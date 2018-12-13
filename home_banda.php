<?php

session_start();
if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
	header("location: login.php");
	exit;
}

/* Connect To Database*/
	require_once ("config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
	require_once ("config/conexion.php");//Contiene funcion que conecta a la base de datos
	$active_facturas="";
	$active_productos="";
	$active_clientes="";
	$active_usuarios="";
	$active_perfil="active";
	$title="Menu Banda | Sala Estudio";
	?>
	<!DOCTYPE html>
	<html lang="en">
	<head>
		<meta http-equiv="refresh" content="0;url=perfil.php">
		<?php include("head.php");?>

	</head>
	<body>
		<?php
		include("navbar_banda.php");
		include("modal/registro_banda.php");
		?>
		<div class="container">
			<div class="panel-body" style="height:600px;">

		</div>
		<hr>
		<?php
		include("footer.php");
		?>
		<script type="text/javascript" src="js/usuarios.js"></script>





	</body>
	</html>
