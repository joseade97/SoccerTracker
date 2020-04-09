<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmSalir.aspx.cs" Inherits="Proyecto.Formularios.frmSalir" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Cierre de la sesión del usuario</h1>
    <p>¿Desea salir de la aplicación?</p>
    <p>&nbsp;</p>
    <p>
    <asp:Button ID="btnSi" runat="server" OnClick="btnSi_Click" Text="Sí" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnNo" runat="server" OnClick="btnNo_Click" Text="No" />
    </p>

</asp:Content>

