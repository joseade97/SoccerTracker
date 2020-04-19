<%@ Page Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmIngresarEquipo.aspx.cs" Inherits="Proyecto.Formularios.frmIngresarEquipo" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form id="form1" runat="server" class="text-center">
        <asp:HiddenField runat="server" ID="hdfIdFundador"/>
        <label class="mb-1">Nombre del Equipo</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtNombre"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" ID="txtNombre" type="text" class="form-control md-textbox btn" />
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
        <label class="mb-1">Número de identificación del fundador</label>
        <br />
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Este campo es requerido"
            ControlToValidate="txtIdentificacion" ForeColor="#FF5050"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" type="text" ID="txtIdentificacion" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <asp:Button Text="Validar identificación" ID="btnVal" class="btn btn-alter btn-s" runat="server" OnClick="btnVal_Click" />
        <br />
        <label class="mb-1">Nombre del fundador seleccionado</label>
        <br />
        <asp:TextBox runat="server" disabled="disabled" ID="txtNombreFundador" class="form-control md-textbox btn" />
        <br />
        <label class="mb-1">Fec. Fundación</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator10" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtFecFund"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" type="text" ID="txtFecFund" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <asp:RegularExpressionValidator CssClass="validator-message" ID="RegularExpressionValidator4" runat="server"  ControlToValidate="txtFecFund"
            ErrorMessage="Por favor, indique la fecha en formato: dd/mm/yyyy" ValidationExpression="^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$"></asp:RegularExpressionValidator>
        <br />
        <asp:Button Text="Guardar" ID="btnSubmit" class="btn btn-alter btn-xl" runat="server" OnClick="btnSubmit_Click" />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    </form>

</asp:Content>
