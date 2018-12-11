	<?php
		if (isset($con))
		{
	?>
	<!-- Modal -->
	<div class="modal fade" id="nuevoCliente" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i> Agregar nuevo cliente</h4>
		  </div>
		  <div class="modal-body">
			<form class="form-horizontal" method="post" id="guardar_cliente" name="guardar_cliente"autocomplete="off">
			<div id="resultados_ajax"></div>
			  <div class="form-group">
				<label for="nombre" class="col-sm-3 control-label">*Nombres</label>
				<div class="col-sm-8">
				
				  
				  <input type="text" class="form-control" id="nombre" name="nombre"  placeholder="*Nombres" title="Nombre de usuario ( sólo letras )" onkeypress="return soloLetras(event)" onblur="limpia()" id="miInput"   required>
				</div>
			  </div>
			  <div class="form-group">
				<label for="telefono" class="col-sm-3 control-label">*Celular</label>
				<div class="col-sm-8">
				  
				  
			 <input type="text" class="form-control" id="telefono" name="telefono" placeholder="*Celular" title="Celular( sólo Números)" onkeypress="return numeros(event)" onKeyUp="pierdeFoco(this)" onblur="limpia()" id="miInput" class="form-control" minlength="10" maxlength="10"  required>
			 
				</div>
			  </div>
			  
			  <div class="form-group">
				<label for="email" class="col-sm-3 control-label">Email</label>
				<div class="col-sm-8">
				
				<input type="email" class="form-control" id="email" name="email" placeholder="*Email" value="" size='30' maxlength='100' title=''Dirección de correo' onKeyUp="javascript:validateMail('correo')" class="form-control" required>
				
				

				  
				</div>
			  </div>
			  
			  <div class="form-group">
				<label for="direccion" class="col-sm-3 control-label">Dirección</label>
				<div class="col-sm-8">
					<textarea class="form-control" id="direccion" name="direccion"   maxlength="255"  required></textarea>
				  
				</div>
			  </div>
			  
			  <div class="form-group">
				<label for="estado" class="col-sm-3 control-label">Estado</label>
				<div class="col-sm-8">
				 <select class="form-control" id="estado" name="estado" required>
					<option value="">-- Selecciona estado --</option>
					<option value="1" selected>Activo</option>
					<option value="0">Inactivo</option>
				  </select>
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
	<script>

	function numeros(e){
		key = e.keyCode || e.which;

		var key = window.Event ? e.which : e.keyCode;
   return ((key >= 48 && key <= 57) ||(key==8))

		tecla = String.fromCharCode(key).toLowerCase();
		letras = " 0123456789";
		especiales = [8,37,39,46];

		tecla_especial = false
		for(var i in especiales){
			if(key == especiales[i]){
				tecla_especial = true;
				break;
			} 
		}

		if(letras.indexOf(tecla)==-1 && !tecla_especial)
			return false;
	}
 
 function pierdeFoco(e){
    var valor = e.value.replace(/^0*/, '');
    e.value = valor;
 }


	function soloLetras(e) {
		key = e.keyCode || e.which;
		tecla = String.fromCharCode(key).toLowerCase();
		letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
		especiales = [8, 37, 39, 46];

		tecla_especial = false
		for(var i in especiales) {
			if(key == especiales[i]) {
				tecla_especial = true;
				break;
			}
		}

		if(letras.indexOf(tecla) == -1 && !tecla_especial)
			return false;
	}

	function limpia() {
		var val = document.getElementById("miInput").value;
		var tam = val.length;
		for(i = 0; i < tam; i++) {
			if(!isNaN(val[i]))
				document.getElementById("miInput").value = '';
		}
	}

	function validateMail(idMail)
	{
    //Creamos un objeto 
    object=document.getElementById(idMail);
    valueForm=object.value;

    // Patron para el correo
    var patron=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/;
    if(valueForm.search(patron)==0)
    {
        //Mail correcto
        object.style.color="#000";
        return;
    }
    //Mail incorrecto
    object.style.color="#f00";
}
//-->
</script>