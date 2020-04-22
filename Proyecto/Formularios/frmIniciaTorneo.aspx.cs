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
    public partial class frmIniciaTorneo : System.Web.UI.Page
    {
        ProyectoBD modelo = new ProyectoBD();
        int idTorneo;
        protected void Page_Load(object sender, EventArgs e)
        {
            idTorneo = Int32.Parse(Request.QueryString["id_torneo"]);
            if(!IsPostBack) {
                var torneo = (from c in modelo.Campeonatos
                              where c.id == idTorneo
                              select c.estado).FirstOrDefault();
                if(torneo == "I" || torneo == "T")
                {
                    Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "No puede iniciar un torneo que ya está iniciado o terminado.",
                                                        "frmListaTorneos");
                }
            }
        }

        protected void btnSi_Click(object sender, EventArgs e)
        {
            ProcesarSolicitud();
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Formularios/frmListaTorneos");
        }

        protected void ProcesarSolicitud()
        {
            var cant_equipos = (from c in modelo.Campeonatos
                                where c.id == idTorneo
                                select c.cant_equipos).FirstOrDefault();

            var cant_ingresados = (from c in modelo.Equipos_x_Campeonato
                                   where c.id_campeonato == idTorneo
                                   select c).Count();
            if (cant_equipos == cant_ingresados)
            {
                try
                {
                    var torneo = (from c in modelo.Campeonatos
                                  where c.id == idTorneo
                                  select c).FirstOrDefault();
                    torneo.estado = "I";
                    modelo.SaveChanges();
                    Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "El torneo ha iniciado exitosamente.",
                                                        "frmListaTorneos");
                }catch (Exception e)
                {
                    Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "Ha ocurrido un error inesperado, por favor, comuníquese con su administrador web.",
                                                        "frmListaTorneos");
                }
            }
            else
            {
                Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "Es necesario que todos los cupos de equipo se llenen para iniciar un torneo.",
                                                    "frmListaTorneos");
            }
        }
    }
}