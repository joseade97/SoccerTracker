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
    public partial class frmEliminarUsuario : System.Web.UI.Page
    {
        int id_usuario;
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            id_usuario = Int32.Parse(Request.QueryString["id_usuario"]);
        }

        protected void btnSi_Click(object sender, EventArgs e)
        {
            try
            {
                var usuario = new Usuario { id_usuario = id_usuario };
                modelo.Usuarios.Attach(usuario);
                modelo.Usuarios.Remove(usuario);
                modelo.SaveChanges();
                Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "El Usuario ha sido eliminado con éxito", "frmListaUsuarios");
            }
            catch (Exception ex)
            {
                string msg = "El usuario posee registros vinculados. Por favor comuníquese con su administrador web si necesita eliminar este registro";
                Utilidades.CreateMessageandRedirect(ClientScript, GetType(), msg, "frmListaUsuarios");
            }
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/frmListaUsuarios");
        }
    }
}