<?php

require_once ("../config/db.php"); //Contiene las variables de configuracion para conectar a la base de datos
require_once ("../config/conexion.php"); //Contiene funcion que conecta a la base de datos

$sql = "UPDATE rs_sala SET NM_ELIMINADO = 1 WHERE CS_SALA_ID = '" . $_REQUEST["id_sala"] . "'";

$query_new_user_insert = mysqli_query($con, $sql);
if ($query_new_user_insert) {
    $messages[] = "La sala fue eliminada";
} else {
    $errors[] = mysqli_error($con);
}

$respuesta = array();
if (isset($errors)) {
    $respuesta["result"] = false;
    $respuesta["mensaje"] = "";
    foreach ($errors as $error) {
        $respuesta["mensaje"] .= $error;
    }
}
if (isset($messages)) {
    $respuesta["result"] = true;
    $respuesta["mensaje"] = "";
    foreach ($messages as $message) {
        $respuesta["mensaje"] .= $message;
    }
}

echo json_encode($respuesta);
mysqli_close($con);
