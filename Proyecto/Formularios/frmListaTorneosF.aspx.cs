using Proyecto.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto.Formularios
{
    public partial class frmListaTorneosF : System.Web.UI.Page
    {
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            var torneos = (from t in modelo.Campeonatos
                           join d in modelo.Personas on t.id_dedicado equals d.id
                           join g in modelo.Jugadores on t.id_goleador equals g.id
                           join dg in modelo.Personas on g.id_persona equals dg.id
                           join eq in modelo.Equipos on t.id_campeon equals eq.id
                           where t.estado == "T"
                           select new
                           {
                               t.id,
                               t.fec_inicio,
                               t.fec_fin,
                               t.cant_equipos,
                               dedicado = d.nombre + " " + d.ape1 + " " + d.ape2 ?? "",
                               goleador = dg.nombre + " " + dg.ape1 + " " + dg.ape2 ?? "",
                               campeon = eq.nombre
                           }).ToList();

            grdTorneos.DataSource = torneos;
            grdTorneos.DataBind();
        }
    }
}