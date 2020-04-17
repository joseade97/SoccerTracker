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
    public partial class frmEliminarPersona : System.Web.UI.Page
    {
        int id;
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Int32.Parse(Request.QueryString["id_persona"]);
        }

        protected void btnSi_Click(object sender, EventArgs e)
        {
            try
            {
                var persona = new Persona { id = id };
                modelo.Personas.Attach(persona);
                modelo.Personas.Remove(persona);
                modelo.SaveChanges();
                Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "La persona ha sido eliminada con éxito", "frmListaPersonas");
            }
            catch (Exception ex)
            {
                string msg = "La persona posee registros vinculados. Por favor comuníquese con su administrador web si necesita eliminar este registro";
                Utilidades.CreateMessageandRedirect(ClientScript, GetType(), msg, "frmListaPersonas");
            }
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/frmListaPersonas");
        }
    }
}