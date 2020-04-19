using Proyecto.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto.Formularios
{
    public partial class frmListaEquipos : System.Web.UI.Page
    {
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarEquipos();
        }

        protected void CargarEquipos()
        {
            var listaEquipos = (from e in modelo.Equipos
                                join d in modelo.Distritos on e.id_distrito equals d.id_distrito
                                join c in modelo.Cantones on d.id_canton equals c.id_canton
                                join p in modelo.Provincias on c.id_provincia equals p.id_provincia
                                join pr in modelo.Personas on e.id_fundador equals pr.id
                                orderby p.id_provincia, c.id_canton, d.id_distrito
                                select new
                                {
                                    e.id,
                                    e.nombre,
                                    fundador = pr.nombre + " " + pr.ape1 + " " + pr.ape2,
                                    e.fecha_fundacion,
                                    distrito = d.nombre,
                                    canton = c.nombre,
                                    provincia = p.nombre

                                }).ToList();

            grdEquipos.DataSource = listaEquipos;
            grdEquipos.DataBind();

        }
    }
}