<?php
include_once "classes/Factura.php";
include_once "classes/Login.php";

$scriptID = uniqid();
//if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
if (!Login::inicioSession()) {
    header("location: login.php");
    exit;
}

/* Connect To Database */
require_once ("config/db.php"); //Contiene las variables de configuracion para conectar a la base de datos
require_once ("config/conexion.php"); //Contiene funcion que conecta a la base de datos
$active_facturas = "";
$active_productos = "";
$active_clientes = "";
$active_usuarios = "";
$active_ventas = "";
$active_reporte = "active";
$title = "Reportes | Sala Estudio";
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <?php include("head.php"); ?>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
        <style type="text/css">
            .result-content{
                height: 28px;
                padding: 4px;
                padding-left: 12px;	
            }
            .panel-primary>.panel-heading {
                background-color: #040404bf;
                border-color: #040404bf;
            }
            #table_productos tbody tr td{
                text-align: center;
            }
            #table_productos thead tr th{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <?php
        include("navbar.php");
        ?>
        <div class="container container-fluid">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#r_inventario">Inventarios</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown">Reservas<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a data-toggle="tab" href="#r_reservas">Todas</a></li>
                        <li><a data-toggle="tab" href="#r_reservas_diarias">Diario</a></li>
                        <li><a data-toggle="tab" href="#r_reservas_mensuales">Mensual</a></li>
                        <li><a data-toggle="tab" href="#r_reservas_anuales">Anual</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown">Venta de productos<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a data-toggle="tab" href="#r_productos">Todos</a></li>
                        <li><a data-toggle="tab" href="#r_productos_diarios">Diario</a></li>
                        <li><a data-toggle="tab" href="#r_productos_mensuales">Mensual</a></li>
                        <li><a data-toggle="tab" href="#r_productos_anuales">Anual</a></li>
                    </ul>
                </li>
                <li><a data-toggle="tab" href="#r_deudores">Deudores</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown">Facturación<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a data-toggle="tab" href="#r_facturacion">Todos</a></li>
                        <li><a data-toggle="tab" href="#r_facturacion_diarios">Diario</a></li>
                        <li><a data-toggle="tab" href="#r_facturacion_mensuales">Mensual</a></li>
                        <li><a data-toggle="tab" href="#r_facturacion_anuales">Anual</a></li>
                    </ul>
                </li>
                <li style="float: right;" class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Exportar
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#" id="exportar_excel">Excel</a></li>
                    </ul>
                </li>
            </ul>

            <div class="tab-content">
                <div id="r_inventario" class="tab-pane fade in active">
                    <div style="min-height: 533px;padding: 30px">
                        <form class="form-horizontal" role="form" id="busqueda" autocomplete="off">
                            <div class="form-group row">
                                <div class="col-md-10">
                                    <input type="text" class="form-control" id="q" name="q" placeholder="Código o cliente">
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-default" onclick="load(1);">
                                        <span class="glyphicon glyphicon-search"></span> Buscar</button>
                                    <span id="loader"></span>
                                </div>
                            </div>
                        </form>
                        <div class="table-responsive">
                            <table id="tbl_inventario" class="table table-bordered">
                                <thead>
                                    <tr class="">
                                        <th>#</th>
                                        <th>Código</th>
                                        <th>Producto</th>
                                        <th>Costo unidad</th>
                                        <th>Proveedor</th>
                                        <th>Stock Actual</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    include_once './ajax/reporte_inventario.php';
                                    ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="r_reservas" class="tab-pane fade">
                    <div style="min-height: 533px;padding: 30px">
                        <form class="form-horizontal" role="form" id="busqueda" autocomplete="off">
                            <div class="form-group row">
                                <div class="col-md-10">
                                    <input type="text" class="form-control" id="q" name="q" placeholder="Sala, cliente, fecha o descripción">
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-default" onclick="load(1);">
                                        <span class="glyphicon glyphicon-search"></span> Buscar</button>
                                    <span id="loader"></span>
                                </div>
                            </div>
                        </form>
                        <div class="table-responsive">
                            <table id="tbl_reservas" class="table table-bordered">
                                <thead>
                                    <tr class="">
                                        <th>Cliente</th>
                                        <th>Sala</th>
                                        <th>Fecha</th>
                                        <th>Hora inicial</th>
                                        <th>Hora final</th>
                                        <th>Descripción</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="r_reservas_diarias" class="tab-pane fade">
                    <div style="min-height: 533px;padding: 30px">
                        <div class="table-responsive">
                        <form class="form-horizontal" role="form" id="busqueda" autocomplete="off">
                            <div class="form-group row">
                                <div class="col-md-10">
                                    <input type="text" class="form-control" id="q" name="q" placeholder="Fecha o cantidad">
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-default" onclick="load(1);">
                                        <span class="glyphicon glyphicon-search"></span> Buscar</button>
                                    <span id="loader"></span>
                                </div>
                            </div>
                        </form>
                        <table id="tbl_reservas_diarias" class="table table-bordered">
                                <thead>
                                    <tr class="">
                                        <th>Fecha</th>
                                        <th>Cantidad</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="r_reservas_mensuales" class="tab-pane fade">
                    <div style="min-height: 533px;padding: 30px">
                        <form class="form-horizontal" role="form" id="busqueda" autocomplete="off">
                            <div class="form-group row">
                                <div class="col-md-10">
                                    <input type="text" class="form-control" id="q" name="q" placeholder="Fecha o cantidad">
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-default" onclick="load(1);">
                                        <span class="glyphicon glyphicon-search"></span> Buscar</button>
                                    <span id="loader"></span>
                                </div>
                            </div>
                        </form>
                        <div class="table-responsive">
                            <table id="tbl_reservas_mensuales" class="table table-bordered">
                                <thead>
                                    <tr class="">
                                        <th>Fecha</th>
                                        <th>Cantidad</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="r_reservas_anuales" class="tab-pane fade">
                    <div style="min-height: 533px;padding: 30px">
                        <form class="form-horizontal" role="form" id="busqueda" autocomplete="off">
                            <div class="form-group row">
                                <div class="col-md-10">
                                    <input type="text" class="form-control" id="q" name="q" placeholder="Fecha o cantidad">
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-default" onclick="load(1);">
                                        <span class="glyphicon glyphicon-search"></span> Buscar</button>
                                    <span id="loader"></span>
                                </div>
                            </div>
                        </form>
                        <div class="table-responsive">
                            <table id="tbl_reservas_anueales" class="table table-bordered">
                                <thead>
                                    <tr class="">
                                        <th>Fecha</th>
                                        <th>Cantidad</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div id="r_productos" class="tab-pane fade">
                    <div style="min-height: 533px;padding: 30px">
                        <form class="form-horizontal" role="form" id="busqueda" autocomplete="off">
                            <div class="form-group row">
                                <div class="col-md-10">
                                    <input type="text" class="form-control" id="q" name="q" placeholder="Código de producto, Nombre del producto, Factura o Fecha">
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-default" onclick="load(1);">
                                        <span class="glyphicon glyphicon-search"></span> Buscar</button>
                                    <span id="loader"></span>
                                </div>
                            </div>
                        </form>
                        <div class="table-responsive">
                            <table id="tbl_productos" class="table table-bordered">
                                <thead>
                                    <tr class="">
                                        <th>Producto</th>
                                        <th>Factura</th>
                                        <th>Fecha</th>
                                        <th>Cantidad</th>
                                        <th>Precio unitario</th>
                                        <th>Precio total</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="r_productos_diarios" class="tab-pane fade">
                    <div style="min-height: 533px;padding: 30px">
                        <form class="form-horizontal" role="form" id="busqueda" autocomplete="off">
                            <div class="form-group row">
                                <div class="col-md-10">
                                    <input type="text" class="form-control" id="q" name="q" placeholder="Código de producto, Nombre del producto o Fecha">
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-default" onclick="load(1);">
                                        <span class="glyphicon glyphicon-search"></span> Buscar</button>
                                    <span id="loader"></span>
                                </div>
                            </div>
                        </form>
                        <div class="table-responsive">
                            <table id="tbl_productos_diarias" class="table table-bordered">
                                <thead>
                                    <tr class="">
                                        <th>Fecha</th>
                                        <th>Producto</th>
                                        <th>Cantidad</th>
                                        <th>Precio total</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="r_productos_mensuales" class="tab-pane ">
                    <div style="min-height: 533px;padding: 30px">
                        <form class="form-horizontal" role="form" id="busqueda" autocomplete="off">
                            <div class="form-group row">
                                <div class="col-md-10">
                                    <input type="text" class="form-control" id="q" name="q" placeholder="Código de producto, Nombre del producto o Fecha">
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-default" onclick="load(1);">
                                        <span class="glyphicon glyphicon-search"></span> Buscar</button>
                                    <span id="loader"></span>
                                </div>
                            </div>
                        </form>
                        <div class="table-responsive">
                            <table id="tbl_productos_mensuales" class="table table-bordered">
                                <thead>
                                    <tr class="">
                                        <th>Fecha</th>
                                        <th>Producto</th>
                                        <th>Cantidad</th>
                                        <th>Precio total</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="r_productos_anuales" class="tab-pane ">
                    <div style="min-height: 533px;padding: 30px">
                        <form class="form-horizontal" role="form" id="busqueda" autocomplete="off">
                            <div class="form-group row">
                                <div class="col-md-10">
                                    <input type="text" class="form-control" id="q" name="q" placeholder="Código de producto, Nombre del producto o Fecha">
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-default" onclick="load(1);">
                                        <span class="glyphicon glyphicon-search"></span> Buscar</button>
                                    <span id="loader"></span>
                                </div>
                            </div>
                        </form>
                        <div class="table-responsive">
                            <table id="tbl_productos_anuales" class="table table-bordered">
                                <thead>
                                    <tr class="">
                                        <th>Fecha</th>
                                        <th>Producto</th>
                                        <th>Precio total</th>
                                        <th>Cantidad</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="r_deudores" class="tab-pane fade">
                    <div style="min-height: 533px;padding: 30px">
                        <form class="form-horizontal" role="form" id="busqueda" autocomplete="off">
                            <div class="form-group row">
                                <div class="col-md-10">
                                    <input type="text" class="form-control" id="q" name="q" placeholder="Factura, Fecha, Cliente">
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-default" onclick="load(1);">
                                        <span class="glyphicon glyphicon-search"></span> Buscar</button>
                                    <span id="loader"></span>
                                </div>
                            </div>
                        </form>
                        <div class="table-responsive">
                            <table id="tbl_deudores" class="table table-bordered">
                                <thead>
                                    <tr class="">
                                        <th>Factura</th>
                                        <th>Notas</th>
                                        <th>Fecha</th>
                                        <th>Cliente</th>
                                        <th>Iva</th>
                                        <th>Descuento</th>
                                        <th>Sub total</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div id="r_facturacion" class="tab-pane fade">
                    <div style="min-height: 533px;padding: 30px">
                        <form class="form-horizontal" role="form" id="busqueda" autocomplete="off">
                            <div class="form-group row">
                                <div class="col-md-10">
                                    <input type="text" class="form-control" id="q" name="q" placeholder="Factura, Fecha, Cliente o las notas">
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-default" onclick="load(1);">
                                        <span class="glyphicon glyphicon-search"></span> Buscar</button>
                                    <span id="loader"></span>
                                </div>
                            </div>
                        </form>
                        <div class="table-responsive">
                            <table id="tbl_facturacion" class="table table-bordered">
                                <thead>
                                    <tr class="">
                                        <th>Factura</th>
                                        <th>Notas</th>
                                        <th>Fecha</th>
                                        <th>Cliente</th>
                                        <th>Iva</th>
                                        <th>Descuento</th>
                                        <th>Sub total</th>
                                        <th>Total</th>
                                        <th>Descargar</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="r_facturacion_diarios" class="tab-pane fade">
                    <div style="min-height: 533px;padding: 30px">
                        <form class="form-horizontal" role="form" id="busqueda" autocomplete="off">
                            <div class="form-group row">
                                <div class="col-md-10">
                                    <input type="text" class="form-control" id="q" name="q" placeholder="Fecha">
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-default" onclick="load(1);">
                                        <span class="glyphicon glyphicon-search"></span> Buscar</button>
                                    <span id="loader"></span>
                                </div>
                            </div>
                        </form>
                        <div class="table-responsive">
                            <table id="tbl_facturacion_diarias" class="table table-bordered">
                                <thead>
                                    <tr class="">
                                        <th>Fecha</th>
                                        <th>Cantidad</th>
                                        <th>Iva</th>
                                        <th>Descuento</th>
                                        <th>Sub total</th>
                                        <th>Precio total</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="r_facturacion_mensuales" class="tab-pane ">
                    <div style="min-height: 533px;padding: 30px">
                        <form class="form-horizontal" role="form" id="busqueda" autocomplete="off">
                            <div class="form-group row">
                                <div class="col-md-10">
                                    <input type="text" class="form-control" id="q" name="q" placeholder="Fecha">
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-default" onclick="load(1);">
                                        <span class="glyphicon glyphicon-search"></span> Buscar</button>
                                    <span id="loader"></span>
                                </div>
                            </div>
                        </form>
                        <div class="table-responsive">
                            <table id="tbl_facturacion_mensuales" class="table table-bordered">
                                <thead>
                                    <tr class="">
                                        <th>Fecha</th>
                                        <th>Cantidad</th>
                                        <th>Iva</th>
                                        <th>Descuento</th>
                                        <th>Sub total</th>
                                        <th>Precio total</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="r_facturacion_anuales" class="tab-pane ">
                    <div style="min-height: 533px;padding: 30px">
                        <form class="form-horizontal" role="form" id="busqueda" autocomplete="off">
                            <div class="form-group row">
                                <div class="col-md-10">
                                    <input type="text" class="form-control" id="q" name="q" placeholder="Fecha">
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-default" onclick="load(1);">
                                        <span class="glyphicon glyphicon-search"></span> Buscar</button>
                                    <span id="loader"></span>
                                </div>
                            </div>
                        </form>
                        <div class="table-responsive">
                            <table id="tbl_facturacion_anuales" class="table table-bordered">
                                <thead>
                                    <tr class="">
                                        <th>Fecha</th>
                                        <th>Cantidad</th>
                                        <th>Iva</th>
                                        <th>Descuento</th>
                                        <th>Sub total</th>
                                        <th>Precio total</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>                
            </div>
        </div>        
        <?php
        include("footer.php");
        ?>
        <script type="text/javascript" src="js/VentanaCentrada.js"></script>
        <script type="text/javascript" src="js/facturas.js"></script>
        <script type="text/javascript" src="js/reportes.js?v=<?php echo uniqid(); ?>"></script>
    </body> 
</html>