<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmSalir.aspx.cs" Inherits="Proyecto.Formularios.frmSalir" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <form id="form1" runat="server" class="text-center">
        <h3>Cierre de la sesión del usuario</h3>
        <h4>¿Desea salir de la aplicación?</h4>
        <asp:Button Text="Sí" ID="btnSi" class="btn btn-alter btn-xl" runat="server" OnClick="btnSi_Click" /> 
        <asp:Button Text="No" ID="btnNo" class="btn btn-cancel btn-xl" runat="server" OnClick="btnNo_Click" />
    </form>

</asp:Content>

