using Proyecto.Clases;
using Proyecto.Modelos;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto.Formularios
{
    public partial class frmModificarEquipo : System.Web.UI.Page
    {
        ///Se crean variables de clase para la gestión del formulario
        ProyectoBD modelo = new ProyectoBD();
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            ///se cargan los datos del equipo a modificar
            id = Int32.Parse(Request.QueryString["id_equipo"]);
            if (!IsPostBack)
            {
                InitForm();
            }
        }

        protected void InitForm()
        {
            ///se carga la informacion del equipo a modificar
            var equipo = (from e in modelo.Equipos
                          where e.id == id
                          select e).FirstOrDefault();
            ///se asigna la informacion a los campos
            EstablecerDdls(equipo);
            txtFecFund.Text = ((DateTime)equipo.fecha_fundacion).ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);
            txtNombre.Text = equipo.nombre;
            EstablecerDatosFundador(equipo);

        }
        /// <summary>
        /// se obtiene los datos del fundador y se asigna a los campos destinados
        /// </summary>
        /// <param name="equipo"></param>
        protected void EstablecerDatosFundador(Equipos equipo)
        {
            var fundador = (from f in modelo.Personas
                            where f.id == equipo.id_fundador
                            select new { nombre_fundador = f.nombre + " " + f.ape1 + " " + (f.ape2 ?? ""), f.num_identificacion }).FirstOrDefault();

            hdfIdFundador.Value = equipo.id_fundador.ToString();
            txtIdentificacion.Text = fundador.num_identificacion;
            txtNombreFundador.Text = fundador.nombre_fundador;
        }

        /// <summary>
        /// se obtiene informacion de las zonas y se agregan a los campos destinados
        /// </summary>
        /// <param name="equipo"></param>
        protected void EstablecerDdls(Equipos equipo)
        {
            var zonas = (from d in modelo.Distritos
                         join c in modelo.Cantones on d.id_canton equals c.id_canton
                         join p in modelo.Provincias on c.id_provincia equals p.id_provincia
                         where d.id_distrito == equipo.id_distrito
                         select new { provincia = p.id_provincia, distrito = d.id_distrito, canton = c.id_canton }).FirstOrDefault();

            var provincias = (from p in modelo.Provincias
                              select p).ToList();
            ddlProvincia.DataSource = provincias;
            ddlProvincia.DataBind();
            ddlProvincia.DataTextField = "nombre";
            ddlProvincia.DataValueField = "id_provincia";
            ddlProvincia.DataBind();
            ddlProvincia.Items.Insert(0, new ListItem("Seleccione", ""));
            ddlProvincia.SelectedValue = zonas.provincia.ToString();

            var cantones = (from c in modelo.Cantones
                            where c.id_provincia == zonas.provincia
                            select c).ToList();
            ddlCanton.DataSource = cantones;
            ddlCanton.DataBind();
            ddlCanton.DataTextField = "nombre";
            ddlCanton.DataValueField = "id_canton";
            ddlCanton.DataBind();
            ddlCanton.Items.Insert(0, new ListItem("Seleccione", ""));
            ddlCanton.SelectedValue = zonas.canton.ToString();

            var distritos = (from d in modelo.Distritos
                             where d.id_canton == zonas.canton
                             select d).ToList();

            ddlDistrito.DataSource = distritos;
            ddlDistrito.DataBind();
            ddlDistrito.DataTextField = "nombre";
            ddlDistrito.DataValueField = "id_distrito";
            ddlDistrito.DataBind();
            ddlDistrito.Items.Insert(0, new ListItem("Seleccione", ""));
            ddlDistrito.SelectedValue = zonas.distrito.ToString();

        }
        /// <summary>
        /// se verifica que el numero de identificacion exista para devolver nombre del fundador
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnVal_Click(object sender, EventArgs e)
        {
            var persona = (from u in modelo.Personas
                           where u.num_identificacion == txtIdentificacion.Text
                           select new { u.id, nombre = u.nombre + " " + u.ape1 + " " + u.ape2 }).FirstOrDefault();
            if (persona != null)
            {
                hdfIdFundador.Value = persona.id.ToString();
                txtNombreFundador.Text = persona.nombre;
            }
            else
            {
                Utilidades.CreateMessageByScript(ClientScript, GetType(), "No hay ninguna persona registrada con ese número de identificación.");
            }
        }
        ///Evento submit para modificar el equipo
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ///Valida datos
            if (IsValid)
            {
                if (!String.IsNullOrEmpty(hdfIdFundador.Value))
                {
                    try
                    {
                        var equipo = (from eq in modelo.Equipos
                                      where eq.id == id
                                      select eq).FirstOrDefault();
                        ModificarEquipo(equipo);
                        modelo.SaveChanges();
                        Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "El equipo ha sido modificado con éxito", "frmListaEquipos");
                    }
                    catch (Exception ex)
                    {
                        string msg = "Ha ocurrido un error inesperado, por favor comuníquese con" +
                                        " el administrador de la web brindándole la siguiente información: " + ex.Message;
                        Utilidades.CreateMessageandRedirect(ClientScript, GetType(), msg, "frmListaEquipos");
                    }
                }
                else
                {
                    Utilidades.CreateMessageByScript(ClientScript, GetType(), "Por favor valide el número de identificación para continuar");
                }
            }
        }
        ///se asignan los datos de las provincias
        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            var provincia = Int32.Parse(ddlProvincia.SelectedValue);
            var cantones = (from c in modelo.Cantones
                            where c.id_provincia == provincia
                            select c).ToList();
            ddlCanton.DataSource = cantones;
            ddlCanton.DataBind();
            ddlCanton.DataTextField = "nombre";
            ddlCanton.DataValueField = "id_canton";
            ddlCanton.DataBind();
            ddlCanton.Items.Insert(0, new ListItem("Seleccione", ""));
        }
        ///se asignan los datos de los cantones segun la provincia
        protected void ddlCanton_SelectedIndexChanged(object sender, EventArgs e)
        {
            var canton = Int32.Parse(ddlCanton.SelectedValue);
            var distritos = (from d in modelo.Distritos
                             where d.id_canton == canton
                             select d).ToList();

            ddlDistrito.DataSource = distritos;
            ddlDistrito.DataBind();
            ddlDistrito.DataTextField = "nombre";
            ddlDistrito.DataValueField = "id_distrito";
            ddlDistrito.DataBind();
            ddlDistrito.Items.Insert(0, new ListItem("Seleccione", ""));
        }
        ///se asginan los datos de los distritos segun el canton
        protected void ModificarEquipo(Equipos nEquipo)
        {
            nEquipo.nombre = txtNombre.Text;
            nEquipo.id_distrito = Int32.Parse(ddlDistrito.SelectedValue);
            nEquipo.id_fundador = Int32.Parse(hdfIdFundador.Value);
            nEquipo.fecha_fundacion = DateTime.Parse(txtFecFund.Text);
        }
    }
}