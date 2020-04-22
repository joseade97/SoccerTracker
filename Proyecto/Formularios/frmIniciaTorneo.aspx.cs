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
        ///se crea una instancia del modelo de base de datos
        ProyectoBD modelo = new ProyectoBD();
        /// variable para asignar el id del torneo
        int idTorneo;
        protected void Page_Load(object sender, EventArgs e)
        {
            ///se asigna el valor de id_torneo a la variable idTorneo
            idTorneo = Int32.Parse(Request.QueryString["id_torneo"]);
            if(!IsPostBack) {
                ///variable que se le asigna el estado del torneo segun el ID
                var torneo = (from c in modelo.Campeonatos
                              where c.id == idTorneo
                              select c.estado).FirstOrDefault();
                ///verifica que el estado del torneo no sea 'Iniciado' o 'Terminado'
                if(torneo == "I" || torneo == "T")
                {
                    ///mensaje de error porque el torneo ya esta iniciado o terminado
                    Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "No puede iniciar un torneo que ya está iniciado o terminado.",
                                                        "frmListaTorneos");
                }
            }
        }
        /// <summary>
        /// evento para procesar solicitud
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSi_Click(object sender, EventArgs e)
        {
            ProcesarSolicitud();
        }

        /// <summary>
        /// evento para no procesar solicitud
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNo_Click(object sender, EventArgs e)
        {
            ///redirecciona a la lista de torneos
            Response.Redirect("~/Formularios/frmListaTorneos");
        }
        /// <summary>
        /// procedimiento que procesa la solicitud 
        /// </summary>
        protected void ProcesarSolicitud()
        {
            ///variable que obtiene la cantidad de equipos por torneo
            var cant_equipos = (from c in modelo.Campeonatos
                                where c.id == idTorneo
                                select c.cant_equipos).FirstOrDefault();
            ///variable que obtiene la cantidad de equipos ingresados
            var cant_ingresados = (from c in modelo.Equipos_x_Campeonato
                                   where c.id_campeonato == idTorneo
                                   select c).Count();
            ///verifica que la cantidad de equipos sea igual a los equipos ingresados
            if (cant_equipos == cant_ingresados)
            {
                try
                {
                    ///variable que obtiene el id del torneo a iniciar
                    var torneo = (from c in modelo.Campeonatos
                                  where c.id == idTorneo
                                  select c).FirstOrDefault();
                    ///Iniciar el torneo
                    torneo.estado = "I";
                    modelo.SaveChanges();
                    Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "El torneo ha iniciado exitosamente.",
                                                        "frmListaTorneos");
                }catch (Exception e)
                {
                    ///mensaje de algun otro error
                    Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "Ha ocurrido un error inesperado, por favor, comuníquese con su administrador web.",
                                                        "frmListaTorneos");
                }
            }
            else
            {
                ///mensaje de error que no todos los equipos requeridos fueron registrados para iniciar el torneo
                Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "Es necesario que todos los cupos de equipo se llenen para iniciar un torneo.",
                                                    "frmListaTorneos");
            }
        }
    }
}