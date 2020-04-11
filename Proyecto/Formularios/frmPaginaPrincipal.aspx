<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmPaginaPrincipal.aspx.cs" Inherits="Proyecto.Formularios.frmPaginaPrincipal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Este es el boton de salir cuando un usuario esta logueado -->
    <form id="form1" runat="server">
    <asp:Button style="font-size: 18px;" ID="btnSalir" runat="server" OnClick="btnSalir_Click" Text="Cerrar Sesión" class="btn btn-primary btn-xl js-scroll-trigger"></asp:Button>
    </form>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <asp:Label style="text-align:left;" ID="lblDatosUsuario" runat="server" Font-Size="X-Large"></asp:Label>

</asp:Content>
