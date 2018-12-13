<form role="form" id="frm_nuevo_inventario" autocomplete="off"> 
<div class="modal fade" id="registroEntradaInventario" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i> Registrar nueva entrada al inventario</h4>
            </div>
            <div class="modal-body">
                <ul class="errorMessages"></ul>

                <div class="row" id="respuestaInv" style="margin: 15px;"></div>
                <div class="row">
                    <div class="form-group col-lg-6">
                        <label class="label-result-content" for="id_producto">*Producto: </label><br>
                        <select name="Inventario[id_producto]" required="required" id="id_producto" style="width:100%"></select>
                    </div>
                    <div class="form-group col-lg-6">
                        <label class="label-result-content" for="id_vendedor">*Proveedor: </label><br>
                        <select name="Inventario[id_vendedor]" required="required" id="id_vendedor" style="width:100%"></select>
                    </div>
                            </div>
	                <div class="row">
		                <div class="form-group col-lg-6">
		                    <label class="label-result-content" for="factura">*Cantidad: </label><br>
                                    <input type="number" required name="Inventario[cantidad]" id="cantidad" class="form-control" required value=""/>
		                </div>
		                <div class="form-group col-lg-6">
		                    <label class="label-result-content" for="factura">*Precio de compra unitario: </label><br>
                                    <input type="number" step="any" required name="Inventario[precio_co]" id="precio_co" readonly="" class="form-control" value=""/>
		                </div>
			        </div>
                <div class="row">
                    <div class="form-group col-lg-6">
                        <label class="label-result-content" for="factura">Fecha entrada: </label>
                        <pre class="result-content" style="width: 100%;" id="fecha"><span class="glyphicon glyphicon-calendar" style="margin-right: 5px"></span><?php echo date("Y-m-d"); ?></pre>
	                	</div>
                </div>
		        </div>
                
		        <div class="modal-footer">
                            <input type="submit" class="btn btn-primary" id="btn_enviar" value="Guardar">
					<button class="btn btn-danger" value="" id="btn_cancelar">Cancelar</button>
			</div>
            </div>
          </div>
</div>
</form>