using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto.Formularios
{
    public partial class frmPaginaPrincipal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(this.Session["usuariologueado"]) != true)
            {
                this.Response.Redirect("~/Formularios/frmLogin.aspx");
            }
            else
            {
                string datosUsuario = Convert.ToString(this.Session["nombreusuario"]);
                if (!string.IsNullOrEmpty(datosUsuario))
                {
                    this.lblDatosUsuario.Text = "Bienvenido(a): " + datosUsuario;
                }
            }
        }
    }
}