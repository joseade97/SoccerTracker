using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto.Modelos;
using Proyecto.Clases;
using System.Globalization;

namespace Proyecto.Formularios
{
    public partial class frmModificarUsuario : System.Web.UI.Page
    {
        ProyectoBD modelo = new ProyectoBD();
        int id_usuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            id_usuario = Int32.Parse(Request.QueryString["id_usuario"]);
            if (!IsPostBack)
            {
                InitForm();

            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                try
                {
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
        protected void InitForm()
        {
            var usuario = (from us in modelo.Usuarios
                           where us.id_usuario == id_usuario
                           select new { datos = us, tipoUsuario = us.es_admin, estadoUsuario = us.estado }).FirstOrDefault();
            
            txtNombreUsuario.Text = usuario.datos.nombre_usuario;
            txtPassword.Text = usuario.datos.hashed_pass;

            if (usuario.datos.es_admin == true)
            {
                ddlTipoUsu.Items.FindByValue("1").Selected = true;
            }
            else
            {
                ddlTipoUsu.Items.FindByValue("0").Selected = true;
            }

            if (usuario.datos.estado == true)
            {
                ddlEstado.Items.FindByValue("1").Selected = true;
            }
            else
            {
                ddlEstado.Items.FindByValue("0").Selected = true;
            }
        }

        protected void GenerarModificacionPersona(Usuario nUsuario)
        {
            nUsuario.nombre_usuario = txtNombreUsuario.Text;
            nUsuario.hashed_pass = txtPassword.Text;
            nUsuario.es_admin = Convert.ToBoolean(ddlTipoUsu.SelectedValue);
            nUsuario.estado = Convert.ToBoolean(ddlEstado.SelectedValue);
        }
    }
}