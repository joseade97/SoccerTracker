using Proyecto.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto.Formularios
{
    public partial class frmListaTorneos : System.Web.UI.Page
    {
        ///Se crean variables de clase para la gestión del formulario
        ProyectoBD modelo = new ProyectoBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            ///se carga la lista de torneos
            var torneos = (from t in modelo.Campeonatos
                           join p in modelo.Personas on t.id_dedicado equals p.id
                           where t.estado != "T"
                           select new
                           {
                               t.id,
                               t.fec_inicio,
                               t.fec_fin,
                               t.cant_equipos,
                               estado = t.estado == "I" ? "Iniciado":"Creado",
                               dedicado = p.nombre + " " + p.ape1 + " " + p.ape2 ?? ""
                           }).ToList();
            ///se asigna la lista al grid
            grdTorneos.DataSource = torneos;
            grdTorneos.DataBind();
        }
    }
}