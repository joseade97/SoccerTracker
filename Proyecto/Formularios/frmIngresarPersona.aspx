<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/ProyectoMaster.Master" AutoEventWireup="true" CodeBehind="frmIngresarPersona.aspx.cs" Inherits="Proyecto.Formularios.frmIngresarPersona" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form id="frm1" runat="server" class="text-center">
        <h2>Ingresar Nueva Persona</h2>
        <label class="mb-1">Nombre</label>
        <br />
        <asp:TextBox runat="server" type="text" ID="txtNombre" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <br />  
        <label class="mb-1">Primer Apellido</label>
        <br />
        <asp:TextBox runat="server" type="text" ID="txtApe1" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <br />  
        <label class="mb-1">Segundo Apellido</label>
        <br />
        <asp:TextBox runat="server" type="text" ID="txtApe2" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <br />  
        <label class="mb-1">Correo</label>
        <br />
        <asp:TextBox runat="server" type="text" ID="txtCorreo" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <br />  
        <label class="mb-1">Número de Identificación</label>
        <br />
        <asp:TextBox runat="server" type="text" ID="txtCed" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <br />  
        <label class="mb-1">Tipo de Identificación</label>
        <br />
        <asp:DropDownList runat="server" ID="ddlTipoIde">
            <asp:ListItem Text="Nacional" Value="N" />
            <asp:ListItem Text="Internacional" Value="I" />
        </asp:DropDownList>
        <br />  
        <label class="mb-1">Género</label>
        <br />
        <asp:DropDownList runat="server" ID="ddlGenero">
            <asp:ListItem Text="Masculino" Value="M" />
            <asp:ListItem Text="Femenino" Value="F"/>
        </asp:DropDownList>
        <br />
        <label class="mb-1">Teléfono Principal</label>
        <br />
        <asp:TextBox runat="server" type="text" ID="txtTel1" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <br />
        <label class="mb-1">Teléfono Secundario</label>
        <br />
        <asp:TextBox runat="server" type="text" ID="txtTel2" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <br />  
        <label class="mb-1">Provincia</label>
        <br />
        <asp:DropDownList runat="server" ID="ddlProvincia" AutoPostBack="true" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <label class="mb-1">Cantón</label>
        <br />
        <asp:DropDownList runat="server" ID="ddlCanton" AutoPostBack="true" OnSelectedIndexChanged="ddlCanton_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <label class="mb-1">Distrito</label>
        <br />
        <asp:DropDownList runat="server" ID="ddlDistrito">
        </asp:DropDownList>
        <br />
        <label class="mb-1">Fec. Nacimiento</label>
        <br />
        <asp:TextBox runat="server" type="text" ID="txtFecNac" class="form-control md-textbox btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <br />  
        <label class="mb-1">Dirección Física</label>
        <br />
        <asp:TextBox id="txtDireccion" TextMode="multiline" Columns="50" Rows="5" runat="server" />
        <br />  
        <asp:Button Text="Guardar" ID="btnSubmit" class="btn btn-alter btn-xl" runat="server" OnClick="btnSubmit_Click" />
    </form>
</asp:Content>
