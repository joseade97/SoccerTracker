using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto.Clases;
using Proyecto.Modelos;

namespace Proyecto.Formularios
{
    public partial class frmEliminarTorneo : System.Web.UI.Page
    {
        ///variable para asignar id del torneo
        int id_torneo;
        ///se crea una instancia del modelo de base de datos
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            ///se asigna el valor de id_torneo a la variable
            id_torneo = Int32.Parse(Request.QueryString["id_torneo"]);
        }
        /// <summary>
        /// evento click para eliminar el torneo
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSi_Click(object sender, EventArgs e)
        {
            ///se crea variable para obtener la cantidad de partidos del torneo
            var cantPartidos = ((from c in modelo.Partidos
                                where c.id_campeonato == id_torneo
                                select c).Count());
            ///verifica si la cantidad de partidos es 0 para eliminarlo
            if (cantPartidos == 0)
            {
                try
                {
                    ///se crea variable que verifica el id del torneo sea igual a 'id'
                    var torneo = new Campeonato { id = id_torneo };
                    modelo.Campeonatos.Attach(torneo);
                    modelo.Campeonatos.Remove(torneo);
                    modelo.SaveChanges();
                    ///mensje de que el torneo fue eliminado
                    ///redirecciona a la lista de torneos
                    Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "El Torneo ha sido eliminado con éxito", "frmListaTorneos");
                }
                catch (Exception ex)
                {
                    ///mensaje por si hay algun otro error
                    string msg = "El torneo tiene eventos disputados y no es posible ser eliminado. Por favor comuníquese con su administrador web si necesita eliminar este registro";
                    Utilidades.CreateMessageandRedirect(ClientScript, GetType(), msg, "frmListaTorneos");
                }
            }
        }
        /// <summary>
        /// evento click para no eliminar torneo
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNo_Click(object sender, EventArgs e)
        {
            ///redirecciona a la lista de torneos
            Response.Redirect("~/Formularios/frmListaTorneos");
        }
    }
}