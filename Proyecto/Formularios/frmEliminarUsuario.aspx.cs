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
        ///variable para asignar id del usuario
        int id_usuario;
        ///se crea una instancia del modelo de base de datos
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            ///se asigna el valor de id_usuario a la variable
            id_usuario = Int32.Parse(Request.QueryString["id_usuario"]);
        }
        /// <summary>
        /// evento click para eliminar el usuario
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSi_Click(object sender, EventArgs e)
        {
            try
            {
                ///se crea variable para asignar al valor de id_usuario el de la variable 'id_usuario'
                var usuario = new Usuario { id_usuario = id_usuario };
                modelo.Usuarios.Attach(usuario);
                modelo.Usuarios.Remove(usuario);
                modelo.SaveChanges();
                ///mensaje de que el usuario fue eliminado
                ///redirecciona a la lista de usuarios
                Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "El Usuario ha sido eliminado con éxito", "frmListaUsuarios");
            }
            catch (Exception ex)
            {
                ///error por si el usuario no pudo ser eliminado
                string msg = "El usuario posee registros vinculados. Por favor comuníquese con su administrador web si necesita eliminar este registro";
                Utilidades.CreateMessageandRedirect(ClientScript, GetType(), msg, "frmListaUsuarios");
            }
        }
        /// <summary>
        /// evento click para no eliminar el usuario
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNo_Click(object sender, EventArgs e)
        {
            ///redirecciona a la lista de usuarios
            Response.Redirect("~/Formularios/frmListaUsuarios");
        }
    }
}