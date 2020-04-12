using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto.Modelos;
using Liphsoft.Crypto.Argon2;

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

            var hasher = new PasswordHasher();

            string nomUsuario = this.txtUsuario.Text;
            string contra = this.txtContrasena.Text;


            var user = (from u in modelo.Usuarios
                        where u.nombre_usuario == nomUsuario
                        select u).FirstOrDefault();

            ///Verificar si el objeto es nulo, si lo es entonces el usuario o el password
            ///es incorrecto
            bool isValid = hasher.Verify(user.hashed_pass, contra);
            if (isValid)
            {
                this.Session.Add("datosUsuario", user);
                ///redireccionar a la pagina inicial
                this.Response.Redirect("~/Formularios/frmPaginaPrincipal.aspx");
            }
            else
            {
                ///variable de sesion
                ///es case-sensitive
                ///nombre variable, valor de la variable
                this.lblResultado.Text = "Debe ingresar un usuario y/o contraseña válidos";
                this.Session.Add("datosUsuario", null);
            }
        }
    }
}