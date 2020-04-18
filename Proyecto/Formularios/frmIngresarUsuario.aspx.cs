using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto.Modelos;
using Microsoft.Ajax;
using Proyecto.Clases;


namespace Proyecto.Formularios
{
    public partial class frmIngresarUsuario : System.Web.UI.Page
    {
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var tipoUsu = (from u in modelo.Usuarios
                                  select u).ToList();
                ddlTipoUsu.DataSource = tipoUsu;
                ddlTipoUsu.DataBind();
                ddlTipoUsu.DataTextField = "es_admin";
                ddlTipoUsu.DataValueField = "es_admin";
                ddlTipoUsu.DataBind();
                ddlTipoUsu.Items.Insert(0, new ListItem("Seleccione", ""));

                var estadoUsu = (from u in modelo.Usuarios
                                  select u).ToList();
                ddlEstado.DataSource = estadoUsu;
                ddlEstado.DataBind();
                ddlEstado.DataTextField = "estado";
                ddlEstado.DataValueField = "estado";
                ddlEstado.DataBind();
                ddlEstado.Items.Insert(0, new ListItem("Seleccione", ""));
            }
        }

        protected void ddlTipoUsu_SelectedIndexChanged(object sender, EventArgs e)
        {
            var es_admin = Boolean.Parse(ddlTipoUsu.SelectedValue);
            var tipoUsu = (from u in modelo.Usuarios
                           where u.es_admin == es_admin
                           select u).ToList();
            ddlTipoUsu.DataSource = tipoUsu;
            ddlTipoUsu.DataBind();
            ddlTipoUsu.DataTextField = "es_admin";
            ddlTipoUsu.DataValueField = "es_admin";
            ddlTipoUsu.DataBind();
            ddlTipoUsu.Items.Insert(0, new ListItem("Seleccione", ""));
        }
        protected void ddlEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            var estado = Boolean.Parse(ddlEstado.SelectedValue);
            var estadoUsu = (from u in modelo.Usuarios
                             where u.estado == estado
                             select u).ToList();

            ddlEstado.DataSource = estadoUsu;
            ddlEstado.DataBind();
            ddlEstado.DataTextField = "estado";
            ddlEstado.DataValueField = "estado";
            ddlEstado.DataBind();
            ddlEstado.Items.Insert(0, new ListItem("Seleccione", ""));
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                try
                {
                    Usuario nUsuario = GenerarNuevoUsuario();
                    modelo.Usuarios.Add(nUsuario);
                    modelo.SaveChanges();
                    Utilidades.CreateMessageByScript(ClientScript, GetType(), "El usuario ha sido registrado con éxito");
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

        protected Usuario GenerarNuevoUsuario()
        {
            Usuario nUsuario = new Usuario();

            nUsuario.nombre_usuario = txtNombreUsuario.Text;
            nUsuario.hashed_pass = txtPassword.Text;
            nUsuario.es_admin = Boolean.Parse(ddlTipoUsu.SelectedValue);
            nUsuario.estado = Boolean.Parse(ddlEstado.SelectedValue);
            nUsuario.id_persona = Int32.Parse(txtNombrePersona.Text);
            return nUsuario;
        }
    }
}