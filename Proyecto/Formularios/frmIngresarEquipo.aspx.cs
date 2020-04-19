using Proyecto.Clases;
using Proyecto.Modelos;
using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace Proyecto.Formularios
{
    public partial class frmIngresarEquipo : System.Web.UI.Page
    {
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                if (!String.IsNullOrEmpty(hdfIdFundador.Value))
                {
                    try
                    {
                        Equipos nEquipo = GenerarEquipo();
                        modelo.Equipos.Add(nEquipo);
                        modelo.SaveChanges();
                        Utilidades.CreateMessageByScript(ClientScript, GetType(), "El equipo ha sido ingresado con éxito");
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