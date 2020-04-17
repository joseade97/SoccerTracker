<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmModificarPersona.aspx.cs" Inherits="Proyecto.Formularios.frmModificarPersona" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form id="frm1" runat="server" class="text-center">
        <h2>Ingresar Nueva Persona</h2>
        <label class="mb-1">Nombre</label>
        <br />
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtNombre" ForeColor="#FF5050"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" type="text" ID="txtNombre" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <br />
        <label class="mb-1">Primer Apellido</label>
        <br />
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtApe1" ForeColor="#FF5050"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" type="text" ID="txtApe1" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <br />
        <label class="mb-1">Segundo Apellido</label>
        <br />
        <asp:TextBox runat="server" type="text" ID="txtApe2" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <br />
        <label class="mb-1">Correo</label>
        <asp:RegularExpressionValidator CssClass="validator-message" ID="RegularExpressionValidator1" runat="server" ErrorMessage="El valor debe corresponder a un correo válido." ControlToValidate="txtCorreo" ForeColor="#FF5050" ValidationExpression="^[a-zA-Z0-9.!#$%&amp;'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$"></asp:RegularExpressionValidator>
        <asp:TextBox runat="server" type="text" ID="txtCorreo" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <br />
        <label class="mb-1">Número de Identificación</label>
        <br />
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtCed" ForeColor="#FF5050"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" type="text" ID="txtCed" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <br />
        <label class="mb-1">Tipo de Identificación</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="ddlTipoIde"></asp:RequiredFieldValidator>
        <asp:DropDownList runat="server" ID="ddlTipoIde">
            <asp:ListItem Text="Seleccione" Value="" />
            <asp:ListItem Text="Nacional" Value="N" />
            <asp:ListItem Text="Extranjero" Value="E" />
        </asp:DropDownList>
        <br />
        <label class="mb-1">Género</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="ddlGenero"></asp:RequiredFieldValidator>
        <asp:DropDownList runat="server" ID="ddlGenero">
            <asp:ListItem Text="Seleccione" Value="" />
            <asp:ListItem Text="Masculino" Value="M" />
            <asp:ListItem Text="Femenino" Value="F" />
            <asp:ListItem Text="No especifica" Value="O" />
        </asp:DropDownList>
        <br />
        <label class="mb-1">Teléfono Principal</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtTel1"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" type="text" ID="txtTel1" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <asp:RegularExpressionValidator CssClass="validator-message" ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtTel1"
            ErrorMessage="Este campo sólo admite números" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
        <br />
        <label class="mb-1">Teléfono Secundario</label>
        <asp:RegularExpressionValidator CssClass="validator-message" ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtTel2"
            ErrorMessage="Este campo sólo admite números" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
        <asp:TextBox runat="server" type="text" ID="txtTel2" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <br />
        <label class="mb-1">Provincia</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator7" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="ddlProvincia"></asp:RequiredFieldValidator>
        <asp:DropDownList runat="server" ID="ddlProvincia" AutoPostBack="true" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <label class="mb-1">Cantón</label>
         <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="ddlCanton"></asp:RequiredFieldValidator>
        <asp:DropDownList runat="server" ID="ddlCanton" AutoPostBack="true" OnSelectedIndexChanged="ddlCanton_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <label class="mb-1">Distrito</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator9" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="ddlDistrito"></asp:RequiredFieldValidator>
        <asp:DropDownList runat="server" ID="ddlDistrito">
        </asp:DropDownList>
        <br />
        <label class="mb-1">Fec. Nacimiento</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator10" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtFecNac"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" type="text" ID="txtFecNac" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <asp:RegularExpressionValidator CssClass="validator-message" ID="RegularExpressionValidator4" runat="server"  ControlToValidate="txtFecNac"
            ErrorMessage="Por favor, indique la fecha en formato: dd/mm/yyyy" ValidationExpression="^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$"></asp:RegularExpressionValidator>
        <br />
        <label class="mb-1">Dirección Física</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator11" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtDireccion"></asp:RequiredFieldValidator>
        <asp:TextBox ID="txtDireccion" TextMode="multiline" Columns="50" Rows="5" runat="server" />
        <br />
        <asp:Button Text="Guardar" ID="btnSubmit" class="btn btn-alter btn-xl" runat="server" OnClick="btnSubmit_Click" />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </form>
</asp:Content>
