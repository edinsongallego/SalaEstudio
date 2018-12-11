<?php
include_once "classes/Factura.php";
include_once "classes/Login.php";

$scriptID = uniqid();
//if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
if (!Login::inicioSession()) {
    header("location: login.php");
    exit;
}

/* Connect To Database */
require_once ("config/db.php"); //Contiene las variables de configuracion para conectar a la base de datos
require_once ("config/conexion.php"); //Contiene funcion que conecta a la base de datos
$active_facturas = "";
$active_productos = "";
$active_clientes = "";
$active_usuarios = "";
$active_reservas = "";
$active_ventas = "active";
$title = "Ventas | Sala Estudio";
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <?php include("head.php"); ?>
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
        $num_fact = Factura::obtenerSiguienteConsecutivoFactura();
        //print_r($num_fact);die;
        ?>
        <div class="container container-fluid">
            <form role="form" id="frm_factura_venta"> 
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">FACTURA DE VENTA</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row" id="respuestaFac" style="margin: 15px;"></div>
                        <div class="row">
                            <div class="form-group col-lg-6">
                                <label class="label-result-content" for="factura">FACTURA: </label><br>
                                <input type="text" required name="Venta[codigo]" id="codigo" class="form-control" value="<?php echo str_pad($num_fact[0], 10, "0", STR_PAD_LEFT); ?>"/>
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
				<div class="row">
	                <div class="form-group col-lg-12">
	                	<label class="" for="nota_venta">Notas de la factura: </label>
	                	<textarea class="form-control" id="nota_venta" name="Venta[nota]" placeholder="Notas sobre la factura"></textarea>
	                </div>
	            </div>
	            <div class="row">
	            	<div class="form-group col-lg-6">
	            		<label class="" for="estado">*Estado: </label><br>
                                <?php foreach (Factura::obtenerEstadoFactura() as $row) { ?>
    							  <label>
    							    <input type="radio" required
    							           name="Venta[estado]" 
    							           value="<?php echo $row[0]; ?>"
                                        <?php echo ($row[0] == 1 ? "checked" : ""); ?>>
                                        <?php echo $row[1]; ?>
    							  </label>
                                <?php } ?>
					</div>
					<div class="form-group col-lg-6">
	                	<label class="label-result-content" for="ultima_compra">Forma de pago: </label>
                                <select name="Venta[id_forma_pago]" required class="form-control" id="id_forma_pago" style="width:100%">
	                		<option value style="display: none" selected></option>
                                    <?php
                                    foreach (Factura::obtenerMediosDePago($con) as $row) {
                                        ?>
    	                			<option value="<?php echo $row["ID_FORMA_PAGO"]; ?>"><?php echo $row["DES_FORMA_PAGO"]; ?></option>
                                        <?php
                                    }
                                    ?>
	                	</select>
	                </div>
	            </div>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">DATOS DE CLIENTE</h3>
				</div>
				<div class="panel-body">
					<div class="row">
		                <div class="form-group col-lg-6" style="vertical-align: top;">
		                    <label class="label-result-content" for="id_cliente">*Cliente: </label>
		                    <select name="Venta[id_cliente]" required="required" id="id_cliente" style="width:100%"></select>
		                </div>
		                <div class="form-group col-lg-6">
		                    <label class="label-result-content" for="cedula">*Cédula: </label><br>
		                    <pre class="result-content" style="width: 100%;" id="cedula"></pre>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-lg-6">
                                        <label class="label-result-content" for="telefono">*Teléfono: </label><br>
                                        <pre class="result-content" style="width: 100%;" id="telefono"></pre>
                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label class="label-result-content" for="celular">*Celular: </label><br>
                                        <pre class="result-content" style="width: 100%;" id="celular"></pre>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-lg-6">
                                        <label class="label-result-content" for="correo">*Email: </label><br>
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
                                    <div class="form-group col-lg-6">
                                        <!--<label class="label-result-content" for="porcentaje_descuento_incentivo">Porcentaje(%) incentivo descuento: </label> -->
                                        <input type="hidden" class="form-control" id="porcentaje_descuento_incentivo" name="Venta[porcentaje_descuento_incentivo]" value="0"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-lg-12">
                                        <label class="label-result-content" for="facturas_pendientes_por_pagar">Facturas pendientes: </label><br>
                                        <pre class="result-content" style="width: 100%;height: auto;min-height:29px" id="facturas_pendientes_por_pagar"></pre>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">PRODUCTOS</h3>
                            </div>
                            <div class="panel-body">
                                <form class="form-horizontal" role="form" id="datos_cotizacion" autocomplete="off">
                                    <div class="form-group row">
                                        <label for="q" class="col-md-2 control-label">Código o nombre</label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" id="q" placeholder="Código o nombre del producto"   autocomplete="off" onkeyup="cargarProductosFactura(1);">
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
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">DETALLE DE LA FACTURA</h3>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td style="vertical-align: top;">
                                                    <table class="table table-bordered" width="80%" id="table_productos"> 
                                                        <thead>
                                                            <tr>
                                                                <th id="thCodigo" class="tablaHeader">CÓDIGO</th>
                                                                <th id="thNombre" class="tablaHeader">NOMBRE</th>
                                                                <th id="thCant" class="tablaHeader">CANTIDAD</th>
                                                                <th id="thPrecio" class="tablaHeader">PRECIO C/U</th>				    
                                                                <th id="" class="tablaHeader">TOTAL</th>
                                                                <th id="tablaHeader2" colspan="2">QUITAR</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        </tbody>
                                                        <tfoot>
                                                            <tr>
                                                                <th colspan="5" style="text-align: right;">Iva:</th>
                                                                <td id="iva" colspan="2"><span>0</span> <input type="hidden" name="Venta[precio_iva]" class="precio_iva" value="0"></td>
                                                            </tr>

                                                            <tr>
                                                                <th colspan="5" style="text-align: right;">SubTotal:</th>
                                                                <td id="subtotal" colspan="2"><span>0</span> <input type="hidden" name="Venta[precio_subtotal]" class="precio_subtotal" value="0"></td>
                                                            </tr>
                                                            
                                                            <tr style="display:none">
                                                                <th colspan="5" style="text-align: right;">Descuento:</th>
                                                                <td id="descuento" colspan="2"><span>0</span> <input type="hidden" name="Venta[precio_descuento]" class="precio_descuento" value="0"></td>
                                                            </tr>

                                                            <tr>
                                                                <th colspan="5" style="text-align: right;" class="Total">Total:</th>
                                                                <td id="total" colspan="2"><span>0</span> <input type="hidden" name="Venta[precio_total]" class="precio_total" value="0"></td>
                                                            </tr>
                                                        </tfoot>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                        <input type="text" class="hidden" id="valid_cantidad_productos_venta" data-rule-cantidadProductosVenta="true"/> 
                                    </div>




                                </div>






                            </div>
                        </div>
                    </div>
                    <div class="panel-footer text-center">
                        <input type="submit" class="btn btn-primary" value="Guardar">
                        <button class="btn btn-danger" value="">Cancelar</button>
                    </div>
                </div>
            </form>
        </div>

        <?php
        include("footer.php");
        ?>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
        <script src="js/jquery.number.min.js"></script>
        <script src="js/ventas.js?c=<?php echo $scriptID; ?>"></script>
        <script src="js/factura.js?c=<?php echo $scriptID; ?>"></script>

