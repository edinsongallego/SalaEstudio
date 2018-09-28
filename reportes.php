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
                <li><a class="dropdown-toggle" data-toggle="dropdown">Productos</a></li>
                <li><a data-toggle="tab" href="#r_ventas">Deudores</a></li>
                <li><a data-toggle="tab" href="#r_facturacion">Facturación</a></li>
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
                
                <div id="r_reservas_mensuales" class="tab-pane fade">
                    <h3>Menu 1</h3>
                    <p>Some content in menu 1.</p>
                </div>
                <div id="r_reservas_anualies" class="tab-pane fade">
                    <h3>Menu 1</h3>
                    <p>Some content in menu 1.</p>
                </div>
                <div id="r_productos" class="tab-pane fade">
                    <h3>Menu 2</h3>
                    <p>Some content in menu 2.</p>
                </div>
                <div id="r_ventas" class="tab-pane fade">
                    <h3>Menu 2</h3>
                    <p>Some content in menu 2.</p>
                </div>
            </div>
        </div>        
        <?php
        include("footer.php");
        ?>
        <script type="text/javascript" src="js/reportes.js?v=<?php echo uniqid(); ?>"></script>
    </body> 
</html>