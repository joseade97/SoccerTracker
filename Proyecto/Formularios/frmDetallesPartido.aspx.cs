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
    public partial class frmDetallesPartido : System.Web.UI.Page
    {
        int idPartido;
        protected void Page_Load(object sender, EventArgs e)
        {
            ProyectoBD modelo = new ProyectoBD();
            idPartido = Int32.Parse(Request.QueryString["id_partido"]);
            var idTorneo = (from p in modelo.Partidos
                            where p.id == idPartido
                            select p.id_campeonato).FirstOrDefault();
            string estado = (from c in modelo.Campeonatos
                             where c.id == idTorneo
                             select c.estado).FirstOrDefault();
            if (!estado.Equals('T'))
            {
                acrVolver.HRef = "/Formularios/frmListaPartidos?id_torneo=" + idTorneo;
                if (!IsPostBack)
                {
                    var detalles = (from d in modelo.Eventos_x_Partido
                                    join j in modelo.Jugadores on d.id_jugador equals j.id
                                    join eq in modelo.Equipos on j.id_equipo equals eq.id
                                    join p in modelo.Personas on j.id_persona equals p.id
                                    join ev in modelo.Eventos on d.id_evento equals ev.id
                                    where d.id_partido == idPartido
                                    orderby d.minuto_evento
                                    select new
                                    {
                                        equipo = eq.nombre,
                                        jugador = p.nombre + " " + p.ape1 + " " + p.ape2 ?? "",
                                        evento = ev.nombre_evento,
                                        d.minuto_evento
                                    }).ToList();
                    grdDetalles.DataSource = detalles;
                    grdDetalles.DataBind();
                }
                else
                {
                    string url = "frmListaPartidos?id_torneo=" + idTorneo;
                    Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "No se pueden registrar eventos en un torneo finalizado", url);
                }
            }
        }
    }
}