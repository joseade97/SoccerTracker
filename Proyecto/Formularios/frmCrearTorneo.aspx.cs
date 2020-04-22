using Proyecto.Clases;
using Proyecto.Modelos;
using System;
using System.Linq;

namespace Proyecto.Formularios
{
    public partial class frmCrearTorneo : System.Web.UI.Page
    {
        ///se crea una instancia del modelo de base de datos
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// Procedimiento que verifica que el numero de identificacion brindado por el administrador
        /// pertenezca al numero de identificacion de algun registro en la tabla Personas
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnVal_Click(object sender, EventArgs e)
        {
            ///se crea variable para obtener el nombre completo de la persona que se asignara al txtIdentificacion
            ///respecto al numero de identificacion
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
                ///error por si el numero de identificacion brindado no corresponde a ninguna persona
                Utilidades.CreateMessageByScript(ClientScript, GetType(), "No hay ninguna persona registrada con ese número de identificación.");
            }
        }

        /// <summary>
        /// evento click para crear torneo
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ///validad que los campos del formulario sean ingresados correctamente
            if (IsValid)
            {
                try
                {
                    ///Se intenta generar el torneo
                    Campeonato torneo = GenerarTorneo();
                    modelo.Campeonatos.Add(torneo);
                    modelo.SaveChanges();
                    Utilidades.CreateMessageByScript(ClientScript, GetType(), "El torneo ha sido creado con éxito");
                    Utilidades.ClearTextBoxes(this);
                }
                catch (Exception)
                {
                    ///error por si no se puede agregar el torneo
                    string msg = "Ha ocurrido un error inesperado, por favor comuníquese con" +
                                        " el administrador de la web.";
                    ///redirecciona a la pagina principal
                    Utilidades.CreateMessageandRedirect(ClientScript, GetType(), msg, "frmPrincipal");
                }
            }
        }
        /// <summary>
        /// Procedimiento que genera un nuevo torneo a partir de los valores brindados por el administrador
        /// </summary>
        /// <returns></returns>
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