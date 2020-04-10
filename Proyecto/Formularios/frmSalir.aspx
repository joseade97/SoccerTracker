<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmSalir.aspx.cs" Inherits="Proyecto.Formularios.frmSalir" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <h3>Cierre de la sesión del usuario</h3>
        <h4>¿Desea salir de la aplicación?</h4>
        &nbsp;
        <p>
        <asp:Button ID="btnSi" runat="server" OnClick="btnSi_Click" Text="Sí" style="text-align:center; width: 45px;" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnNo" runat="server" OnClick="btnNo_Click" Text="No" style="text-align:center; width: 45px;" />
        </p>
    </form>

</asp:Content>

