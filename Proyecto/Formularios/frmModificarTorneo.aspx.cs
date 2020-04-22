using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto.Clases;
using Proyecto.Modelos;

namespace Proyecto.Formularios
{
    public partial class frmModificarTorneo : System.Web.UI.Page
    {
        //Se crean variables de clase para la gestión del formulario
        ProyectoBD modelo = new ProyectoBD();
        int id_torneo;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Se inicializa el formulario
            id_torneo = Int32.Parse(Request.QueryString["id_torneo"]);
            if (!IsPostBack)
            {
                InitForm();
            }
        }

        //Evento btnVal, realiza una validación para seleccionar una persona de la tabla Personas en BD
        protected void btnVal_Click(object sender, EventArgs e)
        {
            var persona = (from u in modelo.Personas
                           where u.num_identificacion == txtIdentificacion.Text
                           select new { u.id, nombre = u.nombre + " " + u.ape1 + " " + u.ape2 }).FirstOrDefault();
            if (persona != null)
            {
                hdfIdPersona.Value = persona.id.ToString();
                txtNombre.Text = persona.nombre;
            }
            else
            {
                Utilidades.CreateMessageByScript(ClientScript, GetType(), "No hay ninguna persona registrada con ese número de identificación.");
            }
        }        

        //Evento btnSubmit
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //Valida datos
            if (IsValid)
            {
                try
                {
                    //Realiza la modificación en BD
                    var torneo = (from c in modelo.Campeonatos
                                   where c.id == id_torneo
                                   select c).FirstOrDefault();
                    ModificarTorneo(torneo);
                    modelo.SaveChanges();
                    Utilidades.CreateMessageByScript(ClientScript, GetType(), "El torneo ha sido modificado con éxito");
                    Utilidades.ClearTextBoxes(this);
                }
                catch (Exception ex)
                {
                    string msg = "Ha ocurrido un error inesperado, por favor comuníquese con" +
                                        " el administrador de la web brindándole la siguiente información: " + ex.Message;
                    Utilidades.CreateMessageByScript(ClientScript, GetType(), msg);
                }
            }
        }

        //Inicializa campos del formulario
        protected void InitForm()
        {
            var torneo = (from c in modelo.Campeonatos
                          where c.id == id_torneo
                          join p in modelo.Personas on c.id_dedicado equals p.id
                          select new { c.id, c.fec_inicio, c.fec_fin, dedicado = p.num_identificacion, c.cant_equipos, c.estado }).FirstOrDefault();

            txtFecIni.Text = Convert.ToString(torneo.fec_inicio);
            txtFecFin.Text = Convert.ToString(torneo.fec_fin);
            txtIdentificacion.Text = Convert.ToString(torneo.dedicado);
            txtCant.Text = Convert.ToString(torneo.cant_equipos);
            ddlEstado.SelectedValue = torneo.estado.ToString();
        }

        //Modifica torneo que recibe por parámentro
        protected void ModificarTorneo(Campeonato nCampeonato)
        {
            nCampeonato.fec_inicio = DateTime.Parse(txtFecIni.Text);
            nCampeonato.fec_fin = DateTime.Parse(txtFecFin.Text);
            nCampeonato.id_dedicado = Int32.Parse(txtIdentificacion.Text);
            nCampeonato.cant_equipos = Int32.Parse(txtCant.Text);
            nCampeonato.estado = ddlEstado.SelectedValue;
        }
    }
}