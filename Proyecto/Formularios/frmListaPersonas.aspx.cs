using Proyecto.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace Proyecto.Formularios
{
    public partial class frmListaPersonas : System.Web.UI.Page
    {
        ///Se crean variables de clase para la gestión del formulario
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitList();
            }
        }

        /// <summary>
        /// se carag la lista de personas
        /// </summary>
        protected void InitList()
        {
            var lista = modelo.pa_obtener_lista_personas(txtIdentificacion.Text);
            grdPersonas.DataSource = lista;
            grdPersonas.DataBind();
        }
        /// <summary>
        /// se asigna la lista de personas al grid
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grdPersonas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdPersonas.PageIndex = e.NewPageIndex;
            InitList();
        }

        protected void grdPersonas_RowCreated(object sender, GridViewRowEventArgs e)
        {
        }

        protected void btnVal_Click(object sender, EventArgs e)
        {
            InitList();
        }
    }
}