$(document).ready(function () {
    $.fn.modal.Constructor.prototype.enforceFocus = function() {};
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
                return {results: data.results};
            }
        },
    });

    $("#id_producto").change(function(){
        if((producto = $(this).select2("data")[0]) != undefined){
            $("#precio_co").val(producto.modelo.NM_PRECIO_UNITARIO_COMPRA_UND);
        }else{
            $("#precio_co").val("");
        }
    });
    
    $("#id_vendedor").select2({
        allowClear: true,
        placeholder: "Seleccione un vendedor",
        ajax: {
            cache: true,
            url: 'ajax/autocomplete/vendedor_prd.php',
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
                return {results: data.results};
            }
        },
    });

    $("#btn_registro_nueva_entrada").click(function (e) {
        e.preventDefault();
        limpiarFormulario();
        $("#registroEntradaInventario").modal("toggle");
    });

    $("#btn_cancelar").click(function (e) {
        e.preventDefault();
        $("#frm_nuevo_inventario")[0].reset();
        $("#registroEntradaInventario").modal("toggle");
    });

    $("#frm_nuevo_inventario").submit(function (e) {
        e.preventDefault();
        $("#loading").toggle();
        if ($('#frm_nuevo_inventario')[0].checkValidity()) {
            $.post("ajax/agregar_entrada_inventario.php", $("#frm_nuevo_inventario").serialize(), function (r) {
               $("#loading").toggle();
                if (r.result) {
                    load(1);
                    setTimeout(function(){
                        $("#registroEntradaInventario").modal("toggle");
                    },1500);
                }
                $("#respuestaInv").html(r.htmlResult);
            }, "JSON");
        }
    });

    load(1);
});

function limpiarFormulario() {
    $("#frm_nuevo_inventario")[0].reset();
    $("#id_vendedor").empty().trigger('change');
    $("#id_producto").empty().trigger('change');
    $("#respuestaInv").html("");
}

function load(page) {
    var q = $("#q").val();
    $("#loader").fadeIn('slow');
    $.ajax({
        url: './ajax/buscar_productos_inventario.php?action=ajax&page=' + page + '&q=' + q,
        beforeSend: function (objeto) {
            $('#loader').html('<img src="./img/ajax-loader.gif"> Cargando...');
        },
        success: function (data) {
            $(".outer_div").html(data).fadeIn('slow');
            $('#loader').html('');
            $('[data-toggle="tooltip"]').tooltip({html: true});

        }
    })
}

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

            //errorList
            //    .show()
            //    .append( "<li><span>" + label.html() + "</span> " + message + "</li>" );
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