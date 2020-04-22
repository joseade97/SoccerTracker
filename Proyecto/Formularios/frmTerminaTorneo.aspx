<%@ Page Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmTerminaTorneo.aspx.cs" Inherits="Proyecto.Formularios.frmTerminaTorneo" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form style="text-align: center;" id="form1" runat="server">
        <h2>¿Desea dar por finalizado el torneo seleccionado?</h2>
        <asp:Button Text="Sí" ID="btnSi" class="btn btn-alter btn-xl" runat="server" OnClick="btnSi_Click" />
        <asp:Button Text="No" ID="btnNo" class="btn btn-cancel btn-xl" runat="server" OnClick="btnNo_Click" />
    </form>
</asp:Content>