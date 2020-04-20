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
    public partial class frmEliminarJugador : System.Web.UI.Page
    {
        int id;
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Int32.Parse(Request.QueryString["id_jugador"]);
        }

        protected void btnSi_Click(object sender, EventArgs e)
        {
            try
            {
                var jugador = new Jugadore { id = id };
                modelo.Jugadores.Attach(jugador);
                modelo.Jugadores.Remove(jugador);
                modelo.SaveChanges();
                Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "El jugador ha sido eliminada con éxito", "frmListaJugadores");
            }
            catch (Exception ex)
            {
                string msg = "El jugador posee registros vinculados. Por favor comuníquese con su administrador web si necesita eliminar este registro";
                Utilidades.CreateMessageandRedirect(ClientScript, GetType(), msg, "frmListaJugadores");
            }
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/frmListaJugadores");
        }
    }
}