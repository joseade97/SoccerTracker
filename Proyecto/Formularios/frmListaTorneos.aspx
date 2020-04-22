<%@ Page Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmListaTorneos.aspx.cs" Inherits="Proyecto.Formularios.frmListaTorneos" %>

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
                    <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="/Formularios/frmIngresarEquiposTorneo?id_torneo={0}" HeaderText="Agregar Equipos" Text="Agregar Equipos" />
                    <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="/Formularios/frmEliminarEquiposTorneo?id_torneo={0}" HeaderText="Quitar Equipos" Text="Quitar Equipos" />
                    <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="/Formularios/frmListaPartidos?id_torneo={0}" HeaderText="Partidos" Text="Ver Partidos" />
                    <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="/Formularios/frmIniciaTorneo?id_torneo={0}" HeaderText="Iniciar" Text="Iniciar Torneo" />
                    <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="/Formularios/frmTerminaTorneo?id_torneo={0}" HeaderText="Termina" Text="Terminar Torneo" />
                    <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="/Formularios/frmModificarTorneo?id_torneo={0}" HeaderText="Modificar" Text="Modificar Torneo" />
                    <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="/Formularios/frmEliminarTorneo?id_torneo={0}" HeaderText="Eliminar" Text="Eliminar Torneo" />
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
        </form>
    </div>
</asp:Content>