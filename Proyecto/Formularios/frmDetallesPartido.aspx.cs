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
        ///variable para asignar id del partido
        int idPartido;
        protected void Page_Load(object sender, EventArgs e)
        {
            ///se crea una instancia del modelo de base de datos
            ProyectoBD modelo = new ProyectoBD();
            ///se asigna el valor de id_partido a la variable
            idPartido = Int32.Parse(Request.QueryString["id_partido"]);
            ///se crea la variable que obtiene el id del torneo
            var idTorneo = (from p in modelo.Partidos
                            where p.id == idPartido
                            select p.id_campeonato).FirstOrDefault();
            ///se crea la variable que obtiene el estado del torneo con respecto al id 
            string estado = (from c in modelo.Campeonatos
                             where c.id == idTorneo
                             select c.estado).FirstOrDefault();
            ///verifica si el estado del torneo es diferente de 'Terminado'
            if (!estado.Equals('T'))
            {
                acrVolver.HRef = "/Formularios/frmListaPartidos?id_torneo=" + idTorneo;
                if (!IsPostBack)
                {
                    ///se crea variable que obtiene los detalles del partido
                    ///nombre de equipo,  jugador del evento, nombre del evento, minuto del evento
                    ///y lo asigna al grid
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
                    ///Error por si el torneo esta 'Terminado'
                    string url = "frmListaPartidos?id_torneo=" + idTorneo;
                    ///redirecciona a la lista de partidos
                    Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "No se pueden registrar eventos en un torneo finalizado", url);
                }
            }
        }
    }
}