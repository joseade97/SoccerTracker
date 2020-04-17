using Proyecto.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto.Formularios
{
    public partial class ProyectoMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["datosUsuario"] == null)
            {
                this.Response.Redirect("~/Formularios/frmLogin.aspx"); 
            }
            else
            {
                this.VerificaPermisosTipoUsuario();
            }
        }

        protected void btnIngresarPersona_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/frmIngresarPersona.aspx");
        }
        /// <summary>
        /// Usando la variable de session tipousuario muestra/oculta opciones del menu
        /// </summary>
        void VerificaPermisosTipoUsuario()
        {
            var user = (Usuario)Session["datosUsuario"];
            if (user.es_admin)
            {
                /// this.hpfSalir.Visible = true;
            }
            else
            {
                /// this.hpfSalir.Visible = false;
            }
        }
    }
}