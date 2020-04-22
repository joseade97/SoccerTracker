using Proyecto.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto.Formularios
{
    public partial class frmPaginaPrincipal : Page
    {
        //Inicializa instancia de BD
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Establece último ingreso de sesión usuario y lo muestra
            Usuario datosUsuario = (Usuario)Session["datosUsuario"];
            var persona = (from u in modelo.Personas
                           where u.id == datosUsuario.id_persona
                           select u).FirstOrDefault();
            if (datosUsuario != null && persona != null)
            {
                this.lblDatosUsuario.Text = $"Bienvenido(a) {persona.nombre} {persona.ape1} {(persona.ape2 ?? "")}" +
                                            $"<br />{(datosUsuario.ultimo_ingreso != null ? "Su último ingreso fue el " + datosUsuario.ultimo_ingreso : "Primer ingreso al sistema")}";
                if (!IsPostBack)
                {
                    //Actualiza el último ingreso en BD
                    Usuario user = (Usuario)Session["datosUsuario"];
                    modelo.UPDATE_ULTIMO_INGRESO(DateTime.Now, user.id_usuario);
                    modelo.SaveChanges();
                }
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            ///al dar click al boton "Cerrar Sesion" redirecciona al frmSalir
            this.Response.Redirect("~/Formularios/frmSalir.aspx");
        }
    }
}