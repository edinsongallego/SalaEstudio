<?php
include('is_logged.php'); //Archivo verifica que el usario que intenta acceder a la URL esta logueado
/* Connect To Database */
require_once ("../config/db.php"); //Contiene las variables de configuracion para conectar a la base de datos
require_once ("../config/conexion.php"); //Contiene funcion que conecta a la base de datos
if(isset($_POST["id_sala"])){
	$SQL = "SELECT * FROM rs_sala s WHERE s.CS_SALA_ID = '".$_POST["id_sala"]."' ";
	$query = mysqli_query($con, $SQL);
	//
	//print_r(mysql_error());
	while ($row = mysqli_fetch_array($query)) {
		echo json_encode($row);die;
	}
}else{
	die("Faltan parametros.");
}
?>