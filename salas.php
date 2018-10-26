<?php $title = "Salas | Sala Estudio";
require_once("config/db.php");
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
                                <?php
                                $i = 0;
                                foreach (Login::obtenerSalas() as $sala) {
                                 ?>
				<div class="col-xs-12 col-sm-8 col-md-6 col-lg-6 col-xl-6">
					<div class="card">
						<div class="card-block block-1">
							<h3 class="card-title"><?php echo $sala["DS_NOMBRE_SALA"]; ?>:</h3>
							<p class="card-text"><?php echo $sala["DS_DESCRIPCION_SALA"]; ?></p>
							<h3 class="card-title">PRECIO:</h3>
							<p class="card-text">1 hora • $<?php @number_format($sala["NM_VALOR_HORA_SALA"], 2, ",", "."); ?></p>
                                                        <a id="btnagregar" class="btn btn-success" href="reservassala1.php?sala=<?php echo $sala["CS_SALA_ID"]; ?>"><b>Reservar</b></a>
						</div>
					</div>
				</div>
                                <?php } ?>
				
			</div>
		</div>	
	</section>

<?php
include("footer.php");
?>
</body>

</html>
