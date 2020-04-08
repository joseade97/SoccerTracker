<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="Proyecto.Formularios.frmLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
    <div class="login">
        <asp:Label ID="Label1" runat="server" class="mb-1" style="color: #FFFFFF" Text="Usuario" BorderColor="Black"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox style="width: 200px; background-color: white;" runat="server" type="text" id="txtUsuario" class="form-control btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" class="mb-1" style="color: #FFFFFF" Text="Contraseña" BorderColor="Black"></asp:Label>
        <asp:TextBox style="width: 200px; background-color: white;" runat="server" type="password" id="txtContrasena" class="form-control btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:Button ID="btnIngresar" runat="server" OnClick="btnIngresar_Click" Text="Ingresar" class="btn btn-primary btn-xl js-scroll-trigger"></asp:Button>
        <br />
        <br />
        <asp:Label ID="lblResultado" runat="server" Font-Size="X-Large" Font-Bold="True"></asp:Label>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <br />
     </div>
     </form>

</asp:Content>
