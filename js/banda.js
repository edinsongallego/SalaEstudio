$(document).ready(function () {

    $('#id_integrantes').select2({
        allowClear: false,
        language: "es",
        placeholder: "Integrantes de la banda",
        multiple: true,
        default: false,
        ajax: {
            url: 'ajax/autocomplete/usuarios_banda.php',
            cache: "true",
            type: 'POST',
            dataType: 'json',
            data: function (data, page) {
                data["id_usuarios_existentes"] = $("#id_lider").val();
                data["search"] = data.term;
                return data;
            },
            results: function (data, page) {
                return {results: data.results};
            }
        },
    });

    $("#id_lider").select2({
        allowClear: true,
        placeholder: "Seleccione el lider de la banda",
        ajax: {
            cache: true,
            url: 'ajax/autocomplete/usuarios_banda.php',
            dataType: 'json',
            data: function (params) {
                term = params.term;
                var query = {
                    search: params.term,
                    id_usuarios_existentes:$('#id_integrantes').val(),
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
    
    $("#btn_nueva_banda").click(function(e){
        e.preventDefault();
        $.fn.modal.Constructor.prototype.enforceFocus = $.noop;
        $("#newBanda").modal("toggle");
    });
    
    $("#btn_cancelar").click(function(e){
        $("#newBanda").modal("toggle");
    });

    $("#editar_banda").submit(function (event) {
        $('#actualizar_datos2').attr("disabled", true);

        var parametros = $(this).serialize();
        $.ajax({
            type: "POST",
            url: "ajax/editar_banda.php",
            data: parametros,
            beforeSend: function (objeto) {
                $("#resultados_editar").html("Mensaje: Cargando...");
            },
            success: function (datos) {
                $("#resultados_editar").html(datos);
                $('#actualizar_datos2').attr("disabled", false);
                load(1);
                setTimeout(function () {
                    $("#editarbanda").modal('toggle');
                }, 2000);
            }
        });
        event.preventDefault();
    });

    $("#guardar_banda2").submit(function (event) {
        $('#guardar_datos_banda').attr("disabled", true);

        var parametros = $(this).serialize();
        $.ajax({
            type: "POST",
            url: "ajax/nuevo_banda.php",
            data: parametros,
            beforeSend: function (objeto) {
                $("#resultados_ajax_banda2").html("Mensaje: Cargando...");
            },
            success: function (datos) {
                $("#resultados_ajax_banda2").html(datos);
                $('#guardar_datos_banda').attr("disabled", false);
                $("#guardar_banda2")[0].reset();
                load(1);
                setTimeout(function () {
                    $("#newBanda").modal('toggle');
                }, 2000);
            }
        });
        event.preventDefault();

    });

    load(1);
});

function load(page) {
    var q = $("#q").val();
    $("#loader").fadeIn('slow');
    $.ajax({
        url: './ajax/buscar_banda.php?action=ajax&page=' + page + '&q=' + q,
        beforeSend: function (objeto) {
            $('#loader').html('<img src="./img/ajax-loader.gif"> Cargando...');
        },
        success: function (data) {
            $(".outer_div").html(data).fadeIn('slow');
            $('#loader').html('');

        }
    })
}



function eliminar(id)
{
    var q = $("#q").val();
    if (confirm("Realmente deseas eliminar la banda")) {
        $.ajax({
            type: "GET",
            url: "./ajax/buscar_banda.php",
            data: "id=" + id, "q": q,
            beforeSend: function (objeto) {
                $("#resultados").html("Mensaje: Cargando...");
            },
            success: function (datos) {
                $("#resultados").html(datos);
                load(1);
            }
        });
    }
}

function obtener_datos_banda(id) {
    var nombre_banda = $("#DS_NOMBRE_BANDA" + id).val();
    var descripcion_banda = $("#DS_DESCRIPCION_BANDA" + id).val();
    var id_banda = $("#DS_DESCRIPCION_BANDA" + id).val();

    console.log("nombre banda:" + nombre_banda);
    console.log("descripcion banda:" + descripcion_banda);

    $("#nombrebanda").val(nombre_banda);
    $("#descripcionbanda").val(descripcion_banda);
    $("#mod_id_banda").val(id);


}

