<%@ Page Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmRegistrarEventos.aspx.cs" Inherits="Proyecto.Formularios.frmRegistrarEventos" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form id="frm1" runat="server" class="text-center">
        <h2>Registrar Evento</h2>
        <br />
        <label class="mb-1">Jugador</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator2" runat="server"
            ErrorMessage="Este campo es requerido" ControlToValidate="ddlJugador"></asp:RequiredFieldValidator>
        <asp:DropDownList runat="server" ID="ddlJugador">
        </asp:DropDownList>
        <br />
        <label class="mb-1">Evento</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator1" runat="server"
            ErrorMessage="Este campo es requerido" ControlToValidate="ddlEvento"></asp:RequiredFieldValidator>
        <asp:DropDownList runat="server" ID="ddlEvento">
        </asp:DropDownList>
        <br />
        <label class="mb-1">Minuto</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtMin"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" type="text" ID="txtMin" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <asp:RegularExpressionValidator CssClass="validator-message" ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMin"
            ErrorMessage="Este campo sólo admite números" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
        <br />

        <asp:Button Text="Guardar" ID="btnSubmit" class="btn btn-alter btn-xl" runat="server" OnClick="btnSubmit_Click" />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </form>
</asp:Content>
