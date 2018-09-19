$(document).ready(function(){
	$("#id_producto").select2({
		allowClear: true,
		placeholder: "Seleccione un producto",
	  	ajax: {
	  	cache: true,
	    url: 'ajax/autocomplete/producto.php',
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
});