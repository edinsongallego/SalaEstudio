<?php
include_once "classes/Inventario.php";
include_once "classes/Login.php";
$scriptID = uniqid();
//if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
if(!Login::inicioSession()){
	header("location: login.php");
	exit;
}

/* Connect To Database*/
	require_once ("config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
	require_once ("config/conexion.php");//Contiene funcion que conecta a la base de datos
	$active_facturas="";
	$active_productos="";
	$active_clientes="";
	$active_usuarios="";
	$active_ventas="";
	$active_inventario="active";
	$title="Ventas | Sala Estudio";
	?>
	<!DOCTYPE html>
	<html lang="en">
	<head>
		<?php include("head.php");?>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
		<style type="text/css">
			.result-content{
				height: 28px;
				padding: 4px;
			    padding-left: 12px;	
			}
			.panel-primary>.panel-heading {
			    background-color: #040404bf;
			    border-color: #040404bf;
			}
			#table_productos tbody tr td{
				text-align: center;
			}
			#table_productos thead tr th{
				text-align: center;
			}
		</style>
	</head>
	<body>
		<?php
		include("navbar.php");
		?>
	<div class="container container-fluid">

		<form role="form" id="frm_factura_venta"> 
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">CARGAR INVENTARIO DE PRODUCTOS</h3>
				</div>
				<div class="panel-body">
					<div class="row" id="respuestaInv" style="margin: 15px;"></div>
					<div class="row">
		                <div class="form-group col-lg-6">
		                    <label class="label-result-content" for="factura">Producto: </label><br>
		                    <select name="Inventario[id_producto]" required="required" id="id_producto" style="width:100%"></select>
		                </div>
		                 <div class="form-group col-lg-6">
		                 	<label class="label-result-content" for="factura">Fecha entrada: </label>
	                    	<pre class="result-content" style="width: 100%;" id="fecha"><span class="glyphicon glyphicon-calendar" style="margin-right: 5px"></span><?php echo date("Y-m-d"); ?></pre>
	                	</div>
	                </div>
	                <div class="row">
		                <div class="form-group col-lg-6">
		                    <label class="label-result-content" for="factura">Cantidad: </label><br>
		                    <input type="text" required name="Inventario[cantidad]" id="cantidad" class="form-control" value=""/>
		                </div>
		                <div class="form-group col-lg-6">
		                    <label class="label-result-content" for="factura">Precio de compra: </label><br>
		                    <input type="text" required name="Inventario[precio_co]" id="precio_co" class="form-control" value=""/>
		                </div>
			        </div>
		        </div>
		        <div class="panel-footer text-center">
					<input type="submit" class="btn btn-primary" value="Enviar">
					<button class="btn btn-danger" value="">Cencelar</button>
			</div>
		    </div>
		</form>
	</div>

<?php
	include("footer.php");
?>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<script src="js/ventas.js?c=<?php echo $scriptID;?>"></script>
<script src="js/factura.js?c=<?php echo $scriptID;?>"></script>

