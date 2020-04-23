<%@ Page Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmDetallesPartido.aspx.cs" Inherits="Proyecto.Formularios.frmDetallesPartido" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="text-align: center;">
        <h2>Detalles del Partido</h2>
        <br />
        <form runat="server">
            <asp:GridView CssClass="centered-element" ID="grdDetalles" runat="server" AllowPaging="True" AllowSorting="True" PageSize="15"
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="equipo" HeaderText="Equipo" />
                    <asp:BoundField DataField="jugador" HeaderText="Jugador" />
                    <asp:BoundField DataField="evento" HeaderText="Evento" />
                    <asp:BoundField DataField="minuto_evento" HeaderText="Minuto" />
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
            <a runat="server" ID="acrVolver" >Regresar</a>
        </form>
    </div>
</asp:Content>