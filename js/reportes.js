$(document).ready(function () {
    $("#exportar_excel").click(function (e) {
        e.preventDefault();
        switch ($(".tab-content > div.active").attr("id")) {
            case "r_inventario":
                window.open("reportes_export.php?reporte=inventario", '_blank');
                break;
            case "r_reservas":
                window.open("reportes_export.php?reporte=reservas", '_blank');
                break;
            case "r_reservas_diarias":
                window.open("reportes_export.php?reporte=reservas_diarias", '_blank');
                break;
            case "r_reservas_mensuales":
                window.open("reportes_export.php?reporte=reservas_mensuales", '_blank');
                break;
            case "r_reservas_anuales":
                window.open("reportes_export.php?reporte=reservas_anuales", '_blank');
                break;
            case "r_productos":
                window.open("reportes_export.php?reporte=productos", '_blank');
                break;
            case "r_productos":
                window.open("reportes_export.php?reporte=productos", '_blank');
                break;
            case "r_productos_diarios":
                window.open("reportes_export.php?reporte=productos_diarios", '_blank');
                break;
            case "r_productos_mensuales":
                window.open("reportes_export.php?reporte=productos_mensuales", '_blank');
                break;
            case "r_productos_anuales":
                window.open("reportes_export.php?reporte=productos_anuales", '_blank');
                break;
            case "r_deudores":
                window.open("reportes_export.php?reporte=deudores", '_blank');
                break;
            case "r_facturacion":
                window.open("reportes_export.php?reporte=facturacion", '_blank');
                break;
            case "r_facturacion_diarios":
                window.open("reportes_export.php?reporte=facturacion_diaria", '_blank');
                break;
            case "r_facturacion_mensuales":
                window.open("reportes_export.php?reporte=facturacion_mensuales", '_blank');
                break;
            case "r_facturacion_anuales":
                window.open("reportes_export.php?reporte=facturacion_anuales", '_blank');
                break;

        }
    });

    $('a[href="#r_reservas"]').click(function () {
        $('#tbl_reservas tbody').html('<tr><td colspan=6 style="text-align: center;"><img style="margin-left: 48%;" src="./img/ajax-loader.gif"> Cargando...</td><tr>').load("ajax/reporte_reservas.php");
    });

    $('a[href="#r_reservas_diarias"]').click(function () {
        $('#tbl_reservas_diarias tbody').html('<tr><td colspan=2 style="text-align: center;"><img style="margin-left: 48%;" src="./img/ajax-loader.gif"> Cargando...</td><tr>').load("ajax/reporte_reservas_diarias.php");
    });

    $('a[href="#r_reservas_mensuales"]').click(function () {
        $('#tbl_reservas_mensuales tbody').html('<tr><td colspan=2 style="text-align: center;"><img style="margin-left: 48%;" src="./img/ajax-loader.gif"> Cargando...</td><tr>').load("ajax/reporte_reservas_mensuales.php");
    });

    $('a[href="#r_reservas_anuales"]').click(function () {
        $('#tbl_reservas_anueales tbody').html('<tr><td colspan=2 style="text-align: center;"><img style="margin-left: 48%;" src="./img/ajax-loader.gif"> Cargando...</td><tr>').load("ajax/reporte_reservas_anuales.php");
    });

    $('a[href="#r_productos"]').click(function () {
        $('#tbl_productos tbody').html('<tr><td colspan=6 style="text-align: center;"><img style="margin-left: 48%;" src="./img/ajax-loader.gif"> Cargando...</td><tr>').load("ajax/reporte_productos_vendidos.php");
    });

    $('a[href="#r_productos_diarios"]').click(function () {
        $('#tbl_productos_diarias tbody').html('<tr><td colspan=2 style="text-align: center;"><img style="margin-left: 48%;" src="./img/ajax-loader.gif"> Cargando...</td><tr>').load("ajax/reporte_productos_vendidos_diarios.php");
    });

    $('a[href="#r_productos_mensuales"]').click(function () {
        $('#r_productos_mensuales tbody').html('<tr><td colspan=2 style="text-align: center;"><img style="margin-left: 48%;" src="./img/ajax-loader.gif"> Cargando...</td><tr>').load("ajax/reporte_productos_vendidos_mensuales.php");
    });

    $('a[href="#r_productos_anuales"]').click(function () {
        $('#tbl_productos_anuales tbody').html('<tr><td colspan=2 style="text-align: center;"><img style="margin-left: 48%;" src="./img/ajax-loader.gif"> Cargando...</td><tr>').load("ajax/reporte_productos_vendidos_anuales.php");
    });

    $('a[href="#r_deudores"]').click(function () {
        $('#tbl_deudores tbody').html('<tr><td colspan=2 style="text-align: center;"><img style="margin-left: 48%;" src="./img/ajax-loader.gif"> Cargando...</td><tr>').load("ajax/reporte_deudores.php");
    });

    $('a[href="#r_facturacion"]').click(function () {
        $('#tbl_facturacion tbody').html('<tr><td colspan=2 style="text-align: center;"><img style="margin-left: 48%;" src="./img/ajax-loader.gif"> Cargando...</td><tr>').load("ajax/reporte_facturacion.php");
    });

    $('a[href="#r_facturacion_diarios"]').click(function () {
        $('#tbl_facturacion_diarias tbody').html('<tr><td colspan=2 style="text-align: center;"><img style="margin-left: 48%;" src="./img/ajax-loader.gif"> Cargando...</td><tr>').load("ajax/reporte_facturacion_diaria.php");
    });

    $('a[href="#r_facturacion_mensuales"]').click(function () {
        $('#r_facturacion_mensuales tbody').html('<tr><td colspan=2 style="text-align: center;"><img style="margin-left: 48%;" src="./img/ajax-loader.gif"> Cargando...</td><tr>').load("ajax/reporte_facturacion_mensual.php");
    });

    $('a[href="#r_facturacion_anuales"]').click(function () {
        $('#tbl_facturacion_anuales tbody').html('<tr><td colspan=2 style="text-align: center;"><img style="margin-left: 48%;" src="./img/ajax-loader.gif"> Cargando...</td><tr>').load("ajax/reporte_facturacion_anual.php");
    });

});


function load(page) {
    var q = $("#q").val();
    $("#loading").toggle();

    switch ($(".tab-content > div.active").attr("id")) {
        case "r_inventario":
            $('#tbl_inventario tbody').load("ajax/reporte_inventario.php?page=" + page, {}, function () {
                $("#loading").toggle();
            });
            break;
        case "r_reservas":
            $('#tbl_reservas tbody').load("ajax/reporte_reservas.php?page=" + page, {}, function () {
                $("#loading").toggle();
            });
            break;
        case "r_reservas_diarias":
            $('#tbl_reservas_diarias tbody').load("ajax/reporte_reservas.php?page=" + page, {}, function () {
                $("#loading").toggle();
            });
            break;
        case "r_reservas_mensuales":
            $('#tbl_reservas_mensuales tbody').load("ajax/reporte_reservas_mensuales.php?page=" + page, {}, function () {
                $("#loading").toggle();
            });
            break;
        case "r_reservas_anuales":
            $('#tbl_reservas_anueales tbody').load("ajax/reporte_reservas_anuales.php?page=" + page, {}, function () {
                $("#loading").toggle();
            });
            break;
        case "r_productos":
            $('#tbl_productos tbody').load("ajax/reporte_productos_vendidos.php?page=" + page, {}, function () {
                $("#loading").toggle();
            });
            break;
        case "r_productos_diarios":
            $('#tbl_productos_diarias tbody').load("ajax/reporte_productos_vendidos_diarios.php?page=" + page, {}, function () {
                $("#loading").toggle();
            });
            break;
        case "r_productos_mensuales":
            $('#tbl_productos_mensuales tbody').load("ajax/reporte_productos_vendidos_mensuales.php?page=" + page, {}, function () {
                $("#loading").toggle();
            });
            break;
        case "r_productos_anuales":
            $('#tbl_productos_anuales tbody').load("ajax/reporte_productos_vendidos_anuales.php?page=" + page, {}, function () {
                $("#loading").toggle();
            });
            break;
        case "r_deudores":
            $('#tbl_deudores tbody').load("ajax/reporte_deudores.php?page=" + page, {}, function () {
                $("#loading").toggle();
            });
            break;
        case "r_facturacion":
            $('#tbl_facturacion tbody').load("ajax/reporte_facturacion.php?page=" + page, {}, function () {
                $("#loading").toggle();
            });
            break;
        case "r_facturacion_diarios":
            $('#tbl_facturacion_diarias tbody').load("ajax/reporte_facturacion_diaria.php?page=" + page, {}, function () {
                $("#loading").toggle();
            });
            break;
        case "r_facturacion_mensuales":
            $('#r_facturacion_mensuales tbody').load("ajax/reporte_facturacion_mensual.php?page=" + page, {}, function () {
                $("#loading").toggle();
            });
            break;
        case "r_facturacion_anuales":
            $('#tbl_facturacion_anuales tbody').load("ajax/reporte_facturacion_anual.php?page=" + page, {}, function () {
                $("#loading").toggle();
            });
            break;
    }
}
