﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto.Formularios;
using Proyecto.Modelos;
using Microsoft.Reporting.WebForms;
using System.IO;

namespace Proyecto.Formularios
{
    public partial class frmReporteGoleadores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btBuscar_Click(object sender, EventArgs e)
        {
            this.construirReporte();
        }

        void construirReporte()
        {

            ///indicar la ruta del reporte
            string rutaReporte = "~/Reportes/ReporteGoleadores.rdlc";
            ///construir la ruta física
            string rutaServidor = Server.MapPath(rutaReporte);
            ///Validar que la ruta física exista
            if (!File.Exists(rutaServidor))
            {
                this.lblResultado.Text =
                    "El reporte seleccionado no existe";
                return;
            }
            else
            {
                rpvGoleadores.LocalReport.ReportPath = rutaServidor;
                var infoFuenteDatos = this.rpvGoleadores.LocalReport.GetDataSourceNames();
                ///limpiar los datos de la fuente de datos
                rpvGoleadores.LocalReport.DataSources.Clear();
                ///obtener los datos del reporte
                List<pa_RetornaPosiciones_Result> datosReporte =
                    null;
                ///crear la fuente de datos
                ReportDataSource fuenteDatos = new ReportDataSource();
                fuenteDatos.Name = infoFuenteDatos[0];
                fuenteDatos.Value = datosReporte;
                // agregar la fuente de datos al reporte
                this.rpvGoleadores.LocalReport.DataSources.Add(fuenteDatos);

                /// mostrar los datos en el reporte
                this.rpvGoleadores.LocalReport.Refresh();
            }
        }
        /// <summary>
        /// Función que retorna la fuente de datos a mostrar en el reporte
        /// </summary>
        /// <param name="pNombre"></param>
        /// <param name="pPuntuacion"></param>
        /// <returns></returns>
        List<pa_RetornaPosiciones_Result> retornaDatosReporte(
            string pNombre, string pPuntuacion)
        {
            return
                  null;
        }
    }
}