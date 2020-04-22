<%@ Page Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmListaTorneosF.aspx.cs" Inherits="Proyecto.Formularios.frmListaTorneosF" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="text-align: center;">
        <h2>Lista de Torneos</h2>
        <br />
        <form runat="server">
            <asp:GridView CssClass="centered-element" ID="grdTorneos" runat="server" AllowPaging="True" AllowSorting="True" PageSize="15"
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="fec_inicio" HeaderText="Fecha de Inicio" />
                    <asp:BoundField DataField="fec_fin" HeaderText="Fecha de Fin" />
                    <asp:BoundField DataField="cant_equipos" HeaderText="Cantidad de Equipos" />
                    <asp:BoundField DataField="dedicado" HeaderText="Dedicado" />
                    <asp:BoundField DataField="campeon" HeaderText="Campeón" />
                    <asp:BoundField DataField="goleador" HeaderText="Goleador" />
                    <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="/Formularios/frmListaPartidos?id_torneo={0}" HeaderText="Partidos" Text="Ver Partidos" />
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
            <a href="/Formularios/frmListaTorneos">Ver Torneos sin Finalizar</a>
        </form>
    </div>
</asp:Content>