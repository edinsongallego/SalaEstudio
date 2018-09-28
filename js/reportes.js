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
        }
    });

    $('a[href="#r_reservas"]').click(function () {
        $('#tbl_reservas tbody').html('<tr><td colspan=6 style="text-align: center;"><img style="margin-left: 48%;" src="./img/ajax-loader.gif"> Cargando...</td><tr>').load("ajax/reporte_reservas.php");
    });
    
    $('a[href="#r_reservas_diarias"]').click(function () {
        $('#tbl_reservas_diarias tbody').html('<tr><td colspan=6 style="text-align: center;"><img style="margin-left: 48%;" src="./img/ajax-loader.gif"> Cargando...</td><tr>').load("ajax/reporte_reservas_diarias.php");
    });
    
    $('a[href="#r_reservas_mensuales"]').click(function () {
        $('#tbl_reservas_mensuales tbody').html('<tr><td colspan=6 style="text-align: center;"><img style="margin-left: 48%;" src="./img/ajax-loader.gif"> Cargando...</td><tr>').load("ajax/reporte_reservas_mensuales.php");
    });
    
    $('a[href="#r_reservas_anuales"]').click(function () {
        $('#tbl_reservas_anueales tbody').html('<tr><td colspan=6 style="text-align: center;"><img style="margin-left: 48%;" src="./img/ajax-loader.gif"> Cargando...</td><tr>').load("ajax/reporte_reservas_anuales.php");
    });
});



function load(page) {
    var q = $("#q").val();
    $("#loading").toggle();

    switch ($(".tab-content > div.active").attr("id")) {
        case "r_inventario":
            $('#tbl_inventario tbody').load("ajax/reporte_inventario.php?page=" + page,{},function(){ $("#loading").toggle(); });
            break;
        case "r_reservas":
            $('#tbl_reservas tbody').load("ajax/reporte_reservas.php?page=" + page,{},function(){ $("#loading").toggle(); });
            break;
        case "r_reservas_diarias":
            $('#tbl_reservas_diarias tbody').load("ajax/reporte_reservas.php?page=" + page,{},function(){ $("#loading").toggle(); });
            break;
        case "r_reservas_mensuales":
            $('#tbl_reservas_mensuales tbody').load("ajax/reporte_reservas_mensuales.php?page=" + page,{},function(){ $("#loading").toggle(); });
            break;
        case "r_reservas_anuales":
            $('#tbl_reservas_anueales tbody').load("ajax/reporte_reservas_anuales.php?page=" + page,{},function(){ $("#loading").toggle(); });
            break;
    }
}
