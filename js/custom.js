(function() {

    // Dispara o Autocomplete a partir do segundo caracter
    $("#txtdocumento").autocomplete({
	    minLength: 2,
	    source: function( request, response ) {
	        $.ajax({
	            url: "consulta.php",
	            dataType: "json",
	            data: {
	            	acao: 'autocomplete',
	                parametro: $('#txtdocumento').val()
	            },
	            success: function(data) {
	               response(data);
	            }
	        });
	    },
	    select: function( event, ui ) {
	        $("#txtdocumento").val( ui.item.NM_DOCUMENTO_ID );
	        return false;
	    }
    })
    .autocomplete( "instance" )._renderItem = function( ul, item ) {
      return $( "<li>" )
        .append( "<a><b>Documento: </b>" + item.NM_DOCUMENTO_ID + "<br><b>Nombres: </b>" + item.DS_NOMBRES_USUARIO + " - <b> Apellidos: </b>" + item.DS_APELLIDOS_USUARIO + "</a><br>" )
        .appendTo( ul );
    };   
});