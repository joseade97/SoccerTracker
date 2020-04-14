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
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitList();
            }
        }

        protected void InitList()
        {
            var lista = modelo.pa_obtener_lista_personas("");
            grdPersonas.DataSource = lista;
            grdPersonas.DataBind();
        }

        protected void grdPersonas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdPersonas.PageIndex = e.NewPageIndex;
            InitList();
        }

        protected void grdPersonas_RowCreated(object sender, GridViewRowEventArgs e)
        {
        }
    }
}