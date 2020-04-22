using Proyecto.Clases;
using Proyecto.Modelos;
using System;
using System.Linq;

namespace Proyecto.Formularios
{
    public partial class frmCrearTorneo : System.Web.UI.Page
    {
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                try
                {
                    Campeonato torneo = GenerarTorneo();
                    modelo.Campeonatos.Add(torneo);
                    modelo.SaveChanges();
                    Utilidades.CreateMessageByScript(ClientScript, GetType(), "El torneo ha sido creado con éxito");
                    Utilidades.ClearTextBoxes(this);
                }
                catch (Exception)
                {
                    string msg = "Ha ocurrido un error inesperado, por favor comuníquese con" +
                                        " el administrador de la web.";
                    Utilidades.CreateMessageandRedirect(ClientScript, GetType(), msg, "frmPrincipal");
                }
            }
        }

        protected Campeonato GenerarTorneo()
        {
            Campeonato torneo = new Campeonato();

            torneo.fec_inicio = DateTime.Now;
            torneo.fec_fin = DateTime.Parse(txtFecFin.Text);
            torneo.id_dedicado = Int32.Parse(hdfIdPersona.Value);
            torneo.cant_equipos = Int32.Parse(txtCant.Text);
            torneo.estado = "C";

            return torneo;
        }
    }
}