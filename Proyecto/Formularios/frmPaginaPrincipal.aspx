<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmPaginaPrincipal.aspx.cs" Inherits="Proyecto.Formularios.frmPaginaPrincipal" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="masthead d-flex" style="height: 85%">
        <div class="container text-center my-auto">
            <h1 class="mb-1" style="color: #FFFFFF">Soccer Tracker</h1>
            <h3 class="mb-5">
                <em style="color: #FFFFFF">Sistema de Control de Fútbol</em>
            </h3>
            <asp:Label Style="text-align: left;" ID="lblDatosUsuario" runat="server" Font-Size="X-Large" ForeColor="White"></asp:Label>
            <br />
            <div runat="server">
                <form id="form1" runat="server">
                    <asp:Button Style="font-size: 18px;" ID="btnSalir" runat="server" OnClick="btnSalir_Click" Text="Cerrar Sesión" class="btn btn-primary btn-xl js-scroll-trigger"></asp:Button>
                </form>
            </div>
        </div>
        <div class="overlay"></div>
    </div>
</asp:Content>
