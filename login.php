<?php

if (version_compare(PHP_VERSION, '5.3.7', '<')) {
	exit("Lo sentimos, La sala estudio no se ejecuta en una versión de PHP menor que 5.3.7.");
} else if (version_compare(PHP_VERSION, '5.5.0', '<')) {

	require_once("libraries/password_compatibility_library.php");
}

// include the configs / constants for the database connection
require_once("config/db.php");

// load the login class
require_once("classes/Login.php");

// create a login object. when this object is created, it will do all login/logout stuff automatically
// so this single line handles the entire login process. in consequence, you can simply ...
$login = new Login();



// ... ask if we are logged in here:
if ($login->isUserLoggedIn() == true) {
    // the user is logged in. you can do whatever you want here.
    // for demonstration purposes, we simply show the "you are logged in" view.
	session_start();
	if ($_SESSION['CS_TIPO_USUARIO_ID'] == 1) {
		header("location: usuarios.php");
	}else{
		header("location: home_banda.php");
	}

	 /*if ($_SESSION['CS_ESTADO_ID'] == 2) {
    	$login->errors[] = "Usuario Inactivo";
    }else{
    session_start();
	if ($_SESSION['CS_TIPO_USUARIO_ID'] == 1) {
		header("location: usuarios.php");
	}else{
		header("location: home_banda.php");

	}*/


} else {
    // the user is not logged in. you can do whatever you want here.
    // for demonstration purposes, we simply show the "you are not logged in" view.
	?>

	<!DOCTYPE html>
	<html lang="es">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
		<title>Sala Estudio</title>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
		<!-- CSS  -->
		<link href="css/login.css" type="text/css" rel="stylesheet" media="screen,projection"/>
		<link rel=icon href=img/logo.png  type="image/png">
		<?php include("head.php");?>
	</head>
	<body>

		<nav class="navbar navbar-default ">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#"><img src="img/logo.png" width="80" height="80"></a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active"><a href="index.php"><i class='glyphicon glyphicon-home'></i> Inicio <span class="sr-only">(current)</span></a></li>

						<li><a href="nosotros.php"> Nosotros</a></li>

						<li><a href="servicios.php"> Servicios</a></li>

						<li><a href="contactenos.php"> Contactenos</a></li>
						<li><a target="_blank" href="https://es-la.facebook.com/Sala.Estudio/"><img src='img/facebook.png'></img></a> </li>
						<li><a target="_blank" href="http://www.thepicta.com/user/lasalaestudio/4339125963"><img src='img/instagram.png'></img></a> </li>
						<li><a target="_blank" href="https://twitter.com/lasalaestudio"><img src='img/twitter.png'></img></a> </li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="login.php"><i class='glyphicon glyphicon-log-in'></i> Iniciar Sesiòn</a></li>
					</ul>
				</div><!-- /.navbar-collapse -->
			</div><!-- /.container-fluid -->
		</nav>

		<div class="container">
			
			<div class="card card-container">
				<img id="profile-img" class="profile-img-card" src="img/logo.png" />
				<p id="profile-name" class="profile-name-card"></p>
				<form method="post" accept-charset="utf-8" action="login.php" name="loginform" autocomplete="off" role="form" class="form-signin">
					<?php

					if (isset($login)) {
						if ($login->errors) {
							?>
							<div class="alert alert-danger" role="alert">
                                                                <a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
								<strong>Error!</strong>

								<?php
								foreach ($login->errors as $error) {
									echo $error;
								}
								?>
							</div>
							<?php
						}
						if ($login->messages) {
							?>
							<div class="alert alert-success" role="alert">
                                                                <a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
								<strong>Aviso!</strong>
								<?php
								foreach ($login->messages as $message) {
									echo $message;
								}
								?>
							</div>
							<?php
						}
					}
					?>
					<span id="reauth-email" class="reauth-email"></span>
					<input class="form-control" placeholder="Usuario" name="DS_CORREO" type="email" value="" autofocus="">
					
					<input class="form-control" placeholder="Contraseña" name="DS_CONTRASENA" type="password" value="" autocomplete="off">

					<a href="registroUsers.php">No estas registrado? registrate</a>
					<button type="submit" class="btn btn-lg btn-success btn-block btn-signin" name="login" id="submit">Iniciar Sesión</button>
					<a href="#myModal" role="button" data-toggle="modal">Recuperar Contraseña</a>

				</form><!-- /form -->

			</div><!-- /card-container -->
		</div><!-- /container -->


		<div id="myModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">



					<form id="frmRestablecer" action="validaremail.php" method="post"autocomplete="off">
							<div class="panel panel-default">
								<div class="panel-heading"> Restaurar contraseña </div>
								<div class="panel-body">
									<div class="form-group">

										<input type="email" id="email" class="form-control" name="email" placeholder="*Email" title="Dirección de correo (Escribe el email asociado a tu cuenta para recuperar tu contraseña)"  value="" size='30' maxlength='100' onKeyUp="javascript:validateMail('correo')" class="form-control" required>
									</div>
									<div class="form-group">
										<input type="submit" class="btn btn-primary" value="Enviar" >
									</div>
								</div>
							</div>
						</form>



				</div>
			</div>
		</div>

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>


	</body>
	</html>

	<?php
}


