using Proyecto.Clases;
using Proyecto.Modelos;
using System;

namespace Proyecto.Formularios
{
    public partial class frmEliminarEquipo : System.Web.UI.Page
    {
        int id;
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Int32.Parse(Request.QueryString["id_equipo"]);
        }

        protected void btnSi_Click(object sender, EventArgs e)
        {
            try
            {
                var equipo = new Equipos { id = id };
                modelo.Equipos.Attach(equipo);
                modelo.Equipos.Remove(equipo);
                modelo.SaveChanges();
                Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "El equipo ha sido eliminado con éxito", "frmListaEquipos");
            }
            catch (Exception ex)
            {
                string msg = "El equipo posee registros vinculados. Por favor comuníquese con su administrador web si necesita eliminar este registro";
                Utilidades.CreateMessageandRedirect(ClientScript, GetType(), msg, "frmListaEquipos");
            }
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/frmListaEquipos");
        }
    }
}