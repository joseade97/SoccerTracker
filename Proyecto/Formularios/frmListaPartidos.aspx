<%@ Page Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmListaPartidos.aspx.cs" Inherits="Proyecto.Formularios.frmListaPartidos" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="text-align: center;">
        <h2>Lista de Partidos</h2>
        <br />
        <form runat="server">
            <asp:GridView CssClass="centered-element" ID="grdPartidos" runat="server" AllowPaging="True" AllowSorting="True" PageSize="15"
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="casa" HeaderText="Equipo Casa" />
                    <asp:BoundField DataField="visita" HeaderText="Equipo Visita" />
                    <asp:BoundField DataField="resultado" HeaderText="Resultado" />
                    <asp:BoundField DataField="goles_casa" HeaderText="Goles Casa" />
                    <asp:BoundField DataField="goles_visita" HeaderText="Goles Visita" />
                    <asp:BoundField DataField="posesion_casa" HeaderText="% Posesión Casa" />
                    <asp:BoundField DataField="posesion_visita" HeaderText="% Posesión Visita" />
                    <asp:BoundField DataField="tiros_marco_casa" HeaderText="Tiros a Marco Casa" />
                    <asp:BoundField DataField="tiros_marco_visita" HeaderText="Tiros a Marco Visita" />
                    <asp:BoundField DataField="tiros_total_casa" HeaderText="Tiros Totales Casa" />
                    <asp:BoundField DataField="tiros_total_visita" HeaderText="Tiros Totales Visita" />
                    <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="/Formularios/frmDetallesPartido?id_partido={0}" HeaderText="Detalles" Text="Ver Detalles" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <a runat="server" ID="acrAgregaPartidos" >Agregar Partidos</a>
        </form>
    </div>
</asp:Content>