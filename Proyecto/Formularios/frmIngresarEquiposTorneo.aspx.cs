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
    public partial class frmIngresarEquiposTorneo : System.Web.UI.Page
    {
        ProyectoBD modelo = new ProyectoBD();
        int idTorneo;
        protected void Page_Load(object sender, EventArgs e)
        {
            idTorneo = Int32.Parse(Request.QueryString["id_torneo"]);
            if(!IsPostBack){
                var listaEquipos = (from eq in modelo.Equipos
                                    join d in modelo.Distritos on eq.id_distrito equals d.id_distrito
                                    join c in modelo.Cantones on d.id_canton equals c.id_canton
                                    join p in modelo.Provincias on c.id_provincia equals p.id_provincia
                                    join pr in modelo.Personas on eq.id_fundador equals pr.id
                                    orderby p.id_provincia, c.id_canton, d.id_distrito
                                    select new
                                    {
                                        eq.id,
                                        eq.nombre,
                                        fundador = pr.nombre + " " + pr.ape1 + " " + pr.ape2,
                                        eq.fecha_fundacion,
                                        distrito = d.nombre,
                                        canton = c.nombre,
                                        provincia = p.nombre

                                    }).ToList();

                grdEquipos.DataSource = listaEquipos;
                grdEquipos.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                ProcesarDatos();
            }
        }

        protected void ProcesarDatos()
        {
            var cant_equipos = (from c in modelo.Campeonatos
                                where c.id == idTorneo
                                select c.cant_equipos).FirstOrDefault();
            
            for (int i = 0; i < grdEquipos.Rows.Count; i++)
            {

                CheckBox seleccion = (CheckBox)grdEquipos.Rows[i].FindControl("chkSeleccion");
                if (seleccion.Checked)
                {
                    int idEquipo = Int32.Parse(grdEquipos.DataKeys[i].Value.ToString());

                    Equipos_x_Campeonato registro = new Equipos_x_Campeonato();
                    registro.id_campeonato = idTorneo;
                    registro.id_equipo = idEquipo;

                    modelo.Equipos_x_Campeonato.Add(registro);
                }
            }
            modelo.SaveChanges();
        }
    }
}