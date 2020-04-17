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

        protected void setDdlTipoUsu()
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

        protected void setDdlEstado()
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
        protected void ddlTipoUsu_SelectedIndexChanged(object sender, EventArgs e)
        {
            setDdlTipoUsu();
        }
        protected void ddlEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            setDdlEstado();
        }
        protected void InitForm()
        {
            var usuario = (from us in modelo.Usuarios
                           where us.id_usuario == id_usuario
                           select new { datos = us, tipoUsuario = us.es_admin, estadoUsuario = us.estado }).FirstOrDefault();

            ddlTipoUsu.Items.Insert(0, new ListItem("Selecccione", ""));
            ddlEstado.Items.Insert(0, new ListItem("Selecccione", ""));
            var usuarios = (from u in modelo.Usuarios
                              select u).ToList();
            ddlTipoUsu.DataSource = usuarios;
            ddlTipoUsu.DataBind();
            ddlTipoUsu.DataTextField = "es_admin";
            ddlTipoUsu.DataValueField = "es_admin";
            ddlTipoUsu.DataBind();
            ddlTipoUsu.Items.Insert(0, new ListItem("Seleccione", ""));
            ddlTipoUsu.SelectedValue = usuario.tipoUsuario.ToString();

            ddlEstado.DataSource = usuarios;
            ddlEstado.DataBind();
            ddlEstado.DataTextField = "estado";
            ddlEstado.DataValueField = "estado";
            ddlEstado.DataBind();
            ddlEstado.Items.Insert(0, new ListItem("Seleccione", ""));
            ddlEstado.SelectedValue = usuario.tipoUsuario.ToString();

            setDdlTipoUsu();
            ddlTipoUsu.SelectedValue = usuario.tipoUsuario.ToString();
            setDdlEstado();
            ddlEstado.SelectedValue = usuario.datos.estado.ToString();

            txtNombreUsuario.Text = usuario.datos.nombre_usuario;
            txtPassword.Text = usuario.datos.hashed_pass;
            ddlTipoUsu.Text = Convert.ToString(usuario.datos.es_admin);
            ddlEstado.Text = Convert.ToString(usuario.datos.estado);
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