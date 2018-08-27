<?php

session_start();
if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
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
	$active_banda="active";
	$title="Banda | Sala Estudio";
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
						<button type='button' class="btn btn-info" data-toggle="modal" data-target="#newBanda"><span class="glyphicon glyphicon-plus" ></span> Nuevo Banda</button>
					</div>
					<h4><i class='glyphicon glyphicon-search'></i> Buscar Banda</h4>
				</div>
				<div class="panel-body">
					<?php
					include("modal/registro_banda2.php");
					include("modal/editar_banda.php");
					?>
					<form class="form-horizontal" role="form" id="datos_cotizacion"autocomplete="off">



						<div class="form-group row">
							<label for="q" class="col-md-2 control-label">Banda</label>
							<div class="col-md-5">
								<input type="text" class="form-control" id="q" placeholder="Buscar por Nombre, Codigo y Descripcion" onkeyup='load(1);'>
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
			<script type="text/javascript" src="js/banda.js"></script>





		</body>
		</html>
		<script>
			$( "#guardar_banda2" ).submit(function( event ) {
				$('#guardar_datos_banda').attr("disabled", true);

				var parametros = $(this).serialize();
				$.ajax({
					type: "POST",
					url: "ajax/nuevo_banda.php",
					data: parametros,
					beforeSend: function(objeto){
						$("#resultados_ajax_banda2").html("Mensaje: Cargando...");
					},
					success: function(datos){
						$("#resultados_ajax_banda2").html(datos);
						$('#guardar_datos_banda').attr("disabled", false);
						$("#guardar_banda2")[0].reset();
						load(1);
						setTimeout(function(){ $("#newBanda").modal('toggle'); },2000);
					}
				});
				event.preventDefault();

			})

			$( "#editar_banda" ).submit(function( event ) {
				$('#actualizar_datos2').attr("disabled", true);

				var parametros = $(this).serialize();
				$.ajax({
					type: "POST",
					url: "ajax/editar_banda.php",
					data: parametros,
					beforeSend: function(objeto){
						$("#resultados_editar").html("Mensaje: Cargando...");
					},
					success: function(datos){
						$("#resultados_editar").html(datos);
						$('#actualizar_datos2').attr("disabled", false);
						load(1);
						setTimeout(function(){ $("#editarbanda").modal('toggle'); },2000);
					}
				});
				event.preventDefault();
			})



			function obtener_datos_banda(id){
				var nombre_banda = $("#DS_NOMBRE_BANDA"+id).val();
				var descripcion_banda = $("#DS_DESCRIPCION_BANDA"+id).val();
				var id_banda = $("#DS_DESCRIPCION_BANDA"+id).val();
				
				console.log("nombre banda:" + nombre_banda);
				console.log("descripcion banda:" + descripcion_banda);

				$("#nombrebanda").val(nombre_banda);
				$("#descripcionbanda").val(descripcion_banda);
				$("#mod_id_banda").val(id);


			}
		</script>