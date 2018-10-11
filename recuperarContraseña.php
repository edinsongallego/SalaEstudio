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
	if ($_SESSION['CS_TIPO_USUARIO_ID'] == 1) {
		header("location: usuarios.php");
	}else{
		header("location: home_banda.php");
	}


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
		<div class="container">
			<div class="card card-container">
				<img id="profile-img" class="profile-img-card" src="img/logo.png" />
				<p id="profile-name" class="profile-name-card"></p>
				<form method="post" accept-charset="utf-8" action="login.php" name="loginform" autocomplete="off" role="form" class="form-signin">
					<?php

					if (isset($login)) {
						if ($login->errors) {
							?>
							<div class="alert alert-danger alert-dismissible" role="alert">
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
							<div class="alert alert-success alert-dismissible" role="alert">
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


<div id="mensaje"></div>

 <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
      $(document).ready(function(){
        $("#frmRestablecer").submit(function(event){
          event.preventDefault();
          $.ajax({
            url:'validaremail.php',
            type:'post',
            dataType:'json',
            data:$("#frmRestablecer").serializeArray()
          }).done(function(respuesta){
            $("#mensaje").html(respuesta.mensaje);
            $("#email").val('');
          });
        });
      });
    </script>

				</form><!-- /form -->

			</div><!-- /card-container -->
		</div><!-- /container -->



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

	</body>
	</html>

	<?php
}














