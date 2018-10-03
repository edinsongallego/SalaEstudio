<?php $title = "Salas | Sala Estudio";
include_once "classes/Login.php";

//if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
if(!Login::inicioSession()){
	header("location: login.php");
	exit;
}

?>

<html lang="en">
<head>
	<?php include("head.php");?>
	<link rel="stylesheet" href="css/salas.css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<?php 
  if ($_SESSION['CS_TIPO_USUARIO_ID']==1) {
    include("navbar.php");
   
  }elseif ($_SESSION['CS_TIPO_USUARIO_ID']==2) {
    include("navbar_banda.php");
  
  }elseif ($_SESSION['CS_TIPO_USUARIO_ID']==4) {
    include("navbar_docente.php");
    
  } 
	?>
	<section id="what-we-do">
		<div class="container-fluid">
			<div class="page-header">
			  <h2 class="section-title mb-2 h1">NUESTRAS SALAS</h2>
			</div>
			<div class="row mt-5">
				<div class="col-xs-12 col-sm-8 col-md-6 col-lg-6 col-xl-6">
					<div class="card">
						<div class="card-block block-1">
							<h3 class="card-title">SALA 1:</h3>
							<p class="card-text">Sala de ensayo para pequeños formatos musicales, espacio para 3 a 6 personas.<br/>

							2 amplificadores laney hibridos, tubos y digital de 80W con 3 efectos progrados 1 amplificador de bajo laney de 100W 2 Monitores B-52 300W 1 consola Behringer 300W 6 canales Microfonos Behringer xm8500 Bateria Mapex venus (Bombo de 22 p) Doble pedal, platilleria sabian XS20.</p>
							<h3 class="card-title">PRECIO:</h3>
							<p class="card-text">1 hora • $24.000</p>
							<button type="button" id="btnagregar" class="btn btn-success" onclick = "location='reservassala1.php'"><b>Reservar</b></button>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-8 col-md-6 col-lg-6 col-xl-6">
					<div class="card">
						<div class="card-block block-1">
							<h3 class="card-title">SALA 2:</h3>
							<p class="card-text">Sala de ensayo para medianos y grandes formatos musicales, espacio para 6 a 10 personas. <br/>

							2 amplificadores laney hibridos, tubos y digital de 200W con 3 efectos progrados 1 amplificador de bajo line 6 de 175W 2 Monitores Behringer 400W 1 consola Behringer 400W 10 canales Microfonos Behringer xm8500 Bateria Mapex Voyage(Bombo de 22 p) Doble pedal, platilleria sabian AAX</p>

							<h3 class="card-title">PRECIO:</h3>
							<p class="card-text">1 hora • $26.000</p>
							<button type="button" id="btnagregar" class="btn btn-success" onclick = "location='reservassala2.php'"><b>Reservar</b></button>
						</div>
					</div>
				</div>
				
			</div>
		</div>	
	</section>

<?php
include("footer.php");
?>
</body>

</html>
