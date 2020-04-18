<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmIngresarUsuario.aspx.cs" Inherits="Proyecto.Formularios.frmIngresarUsuario" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <form id="frm1" runat="server" class="text-center">
        <asp:HiddenField runat="server" ID="hdfIdPersona"/>
        <h2>Ingresar Nuevo Usuario</h2>
        <label class="mb-1">Nombre de Usuario</label>
        <br />
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtNombreUsuario" ForeColor="#FF5050"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" type="text" ID="txtNombreUsuario" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <br />
        <label class="mb-1">Contraseña</label>
        <br />
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtPassword" ForeColor="#FF5050"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" type="text" ID="txtPassword" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <br />
        <label class="mb-1">Tipo de Usuario</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="ddlTipoUsu"></asp:RequiredFieldValidator>
        <asp:DropDownList runat="server" ID="ddlTipoUsu">
            <asp:ListItem Text="Seleccione" Value="" />
            <asp:ListItem Text="Administrador" Value="true" />
            <asp:ListItem Text="Genérico" Value="false" />
        </asp:DropDownList>
        <br />
        <label class="mb-1">Estado del Usuario</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="ddlEstado"></asp:RequiredFieldValidator>
        <asp:DropDownList runat="server" ID="ddlEstado">
            <asp:ListItem Text="Seleccione" Value="" />
            <asp:ListItem Text="Activo" Value="true" />
            <asp:ListItem Text="Inactivo" Value="false" />
        </asp:DropDownList>
        <br />
        <label class="mb-1">Número de identificación</label>
        <br />
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtIdentificacion" ForeColor="#FF5050"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" type="text" ID="txtIdentificacion" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox> <asp:Button Text="Validar identificación" ID="btnVal" class="btn btn-alter btn-s" runat="server" OnClick="btnVal_Click"  />
        <br />
        <label class="mb-1">Nombre de Persona Seleccionada</label>
        <br />
        <asp:TextBox runat="server" disabled="disabled" ID="txtNombre"/>
        <br />
        <asp:Button Text="Guardar" ID="btnSubmit" class="btn btn-alter btn-xl" runat="server" OnClick="btnSubmit_Click" />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </form>

</asp:Content>
