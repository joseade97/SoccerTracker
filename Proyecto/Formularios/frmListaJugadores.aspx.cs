using Proyecto.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto.Formularios
{
    public partial class frmListaJugadores : System.Web.UI.Page
    {
        ProyectoBD modelo = new ProyectoBD();
        int id_equipo;
        protected void Page_Load(object sender, EventArgs e)
        {
            bool existeEquipo = Int32.TryParse(Request.QueryString["id_equipo"], out id_equipo);
            if (!IsPostBack)
            {
                var lista = (from j in modelo.Jugadores
                             where j.id_equipo == id_equipo
                                   || !existeEquipo
                             join eq in modelo.Equipos on j.id_equipo equals eq.id
                             join p in modelo.Personas on j.id_persona equals p.id
                             join r in modelo.Posiciones on j.id_posicion equals r.id
                             select new
                             {
                                 j.id,
                                 nombre = p.nombre + " " + p.ape1 + " " + p.ape2 ?? "",
                                 equipo = eq.nombre,
                                 posicion = r.nombre
                             }).ToList();
                grdJugadores.DataSource = lista;
                grdJugadores.DataBind();
            }
            if(existeEquipo)
            {
                acrListaEquipos.Visible = true;
            }
        }
    }
}