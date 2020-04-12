<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmIngresarPersona.aspx.cs" Inherits="Proyecto.Formularios.frmIngresarPersona" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form id="frm1" runat="server" class="text-center">
        <h2>Ingresar Nueva Persona</h2>
        <label class="mb-1">Nombre</label>
        <br />
        <asp:TextBox runat="server" type="text" ID="txtNombre" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <br />  
        <asp:Button Text="Guardar" class="btn btn-alter btn-xl" runat="server" />
    </form>
</asp:Content>
