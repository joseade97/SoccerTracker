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
        ///se crea una instancia del modelo de base de datos
        ProyectoBD modelo = new ProyectoBD();
        ///variable para asignar id del torneo
        int idTorneo;
        protected void Page_Load(object sender, EventArgs e)
        {
            ///se asigna el valor de id_torneo a la variable
            idTorneo = Int32.Parse(Request.QueryString["id_torneo"]);
            if (!IsPostBack)
            {
                ///varaible que obtiene la lista de equipos que pertenecen al torneo
                ///devuelve id, nombre, nombre completo del fundador, fecha de fundacion, distrito, canton y provincia
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
        /// <summary>
        /// evento click para procesar los datos
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ProcesarDatos();
        }

        /// <summary>
        /// Procedimiento para procesar datos
        /// </summary>
        protected void ProcesarDatos()
        {
            ///se crea variable que obtiene el estado del torneo
            var estado = (from e in modelo.Campeonatos
                          where e.id == idTorneo
                          select e.estado).FirstOrDefault();
            ///verifica que el estado del torneo se diferente de 'Iniciado' y 'Terminado'
            if (!estado.Equals("I") && !estado.Equals("T")){
                try
                {
                    for (int i = 0; i < grdEquipos.Rows.Count; i++)
                    {
                        ///se verifica los equipos que estan seleccionados
                        CheckBox seleccion = (CheckBox)grdEquipos.Rows[i].FindControl("chkSeleccion");
                        if (seleccion.Checked)
                        {
                            ///se crea variable y se asigna el valor del id_equipo
                            int idEquipo = Int32.Parse(grdEquipos.DataKeys[i].Value.ToString());
                            ///se crea variable que devuelve el equipo a eliminar
                            var registro = (from r in modelo.Equipos_x_Campeonato
                                            where r.id_campeonato == idTorneo && r.id_equipo == idEquipo
                                            select r).FirstOrDefault();
                            modelo.Equipos_x_Campeonato.Attach(registro);
                            modelo.Equipos_x_Campeonato.Remove(registro);
                            modelo.SaveChanges();
                        }
                    }
                    ///mensaje de que se eliminaron los equipos correctamente
                    Utilidades.CreateMessageandRedirect(ClientScript, GetType(), "Los equipos fueron eliminados con éxito", "frmEliminarEquiposTorneo?id_torneo=" + idTorneo);
                }
                catch (Exception ex)
                {
                    ///error por cualquier otro error
                    Utilidades.CreateMessageByScript(ClientScript, GetType(), "Ha ocurrido un error inesperado, por favor comuníquese con" +
                                                                              " su administrador web.");
                }
            }
            else
            {
                ///error por si el torneo esta iniciado o terminado
                Utilidades.CreateMessageByScript(ClientScript, GetType(), "No puede eliminar equipos de un torneo iniciado o terminado");
            }
        }
    }
}