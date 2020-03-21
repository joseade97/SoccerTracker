<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-widht, initial-scale=1">
		<title>Demo Bootstrap</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<!--Iconos-->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
		<!--Estilos-->
		<style>
		.fakeimg {
			height: 200px;
			background: #aaa;
		}
		.carousel-inner img {
			width: 60%;
			height: 60%;
		}
		.carousel-control-prev-icon{
			background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='purple' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E");
		}
		.carousel-control-next-icon{
			background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='purple' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E");

		}
		</style>
	</head>
	<body>
	<!--Mensaje en grande-->
	<div class="jumbotron text-center" style="margin-bottom:0">
		<h1>Este es el Demo para el tema Bootstrap</h1>
		<p>Re-ajustar el tamaño de la pagina para ver el efecto</p>

	<!--CAROUSEL-->	
		<div class="container mt-3">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!--Indicadores-->
			<ul class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ul>
			
			<!--Diapositivas-->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="https://s3-us-west-2.amazonaws.com/devcodepro/media/blog/que-es-bootstrap.png" alt="img1" style="width:400px; height:220px;">
				</div>			
				<div class="carousel-item">
					<img src="http://getbootstrap.com/docs/4.3/assets/brand/bootstrap-social.png" alt="img2" style="width:400px; height:220px;">
				</div>
				<div class="carousel-item">
					<img src="https://i.ytimg.com/vi/tX_4HTQ6Pgc/maxresdefault.jpg" alt="img3" style="width:400px; height:220px;">
				</div>				
			</div>
			
			<!--Controles Derecha e Izquierda-->
			<a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a>
			<a class="carousel-control-next" href="#myCarousel" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>
			</div>
		</div>
	</div>
	<!--BARRA NAVEGADORA-->	
	
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<a class="navbar-brand" href="#Bootstrap">Bootstrap</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar" data-hover="dropdown">
				<span class="navbar-toggler-icon"></span>				
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<div class="dropdown">
					  <li class="nav-item">
						<a class="nav-link btn dropdown-toggle bg-dark" data-toggle="dropdown" data-hover="dropdown">Buscadores</a>
							<div class="dropdown-menu">
							  <a class="dropdown-item" href="https://www.google.com"><i class="fab fa-google"></i> Google</a>
							  <a class="dropdown-item" href="https://www.yahoo.com"><i class="fab fa-yahoo"></i> Yahoo!</a>
							</div>
						</li>
					</div>
					<div class="dropdown">
						<li class="nav-item">
							<a class="nav-link btn dropdown-toggle bg-dark" data-toggle="dropdown" data-hover="dropdown">Redes Sociales</a>
								<div class="dropdown-menu">
								  <a class="dropdown-item" href="https://www.facebook.com"><i class="fab fa-facebook"></i> Facebook</a>
								  <a class="dropdown-item" href="https://www.instagram.com"><i class="fab fa-instagram"></i> Instagram</a>
								  <a class="dropdown-item" href="https://www.twitter.com"><i class="fab fa-twitter"></i> Twitter</a>
								</div>
						</li>
					</div>
					<div class="dropdown">
						<li class="nav-item">
							<a class="nav-link btn dropdown-toggle bg-dark" data-toggle="dropdown" data-hover="dropdown">Música</a>
								<div class="dropdown-menu">
								  <a class="dropdown-item" href="https://www.youtube.com"><i class="fab fa-youtube"></i> YouTube</a>
								  <a class="dropdown-item" href="https://www.soundcloud.com"><i class="fab fa-soundcloud"></i> SoundCloud</a>
								  <a class="dropdown-item" href="https://www.spotify.com"><i class="fab fa-spotify"></i> Spotify</a>
								</div>
						</li>
					</div>
				</ul>
			</div>
		</nav>
		<!--Columnas-->	
		<div class="container" style="margin-top:30px; margin-bottom:30px;" data-toggle="collapse" data-target="#collapsibleColumns">
		  <div class="row">
			<div class="col-sm-4">
				<h3>Buscadores</h3>
				<p>Es un conjunto de programas coordinados que se encargan de visitar cada uno de los sitios que integran el Web,
				empleando los propios hipervínculos contenidos en las páginas Web para buscar y leer otros sitios,
				crear un enorme índice de todas las páginas que han sido leídas y registradas, llamado comúnmente catálogo,
				y mantener una copia actualizada de toda esta información, para luego presentar direcciones en Internet como resultado
				de las peticiones de búsqueda solicitadas por las personas que usan estos servicios de localización de páginas.</p>
				<img src="http://pngimg.com/uploads/google/google_PNG19644.png" alt="Google" style="width:120px; height:60px;">
				<img src="http://vishub.org/pictures/12473.png?style=500" alt="Yahoo" style="width:120px; height:60px;">
			</div>
			<div class="col-sm-4">
				<h3>Redes Sociales</h3>
				<p>Las redes sociales son estructuras formadas en Internet por personas u organizaciones que se conectan a partir de intereses o valores comunes.
				A través de ellas, se crean relaciones entre individuos o empresas de forma rápida, sin jerarquía o límites físicos.</p>
				<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/F_icon.svg/768px-F_icon.svg.png" alt="Facebook" style="width70:px; height:70px;">
				<img src="https://www.edigitalagency.com.au/wp-content/uploads/new-instagram-logo-png-transparent.png" alt="Instagram" style="width:70px; height:70px;">
				<img src="https://ikaltours.com/wp-content/uploads/2018/10/twitter-round-logo-png-transparent-background-7.png" alt="Twitter" style="width:70px; height:70px;">
			</div>
			<div class="col-sm-4">
				<h3>Páginas de Música</h3> 
				<p>Las páginas de música son aquellas interfaces web que se encargan de brindar los servicios de entretenimiento músical a todos los usuarios.
				Algunas de estas páginas requieren pagar una membresia mensual, pero si bien se quisiera, se pueden utilizar las gratuitas,
				el único problemas es que la mayoria tienden a tener anuncios publicitarios que son de gran molestia para los usuarios.</p>
				<img src="https://logosmarcas.com/wp-content/uploads/2018/06/Youtube-Emblema.png" alt="YouTube" style="width:100px; height:50px;">
				<img src="http://www.stickpng.com/assets/images/580b57fcd9996e24bc43c537.png" alt="SoundCloud" style="width:100px; height:50px;">
				<img src="https://storage.googleapis.com/pr-newsroom-wp/1/2018/11/Spotify_Logo_CMYK_Green.png" alt="Spotify" style="width:130px; height:50px;">
			</div>
		  </div>
		</div>
		
		<div class="jumbotron">
			<div class="row">
				<h2 id="Bootstrap">¿Qué es Bootstrap?</h2>
				<p>Bootstrap es un conjunto de herramientas de código abierto para desarrollar con HTML, CSS y JS. Realice rápidamente un prototipo de sus ideas o construya su
				aplicación completa con nuestras variables y combinaciones de Sass, sistema de cuadrícula sensible, extensos componentes precompilados y poderosos complementos creados en jQuery.</p>				
				<p>Bootstrap, originalmente llamado Blueprint de Twitter, fue desarrollado por Mark Otto y Jacob Thornton de Twitter, como un marco de trabajo (framework)
				para fomentar la consistencia entre las herramientas internas. Antes de Bootstrap, se usaron varias bibliotecas para el desarrollo de interfaces de usuario,
				las cuales generó inconsistencias y una gran carga de trabajo en su mantenimiento.</p>
				<p>Les dejamos su <Strong>página oficial: </strong><a href="https://getbootstrap.com/">Bootstrap</a></p>
			</div>
		</div>
		<div style="text-align:center">
		<h4><strong>Integrantes:</strong></h4>
		<p>Alejandro Mora <br>
		Kenneth Alvarado <br>
		Jose Delgado Elizondo</p>
	</div>
	</body>
</html> 