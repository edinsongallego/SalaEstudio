<?php 

include_once "../classes/Factura.php";
include_once "../classes/Inventario.php";
include_once "../classes/Login.php";
require_once '../vendor/autoload.php';
use mikehaertl\wkhtmlto\Pdf;
if(!Login::inicioSession()){
	header("location: ../login.php");
	exit;
}
/* Connect To Database*/
include("../config/db.php");
include("../config/conexion.php");

$id_factura = intval($_GET['id_factura']);

$productos = Factura::obtenerProductosFactura($id_factura,$con);

/* foreach ($productos AS $row) {
	if ($row["CANTIDAD_PRODUCTO"] > $row["CANTIDAD_INVENTARIO"]) {
		echo json_encode(array("result" => false, "mensaje" => "No existe suficiente inventario del producto: ".$row["DS_PRODUCTO"]."."));
		die;	
	}
} */

if(Factura::pagarFactura($id_factura,$con)){
	//Inventario::descontarProductosInventario($productos, $con);
	echo json_encode(array("result" => true, "mensaje" => "La factura fue pagada exitosamente."));
}else{
	echo json_encode(array("result" => false, "mensaje" => "Se presento un error, cambiando el estado de la factura."));
}

mysqli_close($con);