using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto.Modelos;

namespace Proyecto.Formularios
{
    public partial class frmListaPartidos : System.Web.UI.Page
    {
        int idTorneo;
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            idTorneo = Int32.Parse(Request.QueryString["id_torneo"]);
            acrAgregaPartidos.HRef = "/Formularios/frmAgregarPartido?id_torneo=" + idTorneo;
            if (!IsPostBack)
            {
                var partidos = modelo.pa_partidos_torneo(idTorneo).ToList();

                grdPartidos.DataSource = partidos;
                grdPartidos.DataBind();
            }
        }
    }
}