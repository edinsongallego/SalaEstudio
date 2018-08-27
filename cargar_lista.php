<?php
require_once ("config/db.php");
require_once 'config/conexion.php';

 function getListasRep(){
 	$mysql = getconn();
 	$query= 'SELECT CS_SALA_ID, DS_NOMBRE_SALA, NM_VALOR_HORA_SALA FROM rs_sala';
	$result = $mysql->query($query);
	$listas = '<option value="0">Seleccionar</option>';
	while($row = $result->fetch_array(MYSQLI_ASSOC)){
		$listas .= "<option value = '$row[CS_SALA_ID]'>$row[DS_NOMBRE_SALA]</option>";
	}
	return $listas;

 }	
echo getListasRep();
