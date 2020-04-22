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
        ///variable para asignar id del jugador
        int id;
        ///se crea una instancia del modelo de base de datos
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            ///se asigna el valor de id_jugador a la variable
            id = Int32.Parse(Request.QueryString["id_jugador"]);
        }
        /// <summary>
        /// evento click para eliminar jugador
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSi_Click(object sender, EventArgs e)
        {
            try
            {
                ///se crea variable para verificar que el id de la tabla jugadores sea igual a la variable 'id'
                var jugador = new Jugadore { id = id };
                modelo.Jugadores.Attach(jugador);
                modelo.Jugadores.Remove(jugador);
                modelo.SaveChanges();
                ///mensaje de que el jugador se elimino
                ///redirecciona a la lista de jugadores
                Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "El jugador ha sido eliminada con éxito", "frmListaJugadores");
            }
            catch (Exception ex)
            {
                ///error por si el jugador posee registros vinculados
                string msg = "El jugador posee registros vinculados. Por favor comuníquese con su administrador web si necesita eliminar este registro";
                Utilidades.CreateMessageandRedirect(ClientScript, GetType(), msg, "frmListaJugadores");
            }
        }
        /// <summary>
        /// evento click por si no se quiere eliminar el jugador
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNo_Click(object sender, EventArgs e)
        {
            ///redirecciona a la lista de jugadores
            Response.Redirect("~/Formularios/frmListaJugadores");
        }
    }
}