<?php

$title="Sala Estudio";
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<?php include("head.php");?>
</head>
<body>
	<?php
	include("navbar-home.php");
	?>

	<div class="container">
		<h2 class="text-center">LA SALA ESTUDIO</h2> 
		<h4 class="text-center">SALAS DE ENSAYO - ESTUDIO DE GRABACION</h4>  

		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="img/banner1.jpg" alt="banner1" style="width:100%;">
				</div>

				<div class="item">
					<img src="img/banner2.jpg" alt="banner2" style="width:100%;">
				</div>

				<div class="item">
					<img src="img/banner3.jpg" alt="banner3" style="width:100%;">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<br><br>
		<div class="container">
			<div class="row">
				<h4 class="text-center">La Sala Estudio</h4>
				<h6 class="text-center">¡Aprendiendo a jugar, jugando para aprender!</h6>
				<div class="col-md-2">
				</div>
				<div class="col-md-3">
					<img src="img/img1.png" align="center" class="img-responsive text-center">
					<h3 style="color: #26a5d0;margin-left: 2rem;">Calidad</h3>
					<h4 style="text-align: center;float: left;width: 45%;">Equipos e infraestructura de alta calidad</h4>
				</div>
				<div class="col-md-3">
					<img src="img/img2.png" class="img-responsive text-center">
					<h3 style="color: #26a5d0;margin-left: 2rem;">Faclidad</h3>
					<h4 style="text-align: center;float: left;width: 45%;">Acceso facil a datos y reservas</h4>
				</div>
				<div class="col-md-3">
					<img src="img/img3.png" class="img-responsive text-center">
					<h3 style="color: #26a5d0;margin-left: 1rem;">Comodidad</h3>
					<h4 style="text-align: center;float: left;width: 45%;">El uso del servicio con comodidad y seguridad</h4>
				</div>
			</div>
		</div>
	</div>



	



</div>
</div>

</div>
<hr>
<?php
include("footer.php");
?>
<script type="text/javascript" src="js/clientes.js"></script>
</body>
</html>
