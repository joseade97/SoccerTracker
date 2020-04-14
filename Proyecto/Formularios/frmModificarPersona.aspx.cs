using System;
using System.Linq;
using System.Web.UI.WebControls;
using Proyecto.Modelos;
using Proyecto.Clases;
using System.Globalization;

namespace Proyecto.Formularios
{
    public partial class frmModificarPersona : System.Web.UI.Page
    {
        ProyectoBD modelo = new ProyectoBD();
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                InitForm();

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                try
                {
                    var persona = (from p in modelo.Personas
                                   where p.id == id
                                   select p).FirstOrDefault();
                    GenerarModificacionPersona(persona);
                    modelo.SaveChanges();
                    Utilidades.CreateMessageByScript(ClientScript, GetType(), "La persona ha sido modificada con éxito");
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

        protected void setDdlCanton()
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

        protected void setDdlDistrito()
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
        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            setDdlCanton();
        }
        protected void ddlCanton_SelectedIndexChanged(object sender, EventArgs e)
        {
            setDdlDistrito();
        }
        protected void InitForm()
        {
            id = Int32.Parse(Request.QueryString["idPersona"]);

            var persona = (from ps in modelo.Personas
                           where ps.id == id
                           join d in modelo.Distritos on ps.id_distrito equals d.id_distrito
                           join c in modelo.Cantones on d.id_canton equals c.id_canton
                           join pr in modelo.Provincias on c.id_provincia equals pr.id_provincia
                           select new { datos = ps, provincia = pr.id_provincia, canton = c.id_canton }).FirstOrDefault();

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
            ddlProvincia.SelectedValue = persona.provincia.ToString();
            setDdlCanton();
            ddlCanton.SelectedValue = persona.canton.ToString();
            setDdlDistrito();
            ddlDistrito.SelectedValue = persona.datos.id_distrito.ToString();

            txtNombre.Text = persona.datos.nombre;
            txtApe1.Text = persona.datos.ape1;
            txtApe2.Text = persona.datos.ape2 != null ? persona.datos.ape2 : String.Empty;
            txtCorreo.Text = persona.datos.correo != null ? persona.datos.correo : String.Empty;
            txtCed.Text = persona.datos.num_identificacion;
            ddlTipoIde.SelectedValue = persona.datos.tipo_identificacion;
            ddlGenero.SelectedValue = persona.datos.genero;
            txtTel1.Text = persona.datos.telefono_principal.ToString();
            txtTel2.Text = persona.datos.telefono_secundario != null ? persona.datos.telefono_secundario.ToString() : String.Empty;
            txtFecNac.Text = String.Format("dd/MM/yyyy", CultureInfo.InvariantCulture, persona.datos.fec_nacimiento);
            txtDireccion.Text = persona.datos.direccion_fisica;
        }

        protected void GenerarModificacionPersona(Persona nPersona)
        {
            if (String.IsNullOrEmpty(txtTel2.Text))
            {
                nPersona.telefono_secundario = null;
            }
            else
            {
                nPersona.telefono_secundario = Int32.Parse(txtTel2.Text);
            }
            nPersona.nombre = txtNombre.Text;
            nPersona.ape1 = txtApe1.Text;
            nPersona.ape2 = txtApe2.Text;
            nPersona.correo = txtCorreo.Text;
            nPersona.num_identificacion = txtCed.Text;
            nPersona.tipo_identificacion = ddlTipoIde.SelectedValue;
            nPersona.genero = ddlGenero.SelectedValue;
            nPersona.telefono_principal = Int32.Parse(txtTel1.Text);
            nPersona.id_distrito = Int32.Parse(ddlDistrito.SelectedValue);
            nPersona.direccion_fisica = txtDireccion.Text;
            nPersona.fec_nacimiento = DateTime.Parse(txtFecNac.Text);
        }
    }
}