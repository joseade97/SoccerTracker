<%@ Page Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmAgregarPartido.aspx.cs" Inherits="Proyecto.Formularios.frmAgregarPartidos" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form style="text-align: center;" id="form1" runat="server">
        <h2>Agregar Partido</h2>

        <label class="mb-1">Fecha</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator10" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtFecha"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" type="text" ID="txtFecha" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <asp:RegularExpressionValidator CssClass="validator-message" ID="RegularExpressionValidator6" runat="server"  ControlToValidate="txtFecha"
            ErrorMessage="Por favor, indique la fecha en formato: dd/mm/yyyy" ValidationExpression="^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$"></asp:RegularExpressionValidator>
        <br />

        <br />
        <label class="mb-1">Equipo Casa</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator9" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="ddlCasa"></asp:RequiredFieldValidator>
        <asp:DropDownList runat="server" ID="ddlCasa">
        </asp:DropDownList><br />

        <label class="mb-1">Equipo Visita</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="ddlVisita"></asp:RequiredFieldValidator>
        <asp:DropDownList runat="server" ID="ddlVisita">
        </asp:DropDownList>

        <br />
        <label class="mb-1">Resultado</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="ddlResultado"></asp:RequiredFieldValidator>
        <asp:DropDownList runat="server" ID="ddlResultado">
            <asp:ListItem Text="Seleccione" Value="" />
            <asp:ListItem Text="Victoria Casa" Value="C" />
            <asp:ListItem Text="Empate" Value="E" />
            <asp:ListItem Text="Victoria Visita" Value="V" />
        </asp:DropDownList>
        <br />

        <label class="mb-1">Porcentaje de Posesión Equipo Casa</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtPosesion"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" type="text" ID="txtPosesion" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <asp:RegularExpressionValidator CssClass="validator-message" ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPosesion"
            ErrorMessage="Este campo sólo admite números" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
        <br />

        <label class="mb-1">Tiros a Marco Equipo Casa</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator7" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtMarcoCasa"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" type="text" ID="txtMarcoCasa" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <asp:RegularExpressionValidator CssClass="validator-message" ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtMarcoCasa"
            ErrorMessage="Este campo sólo admite números" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
        <br />

        <label class="mb-1">Tiros a Marco Equipo Visita</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtMarcoVisita"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" type="text" ID="txtMarcoVisita" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <asp:RegularExpressionValidator CssClass="validator-message" ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMarcoVisita"
            ErrorMessage="Este campo sólo admite números" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
        <br />

        <label class="mb-1">Tiros Totales Equipo Casa</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtTotalCasa"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" type="text" ID="txtTotalCasa" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <asp:RegularExpressionValidator CssClass="validator-message" ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtTotalCasa"
            ErrorMessage="Este campo sólo admite números" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
        <br />

        <label class="mb-1">Tiros Totales Equipo Visita</label>
        <asp:RequiredFieldValidator CssClass="validator-message" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtTotalVisita"></asp:RequiredFieldValidator>
        <asp:TextBox runat="server" type="text" ID="txtTotalVisita" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <asp:RegularExpressionValidator CssClass="validator-message" ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtTotalVisita"
            ErrorMessage="Este campo sólo admite números" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
        <br />

        <asp:Button Text="Ingresar Eventos" ID="btnSubmit" class="btn btn-alter btn-xl" runat="server" OnClick="btnSubmit_Click" />
        <asp:Button Text="Guardar y Omitir Eventos" ID="btnOmitirEventos" class="btn btn-alter btn-xl" runat="server" OnClick="btnOmitirEventos_Click"  />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </form>
</asp:Content>
