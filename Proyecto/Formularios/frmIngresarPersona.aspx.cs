using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto.Modelos;
using Microsoft.Ajax;
using Proyecto.Clases;

namespace Proyecto.Formularios
{
    public partial class frmIngresarPersona : System.Web.UI.Page
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                try
                {
                    Persona nPersona = GenerarNuevaPersona();
                    modelo.Personas.Add(nPersona);
                    modelo.SaveChanges();
                    Utilidades.CreateMessageByScript(ClientScript, GetType(), "La persona ha sido registrada con éxito");
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

        protected Persona GenerarNuevaPersona()
        {
            Persona nPersona = new Persona();
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
            return nPersona;
        }
    }
}