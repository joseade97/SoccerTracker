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
        ///se crea una instancia del modelo de base de datos
        ProyectoBD modelo = new ProyectoBD();
        ///variable para asignar el id del torneo
        int idTorneo;
        protected void Page_Load(object sender, EventArgs e)
        {
            ///se asigna el valor de id_torneo a la variable idTorneo
            idTorneo = Int32.Parse(Request.QueryString["id_torneo"]);
            if (!IsPostBack)
            {
                ///se crea variable para asignar los datos del equipo por agregar en el torneo
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
        /// <summary>
        /// evento click para procesar los datos ingresados
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                ProcesarDatos();
            }
        }
        /// <summary>
        /// procedimiento que procesa los datos ingresados
        /// </summary>
        protected void ProcesarDatos()
        {
            ///variable que asigna la cantidad de equipos por torneo
            var cant_equipos = (from c in modelo.Campeonatos
                                where c.id == idTorneo
                                select c.cant_equipos).FirstOrDefault();

            ////variable que asigna la cantidad de ingresados al torneo
            var cant_ingresados = (from c in modelo.Equipos_x_Campeonato
                                   where c.id_campeonato == idTorneo
                                   select c).Count();
            ///variable para asignar la cantidad de equipos actuales
            int actuales = cant_ingresados;

            for (int i = 0; i < grdEquipos.Rows.Count; i++)
            {
                ///se verifica los equipos seleccionados
                CheckBox seleccion = (CheckBox)grdEquipos.Rows[i].FindControl("chkSeleccion");
                ///se verifica que esten seleccionados para asignarlos al torneo y subir la cantidad de equipos ingresados
                if (seleccion.Checked)
                {
                    int idEquipo = Int32.Parse(grdEquipos.DataKeys[i].Value.ToString());
                    Equipos_x_Campeonato registro = new Equipos_x_Campeonato();
                    registro.id_campeonato = idTorneo;
                    registro.id_equipo = idEquipo;

                    modelo.Equipos_x_Campeonato.Add(registro);
                    cant_ingresados++;
                }
            }
            ///se verifica que la cantidad de ingresados sea menor a la cantidad de equipos para poder agregar mas equipos al torneo
            if (cant_ingresados <= cant_equipos)
            {
                try
                {
                    modelo.SaveChanges();
                    Utilidades.CreateMessageByScript(ClientScript, GetType(), "Los equipos fueron agregados con éxito");
                    lblRes.Text = "";
                }
                catch (Exception ex)
                {
                    ///error para verificar que el equipo a asignar ya esta registrado en el proyecto
                    lblRes.Text = "Por favor verifique que los equipos que intenta ingresar, no estén actualmente registros en el torneo.";
                }
            }
            else
            {
                ///mensaje de error por si se agregan mas equipos de los permitidos
                Utilidades.CreateMessageByScript(ClientScript, GetType(),
                           $"No es posible agregar la cantidad de equipos seleccionada. Actualmente hay {actuales} ingresados, el " +
                           $"máximo de equipos es de {cant_equipos}");
            }
        }
    }
}