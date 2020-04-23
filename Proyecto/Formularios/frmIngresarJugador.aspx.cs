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
    public partial class frmIngresarJugador : System.Web.UI.Page
    {
        ///se crea una instancia del modelo de base de datos
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitForm();
            }
        }
        /// <summary>
        /// verificacion del numero de identificacion para obtener el nombre de la persona
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnVal_Click(object sender, EventArgs e)
        {
            ///se crea variable para obtener el nombre de la persona y asignarlo al txtIdentificacion
            var persona = (from u in modelo.Personas
                           where u.num_identificacion == txtIdentificacion.Text
                           select new { u.id, nombre = u.nombre + " " + u.ape1 + " " + u.ape2 }).FirstOrDefault();
            ///verifica si la persona no es vacia, si no lo se agrega el nombre
            if (persona != null)
            {
                hdfIdJugador.Value = persona.id.ToString();
                txtNombreJugador.Text = persona.nombre;
            }
            else
            {
                ///mensaje por si la persona no existe o el codigo esta mal
                Utilidades.CreateMessageByScript(ClientScript, GetType(), "No hay ninguna persona registrada con ese número de identificación.");
            }
        }
        /// <summary>
        /// evento para ingresar jugador
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ///verifica que los campos requeridos fueron agregados correctamente
            if (IsValid)
            {
                ///verifica el que IDJugar no este vacio
                if (!String.IsNullOrEmpty(hdfIdJugador.Value))
                {
                    try
                    {
                        ///se agrega el jugador
                        Jugadore nJugador = GenerarJugador();
                        modelo.Jugadores.Add(nJugador);
                        modelo.SaveChanges();
                        ///mensaje de que el jugador fue agregado
                        Utilidades.CreateMessageByScript(ClientScript, GetType(), "El jugador ha sido ingresado con éxito");
                        Utilidades.ClearTextBoxes(this);
                    }
                    catch (Exception ex)
                    {
                        ///mensaje por algun error al ingresar jugador
                        string msg = "Ha ocurrido un error inesperado, por favor comuníquese con" +
                                        " el administrador de la web brindándole la siguiente información: " + ex.Message;
                        Utilidades.CreateMessageByScript(ClientScript, GetType(), msg);
                    }
                }
                else
                {
                    ///error por que el numero de identificacion no existe en las peronas
                    Utilidades.CreateMessageByScript(ClientScript, GetType(), "Por favor valide el número de identificación para continuar");
                }
            }
        }
        /// <summary>
        /// Procedimiento para carga los datos de equipos y posiciones para asignarle al jugador
        /// </summary>
        protected void InitForm()
        {
            ///se crea variable que devuelve la lista de equipos
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
            ddlEquipo.Items.Insert(0, new ListItem("Seleccione", ""));

            ///se crea variable que devuelve la lista de posiciones
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
            ddlPosicion.Items.Insert(0, new ListItem("Seleccione", ""));
        }
        /// <summary>
        /// Procedimiento que genera el jugar segun los datos ingresados por el administrador
        /// </summary>
        /// <returns></returns>
        protected Jugadore GenerarJugador()
        {
            Jugadore nJugador = new Jugadore();
            nJugador.id_equipo = Int32.Parse(ddlEquipo.SelectedValue);
            nJugador.id_persona = Int32.Parse(hdfIdJugador.Value);
            nJugador.id_posicion = Int32.Parse(ddlPosicion.SelectedValue);

            return nJugador;
        }
    }
}