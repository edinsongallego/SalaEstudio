<?php
/* Connect To Database */
require_once ("../config/db.php"); //Contiene las variables de configuracion para conectar a la base de datos
require_once ("../config/conexion.php"); //Contiene funcion que conecta a la base de datos

if (isset($_REQUEST["correo"])) {
   
    $correo = $_REQUEST["correo"];

    $query = mysqli_query($con, "SELECT * FROM us_usuario WHERE DS_CORREO = '$correo'");
    $row = mysqli_fetch_array($query,MYSQLI_ASSOC);
    
    if(count($row) > 0)
        echo json_encode(array("rpt" => true, "mensaje" => "El correo existe"));
    else
        echo json_encode(array("rpt" => false, "mensaje" => "El correo no existe"));
}else{
    echo json_encode(array("rpt" => false, "mensaje" => "Faltan parametros"));
}