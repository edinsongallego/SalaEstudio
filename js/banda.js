$(document).ready(function () {
    $("#guardar_banda2").validate();
    $("#editar_banda").validate();
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

    crearSelectIntegrantes();
    crearSelectEditLider();

    $("#id_lider").select2({
        allowClear: true,
        placeholder: "Seleccione el líder de la banda",
        ajax: {
            cache: true,
            url: 'ajax/autocomplete/usuarios_banda.php',
            dataType: 'json',
            data: function (params) {
                term = params.term;
                var query = {
                    search: params.term,
                    id_usuarios_existentes: $('#id_integrantes').val(),
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

    $("#btn_nueva_banda").click(function (e) {
        e.preventDefault();
        $.fn.modal.Constructor.prototype.enforceFocus = $.noop;
        $("#resultados_ajax_banda2").html("");
        $("#newBanda").modal("toggle");
    });

    $("#btn_cancelar").click(function (e) {
        $("#newBanda").modal("toggle");
    });

    $("#btn_cancelar_edit").click(function (e) {
        e.preventDefault();
        $("#editarbanda").modal("toggle");
    });


    $("#editar_banda").submit(function (event) {
 
        if ($("#editar_banda").valid()) {
            $('#actualizar_datos2').attr("disabled", true);
            $("#loading").toggle();
            var parametros = $(this).serialize();
            $.ajax({
                type: "POST",
                url: "ajax/editar_banda.php",
                data: parametros,
                beforeSend: function (objeto) {
                    $("#resultados_editar").html("Mensaje: Cargando...");
                },
                success: function (datos) {
                    $("#loading").toggle();
                    $("#resultados_editar").html(datos);
                    $('#actualizar_datos2').attr("disabled", false);
                    load(1);
                    setTimeout(function () {
                        $("#editarbanda").modal('toggle');
                    }, 2000);
                }
            });
        }
        event.preventDefault();
    });

    $("#guardar_banda2").submit(function (event) {

        if ($("#guardar_banda2").valid()) {
            $('#guardar_datos_banda').attr("disabled", true);
            $("#loading").toggle();
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
                    $("#loading").toggle();
                    $('#guardar_datos_banda').attr("disabled", false);
                    limpiar_formulario();
                    load(1);
                    setTimeout(function () {
                        $("#newBanda").modal('toggle');
                    }, 2000);
                }
            });
        }
        event.preventDefault();

    });

    load(1);
});


function limpiar_formulario() {
    $("#guardar_banda2")[0].reset();
    $("#id_lider").empty().trigger('change');
    $("#id_integrantes").empty().trigger('change');
}

function limpiar_formulario_ed() {
    $("#editar_banda")[0].reset();
    $("#id_lider_ed").empty().trigger('change');
    $("#id_integrantes_ed").empty().trigger('change');
    $("#resultados_editar").html("");
}

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

function crearSelectIntegrantes() {
    $('#id_integrantes_ed').select2({
        allowClear: false,
        language: "es",
        placeholder: "Integrantes de la banda",
        multiple: true,
        ajax: {
            url: 'ajax/autocomplete/usuarios_banda.php',
            cache: "true",
            type: 'POST',
            dataType: 'json',
            data: function (data, page) {
                data["id_usuarios_existentes"] = $("#id_lider_ed").val();
                data["search"] = data.term;
                return data;
            },
            results: function (data, page) {
                return {results: data.results};
            }
        },
    });

}

function crearSelectEditLider(data) {

    $("#id_lider_ed").select2({
        allowClear: true,
        language: "es",
        placeholder: "Seleccione el lider de la banda",
        data: processData(data).results,
        // selectOnClose: true,
        processResults: function (data) {
            console.log(data);
            return {
                results: data.users,
                pagination: {
                    more: data.next !== null
                }
            };

        },
        ajax: {
            cache: true,
            url: 'ajax/autocomplete/usuarios_banda.php',
            dataType: 'json',
            data: function (params) {
                term = params.term;
                var query = {
                    search: params.term,
                    id_usuarios_existentes: $('#id_integrantes_ed').val(),
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

    // $('#id_lider_ed').val(selected).trigger('change');
}

function processData(data) {
    var mapdata = $.map(data, function (obj) {
        return obj;
    });
    return {results: mapdata};
}

function obtener_datos_banda(id) {
    var nombre_banda = $("#DS_NOMBRE_BANDA" + id).val();
    var descripcion_banda = $("#DS_DESCRIPCION_BANDA" + id).val();
    var id_banda = $("#DS_DESCRIPCION_BANDA" + id).val();
    limpiar_formulario_ed();

    $("#nombrebanda").val(nombre_banda);
    $("#descripcionbanda").val(descripcion_banda);
    $("#mod_id_banda").val(id);

    $.get("ajax/obtener_datos_banda.php", {id_banda: id}, function (data) {
        var inte = [];
        $.when($.each(data.integrantes, function (i, integrante) {
            if (integrante.ES_LIDER == 1) {
                $("#id_lider_ed").select2("trigger", "select", {
                    data: {id: integrante.NM_DOCUMENTO_ID, text: integrante.DS_NOMBRE_USUARIO, modelo: integrante}
                });
            } else {
                inte.push(integrante);
                $("#id_integrantes_ed").select2("trigger", "select", {
                    data: {id: integrante.NM_DOCUMENTO_ID, text: integrante.DS_NOMBRE_USUARIO, modelo: integrante}
                });

            }
        })).then(function () {
            // crearSelectIntegrantes(inte);
        });
    }, "JSON");
    $.fn.modal.Constructor.prototype.enforceFocus = $.noop;
}

