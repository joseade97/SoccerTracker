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
    public partial class frmEliminarEquiposTorneo : System.Web.UI.Page
    {
        ProyectoBD modelo = new ProyectoBD();
        int idTorneo;
        protected void Page_Load(object sender, EventArgs e)
        {
            idTorneo = Int32.Parse(Request.QueryString["id_torneo"]);
            if (!IsPostBack)
            {
                var listaEquipos = (from eq in modelo.Equipos
                                    join d in modelo.Distritos on eq.id_distrito equals d.id_distrito
                                    join c in modelo.Cantones on d.id_canton equals c.id_canton
                                    join p in modelo.Provincias on c.id_provincia equals p.id_provincia
                                    join pr in modelo.Personas on eq.id_fundador equals pr.id
                                    join ec in modelo.Equipos_x_Campeonato on eq.id equals ec.id_equipo
                                    where ec.id_campeonato == idTorneo
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
            ProcesarDatos();
        }

        protected void ProcesarDatos()
        {
            var estado = (from e in modelo.Campeonatos
                          where e.id == idTorneo
                          select e.estado).FirstOrDefault();
            if (!estado.Equals("I") && !estado.Equals("T")){
                try
                {
                    for (int i = 0; i < grdEquipos.Rows.Count; i++)
                    {

                        CheckBox seleccion = (CheckBox)grdEquipos.Rows[i].FindControl("chkSeleccion");
                        if (seleccion.Checked)
                        {
                            int idEquipo = Int32.Parse(grdEquipos.DataKeys[i].Value.ToString());
                            var registro = (from r in modelo.Equipos_x_Campeonato
                                            where r.id_campeonato == idTorneo && r.id_equipo == idEquipo
                                            select r).FirstOrDefault();
                            modelo.Equipos_x_Campeonato.Attach(registro);
                            modelo.Equipos_x_Campeonato.Remove(registro);
                            modelo.SaveChanges();
                        }
                    }
                    Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "Los equipos fueron eliminados con éxito", "frmEliminarEquiposTorneo?id_torneo=" + idTorneo);
                }
                catch (Exception ex)
                {
                    Utilidades.CreateMessageByScript(ClientScript, GetType(), "Ha ocurrido un error inesperado, por favor comuníquese con" +
                                                                              " su administrador web.");
                }
            }
            else
            {
                Utilidades.CreateMessageByScript(ClientScript, GetType(), "No puede eliminar equipos de un torneo iniciado o terminado");
            }
        }
    }
}