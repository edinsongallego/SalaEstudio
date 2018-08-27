<?php

require_once ("config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
require_once ("config/conexion.php");

$email = $_POST['email'];

if (isset($email)) {

	$query=mysqli_query($con, "select * from us_usuario where DS_CORREO='".$email."'");

	$count = mysqli_num_rows($query);

	if ($count==1){

		while ($row=mysqli_fetch_array($query)){
				$correo=$row['DS_CORREO'];
				$identificacion=$row['NM_DOCUMENTO_ID'];
				$nombre=$row['DS_NOMBRES_USUARIO'];
			}

			$user_password_hash = password_hash($nombre.$identificacion, PASSWORD_DEFAULT);

		$sql = "UPDATE us_usuario SET DS_CONTRASENA='".$user_password_hash."', RESTAURAR_CONTRASENA=1 WHERE NM_DOCUMENTO_ID='".$identificacion."'";

		$headers = "From: $correo \r\n";
    	$headers .= "Reply-To: $correo \r\n";

		if ($query = mysqli_query($con,$sql)){
			if (mail($email, "Recuperar contraseña", "Su nueva contraseña es ".$nombre.$identificacion, $headers)) {
				echo "Mensaje enviado";
				header("Location:login.php");
			}else{
				echo "Mensaje no enviado";
			}
		}
	}else{

	}
}


?>