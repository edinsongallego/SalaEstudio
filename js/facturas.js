$(document).ready(function(){
	load(1);
	
});

function load(page){
	var q= $("#q").val();
	$("#loader").fadeIn('slow');
	$.ajax({
		url:'./ajax/buscar_facturas.php?action=ajax&page='+page+'&q='+q,
		 beforeSend: function(objeto){
		 $('#loader').html('<img src="./img/ajax-loader.gif"> Cargando...');
	  },
		success:function(data){
			$(".outer_div").html(data).fadeIn('slow');
			$('#loader').html('');
			$('[data-toggle="tooltip"]').tooltip({html:true}); 
			
		}
	})
}



	function eliminar (id)
{
	var q= $("#q").val();
if (confirm("Realmente deseas eliminar la factura")){	
$.ajax({
type: "GET",
url: "./ajax/buscar_facturas.php",
data: "id="+id,"q":q,
 beforeSend: function(objeto){
	$("#resultados").html("Mensaje: Cargando...");
  },
success: function(datos){
$("#resultados").html(datos);
load(1);
}
	});
}
}

function imprimir_factura(id_factura){
	VentanaCentrada('./pdf/documentos/ver_factura.php?id_factura='+id_factura,'Factura','','1024','768','true');
}

function realizar_pago_factura(id_factura) {
	if (confirm("Esta acción descargará los productos de inventario, ¿Esta seguro de realizar esta acción?")) {
		$('#loading').show();
		$.get("ajax/realizar_pago_factura.php?id_factura="+id_factura,function(r){
			if (r.result) {
				//imprimir_factura(id_factura);
				alertify.success(r.mensaje);
				load(1);
			}else{
				alertify.error(r.mensaje);
			}
			$('#loading').hide();
		},"JSON");
	}
}