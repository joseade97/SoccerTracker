﻿using Proyecto.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace Proyecto.Formularios
{
    public partial class frmListaUsuarios : System.Web.UI.Page
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

        protected void InitList()
        {
            ///se obtiene la lista de usuarios
            var lista = modelo.pa_obtener_lista_usuarios("");
            ///se agrega la lista al grid
            grdUsuarios.DataSource = lista;
            grdUsuarios.DataBind();
        }

        protected void grdUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ///se agregan los datos de y a una nueva pagina del grid
            grdUsuarios.PageIndex = e.NewPageIndex;
            InitList();
        }

        protected void grdUsuarios_RowCreated(object sender, GridViewRowEventArgs e)
        {
        }
    }
}