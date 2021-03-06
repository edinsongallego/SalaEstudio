	<?php
		if (isset($con))
		{
	?>
	<!-- Modal -->
	<div class="modal fade" id="nuevoProducto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i> Agregar nuevo producto</h4>
		  </div>
		  <div class="modal-body">
			<form class="form-horizontal" method="post" id="guardar_producto" name="guardar_producto"autocomplete="off">
			<div id="resultados_ajax_productos"></div>
			  <div class="form-group">
				<label for="codigo" class="col-sm-3 control-label">*Código</label>
				<div class="col-sm-8">
				  <input type="text" class="form-control" data-rule-validarExistenciaCodigoProduco="true" minlength="3" maxlength="15"id="codigo" name="codigo" placeholder="Código del producto" required>
				</div>
			  </div>
			  
			  <div class="form-group">
				<label for="nombre" class="col-sm-3 control-label">*Nombre</label>
				<div class="col-sm-8">
					<textarea class="form-control" id="nombre" name="nombre" placeholder="Nombre del producto" required maxlength="255" ></textarea>
				  
				</div>
			  </div>
			  
			  <div class="form-group">
				<label for="estado" class="col-sm-3 control-label">*Estado</label>
				<div class="col-sm-8">
				 <select class="form-control" id="estado" name="estado" required>
					<option value="">-- Selecciona estado --</option>
					<option value="1" selected>Activo</option>
					<option value="0">Inactivo</option>
				  </select>
				</div>
			  </div>
			  <div class="form-group">
				<label for="precio" class="col-sm-3 control-label">*Precio de venta</label>
				<div class="col-sm-8">
                                    <input type="number" class="form-control" id="precio" name="precio" placeholder="Precio de venta del producto" required pattern="^[0-9]{1,6}?$" title="Ingresa sólo números" maxlength="8">
				</div>
			  </div> 
			  <div class="form-group">
				<label for="precio_compra" class="col-sm-3 control-label">*Precio de compra</label>
				<div class="col-sm-8">
				  <input type="number" class="form-control" id="precio_compra" name="precio_compra" placeholder="Precio al que se compra el producto" required pattern="^[0-9]{1,6}?$" title="Ingresa sólo números" maxlength="8">
				</div>
			  </div> 
			  <div class="form-group">
				<label for="unidad" class="col-sm-3 control-label">*Unidad</label>
				<div class="col-sm-8">
				  <select class="form-control" required id="unidad" name="unidad">
				  	<option value selected style="display: none">Seleccionar unidad</option>
				  	<?php 
				  		foreach (Producto::obtenerUnidades() as $row) { ?>
				  		<option value="<?php echo $row['CS_UNIDAD_ID']; ?>"><?php echo $row['DS_DESCRIPCION_UNIDAD']; ?>(<?php echo $row['DS_NOMBRE_UNIDAD']; ?>)</option>
				  	<?php		
				  		}
				  	?>
				  </select>
				</div>
			  </div>
			 
			  <div class="form-group">
				<label for="descripcion" class="col-sm-3 control-label">Descripción</label>
				<div class="col-sm-8">
				  <textarea class="form-control" name="descripcion" placeholder="Descripción del producto"></textarea>
				</div>
			  </div> 	
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
			<button type="submit" class="btn btn-primary" id="guardar_datos">Guardar datos</button>
		  </div>
		  </form>
		</div>
	  </div>
	</div>
	<?php
		}
	?>