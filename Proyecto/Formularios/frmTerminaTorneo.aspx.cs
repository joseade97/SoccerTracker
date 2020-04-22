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
    public partial class frmTerminaTorneo : System.Web.UI.Page
    {
        //Se crean variables de clase para base de datos y gestión del ID
        ProyectoBD modelo = new ProyectoBD();
        int idTorneo;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Se establecen los datos iniciales del formularios
            idTorneo = Int32.Parse(Request.QueryString["id_torneo"]);
            var estadoTorneo = (from c in modelo.Campeonatos
                                where c.id == idTorneo
                                select c.estado).FirstOrDefault();
            if(estadoTorneo.Equals("C"))
            {
                Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "No puede finalizar un torneo que no ha iniciado", "frmListaTorneos");
            }
        }

        //Evento del btnSi
        protected void btnSi_Click(object sender, EventArgs e)
        {
            //Valida información
            if (JornadaCumplida())
            {
                try
                {
                    //Actualiza información en BD
                    var torneo = (from c in modelo.Campeonatos
                                  where c.id == idTorneo
                                  select c).FirstOrDefault();
                    ModificarTorneo(torneo);
                    modelo.SaveChanges();
                    Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "El torneo ha sido finalizado con éxito.", "frmListaTorneosF");
                }
                catch (Exception)
                {
                    Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "Ha ocurrido un error inesperado, por favor, comuníquese con su administrador web.", "frmListaTorneos");

                }

            }
            else
            {
                Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "No se puede finalizar el torneo. Hay equipos con encuentros por disputar", "frmListaTorneos");
            }
        }

        //Evento btnNo
        protected void btnNo_Click(object sender, EventArgs e)
        {
            //Redirige a Lista Torneos
            Response.Redirect("~/Formularios/frmListaTorneos");
        }

        //Modifica un torneo recibido por parámetro, de acuerdo a los datos necesarios
        protected void ModificarTorneo(Campeonato torneo)
        {
            //Recupera goleador y campeón desde BD
            var idGoleador = modelo.pa_goleador(idTorneo).Select(x => x.jugador).FirstOrDefault();
            var idCampeon = modelo.pa_campeon_torneo(idTorneo).Select(x => x.id).FirstOrDefault();

            torneo.id_campeon = idCampeon;
            torneo.id_goleador = idGoleador;
            torneo.estado = "T";
            torneo.fec_fin = DateTime.Now;
        }

        //Verifica si un torneo cumplió su jornada
        protected bool JornadaCumplida()
        {
            var cantPartidos = modelo.pa_partidos_equipo(idTorneo).ToList();
            int primeroRegistro = (int)cantPartidos.FirstOrDefault();
            if (cantPartidos.Count > 0)
            {
                for (int i = 0; i < cantPartidos.Count; i++)
                {
                    if (primeroRegistro != cantPartidos[i])
                    {
                        return false;
                    }
                }
            }
            else
            {
                return false;
            }

            return true;
        }
    }
}