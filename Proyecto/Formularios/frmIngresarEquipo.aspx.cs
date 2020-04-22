using Proyecto.Clases;
using Proyecto.Modelos;
using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace Proyecto.Formularios
{
    public partial class frmIngresarEquipo : System.Web.UI.Page
    {
        ///se crea una instancia del modelo de base de datos
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ///se asigna al ddlProvincia la lista de provincias
                ddlCanton.Items.Insert(0, new ListItem("Selecccione", ""));
                ddlDistrito.Items.Insert(0, new ListItem("Selecccione", ""));
                var provincias = (from p in modelo.Provincias
                                  select p).ToList();
                ddlProvincia.DataSource = provincias;
                ddlProvincia.DataBind();
                ddlProvincia.DataTextField = "nombre";
                ddlProvincia.DataValueField = "id_provincia";
                ddlProvincia.DataBind();
                ddlProvincia.Items.Insert(0, new ListItem("Seleccione", ""));
            }
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            ///se asigna al ddlCanton la lista de cantones dependiendo de la provincia
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
        protected void ddlCanton_SelectedIndexChanged(object sender, EventArgs e)
        {
            ///se asigna al ddlDistrito la lista de distritos dependiendo del canton
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

        protected void btnVal_Click(object sender, EventArgs e)
        {
            ///se crea variable para obtener el nombre del fundador del equipo segun el numero de identificacion
            var persona = (from u in modelo.Personas
                           where u.num_identificacion == txtIdentificacion.Text
                           select new { u.id, nombre = u.nombre + " " + u.ape1 + " " + u.ape2 }).FirstOrDefault();
            ///verifica que la persona exista para asignar el nombre al txtNombreFundador
            ///si no existe, da error
            if (persona != null)
            {
                hdfIdFundador.Value = persona.id.ToString();
                txtNombreFundador.Text = persona.nombre;
            }
            else
            {
                ///mensaje de error por si la persona no existe
                Utilidades.CreateMessageByScript(ClientScript, GetType(), "No hay ninguna persona registrada con ese número de identificación.");
            }
        }
        /// <summary>
        /// evento click para ingresar equipo
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ///verifica que los campos requeridos fue ingresados correctamente
            if (IsValid)
            {
                ///verifica que el idFundador no este vacio, de lo contrario dara error
                if (!String.IsNullOrEmpty(hdfIdFundador.Value))
                {
                    try
                    {
                        ///se genera el equipo y se asignan los datos del equipo a la base de datos
                        Equipos nEquipo = GenerarEquipo();
                        modelo.Equipos.Add(nEquipo);
                        modelo.SaveChanges();
                        Utilidades.CreateMessageByScript(ClientScript, GetType(), "El equipo ha sido ingresado con éxito");
                        Utilidades.ClearTextBoxes(this);
                    }
                    catch (Exception ex)
                    {
                        ///mensaje por si hay algun otro error
                        string msg = "Ha ocurrido un error inesperado, por favor comuníquese con" +
                                        " el administrador de la web brindándole la siguiente información: " + ex.Message;
                        Utilidades.CreateMessageByScript(ClientScript, GetType(), msg);
                    }
                }
                else
                {
                    ///error por que el idFundador esta vacio o incorrecto
                    Utilidades.CreateMessageByScript(ClientScript, GetType(), "Por favor valide el número de identificación para continuar");
                }
            }
        }
        /// <summary>
        /// Procedimiento que genera equipos segun los datos brindados por el administrador
        /// </summary>
        /// <returns></returns>
        protected Equipos GenerarEquipo()
        {
            Equipos nEquipo = new Equipos();
            nEquipo.nombre = txtNombre.Text;
            nEquipo.id_distrito = Int32.Parse(ddlDistrito.SelectedValue);
            nEquipo.id_fundador = Int32.Parse(hdfIdFundador.Value);
            nEquipo.fecha_fundacion = DateTime.Parse(txtFecFund.Text);
            return nEquipo;
        }
    }
}