<%@ Page Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmListaJugadores.aspx.cs" Inherits="Proyecto.Formularios.frmListaJugadores" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="text-align: center;">
        <h2>Lista de Jugadores</h2>
        <br />
        <form runat="server">
            <asp:GridView CssClass="centered-element" ID="grdJugadores" runat="server" AllowPaging="True" AllowSorting="True"
                PageSize="15"
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="equipo" HeaderText="Equipo" />
                    <asp:BoundField DataField="posicion" HeaderText="Posición" />
                    <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="/Formularios/frmModificarJugador?id_jugador={0}" HeaderText="Modificar" Text="Modificar Jugador" />
                    <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="/Formularios/frmEliminarJugador?id_jugador={0}" HeaderText="Eliminar" Text="Eliminar Jugador" />
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
        <a runat="server" visible="false" id="acrListaEquipos" href="/Formularios/frmListaEquipos">Regresar a la Lista</a>
    </div
</asp:Content>
