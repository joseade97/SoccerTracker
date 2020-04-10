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
            string datosUsuario = Convert.ToString(this.Session["nombreusuario"]);
                if (!string.IsNullOrEmpty(datosUsuario))
                {
                    this.lblDatosUsuario.Text = "Bienvenido(a): " + datosUsuario;
                }        
        }
    }
}