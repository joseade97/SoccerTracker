using Proyecto.Clases;
using Proyecto.Modelos;
using System;

namespace Proyecto.Formularios
{
    public partial class frmEliminarEquipo : System.Web.UI.Page
    {
        ///variable para asignar id del pequipo
        int id;
        ///se crea una instancia del modelo de base de datos
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            ///se asigna el valor de id_equipo a la variable
            id = Int32.Parse(Request.QueryString["id_equipo"]);
        }

        /// <summary>
        /// evento click para eliminar equipo
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSi_Click(object sender, EventArgs e)
        {
            try
            {
                ///se crea variable que obtiene el id de equipo para ser eliminado
                var equipo = new Equipos { id = id };
                modelo.Equipos.Attach(equipo);
                modelo.Equipos.Remove(equipo);
                modelo.SaveChanges();
                Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "El equipo ha sido eliminado con éxito", "frmListaEquipos");
            }
            catch (Exception ex)
            {
                ///error por si el equipo posee registros vinculados
                string msg = "El equipo posee registros vinculados. Por favor comuníquese con su administrador web si necesita eliminar este registro";
                ///redirecciona a la lista de equipos
                Utilidades.CreateMessageandRedirect(ClientScript, GetType(), msg, "frmListaEquipos");
            }
        }
        /// <summary>
        /// evento click para no eliminar equipo
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNo_Click(object sender, EventArgs e)
        {
            ///redirecciona a la lista de equipos
            Response.Redirect("~/Formularios/frmListaEquipos");
        }
    }
}