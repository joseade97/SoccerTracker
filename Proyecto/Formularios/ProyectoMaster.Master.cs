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
            if (Convert.ToBoolean(this.Session["usuariologueado"]) != true)
            {
                this.Response.Redirect("~/Formularios/frmLogin.aspx"); 
            }
            else
            {
                this.hpfSalir.Visible = true;
                this.VerificaPermisosTipoUsuario();
            }
        }

        /// <summary>
        /// Usando la variable de session tipousuario muestra/oculta opciones del menu
        /// </summary>
        void VerificaPermisosTipoUsuario()
        {
            if (Convert.ToString(this.Session["esadmin"]) == "1")
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