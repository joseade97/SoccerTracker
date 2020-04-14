<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="~/Formularios/frmListaPersonas.aspx.cs" Inherits="Proyecto.Formularios.frmListaPersonas" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="text-align: center;">
        <h2>Lista de Personas</h2>
        <br />
        <form runat="server">
            <asp:GridView CssClass="centered-element" ID="grdPersonas" runat="server" AllowPaging="True" AllowSorting="True" PageSize="15" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="grdPersonas_PageIndexChanging" OnRowCreated="grdPersonas_RowCreated">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="nombre_completo" HeaderText="Nombre Completo" />
                    <asp:BoundField DataField="correo" HeaderText="Correo Electrónico" />
                    <asp:BoundField DataField="num_identificacion" HeaderText="Número de Identificación" />
                    <asp:BoundField DataField="tipo_identificacion" HeaderText="Tipo de Identificación" />
                    <asp:BoundField DataField="genero" HeaderText="Género" />
                    <asp:BoundField DataField="provincia" HeaderText="Provincia" />
                    <asp:BoundField DataField="canton" HeaderText="Cantón" />
                    <asp:BoundField DataField="distrito" HeaderText="Distrito" />
                    <asp:BoundField DataField="direccion_fisica" HeaderText="Dirección Exacta" />
                    <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="/Formularios/frmModificarPersona.aspx?idPersona={0}" HeaderText="Modificar" Text="Modificar Datos" />
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
