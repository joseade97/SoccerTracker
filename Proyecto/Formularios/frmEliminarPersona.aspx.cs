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
        ///variable para asignar id de la persona
        int id;
        ///se crea una instancia del modelo de base de datos
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            ///se asigna el valor de id_persona a la variable
            id = Int32.Parse(Request.QueryString["id_persona"]);
        }
        /// <summary>
        /// evento click para eliminar persona
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSi_Click(object sender, EventArgs e)
        {
            try
            {
                ///se crea variable para verificar que el id de Person se igual al 'id'
                var persona = new Persona { id = id };
                modelo.Personas.Attach(persona);
                modelo.Personas.Remove(persona);
                modelo.SaveChanges();
                ///mensaje de que se pudo eliminar la persona
                ///redirecciona a la lista de personas
                Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "La persona ha sido eliminada con éxito", "frmListaPersonas");
            }
            catch (Exception ex)
            {
                ///error por si la persona posee registros vinculados
                string msg = "La persona posee registros vinculados. Por favor comuníquese con su administrador web si necesita eliminar este registro";
                Utilidades.CreateMessageandRedirect(ClientScript, GetType(), msg, "frmListaPersonas");
            }
        }
        /// <summary>
        /// evento click para no eliminar persona
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNo_Click(object sender, EventArgs e)
        {
            ///redirecciona a la lista de personas
            Response.Redirect("~/Formularios/frmListaPersonas");
        }
    }
}