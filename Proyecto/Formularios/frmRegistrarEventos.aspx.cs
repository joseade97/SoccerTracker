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
    public partial class frmRegistrarEventos : System.Web.UI.Page
    {
        ProyectoBD modelo = new ProyectoBD();
        int idPartido;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Inicializa información necesaria para el llenado de datos
            idPartido = Int32.Parse(Request.QueryString["id_partido"]);            
            if (!IsPostBack)
            {
                var jugadores = modelo.pa_lista_jugadores_partido2(idPartido);
                var eventos = (from ev in modelo.Eventos
                               select new
                               {
                                   display = ev.nombre_evento,
                                   value = ev.id
                               }).ToList();

                ddlJugador.DataSource = jugadores;
                ddlJugador.DataTextField = "display";
                ddlJugador.DataValueField = "value";
                ddlJugador.DataBind();
                ddlJugador.Items.Insert(0, new ListItem("Seleccione", ""));

                ddlEvento.DataSource = eventos;
                ddlEvento.DataTextField = "display";
                ddlEvento.DataValueField = "value";
                ddlEvento.DataBind();
                ddlEvento.Items.Insert(0, new ListItem("Seleccione", ""));
            }
        }

        //Evento btnSubmit
        //Gestiona la creación del evento en la BD
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(IsValid)
            {
                try
                {
                    Eventos_x_Partido nEvento = GenerarEvento();
                    modelo.Eventos_x_Partido.Add(nEvento);
                    modelo.SaveChanges();
                    Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "El usuario ha sido modificado con éxito", "frmListaUsuarios");
                    Utilidades.ClearTextBoxes(this);
                }
                catch (Exception ex)
                {
                    string msg = "Ha ocurrido un error inesperado, por favor comuníquese con" +
                                        " el administrador de la web brindándole la siguiente información: " + ex.Message;
                    Utilidades.CreateMessageByScript(ClientScript, GetType(), msg);
                }
            }
        }

        //Crear y devuelve un objeto del tipo Eventos_x_Partido
        protected Eventos_x_Partido GenerarEvento ()
        {
            Eventos_x_Partido nEvento = new Eventos_x_Partido();
            nEvento.id_evento = Int32.Parse(ddlEvento.SelectedValue);
            nEvento.id_jugador = Int32.Parse(ddlJugador.SelectedValue);
            nEvento.minuto_evento = Int32.Parse(txtMin.Text);
            nEvento.id_partido = idPartido;

            return nEvento;
        }
    }
}