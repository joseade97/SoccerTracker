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
    public partial class frmAgregarPartidos : System.Web.UI.Page
    {
        ///variable para asignar id del torneo
        int idTorneo;
        ///se crea una instancia del modelo de base de datos
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            ///se asigna el valor de id_torneo a la variable
            idTorneo = Int32.Parse(Request.QueryString["id_torneo"]);
            ///se crea variable que va a obtener el estado del Campeonato segun la variable idTorneo
            string estado = (from c in modelo.Campeonatos
                             where c.id == idTorneo
                             select c.estado).FirstOrDefault();
            ///Verifica si el estado es 'Terminado' y si lo es no se pueden registrar eventos en el torneo
            if (!estado.Equals("T"))
            {
                if (!IsPostBack)
                {
                    ///se crea variable que va a obtener el nombre e id del equipo por torneo
                    var equiposTorneo = (from ec in modelo.Equipos_x_Campeonato
                                         join eq in modelo.Equipos on ec.id_equipo equals eq.id
                                         where ec.id_campeonato == idTorneo
                                         select new
                                         {
                                             display = eq.nombre,
                                             value = eq.id
                                         }).ToList();
                    ///se agregan los valores obtenidos anteriormente a los campos del formulario
                    ddlCasa.DataSource = equiposTorneo;
                    ddlCasa.DataTextField = "display";
                    ddlCasa.DataValueField = "value";
                    ddlCasa.DataBind();
                    ddlCasa.Items.Insert(0, new ListItem("Seleccione", ""));

                    ddlVisita.DataSource = equiposTorneo;
                    ddlVisita.DataTextField = "display";
                    ddlVisita.DataValueField = "value";
                    ddlVisita.DataBind();
                    ddlVisita.Items.Insert(0, new ListItem("Seleccione", ""));
                }
            }else
            {
                ///este es el error por si el torneo ya esta finalizado
                string url = "frmListaPartidos?id_torneo=" + idTorneo;
                ///redirecciona a la lista de partidos
                Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "No se pueden registrar eventos en un torneo finalizado", url);
            }
        }

        /// <summary>
        /// evento click para agregar eventos al partido
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            AgregarPartido("frmRegistrarEventos");
        }

        /// <summary>
        /// evento click parar omitir agregar eventos al partido
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnOmitirEventos_Click(object sender, EventArgs e)
        {
            string url = "frmListaPartidos?id_torneo=" + idTorneo;
            AgregarPartido(url);
        }

        /// <summary>
        /// Procedimiento que agrega un Partido al torneo
        /// </summary>
        /// <param name="url"></param>
        protected void AgregarPartido(string url)
        {
            ///Verifica que las validaciones de los campos requeridos fueron ingresadas correctamente
            ///si es valido, entonces, agrega el partido al torneo
            if (this.IsValid)
            {
                ///verifica que el equipo casa y visita no sea el mismo para agregarlo al torneo, si es el mismo,
                ///no podra ser ingresado, si da algun otro error se desplegara
                try
                {
                    Partido nPartido = GenerarDatosPartido();
                    if (nPartido.id_casa != nPartido.id_visita)
                    {
                        modelo.Partidos.Add(nPartido);
                        modelo.SaveChanges();
                        string ir = url.Equals("frmRegistrarEventos") ? url + "?id_partido=" + nPartido.id : url;
                        Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "El partido ha sido ingresado con éxito", ir);
                    }
                    else
                    {
                        Utilidades.CreateMessageByScript(ClientScript, GetType(), "El equipo casa y el equipo visita no pueden ser el mismo");
                    }
                }
                catch (Exception ex)
                {
                    string msg = "Ha ocurrido un error inesperado, por favor comuníquese con" +
                                        " el administrador de la web brindándole la siguiente información: " + ex.Message;
                    Utilidades.CreateMessageByScript(ClientScript, GetType(), msg);
                }

            }
        }


        /// <summary>
        /// Procedimiento que genera los datos del partido con respecto a los valores ingresados
        /// por el Administrador en el frmAgregarPartido
        /// </summary>
        /// <returns></returns>
        protected Partido GenerarDatosPartido()
        {
            Partido nPartido = new Partido();
            nPartido.fecha = DateTime.Parse(txtFecha.Text);
            nPartido.id_campeonato = idTorneo;
            nPartido.id_casa = Int32.Parse(ddlCasa.SelectedValue);
            nPartido.id_visita = Int32.Parse(ddlVisita.SelectedValue);
            nPartido.resultado = ddlResultado.SelectedValue;
            nPartido.posesion_casa = Int32.Parse(txtPosesion.Text);
            nPartido.posesion_visita = 100 - Int32.Parse(txtPosesion.Text);
            nPartido.tiros_marco_casa = Int32.Parse(txtMarcoCasa.Text);
            nPartido.tiros_marco_visita = Int32.Parse(txtMarcoVisita.Text);
            nPartido.tiros_total_casa = Int32.Parse(txtTotalCasa.Text);
            nPartido.tiros_total_visita = Int32.Parse(txtTotalVisita.Text);

            return nPartido;
        }
    }
}