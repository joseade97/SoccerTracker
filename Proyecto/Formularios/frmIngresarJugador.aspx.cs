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
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitForm();
            }
        }

        protected void btnVal_Click(object sender, EventArgs e)
        {
            var persona = (from u in modelo.Personas
                           where u.num_identificacion == txtIdentificacion.Text
                           select new { u.id, nombre = u.nombre + " " + u.ape1 + " " + u.ape2 }).FirstOrDefault();
            if (persona != null)
            {
                hdfIdJugador.Value = persona.id.ToString();
                txtNombreJugador.Text = persona.nombre;
            }
            else
            {
                Utilidades.CreateMessageByScript(ClientScript, GetType(), "No hay ninguna persona registrada con ese número de identificación.");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                if (!String.IsNullOrEmpty(hdfIdJugador.Value))
                {
                    try
                    {
                        Jugadore nJugador = GenerarJugador();
                        modelo.Jugadores.Add(nJugador);
                        modelo.SaveChanges();
                        Utilidades.CreateMessageByScript(ClientScript, GetType(), "El jugador ha sido ingresado con éxito");
                        Utilidades.ClearTextBoxes(this);
                    }
                    catch (Exception ex)
                    {
                        string msg = "Ha ocurrido un error inesperado, por favor comuníquese con" +
                                        " el administrador de la web brindándole la siguiente información: " + ex.Message;
                        Utilidades.CreateMessageByScript(ClientScript, GetType(), msg);
                    }
                }
                else
                {
                    Utilidades.CreateMessageByScript(ClientScript, GetType(), "Por favor valide el número de identificación para continuar");
                }
            }
        }

        protected void InitForm()
        {
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