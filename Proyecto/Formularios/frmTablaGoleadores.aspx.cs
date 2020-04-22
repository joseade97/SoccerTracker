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
    public partial class frmTablaGoleadores : System.Web.UI.Page
    {
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Inicializa formulario
            if (!IsPostBack)
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
                ddlEquipo.Items.Insert(0, new ListItem("Seleccione", ""));
            }
        }

        //Sobrescribe valores de ddlEquipo según torneo
        protected void ddlCampeonatos_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(ddlCampeonatos.SelectedValue))
            {
                int idTorneo = Int32.Parse(ddlCampeonatos.SelectedValue);
                var equipos = (from eq in modelo.Equipos
                               join ec in modelo.Equipos_x_Campeonato on eq.id equals ec.id_equipo
                               where ec.id_campeonato == idTorneo
                               select new
                               {
                                   display = eq.nombre,
                                   value = eq.nombre
                               }).ToList();
                ddlEquipo.DataSource = equipos;
                ddlEquipo.DataTextField = "display";
                ddlEquipo.DataValueField = "value";
                ddlEquipo.DataBind();
                ddlEquipo.Items.Insert(0, new ListItem("Seleccione", ""));
            }else
            {
                ddlEquipo.DataSource = null;
                ddlEquipo.DataTextField = null;
                ddlEquipo.DataValueField = null;
                ddlEquipo.DataBind();
            }

        }

        //Construye reporte desde fuente de datos
        protected void ConstruirReporte()
        {
            string rutaReporte = "~/Reportes/ReporteGoleadores.rdlc";
            string rutaServidor = Server.MapPath(rutaReporte);

            if (!File.Exists(rutaServidor))
            {
                Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "El reporte no existe.", "frmPrincipal");
                return;
            }
            else
            {
                rpvGoleadores.LocalReport.ReportPath = rutaServidor;
                var infoFuenteDatos = this.rpvGoleadores.LocalReport.GetDataSourceNames();

                rpvGoleadores.LocalReport.DataSources.Clear();

                var datosReporte = modelo.pa_retorna_goleadores(Int32.Parse(ddlCampeonatos.SelectedValue)).ToList();

                if(!String.IsNullOrEmpty(ddlEquipo.SelectedValue))
                {
                    datosReporte = datosReporte.Where(x => x.equipo.Equals(ddlEquipo.SelectedValue)).ToList();
                }

                ReportDataSource dataSource = new ReportDataSource();
                dataSource.Name = infoFuenteDatos[0];
                dataSource.Value = datosReporte;

                rpvGoleadores.LocalReport.DataSources.Add(dataSource);
                rpvGoleadores.LocalReport.Refresh();
            }

        }

        //Muestra reporte por medio del método ConstruirReporte
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(IsValid)
            {
                ConstruirReporte();
            }
        }
    }
}