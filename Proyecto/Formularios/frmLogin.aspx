<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="Proyecto.Formularios.frmLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
    <div class="login">
        <h4 class="mb-1" style="color: #FFFFFF">Usuario</h4>
        <asp:TextBox style="width: 200px; background-color: white;" runat="server" type="text" id="txtUsuario" class="form-control btn" />
        <br />
        <h4 class="mb-1" style="color: #FFFFFF">Contraseña</h4>
        <asp:TextBox style="width: 200px; background-color: white;" runat="server" type="password" id="txtContrasena" class="form-control btn" />
        <br />
        <br />
        <a class="btn btn-primary btn-xl js-scroll-trigger" id="btnIngresar" runat="server" OnClick="btnIngresar_Click">Ingresar</a>
        <br />
        <br />
        <asp:Label ID="lblResultado" runat="server"></asp:Label>
        <br />
     </div>
     </form>

</asp:Content>
