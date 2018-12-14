<?php

require_once ("config/db.php"); //Contiene las variables de configuracion para conectar a la base de datos
require_once ("config/conexion.php");

$email = $_POST['email'];

if (isset($email)) {

    $query = mysqli_query($con, "select * from us_usuario where DS_CORREO='" . $email . "'");

    $count = mysqli_num_rows($query);

    if ($count > 0) {

        while ($row = mysqli_fetch_array($query)) {
            $correo = $row['DS_CORREO'];
            $identificacion = $row['NM_DOCUMENTO_ID'];
            $nombre = $row['DS_NOMBRES_USUARIO'];
        }

        $user_password_hash = sha1($identificacion);

        $sql = "UPDATE us_usuario SET DS_CONTRASENA='" . $user_password_hash . "', RESTAURAR_CONTRASENA=1 WHERE NM_DOCUMENTO_ID='" . $identificacion . "'";


        if ($query = mysqli_query($con, $sql)) {
            session_start();
            $headers = "From: ".$correo."\r\n"."Reply-To: ".$correo."\r\n"."X-Mailer: PHP/".phpversion();
            if (mailutf8($email, "Recuperar contraseña", "La solicitud ha sido atendida, su contraseña ha sido modificada por su número de documento.\n Al ingresar a la plataforma favor hacer el cambio de la misma.", $headers)) {
                $_SESSION["respuesta"] = array("mensaje" => "Las credenciales fueron enviadas al correo electrónico.", "rpt" => true);
            } else {
                $_SESSION["respuesta"] = array("mensaje" => "Mensaje enviado", "rpt" => false);
            }
            header("Location:login.php");
        }
    } else {
        
    }
}

function mailutf8($correo_destinatario, $asunto = "(Sin Asunto)", $mensaje = "", $header = "") {
    $header_on = "MIME-Version: 1.0" . "\r\n" . "Content-type: text/html; charset=UTF-8" . "\r\n";
    if (mail($correo_destinatario, "=?UTF-8?B?" . base64_encode($asunto) . "?=", $mensaje, $header_on . $header)) {
        echo "Mensaje enviado";
    } else {
        echo "Error en el envío";
    }
}

?>