using Proyecto.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto.Formularios
{
    public partial class frmSalir : System.Web.UI.Page
    {
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSi_Click(object sender, EventArgs e)
        {
            ///variable de sesion
            ///es case-sensitive
            ///nombre variable, valor de la variable
            Usuario user = (Usuario)Session["datosUsuario"];
            modelo.UPDATE_ULTIMO_INGRESO(DateTime.Now, user.id_usuario);
            modelo.SaveChanges();
            Session["datosUsuario"] = null;
            ///redireccionar a la pagina de loggin
           this.Response.Redirect("~/Formularios/frmLogin.aspx");
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            ///redireccionar a la pagina de login
            this.Response.Redirect("~/Formularios/frmPaginaPrincipal.aspx");
        }
    }
}