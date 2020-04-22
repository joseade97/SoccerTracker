<%@ Page Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmEliminarEquiposTorneo.aspx.cs" Inherits="Proyecto.Formularios.frmEliminarEquiposTorneo" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="text-align: center;">
        <h2>Lista de Equipos</h2>
        <br />
        <asp:Label Text="" ID="lblRes" runat="server" ForeColor="Red" />
        <form runat="server">
            <asp:GridView CssClass="centered-element" ID="grdEquipos" runat="server" AllowPaging="True" AllowSorting="True" PageSize="15"
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="id">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Seleccionar">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSeleccion" runat="server" AutoPostBack="True" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="fundador" HeaderText="Fundador" />
                    <asp:BoundField DataField="fecha_fundacion" HeaderText="Fecha de Fundación" />
                    <asp:BoundField DataField="distrito" HeaderText="Distrito" />
                    <asp:BoundField DataField="canton" HeaderText="Cantón" />
                    <asp:BoundField DataField="provincia" HeaderText="Provincia" />
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
            <br />
            <asp:Button Text="Eliminar" ID="btnSubmit" class="btn btn-cancel btn-xl" runat="server" OnClick="btnSubmit_Click" />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </form>
    </div>
</asp:Content>
