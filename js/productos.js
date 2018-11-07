$(document).ready(function () {
    load(1);
    $("#editar_producto").validate();
    $("#guardar_producto").validate();

    $("#guardar_producto").submit(function (event) {
        if ($("#guardar_producto").valid()) {
            $('#guardar_datos').attr("disabled", true);
            $("#loading").toggle();
            var parametros = $(this).serialize();
            $.ajax({
                type: "POST",
                url: "ajax/nuevo_producto.php",
                data: parametros,
                beforeSend: function (objeto) {
                    $("#resultados_ajax_productos").html("Mensaje: Cargando...");
                },
                success: function (datos) {
                    $("#resultados_ajax_productos").html(datos);
                    $('#guardar_datos').attr("disabled", false);
                    load(1);
                    $("#loading").toggle();
                    $("#guardar_producto")[0].reset();
                    setTimeout(function () {
                        $("#nuevoProducto").modal("toggle");
                        $("#resultados_ajax_productos").html("");
                    }, 1900);
                }
            });
        }
        event.preventDefault();
    });

    $("#editar_producto").submit(function (event) {
        if ($("#editar_producto").valid()) {
            $('#actualizar_datos').attr("disabled", true);
            $("#loading").toggle();
            var parametros = $(this).serialize();
            $.ajax({
                type: "POST",
                url: "ajax/editar_producto.php",
                data: parametros,
                beforeSend: function (objeto) {
                    $("#resultados_ajax2").html("Mensaje: Cargando...");
                },
                success: function (datos) {
                    $("#resultados_ajax2").html(datos);
                    $('#actualizar_datos').attr("disabled", false);
                    load(1);
                    $("#loading").toggle();
                    setTimeout(function () {
                        $("#myModal2").modal('toggle');
                        $("#resultados_ajax2").html("");
                    }, 1500);
                }
            });
        }
        event.preventDefault();
    });

});

function load(page) {
    var q = $("#q").val();
    $("#loader").fadeIn('slow');
    $.ajax({
        url: './ajax/buscar_productos.php?action=ajax&page=' + page + '&q=' + q,
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
    if (confirm("Realmente deseas eliminar el producto")) {
        $.ajax({
            type: "GET",
            url: "./ajax/buscar_productos.php",
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

function obtener_datos(id) {
    var codigo_producto = $("#codigo_producto" + id).val();
    var nombre_producto = $("#nombre_producto" + id).val();
    var estado = $("#estado" + id).val();
    var precio_producto = $("#precio_producto" + id).val();
    var precio_compra_producto = $("#precio_compra_producto" + id).val();
    var unidad_producto = $("#unidad_producto" + id).val();
    var descripcion_producto = $("#descripcion_producto" + id).val();
    $("#mod_id").val(id);
    $("#mod_codigo").val(codigo_producto);
    $("#mod_nombre").val(nombre_producto);
    $("#mod_unidad").val(unidad_producto);
    $("#mod_precio").val(precio_producto);
    $("#mod_descripcion").val(descripcion_producto);
    $("#mod_precio_compra").val(precio_compra_producto);
}



