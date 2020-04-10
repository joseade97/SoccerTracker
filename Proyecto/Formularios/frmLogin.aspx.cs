using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto.Modelos;

namespace Proyecto.Formularios
{
    public partial class frmLogin : System.Web.UI.Page
    {
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            ///validar que todas las reglas del formulario se cumplan
            if (this.Page.IsValid)
            {
                this.RealizarAutenticacion();
            }
        }
        void RealizarAutenticacion()
        {
            sp_RetornaUsuarioNombrePwd_Result
                resultadoSp = this.modelo.sp_RetornaUsuarioNombrePwd(
                    this.txtUsuario.Text,
                    this.txtContrasena.Text).FirstOrDefault();

            ///Verificar si el objeto es nulo, si lo es entonces el usuario o el password
            ///es incorrecto
            if (resultadoSp == null)
            {
                this.lblResultado.Text = "Debe ingresar un usuario y/o contraseña válidos";
                this.Session.Add("nombreusuario", null);
                this.Session.Add("idusuario", null);
                this.Session.Add("usuariologueado", null);
                this.Session.Add("esadmin", null);
            }
            else
            {
                ///variable de sesion
                ///es case-sensitive
                ///nombre variable, valor de la variable
                this.Session.Add("nombreusuario", resultadoSp.nombre_usuario);
                this.Session.Add("idusuario", resultadoSp.id_usuario);
                this.Session.Add("esadmin", resultadoSp.es_admin);
                this.Session.Add("usuariologueado", true);

                ///redireccionar a la pagina inicial
                this.Response.Redirect("~/Formularios/frmPaginaPrincipal.aspx");
            }
        }
    }
}