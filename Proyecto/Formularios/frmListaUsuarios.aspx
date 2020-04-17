<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmListaUsuarios.aspx.cs" Inherits="Proyecto.Formularios.frmListaUsuarios" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div style="text-align: center;">
        <h2>Lista de Usuarios</h2>
        <br />
        <form runat="server">
            <asp:GridView CssClass="centered-element" ID="grdUsuarios" runat="server" AllowPaging="True" AllowSorting="True" PageSize="15" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="grdUsuarios_PageIndexChanging" OnRowCreated="grdUsuarios_RowCreated">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="id_usuario" HeaderText="Identificador Usuario" />
                    <asp:BoundField DataField="nombre_usuario" HeaderText="Nombre de Usuario" />
                    <asp:BoundField DataField="es_admin" HeaderText="Tipo de Usuario" />
                    <asp:BoundField DataField="estado" HeaderText="Estado del Usuario" />
                    <asp:HyperLinkField DataNavigateUrlFields="id_usuario" DataNavigateUrlFormatString="/Formularios/frmModificarUsuario.aspx?id_usuario={0}" HeaderText="Modificar" Text="Modificar Datos" />
                    <asp:HyperLinkField DataNavigateUrlFields="id_usuario" DataNavigateUrlFormatString="/Formularios/frmEliminarUsuario.aspx?id_usuario={0}" HeaderText="Eliminar" Text="Eliminar Usuario" />
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
