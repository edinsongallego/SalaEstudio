var term;
$(document).ready(function(){
	mueveReloj();
	cargarProductosFactura();
	$("#id_cliente").select2({
		allowClear: true,
	  	ajax: {
	  	cache: true,
	    url: 'ajax/autocomplete/clientes.php',
	    dataType: 'json',
	    data: function (params) {
	    	term = params.term;
	      var query = {
	        search: params.term,
	        page: params.page || 1
	      }

	      // Query parameters will be ?search=[term]&page=[page]
	      return query;
	    },
	     results: function (data, page) {
            return { results: data.results };
        }
	  },
	});


	$(document).on("click", ".btn_agregar_producto", function(e){
		e.preventDefault();
		id_producto = $(this).attr("id_prodcuto");
		if ($.isNumeric($("#cantidad_"+id_producto).val()) && parseInt($("#cantidad_"+id_producto).val()) > 0 ) {
			if (true) {}
		}else{
			alertify.error("Verifique la cantidad ingresada.");

		}
	});

	$("#id_cliente").change(function(e){
		if((cliente = $(this).select2("data")[0]) != undefined && cliente.id > 0 ){
			$("#cedula").html(cliente.modelo.NM_DOCUMENTO_ID);
			$("#telefono").html(cliente.modelo.NM_TELEFONO);
			$("#celular").html(cliente.modelo.NM_CELULAR);
			$("#correo").html(cliente.modelo.DS_CORREO);
			$("#direccion").html(cliente.modelo.DS_DIRECCION);
			$("#ultima_compra").html(cliente.modelo.ULTIMA_COMPRA);
		}else{
			$("#cedula").html("");
			$("#telefono").html("");
			$("#celular").html("");
			$("#correo").html("");
			$("#direccion").html("");
			$("#ultima_compra").html("");
		}
});
});


function mueveReloj(){
    momentoActual = new Date()
    hora = momentoActual.getHours()
    minuto = momentoActual.getMinutes()
    segundo = momentoActual.getSeconds()
	horaImprimible = hora + ":" + minuto + ":" + segundo
 	$("#reloj").html(horaImprimible);
	setTimeout("mueveReloj()",1000);
}

function cargarProductosFactura() {
	$("#loader").fadeIn('slow');
	var q= $("#q").val();
	$.ajax({
		url:'ajax/buscar_productos_factura.php?action=ajax&page=1&q='+q,
		 beforeSend: function(objeto){
		 $('#loader').html('<img src="img/ajax-loader.gif"> Cargando...');
	  },
		success:function(data){
			$("#tbody_productos").html(data).fadeIn('slow');
			$('#loader').html('');
			
		}
	});
}

