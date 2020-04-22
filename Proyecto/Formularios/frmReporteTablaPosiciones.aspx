<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmReporteTablaPosiciones.aspx.cs" Inherits="Proyecto.Formularios.frmReporteTablaPosiciones" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <form id="form1" runat="server">
        <asp:ScriptManager ID="scmReporteClientes" runat="server"></asp:ScriptManager>
        <div>
            <h1 class="auto-style1">Reporte Tabla de Posiciones por Torneo</h1>               
              <p> Buscar por</p>
        </div>
        <asp:Label ID="Label1" runat="server" Text="Número de Equipo:"></asp:Label>
        <asp:TextBox ID="txtNumeroEquipo" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Número de Torneo:"></asp:Label>
        <asp:TextBox ID="txtNumeroTorneo" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Ver Reporte" />
        <br />
        <br />
        <br />
        <asp:Label ID="lblResultado" runat="server" ForeColor="Red"></asp:Label>       
        <br />
        <br />       
        <rsweb:ReportViewer ID="rpvTablaPosiciones" runat="server" Width="100%">
        </rsweb:ReportViewer>
    </form>

    

</asp:Content>
