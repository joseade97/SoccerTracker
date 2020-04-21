<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmModificarUsuario.aspx.cs" Inherits="Proyecto.Formularios.frmModificarUsuario" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <form id="frm1" runat="server" class="text-center">
        <h2>Modificar Usuario</h2>
        <label class="mb-1">Nombre de Usuario</label>
        <br />
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtNombreUsuario" ForeColor="#FF5050"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" type="text" ID="txtNombreUsuario" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <br />
        <label class="mb-1">Contraseña</label>
        <asp:TextBox runat="server" type="password" ID="txtPassword" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
         <br />
        <label class="mb-1">Verificar Contraseña</label>
        <asp:CompareValidator ID="CompareValidator1" CssClass="validator-message" runat="server" ErrorMessage="Las contraseñas deben coincidir" ControlToCompare="txtVerContra" ControlToValidate="txtPassword"></asp:CompareValidator>
        <asp:TextBox runat="server" type="password" ID="txtVerContra" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <br />
        <label class="mb-1">Tipo de Usuario</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="ddlTipoUsu"></asp:RequiredFieldValidator>
        <asp:DropDownList runat="server" ID="ddlTipoUsu">
            <asp:ListItem Text="Seleccione" Value="" />
            <asp:ListItem Text="Administrador" Value="True" />
            <asp:ListItem Text="Consultor" Value="False" />
        </asp:DropDownList>
        <br />
        <label class="mb-1">Estado del Usuario</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="ddlEstado"></asp:RequiredFieldValidator>
        <asp:DropDownList runat="server" ID="ddlEstado">
            <asp:ListItem Text="Seleccione" Value="" />
            <asp:ListItem Text="Activo" Value="True" />
            <asp:ListItem Text="Inactivo" Value="False" />
        </asp:DropDownList>
        <br />
        <asp:Button Text="Guardar" ID="btnSubmit" class="btn btn-alter btn-xl" runat="server" OnClick="btnSubmit_Click" />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </form>

</asp:Content>
