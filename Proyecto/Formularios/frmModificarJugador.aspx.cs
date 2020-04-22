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
    public partial class frmModificarJugador : System.Web.UI.Page
    {
        //Se crean propiedades de clase
        ProyectoBD modelo = new ProyectoBD();
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Se inicializa el formulario
            id = Int32.Parse(Request.QueryString["id_jugador"]);
            if (!IsPostBack)
            {
                InitForm();
            }
        }

        //Se inicializan campos del formulario
        protected void InitForm()
        {
            var jugador = (from j in modelo.Jugadores
                           where j.id == id
                           join p in modelo.Personas on j.id_persona equals p.id
                           select new
                           {
                               j.id_equipo,
                               j.id_posicion,
                               j.id_persona,
                               nombre = p.nombre + " " + p.ape1 + " " + p.ape2 ?? "",
                               p.num_identificacion
                           }).FirstOrDefault();

            var equipos = (from e in modelo.Equipos
                           select new
                           {
                               e.nombre,
                               valor = e.id
                           }).ToList();
            ddlEquipo.DataSource = equipos;
            ddlEquipo.DataTextField = "nombre";
            ddlEquipo.DataValueField = "valor";
            ddlEquipo.DataBind();
            ddlEquipo.SelectedValue = jugador.id_equipo.ToString();

            var posiciones = (from r in modelo.Posiciones
                              select new
                              {
                                  nombre = r.nombre + " - " + r.codigo_posicion,
                                  valor = r.id
                              }).ToList();
            ddlPosicion.DataSource = posiciones;
            ddlPosicion.DataTextField = "nombre";
            ddlPosicion.DataValueField = "valor";
            ddlPosicion.DataBind();
            ddlPosicion.SelectedValue = jugador.id_posicion.ToString();
            txtNombreJugador.Text = jugador.nombre;
        }

        //evento submit
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //Valida datos
            if (IsValid)
            {
                try
                {
                    //Modifica datos en la BD
                    var jugador = (from j in modelo.Jugadores
                                   where j.id == id
                                   select j).FirstOrDefault();
                    GenerarModJugador(jugador);
                    modelo.SaveChanges();
                    Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "El jugador ha sido modificado con éxito", "frmListaJugadores");
                }
                catch (Exception ex)
                {
                    string msg = "Ha ocurrido un error inesperado, por favor comuníquese con" +
                                    " el administrador de la web brindándole la siguiente información: " + ex.Message;
                    Utilidades.CreateMessageandRedirect(ClientScript, GetType(), msg, "frmListaJugadores");
                }
            }
        }

        //Modifica Jugador que recibe por parámetro
        protected void GenerarModJugador(Jugadore nJugador)
        {
            nJugador.id_equipo = Int32.Parse(ddlEquipo.SelectedValue);
            nJugador.id_posicion = Int32.Parse(ddlPosicion.SelectedValue);
        }
    }
}