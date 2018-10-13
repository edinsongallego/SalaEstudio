<?php
	include_once "classes/Factura.php";
	session_start();
	if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
        header("location: login.php");
		exit;
        }
	require_once ("config/db.php"); //Contiene las variables de configuracion para conectar a la base de datos
	require_once ("config/conexion.php"); //Contiene funcion que conecta a la base de datos
	$active_facturas="active";
	$active_productos="";
	$active_clientes="";
	$active_usuarios="";	
	$title="Facturas | Sala Estudio";
?>
<!DOCTYPE html>
<html lang="en">
  <head>
	<?php include("head.php");?>

  </head>
  <body>
	<?php
	include("navbar.php");
	?>  
    <div class="container">
		<div class="panel panel-info">
		<div class="panel-heading">
		    <div class="btn-group pull-right">
				<a  href="ventas.php" class="btn btn-info"><span class="glyphicon glyphicon-plus" ></span> Nueva Venta</a>
			</div>
			<h4><i class='glyphicon glyphicon-search'></i> Buscar Facturas</h4>
		</div>
			<div class="panel-body"style="    height: auto;min-height: 500px;">
				<form class="form-horizontal" role="form" id="datos_cotizacion"autocomplete="off">
				
						<div class="form-group row">
							<label for="q" class="col-md-2 control-label">Cliente o # de factura</label>
							<div class="col-md-5">
								<input type="text" class="form-control" id="q" placeholder="Nombre del cliente o # de factura" onkeyup='load(1);'>
							</div>
							
							
							
							<div class="col-md-3">
								<button type="button" class="btn btn-default" onclick='load(1);'>
									<span class="glyphicon glyphicon-search" ></span> Buscar</button>
								<span id="loader"></span>
							</div>
							
						</div>
				
				
				
			</form>
				<div id="resultados"></div><!-- Carga los datos ajax -->
				<div class='outer_div'></div><!-- Carga los datos ajax -->
			</div>
		</div>	
		
	</div>
	<hr>
	<?php
	include("footer.php");
	?>

    
<div class="modal fade" id="realizarpago" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
   <div class="modal-dialog">
   	<form role="form" id="frm_factura_venta">
      <div class="modal-content">
         <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i> Realizar pago de la factura</h4> 
     </div>
         <div class="modal-body">
         		
	         	<div class="form-group col-lg-12">
	            	<label class="label-result-content" for="id_forma_pago">Forma de pago: </label>
	            	<select required="" name="Venta[id_forma_pago]" class="form-control" id="id_forma_pago" style="width:100%">
	            		<option value="" style="display: none" selected=""></option>
	                    <?php
	                        foreach (Factura::obtenerMediosDePago($con) as $row) {
	                            ?>
	            			<option value="<?php echo $row["ID_FORMA_PAGO"]; ?>"><?php echo $row["DES_FORMA_PAGO"]; ?></option>
	                            <?php
	                        }
	                    ?>
	                </select>
	            </div>

	            <div class="form-group col-lg-12">
	            	<label class="" for="nota_venta">Actualizar notas de la factura: </label>
	            	<textarea class="form-control" id="nota_venta" name="Venta[nota]" placeholder="Notas sobre la factura"></textarea>
	            </div>
	            <input type="hidden" value="" name="id_factura" id="id_factura"/>
     	</div>
         <div class="modal-footer">
        	<a href="#" data-dismiss="modal" class="btn btn-danger">Cerrar</a>
        	<input type="submit" class="btn btn-primary" id="btn_realizar_pago" value="Realizar pago"/>
     </div>
      </div>
          	</form>
   </div>
</div>	
	<script type="text/javascript" src="js/VentanaCentrada.js"></script>
	<script type="text/javascript" src="js/facturas.js?v=<?php echo uniqid(); ?>"></script>
	<script type="text/javascript">
		$(document).ready(function(e){
			    var createAllErrors = function() {
		        var form = $( this ),
		            errorList = $( "ul.errorMessages", form );

		        var showAllErrorMessages = function() {
		            errorList.empty();

		            // Find all invalid fields within the form.
		            var invalidFields = form.find( ":invalid" ).each( function( index, node ) {

		                // Find the field's corresponding label
		                var label = $( "label[for=" + node.id + "] "),
		                    // Opera incorrectly does not fill the validationMessage property.
		                    message = node.validationMessage || 'Invalid value.';

		                errorList
		                    .show()
		                    .append( "<li><span>" + label.html() + "</span> " + message + "</li>" );
		            });
		        };

		        // Support Safari
		        form.on( "submit", function( event ) {
		            if ( this.checkValidity && !this.checkValidity() ) {
		                $( this ).find( ":invalid" ).first().focus();
		                event.preventDefault();
		            }
		        });

		        $( "input[type=submit], button:not([type=button])", form )
		            .on( "click", showAllErrorMessages);

		        $( "input", form ).on( "keypress", function( event ) {
		            var type = $( this ).attr( "type" );
		            if ( /date|email|month|number|search|tel|text|time|url|week/.test ( type )
		              && event.keyCode == 13 ) {
		                showAllErrorMessages();
		            }
		        });
		    };
		    
		    $( "form" ).each( createAllErrors );
		});
	</script>
  </body>
</html>