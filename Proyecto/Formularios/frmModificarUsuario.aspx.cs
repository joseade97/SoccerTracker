using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto.Modelos;
using Proyecto.Clases;
using System.Globalization;
using Liphsoft.Crypto.Argon2;

namespace Proyecto.Formularios
{
    public partial class frmModificarUsuario : System.Web.UI.Page
    {
        //Crea variables de clase para la gestión del formulario
        ProyectoBD modelo = new ProyectoBD();
        int id_usuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Inicializa formulario
            id_usuario = Int32.Parse(Request.QueryString["id_usuario"]);
            if (!IsPostBack)
            {
                InitForm();

            }
        }

        //Evento btnSubmit
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //Valida datos
            if (this.IsValid)
            {
                try
                {
                    //Realiza la modificación en BD
                    var usuario = (from u in modelo.Usuarios
                                   where u.id_usuario == id_usuario
                                   select u).FirstOrDefault();
                    GenerarModificacionPersona(usuario);
                    modelo.SaveChanges();
                    Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "El usuario ha sido modificado con éxito", "frmListaUsuarios");
                    Utilidades.ClearTextBoxes(this);
                }
                catch (Exception ex)
                {
                    string msg = "Ha ocurrido un error inesperado, por favor comuníquese con" +
                                        " el administrador de la web brindándole la siguiente información: " + ex.Message;
                    Utilidades.CreateMessageandRedirect(ClientScript, GetType(), msg, "frmListaPersonas");
                }

            }
        }

        protected void ddlTipoUsu_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
        protected void ddlEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        //Establece datos iniciales
        protected void InitForm()
        {
            var usuario = (from us in modelo.Usuarios
                           where us.id_usuario == id_usuario
                           select new { us.nombre_usuario, us.estado, us.es_admin }).FirstOrDefault();
            
            txtNombreUsuario.Text = usuario.nombre_usuario;
            ddlEstado.SelectedValue = usuario.estado.ToString();
            ddlTipoUsu.SelectedValue = usuario.es_admin.ToString();
        }

        //Modifica Usuario que recibe por parámetro
        protected void GenerarModificacionPersona(Usuario nUsuario)
        {
            nUsuario.nombre_usuario = txtNombreUsuario.Text;
            nUsuario.es_admin = Convert.ToBoolean(ddlTipoUsu.SelectedValue);
            nUsuario.estado = Convert.ToBoolean(ddlEstado.SelectedValue);
            if (!String.IsNullOrEmpty(txtPassword.Text))
            {
                var hasher = new PasswordHasher();
                string hashed_pass = hasher.Hash(txtPassword.Text);

                nUsuario.hashed_pass = hashed_pass;
            }
        }
    }
}