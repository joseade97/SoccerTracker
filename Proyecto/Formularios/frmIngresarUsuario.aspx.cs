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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                if (!String.IsNullOrEmpty(hdfIdPersona.Value))
                {
                    try
                    {
                        Usuario nUsuario = GenerarNuevoUsuario();
                        modelo.Usuarios.Add(nUsuario);
                        modelo.SaveChanges();
                        Utilidades.CreateMessageByScript(ClientScript, GetType(), "El usuario ha sido registrado con éxito.");
                        Utilidades.ClearTextBoxes(this);
                    }
                    catch (Exception ex)
                    {
                        string msg = "Ha ocurrido un error inesperado, por favor comuníquese con" +
                                            " el administrador de la web brindándole la siguiente información: " + ex.Message;
                        Utilidades.CreateMessageByScript(ClientScript, GetType(), msg);
                    }
                }
                else
                {
                    Utilidades.CreateMessageByScript(ClientScript, GetType(), "Por favor valide el número de identificación para continuar.");
                }

            }
        }

        protected Usuario GenerarNuevoUsuario()
        {
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

        protected void btnVal_Click(object sender, EventArgs e)
        {
            var persona = (from u in modelo.Personas
                           where u.num_identificacion == txtIdentificacion.Text
                           select new { u.id, nombre = u.nombre + " " + u.ape1 + " " + u.ape2 }).FirstOrDefault();
            if (persona != null)
            {
                hdfIdPersona.Value = persona.id.ToString();
                txtNombre.Text = persona.nombre;
            }else
            {
                Utilidades.CreateMessageByScript(ClientScript, GetType(), "No hay ninguna persona registrada con ese número de identificación.");
            }
        }
    }
}