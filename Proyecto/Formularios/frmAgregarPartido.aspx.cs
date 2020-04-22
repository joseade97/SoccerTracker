using Proyecto.Clases;
using Proyecto.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto.Formularios
{
    public partial class frmAgregarPartidos : System.Web.UI.Page
    {
        int idTorneo;
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            idTorneo = Int32.Parse(Request.QueryString["id_torneo"]);

            string estado = (from c in modelo.Campeonatos
                             where c.id == idTorneo
                             select c.estado).FirstOrDefault();
            if (!estado.Equals("T"))
            {
                if (!IsPostBack)
                {
                    var equiposTorneo = (from ec in modelo.Equipos_x_Campeonato
                                         join eq in modelo.Equipos on ec.id_equipo equals eq.id
                                         where ec.id_campeonato == idTorneo
                                         select new
                                         {
                                             display = eq.nombre,
                                             value = eq.id
                                         }).ToList();
                    ddlCasa.DataSource = equiposTorneo;
                    ddlCasa.DataTextField = "display";
                    ddlCasa.DataValueField = "value";
                    ddlCasa.DataBind();
                    ddlCasa.Items.Insert(0, new ListItem("Seleccione", ""));

                    ddlVisita.DataSource = equiposTorneo;
                    ddlVisita.DataTextField = "display";
                    ddlVisita.DataValueField = "value";
                    ddlVisita.DataBind();
                    ddlVisita.Items.Insert(0, new ListItem("Seleccione", ""));
                }
            }else
            {
                string url = "frmListaPartidos?id_torneo=" + idTorneo;
                Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "No se pueden registrar eventos en un torneo finalizado", url);
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            AgregarPartido("frmRegistrarEventos");
        }

        protected void btnOmitirEventos_Click(object sender, EventArgs e)
        {
            string url = "frmListaPartidos?id_torneo=" + idTorneo;
            AgregarPartido(url);
        }

        protected void AgregarPartido(string url)
        {
            if (this.IsValid)
            {
                try
                {
                    Partido nPartido = GenerarDatosPartido();
                    if (nPartido.id_casa != nPartido.id_visita)
                    {
                        modelo.Partidos.Add(nPartido);
                        modelo.SaveChanges();
                        string ir = url.Equals("frmRegistrarEventos") ? url + "?id_partido=" + nPartido.id : url;
                        Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "El partido ha sido ingresado con éxito", ir);
                    }
                    else
                    {
                        Utilidades.CreateMessageByScript(ClientScript, GetType(), "El equipo casa y el equipo visita no pueden ser el mismo");
                    }
                }
                catch (Exception ex)
                {
                    string msg = "Ha ocurrido un error inesperado, por favor comuníquese con" +
                                        " el administrador de la web brindándole la siguiente información: " + ex.Message;
                    Utilidades.CreateMessageByScript(ClientScript, GetType(), msg);
                }

            }
        }

        protected Partido GenerarDatosPartido()
        {
            Partido nPartido = new Partido();
            nPartido.fecha = DateTime.Parse(txtFecha.Text);
            nPartido.id_campeonato = idTorneo;
            nPartido.id_casa = Int32.Parse(ddlCasa.SelectedValue);
            nPartido.id_visita = Int32.Parse(ddlVisita.SelectedValue);
            nPartido.resultado = ddlResultado.SelectedValue;
            nPartido.posesion_casa = Int32.Parse(txtPosesion.Text);
            nPartido.posesion_visita = 100 - Int32.Parse(txtPosesion.Text);
            nPartido.tiros_marco_casa = Int32.Parse(txtMarcoCasa.Text);
            nPartido.tiros_marco_visita = Int32.Parse(txtMarcoVisita.Text);
            nPartido.tiros_total_casa = Int32.Parse(txtTotalCasa.Text);
            nPartido.tiros_total_visita = Int32.Parse(txtTotalVisita.Text);

            return nPartido;
        }
    }
}