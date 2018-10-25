<?php

if (isset($_REQUEST["reporte"])) {
    include './config/db.php';
    $rp = "reporte";
    switch ($_REQUEST["reporte"]) {
        case "inventario":
            $rp = "Inventario";
            $columnas = array("#", "Código", "Producto", "Costo unidad", "Proveedor", "Stock Actual");
            include './ajax/cabecera_reporte.php';
            include './ajax/reporte_inventario.php';
            break;
        case "reservas":
            $columnas = array("Cliente", "Sala", "Fecha", "Hora inicial", "Hora final", "Descripción");
            include './ajax/cabecera_reporte.php';
            include './ajax/reporte_reservas.php';
            break;
        case "reservas_diarias";
            $columnas = array("Fecha", "Cantidad");
            include './ajax/cabecera_reporte.php';
            include './ajax/reporte_reservas_diarias.php';
            break;
        case "reservas_mensuales";
            $columnas = array("Fecha", "Cantidad");
            include './ajax/cabecera_reporte.php';
            include './ajax/reporte_reservas_mensuales.php';
            break;
        case "reservas_anuales";
            $columnas = array("Fecha", "Cantidad");
            include './ajax/cabecera_reporte.php';
            include './ajax/reporte_reservas_anuales.php';
            break;
        case "productos";
            $columnas = array("Producto", "Factura", "Fecha", "Cantidad", "Precio unitario", "Precio total");
            include './ajax/cabecera_reporte.php';
            include './ajax/reporte_productos_vendidos.php';
            break;
        case "productos_diarios";
            $columnas = array("Fecha", "Producto", "Precio total", "Cantidad");
            include './ajax/cabecera_reporte.php';
            include './ajax/reporte_productos_vendidos_diarios.php';
            break;
        case "productos_mensuales";
            $columnas = array("Fecha", "Producto", "Precio total", "Cantidad");
            include './ajax/cabecera_reporte.php';
            include './ajax/reporte_productos_vendidos_mensuales.php';
            break;
        case "productos_mensuales";
            $columnas = array("Fecha", "Producto", "Precio total", "Cantidad");
            include './ajax/cabecera_reporte.php';
            include './ajax/reporte_productos_vendidos_mensuales.php';
            break;
        case "productos_anuales";
            $columnas = array("Fecha", "Producto", "Precio total", "Cantidad");
            include './ajax/cabecera_reporte.php';
            include './ajax/reporte_productos_vendidos_anuales.php';
            break;
        case "deudores";
            $columnas = array("Factura", "Notas", "Fecha", "Cliente", "Iva", "Descuento", "Sub total", "Total");
            include './ajax/cabecera_reporte.php';
            include './ajax/reporte_deudores.php';
            break;
        case "facturacion";
            $columnas = array("Factura", "Notas", "Fecha", "Cliente", "Iva", "Descuento", "Sub total", "Total");
            include './ajax/cabecera_reporte.php';
            include './ajax/reporte_facturacion.php';
            break;
        case "facturacion_diaria";
            $columnas = array("Fecha", "Cantidad", "Iva", "Descuento", "Sub total", "Precio total");
            include './ajax/cabecera_reporte.php';
            include './ajax/reporte_facturacion_diaria.php';
            break;
        case "facturacion_mensuales";
            $columnas = array("Fecha", "Cantidad", "Iva", "Descuento", "Sub total", "Precio total");
            include './ajax/cabecera_reporte.php';
            include './ajax/reporte_facturacion_mensual.php';
            break;
        case "facturacion_anuales";
            $columnas = array("Fecha", "Cantidad", "Iva", "Descuento", "Sub total", "Precio total");
            include './ajax/cabecera_reporte.php';
            include './ajax/reporte_facturacion_anual.php';
            break;
        default:
            die("Debe enviar parametros validos");        
        
    }


    $reportes = ob_get_clean();
    header("Content-type: application/vnd.ms-xls");
    header("Content-Disposition: attachment; filename=" . $rp . ".xls");

    /* header("Content-Type: application/download"); 
      header("Pragma: no-cache");
      header("Expires: 0"); */

    header('mso-number-format: @');

    echo $reportes;
} else {
    die("Faltan parametros!!!");
}