using Microsoft.Reporting.WebForms;
using Proyecto.Clases;
using Proyecto.Modelos;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto.Formularios
{
    public partial class frmTablaPosiciones : System.Web.UI.Page
    {
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                var datosCampeonatos = (from c in modelo.Campeonatos
                                        join p in modelo.Personas on c.id_dedicado equals p.id
                                        where c.estado != "C"
                                        select new
                                        {
                                            value = c.id,
                                            display = "Campeonato " + p.nombre + " " + p.ape1
                                        }).ToList();
                ddlCampeonatos.DataSource = datosCampeonatos;
                ddlCampeonatos.DataTextField = "display";
                ddlCampeonatos.DataValueField = "value";
                ddlCampeonatos.DataBind();
                ddlCampeonatos.Items.Insert(0, new ListItem("Seleccione", ""));
            }
        }

        protected void ConstruirReporte ()
        {
            string rutaReporte = "~/Reportes/ReporteTablaPosiciones.rdlc";
            string rutaServidor = Server.MapPath(rutaReporte);

            if(!File.Exists(rutaServidor))
            {
                Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "El reporte no existe.", "frmPrincipal");
                return;
            }
            else
            {
                rpvPosiciones.LocalReport.ReportPath = rutaServidor;
                var infoFuenteDatos = this.rpvPosiciones.LocalReport.GetDataSourceNames();

                rpvPosiciones.LocalReport.DataSources.Clear();

                var datosReporte = modelo.pa_RetornaPosiciones(Int32.Parse(ddlCampeonatos.SelectedValue));

                ReportDataSource dataSource = new ReportDataSource();
                dataSource.Name = infoFuenteDatos[0];
                dataSource.Value = datosReporte;

                rpvPosiciones.LocalReport.DataSources.Add(dataSource);
                rpvPosiciones.LocalReport.Refresh();
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(IsValid)
            {
                ConstruirReporte();
            }
        }
    }
}