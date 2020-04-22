<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Page Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmTablaGoleadores.aspx.cs" Inherits="Proyecto.Formularios.frmTablaGoleadores" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form id="frm1" runat="server" class="text-center">
        <asp:ScriptManager ID="scmReporte" runat="server">
        </asp:ScriptManager>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator4"
            runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="ddlCampeonatos" ForeColor="#FF5050">
        </asp:RequiredFieldValidator>
        <asp:DropDownList ID="ddlCampeonatos" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlCampeonatos_SelectedIndexChanged">
        </asp:DropDownList> 
        <asp:DropDownList ID="ddlEquipo" runat="server">
        </asp:DropDownList> <asp:Button Text="Listar" ID="btnSubmit" class="btn btn-alter btn-s" runat="server" OnClick="btnSubmit_Click" />

        <rsweb:ReportViewer ID="rpvGoleadores" runat="server" Width="100%" Height="800px">
        </rsweb:ReportViewer>
    </form>
</asp:Content>
