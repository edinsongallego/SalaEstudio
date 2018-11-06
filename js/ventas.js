var term;
$(document).ready(function () {

    mueveReloj();
    cargarProductosFactura();

    $.validator.addMethod("cantidadExistenteProductos", function (value, element) {
        cantidad = parseInt(value);
        return cantidad <= parseInt($("#cantidad_inventario_" + id_producto).val());
    }, "La cantidad ingresada no puede superar el stock de inventario.");

    $.validator.addMethod("cantidadProductosVenta", function (value, element) {
        return ($("#table_productos tbody tr").length > 0 ? true : false);
    }, "Asegurece que la factura se le han agregado productos.");

    $.validator.setDefaults({
        ignore: "",
        ignore: ".ignoreClass"
    });

    $('#frm_factura_venta').validate({
        ignore: "",
        ignore: ".ignoreClass"
    });


    $("#id_cliente").select2({
        allowClear: true,
        placeholder: "Seleccione un cliente",
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
                return {results: data.results};
            }
        },
    });

    $(document).on("click", ".btn_remover_producto", function (e) {
        $(this).parent().parent().remove();
        calcular_totales();
        cargarProductosFactura();
    });

    $("#frm_factura_venta").submit(function (e) {
        e.preventDefault();
        if ($('#frm_factura_venta').valid() && $("#valid_cantidad_productos_venta").valid()) {
            $('#loading').show();
            $.get("ajax/agregar_factura.php?" + $("#frm_factura_venta").serialize() + "&Venta%5Bcliente%5D=" + $("#id_cliente").select2("data")[0].text, function (r) {
                if (r.result) {
                    limpiarFormulario();
                    imprimir_factura(r.idFactura);
                    $("#codigo").val(r.consecutivoFactura);
                    cargarProductosFactura();
                }
                $("#respuestaFac").html(r.htmlResult);
                $("#respuestaFac").focus();
                $('html, body').animate({scrollTop: $('#respuestaFac').offset().top - 10}, 'slow');
                $('#loading').hide();

            }, "JSON");

        }
    });

    $(document).on("click", ".btn_agregar_producto", function (e) {
        e.preventDefault();
        id_producto = $(this).attr("id_prodcuto");
        inputValidar = $(this).parent().parent().find(".ignoreClass");
        inputValidar.removeClass("ignoreClass");
        if ($("#cantidad_" + id_producto).valid() && $("#precio_" + id_producto).valid()) {
            precio = parseFloat($("#precio_" + id_producto).val());
            cantidad = parseInt($("#cantidad_" + id_producto).val());
            precio_total = cantidad * precio;
            html = "<tr><input type='hidden' name='PRODUCTO[" + id_producto + "][ID_PRODUCTO]' value='" + $("#producto_id_" + id_producto).val() + "'/>";
            html += "<td>" + $("#codigo_producto" + id_producto).val() + "</td>";
            html += "<td>" + $("#nombre_producto" + id_producto).val() + "</td>";
            html += "<td>" + $("#cantidad_" + id_producto).val() + "<input type='hidden' class='cantidad' name='PRODUCTO[" + id_producto + "][CANTIDAD_PRODUCTO]' value='" + cantidad + "'/></td>";
            html += "<td>" + $("#precio_" + id_producto).val() + "<input type='hidden' class='precio' name='PRODUCTO[" + id_producto + "][PRECIO_PRODUCTO]' value='" + precio + "'/></td>";
            html += "<td>" + precio_total + "<input type='hidden' class='precio_total' name='PRODUCTO[" + id_producto + "][PRECIO_TOTAL_PRODUCTO]' value='" + precio_total + "'/></td>";
            html += "<td colspan=2><button type='button' class='btn btn-danger btn_remover_producto' id_prodcuto=" + id_producto + " name=''><span class='glyphicon glyphicon-trash'></span></button></td>"
            html += "</tr>";
            $("#table_productos tbody").append(html);
            calcular_totales();
            $("#valid_cantidad_productos_venta").valid();
            $(this).parent().parent().remove();

        }
        inputValidar.addClass("ignoreClass");
    });

    $("#porcentaje_descuento_incentivo").change(function (e) {
        calcular_totales();
    });

    $('input[type=radio][name="Venta[estado]"]').change(function () {
        if ($(this).val() == 2) {
            $("#id_forma_pago").parent().hide();
            $("#id_forma_pago").prop('selectedIndex', 0);
            $("#id_forma_pago").addClass("ignoreClass");
        } else {
            $("#id_forma_pago").parent().show();
            $("#id_forma_pago").removeClass("ignoreClass");
        }
    });

    $("#id_cliente").change(function (e) {
        if ((cliente = $(this).select2("data")[0]) != undefined && cliente.id > 0) {
            $("#cedula").html(cliente.modelo.NM_DOCUMENTO_ID);
            $("#telefono").html(cliente.modelo.NM_TELEFONO);
            $("#celular").html(cliente.modelo.NM_CELULAR);
            $("#correo").html(cliente.modelo.DS_CORREO);
            $("#direccion").html(cliente.modelo.DS_DIRECCION);
            $("#ultima_compra").html(cliente.modelo.ULTIMA_COMPRA);
            //$("#porcentaje_descuento_incentivo").val(cliente.modelo.NM_PORCENTAJE_INCENTIVO);
            $("#facturas_pendientes_por_pagar").html("");
            html = "<table class='table'><thead><tr><th>Código</th><th>Fecha</th><th>Valor Total</th</tr></thead><tbody>";
            if (Object.keys(cliente.facturasPendientes).length > 0) {
                $.when($.each(cliente.facturasPendientes, function (i, fac) {
                    html += "<tr><td>" + fac.DS_CODIGO_FACTURA + "</td><td>" + fac.DT_FECHA_CREACION + "</td><td>" + $.number(fac.NM_PRECIO_TOTAL, 2) + "</td></tr>";
                })).done(function () {
                    html += "</tbody></table>";
                    $("#facturas_pendientes_por_pagar").html(html);
                });
            }
            calcular_totales();
        } else {
            $("#cedula").html("");
            $("#telefono").html("");
            $("#celular").html("");
            $("#correo").html("");
            $("#direccion").html("");
            $("#ultima_compra").html("");
            $("#facturas_pendientes_por_pagar").html("");
        }
    });
});

function limpiarFormulario() {
    $("#frm_factura_venta")[0].reset();
    $("#table_productos tbody").html("");
    $("#facturas_pendientes_por_pagar").html("");
    $("#id_cliente").empty().trigger('change');
    $("#iva span").html("0");
    $("#subtotal span").html("0");
    $("#total span").html("0");

    $("#iva").find('.precio_iva').val(0);
    $("#subtotal").find('.precio_subtotal').val(0);
    $("#descuento").find('.precio_descuento').val(0);
    $("#total").find('.precio_total').val(0);
}

function calcular_totales() {
    var t_iva = 0, t_subtotal = 0, t_total = 0, t_descuento = 0;
    $("#table_productos tbody tr").each(function (i, tr) {
        t_iva += iva = parseFloat($(tr).find(".precio_total").val()) * 0.16;
        t_subtotal += subtotal = parseFloat($(tr).find(".precio_total").val());
        t_total += iva + subtotal;
    }).promise().done(function () {
        t_descuento = t_subtotal * (parseFloat($("#porcentaje_descuento_incentivo").val()) / 100);
        //console.log(t_descuento);
        t_total = t_total - t_descuento;
        $("#iva span").html(t_iva);
        $("#subtotal span").html(t_subtotal);
        $("#total span").html(t_total);
        $("#descuento span").html(t_descuento);

        $("#iva").find('.precio_iva').val(t_iva);
        $("#subtotal").find('.precio_subtotal').val(t_subtotal);
        $("#descuento").find('.precio_descuento').val(t_descuento);
        $("#total").find('.precio_total').val(t_total);
        cargarProductosFactura();
    });
}

function mueveReloj() {
    momentoActual = new Date()
    hora = momentoActual.getHours()
    minuto = momentoActual.getMinutes()
    segundo = momentoActual.getSeconds()
    horaImprimible = hora + ":" + minuto + ":" + segundo
    $("#reloj").html(horaImprimible);
    setTimeout("mueveReloj()", 1000);
}

function cargarProductosFactura() {
    $("#loader").fadeIn('slow');
    var q = $("#q").val();
    $.ajax({
        url: 'ajax/buscar_productos_factura.php?action=ajax&page=1&q=' + q + '&' + $("#frm_factura_venta").serialize(),
        beforeSend: function (objeto) {
            $('#loader').html('<img src="img/ajax-loader.gif"> Cargando...');
        },
        success: function (data) {
            $("#tbody_productos").html(data).fadeIn('slow');
            $('#loader').html('');

        }
    });
}

