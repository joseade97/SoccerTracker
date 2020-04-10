﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="Proyecto.Formularios.frmLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Soccer Tracker</title>

  <!-- Bootstrap Core CSS -->
  <link href="../StartBootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom Fonts -->
  <link href="../StartBootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
  <link href="../StartBootstrap/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link href="../StartBootstrap/css/stylish-portfolio.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Navigation -->
  <a class="menu-toggle rounded" href="#">
    <i class="fas fa-bars"></i>
  </a>
  <nav id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <a class="js-scroll-trigger" href="#page-top">Soccer Tracker</a>
      </li>
      <li class="sidebar-nav-item">
        <a class="js-scroll-trigger" href="#page-top">Campeonatos</a>
      </li>
        <li class="sidebar-nav-item">
        <a class="js-scroll-trigger" href="#about">Equipos</a>
      </li>
      <li class="sidebar-nav-item">
        <a class="js-scroll-trigger" href="#about">Jugadores</a>
      </li>
      <li class="sidebar-nav-item">
        <a class="js-scroll-trigger" href="#services">Reportes</a>
      </li>
    </ul>
  </nav>

  <!-- Header -->
  <div class="masthead d-flex">
    <div class="container text-center my-auto">
      <h1 class="mb-1" style="color: #FFFFFF">Soccer Tracker</h1>
      <h3 class="mb-5">
        <em style="color: #FFFFFF">Sistema de Control de Fútbol</em>
      </h3>
      <div>

        <!-- Acá se incluye el contenido de la página de Login -->

            <form id="form1" runat="server">
                <div class="login">
                    <asp:Label ID="Label1" runat="server" class="mb-1" style="color: #FFFFFF" Text="Usuario" BorderColor="Black"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox style="width: 200px; background-color: white;" runat="server" type="text" id="txtUsuario" class="form-control btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    <asp:Label ID="Label2" runat="server" class="mb-1" style="color: #FFFFFF" Text="Contraseña" BorderColor="Black"></asp:Label>
                    <asp:TextBox style="width: 200px; background-color: white;" runat="server" type="password" id="txtContrasena" class="form-control btn" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    <asp:Button ID="btnIngresar" runat="server" OnClick="btnIngresar_Click" Text="Ingresar" class="btn btn-primary btn-xl js-scroll-trigger"></asp:Button>
                    <br />
                    <br />
                    <asp:Label ID="lblResultado" runat="server" Font-Size="X-Large" Font-Bold="True"></asp:Label>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <br />
                 </div>
             </form>

      </div>
    </div>
    <div class="overlay"></div>
  </div>

  <!-- Footer -->
  <footer class="footer text-center">
    <div class="container">
      <ul class="list-inline mb-5">
        <li class="list-inline-item">
          <a class="social-link rounded-circle text-white mr-3" href="#">
            <i class="icon-social-facebook"></i>
          </a>
        </li>
        <li class="list-inline-item">
          <a class="social-link rounded-circle text-white mr-3" href="#">
            <i class="icon-social-twitter"></i>
          </a>
        </li>
        <li class="list-inline-item">
          <a class="social-link rounded-circle text-white" href="#">
            <i class="icon-social-github"></i>
          </a>
        </li>
      </ul>
      <p class="text-muted small mb-0">Copyright &copy; Your Website 2019</p>
    </div>
  </footer>

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded js-scroll-trigger" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Bootstrap core JavaScript -->
  <script src="../StartBootstrap/vendor/jquery/jquery.min.js"></script>
  <script src="../StartBootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="../StartBootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="../StartBootstrap/js/stylish-portfolio.min.js"></script>

</body>

</html>