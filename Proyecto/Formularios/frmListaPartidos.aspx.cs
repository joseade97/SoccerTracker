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
        ///Se crean variables de clase para la gestión del formulario
        int idTorneo;
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            ///se asigna el id_torneo a la variable idTorneo
            idTorneo = Int32.Parse(Request.QueryString["id_torneo"]);
            acrAgregaPartidos.HRef = "/Formularios/frmAgregarPartido?id_torneo=" + idTorneo;
            if (!IsPostBack)
            {
                ///se asgina obtienen los partidos del torneo segun el id del torneo
                var partidos = modelo.pa_partidos_torneo(idTorneo).ToList();
                ///se agregan los datos al grid
                grdPartidos.DataSource = partidos;
                grdPartidos.DataBind();
            }
        }
    }
}