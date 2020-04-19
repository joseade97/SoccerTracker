<%@ Page Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmListaEquipos.aspx.cs" Inherits="Proyecto.Formularios.frmListaEquipos" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="text-align: center;">
        <h2>Lista de Equipos</h2>
        <br />
        <form runat="server">
            <asp:GridView CssClass="centered-element" ID="grdEquipos" runat="server" AllowPaging="True" AllowSorting="True" PageSize="15"
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="fundador" HeaderText="Fundador" />
                    <asp:BoundField DataField="fecha_fundacion" HeaderText="Fecha de Fundación" />
                    <asp:BoundField DataField="distrito" HeaderText="Distrito" />
                    <asp:BoundField DataField="canton" HeaderText="Cantón" />
                    <asp:BoundField DataField="provincia" HeaderText="Provincia" />
                    <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="/Formularios/frmListaJugadores.aspx?id_equipo={0}" HeaderText="Jugadores" Text="Ver Jugadores" />
                    <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="/Formularios/frmModificarEquipo.aspx?id_equipo={0}" HeaderText="Modificar" Text="Modificar Equipo" />
                    <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="/Formularios/frmEliminarEquipo.aspx?id_equipo={0}" HeaderText="Eliminar" Text="Eliminar Equipo" />
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
