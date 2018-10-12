<?php
include('is_logged.php'); //Archivo verifica que el usario que intenta acceder a la URL esta logueado
/* Connect To Database */
require_once ("../config/db.php"); //Contiene las variables de configuracion para conectar a la base de datos
require_once ("../config/conexion.php"); //Contiene funcion que conecta a la base de datos

if (isset($_REQUEST["id_banda"])) {
   
    $id_banda = $_REQUEST["id_banda"];

    $query = mysqli_query($con, "SELECT * FROM us_banda_usuario WHERE CS_BANDA_ID = $id_banda");
    $row = mysqli_fetch_array($query,MYSQLI_ASSOC);

    //main query to fetch the data
    $sql = "SELECT
                us_banda_detalle_usuario.ES_LIDER,
                us_usuario.NM_DOCUMENTO_ID,
                us_usuario.CS_TIPO_DOCUMENTO_ID,
                us_usuario.DS_NOMBRES_USUARIO,
                us_usuario.DS_APELLIDOS_USUARIO,
                us_usuario.NM_TELEFONO,
                us_usuario.NM_CELULAR,
                us_usuario.DS_CORREO,
                us_usuario.DS_DIRECCION,
                us_usuario.DS_CONTRASENA,
                us_usuario.CS_TIPO_USUARIO_ID,
                us_usuario.CS_ESTADO_ID,
                us_usuario.DT_FECHA_CREACION,
                us_usuario.RESTAURAR_CONTRASENA,
                CONCAT(us_usuario.DS_NOMBRES_USUARIO,' ',us_usuario.DS_APELLIDOS_USUARIO) AS DS_NOMBRE_USUARIO
                FROM
                us_usuario
                INNER JOIN us_banda_detalle_usuario ON us_banda_detalle_usuario.NM_DOCUMENTO_ID = us_usuario.NM_DOCUMENTO_ID
                WHERE NM_ELIMINADO = 0 AND
                us_banda_detalle_usuario.CS_BANDA_ID = $id_banda 
            ";
    $query = mysqli_query($con, $sql);
    $integrantes = mysqli_fetch_all($query,MYSQLI_ASSOC);
    echo json_encode(array("banda"=>$row,"integrantes" => $integrantes));
}else{
    echo json_encode(array("rpt" => false, "mensaje" => "Faltan parametros"));
}