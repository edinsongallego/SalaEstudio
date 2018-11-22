<?php

require_once ("config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
require_once ("config/conexion.php");

$email = $_POST['email'];

if (isset($email)) {

	$query=mysqli_query($con, "select * from us_usuario where DS_CORREO='".$email."'");

	$count = mysqli_num_rows($query);

	if ($count>0){

		while ($row=mysqli_fetch_array($query)){
				$correo=$row['DS_CORREO'];
				$identificacion=$row['NM_DOCUMENTO_ID'];
				$nombre=$row['DS_NOMBRES_USUARIO'];
			}

			$user_password_hash = sha1($nombre.$identificacion);

		$sql = "UPDATE us_usuario SET DS_CONTRASENA='".$user_password_hash."', RESTAURAR_CONTRASENA=1 WHERE NM_DOCUMENTO_ID='".$identificacion."'";

		$headers = "From: $correo \r\n";
    	$headers .= "Reply-To: $correo \r\n";

		if ($query = mysqli_query($con,$sql)){
                        session_start();
			if (mail($email, "Recuperar contraseña", "Su nueva contraseña es ".$nombre.$identificacion, $headers)) {
				$_SESSION["respuesta"] = array("mensaje" => "Las credenciales fueron enviadas al correo electrónico.", "rpt" => true);
				
			}else{
				$_SESSION["respuesta"] = array("mensaje" => "Mensaje enviado", "rpt" => false);
			}
                        header("Location:login.php");
		}
	}else{

	}
}


?>