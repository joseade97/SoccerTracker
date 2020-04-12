using Proyecto.Modelos;
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
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario datosUsuario = (Usuario)Session["datosUsuario"];
                if (datosUsuario != null)
                {
                    this.lblDatosUsuario.Text = "Bienvenido(a): " + datosUsuario.nombre_usuario;
                    this.btnSalir.Visible = true;
                }        
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            ///al dar click al boton "Cerrar Sesion" redirecciona al frmSalir
            this.Response.Redirect("~/Formularios/frmSalir.aspx");
        }
    }
}