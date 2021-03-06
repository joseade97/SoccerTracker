﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmModificarTorneo.aspx.cs" Inherits="Proyecto.Formularios.frmModificarTorneo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <form id="frm1" runat="server" class="text-center">
        <asp:HiddenField runat="server" ID="hdfIdPersona" />
        <br />
        <label class="mb-1">Fec. Inicio</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator10" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtFecIni"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" type="text" ID="txtFecIni" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <asp:RegularExpressionValidator CssClass="validator-message" ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtFecIni"
            ErrorMessage="Por favor, indique la fecha en formato: dd/mm/yyyy" ValidationExpression="^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$"></asp:RegularExpressionValidator>
        <br />
        <label class="mb-1">Fec. Fin</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtFecFin"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" type="text" ID="txtFecFin" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <asp:RegularExpressionValidator CssClass="validator-message" ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFecFin"
            ErrorMessage="Por favor, indique la fecha en formato: dd/mm/yyyy" ValidationExpression="^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$"></asp:RegularExpressionValidator>
        <br />
        <label class="mb-1">Número de identificación</label>
        <br />
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtIdentificacion" ForeColor="#FF5050"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" type="text" ID="txtIdentificacion" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <asp:Button Text="Validar identificación" ID="btnVal" class="btn btn-alter btn-s" runat="server" OnClick="btnVal_Click" />
        <br />
        <label class="mb-1">Nombre de Persona Seleccionada</label>
        <br />
        <asp:TextBox runat="server" disabled="disabled" ID="txtNombre" />
        <br />
        <label class="mb-1">Cantidad de Equipos</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtCant"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" type="text" ID="txtCant" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <asp:RegularExpressionValidator CssClass="validator-message" ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtCant"
            ErrorMessage="Este campo sólo admite números" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
        <br />
        <asp:DropDownList runat="server" ID="ddlEstado">
            <asp:ListItem Text="Seleccione" Value="" />
            <asp:ListItem Text="Creado" Value="C" />
            <asp:ListItem Text="Iniciado" Value="I" />
            <asp:ListItem Text="Terminado" Value="T" />
        </asp:DropDownList>
        <br />
        <asp:Button Text="Guardar" ID="btnSubmit" class="btn btn-alter btn-xl" runat="server" OnClick="btnSubmit_Click" />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </form>

</asp:Content>
