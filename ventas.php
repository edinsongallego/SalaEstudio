<?php
include_once "classes/Login.php";

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
	$active_ventas="active";
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
		</style>
	</head>
	<body>
		<?php
		include("navbar.php");
		$num_fact = 1;
		?>
	<div class="container container-fluid">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">FACTURA DE VENTA</h3>
			</div>
			<div class="panel-body">
				<div class="row">
	                <div class="form-group col-lg-6">
	                    <label class="label-result-content" for="factura">FACTURA: </label><br>
	                    <pre class="result-content" style="width: 100%;" id="factura"><?php echo str_pad($num_fact, 10, "0", STR_PAD_LEFT);?></pre>
	                </div>
	                <div class="form-group col-lg-6">
	                    <label class="label-result-content" for="atendidoPOR">Atendido por: </label><br>
	                    <pre class="btn btn-default" style="width: 100%;padding-bottom: 9px;padding-top: 9px;text-align: left;" id="atendidoPOR"><span class="glyphicon glyphicon-hand-right" style="margin-right: 5px"></span><?php echo strtoupper($_SESSION['DS_NOMBRES_USUARIO']); ?></pre>
	                </div>
	            </div>
	            <div class="row">
	                <div class="form-group col-lg-6">
	                    <pre class="result-content" style="width: 100%;" id="fecha"><span class="glyphicon glyphicon-calendar" style="margin-right: 5px"></span><?php echo date("Y-m-d"); ?></pre>
	                </div>
	                <div class="form-group col-lg-6">
	                    <pre class="result-content" style="width: 100%;"><span style="margin-right: 5px" class="glyphicon glyphicon-dashboard"></span><div id="reloj"name="reloj" style="display: inline;"></div></pre>
	                </div>
	            </div>
			
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">DATOS DE CLIENTE</h3>
				</div>
				<div class="panel-body">
					<div class="row">
		                <div class="form-group col-lg-6" style="vertical-align: top;">
		                    <label class="label-result-content" for="id_cliente">Cliente: </label>
		                    <select name="Venta[id_cliente]" required="required" id="id_cliente" style="width:100%"></select>
		                </div>
		                <div class="form-group col-lg-6">
		                    <label class="label-result-content" for="cedula">Cédula: </label><br>
		                    <pre class="result-content" style="width: 100%;" id="cedula"></pre>
		                </div>
		            </div>
		            <div class="row">
		            	<div class="form-group col-lg-6">
		                    <label class="label-result-content" for="telefono">Teléfono: </label><br>
		                    <pre class="result-content" style="width: 100%;" id="telefono"></pre>
		                </div>
		                <div class="form-group col-lg-6">
		                    <label class="label-result-content" for="celular">Celular: </label><br>
		                    <pre class="result-content" style="width: 100%;" id="celular"></pre>
		                </div>
		            </div>
		            <div class="row">
		            	<div class="form-group col-lg-6">
		                    <label class="label-result-content" for="correo">Correo: </label><br>
		                    <pre class="result-content" style="width: 100%;" id="correo"></pre>
		                </div>
		                <div class="form-group col-lg-6">
		                    <label class="label-result-content" for="direccion">Dirección: </label><br>
		                    <pre class="result-content" style="width: 100%;" id="direccion"></pre>
		                </div>
		            </div>
		            <div class="row">
		                <div class="form-group col-lg-6">
		                    <label class="label-result-content" for="ultima_compra">Ultima compra: </label><br>
		                    <pre class="result-content" style="width: 100%;" id="ultima_compra"></pre>
		                </div>
		            </div>
				</div>
			</div>
<div class="col-lg-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">PRODUCTOS</h3>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form" id="datos_cotizacion" autocomplete="off">
				
						<div class="form-group row">
							<label for="q" class="col-md-2 control-label">Código o nombre</label>
							<div class="col-md-8">
								<input type="text" class="form-control" id="q" placeholder="Código o nombre del producto" onkeyup="cargarProductosFactura(1);">
							</div>
							<div class="col-md-2">
								<button type="button" class="btn btn-default" onclick="cargarProductosFactura(1);">
									<span class="glyphicon glyphicon-search"></span> Buscar</button>
								<span id="loader"></span>
							</div>
							
						</div>
				
				
				
					</form>
					<div class="table-responsive">
						<table class="table">
							<thead>
								<th>PRODUCTO ID</th>
								<th>CÓDIGO</th>
								<th>NOMBRE</th>
								<th>DESCRIPCIÓN</th>
								<th>STOCK</th>
								<th>CANTIDAD</th>
								<th>PRECIO DE VENTA UND</th>
								<th>AGREGAR </th>
							</thead>
							<tbody id="tbody_productos">
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
</div>
<div class="col-lg-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">DETALLE DE LA FACTURA</h3>
		</div>
		<div class="panel-body">



			<div class="row">
				<div class="col-xs-9 ">
				          <input type="hidden" id="act_FinalizarVenta" value="Activation">
				 <table class="table" width="80%" id="table"> 
				   
				<tbody><tr id="carrito">
				  <th id="thCodigo" class="tablaHeader">IdPro</th>
				    <th id="thNombre" class="tablaHeader">Descripcion</th>
				      <th id="thCant" class="tablaHeader">Cant</th>
				        <th id="thPrecio" class="tablaHeader">Precio C/U</th>
				    
				            <th id="" class="tablaHeader">Total</th>
				            <th id="tablaHeader2">Quitar</th>
				</tr>
				   </tbody></table>
				          <div id="scroll" overflow="auto" width="80%">
				        <table class="table table-striped table-hover" border="0">

				                  <tbody><tr>
				  <th id="thCodigo">3</th>
				    <th id="thNombre">BOLSO RS21 MODEL JS43 </th>
				      <th id="thCant">2</th>
				        <th id="thPrecio">2567.92</th>
				        
				            <th>5135.84</th>
				<th id="operaciones"><a href="../controlador/Controlador.php?codigo=3&amp;cant=2&amp;SumarInventario"> <img src="../img/papelera.png" width="20px;"></a></th>
				</tr>
				              
				            </tbody></table>
				     </div>

				  
				 </div>

				  <div class="col-xs-3 ">
				    <table width="90%;" class="table">
				          <tbody><tr>
				        <th>Iva:</th>
				        <td>616.3008</td>
				      </tr>

				        <tr>
				        <th>SubTotal:</th>
				        <td> 4519.5392</td>
				      </tr>

				        <tr>
				        <th class="Total">Total:</th>
				        <td class="Total">5135.84</td>
				      </tr>
				    </tbody></table>
				  </div>
				</div>






		</div>
	</div>
</div>
			</div>
		</div>
	</div>

	<?php
		include("footer.php");
	?>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
	<script src="js/ventas.js"></script>

