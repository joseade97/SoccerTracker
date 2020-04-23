using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto.Modelos;
using Microsoft.Ajax;
using Proyecto.Clases;
using Liphsoft.Crypto.Argon2;

namespace Proyecto.Formularios
{
    public partial class frmIngresarUsuario : System.Web.UI.Page
    {
        ///se crea una instancia del modelo de base de datos
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlTipoUsu_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void ddlEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
        /// <summary>
        /// Procedimiento para ingresar usuario
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ///verifica que los campos requeridos fueron ingresados
            if (this.IsValid)
            {
                ///verifica que el idPersona no se vacio, si no lo es, se procede a ingresar el usuario
                if (!String.IsNullOrEmpty(hdfIdPersona.Value))
                {
                    try
                    {
                        ///se llama al procedimiento para generar usuario
                        Usuario nUsuario = GenerarNuevoUsuario();
                        modelo.Usuarios.Add(nUsuario);
                        modelo.SaveChanges();
                        ///el usuario fue ingresado
                        Utilidades.CreateMessageByScript(ClientScript, GetType(), "El usuario ha sido registrado con éxito.");
                        Utilidades.ClearTextBoxes(this);
                    }
                    catch (Exception ex)
                    {
                        ///mensaje de algun otro error
                        string msg = "Ha ocurrido un error inesperado, por favor comuníquese con" +
                                            " el administrador de la web brindándole la siguiente información: " + ex.Message;
                        Utilidades.CreateMessageByScript(ClientScript, GetType(), msg);
                    }
                }
                else
                {
                    ///mensaje de error porque el numero de identificacion no existe
                    Utilidades.CreateMessageByScript(ClientScript, GetType(), "Por favor valide el número de identificación para continuar.");
                }

            }
        }
        /// <summary>
        /// Procedimiento que genero un nuevo usuario segun los datos brindados por el administrador
        /// </summary>
        /// <returns></returns>
        protected Usuario GenerarNuevoUsuario()
        {
            ///se encripta la contraseña brindada
            var hasher = new PasswordHasher();
            string hashed_pass = hasher.Hash(txtPassword.Text);

            Usuario nUsuario = new Usuario();

            nUsuario.nombre_usuario = txtNombreUsuario.Text;
            nUsuario.hashed_pass = hashed_pass;
            nUsuario.es_admin = Boolean.Parse(ddlTipoUsu.SelectedValue);
            nUsuario.estado = Boolean.Parse(ddlEstado.SelectedValue);
            nUsuario.id_persona = Int32.Parse(hdfIdPersona.Value);
            return nUsuario;
        }
        /// <summary>
        /// procedimiento que verifica que el numero de identificacion exista en las personas
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnVal_Click(object sender, EventArgs e)
        {
            ///se crea variable para obtener nombre de la persona que va a ser agregada
            var persona = (from u in modelo.Personas
                           where u.num_identificacion == txtIdentificacion.Text
                           select new { u.id, nombre = u.nombre + " " + u.ape1 + " " + u.ape2 }).FirstOrDefault();
            ///se la persona existe, asigna el nombre al campo
            if (persona != null)
            {
                hdfIdPersona.Value = persona.id.ToString();
                txtNombre.Text = persona.nombre;
            }else
            {
                ///mensaje de error por la persona no existe
                Utilidades.CreateMessageByScript(ClientScript, GetType(), "No hay ninguna persona registrada con ese número de identificación.");
            }
        }
    }
}