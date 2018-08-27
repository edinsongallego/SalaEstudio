$(document).ready(function(){
   $.ajax({
   	type: 'POST',
   	url: 'cargar_lista.php',
   	data: {'peticion':'cargar_lista'}	
   })
   .done(function(listas_sala){
		$('#lista_salas').html(listas_sala)
   		alert('mierda');
   })
   .fail(function(){
   		alert('Error al cargar la lista')
   })
})