<?php
include_once "classes/Inventario.php";
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
$active_inventario = "";
$sopoerte = "active";
$title = "Soporte | Sala Estudio";
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
           
            <iframe src="ManualDeUsuario.pdf#zoom=100&view=fitH" frameborder="0" width="100%" height="550" marginheight="0" marginwidth="0" id="pdf"  
></iframe>
        </div>
<?php
        include("footer.php");
        ?>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
        <script src="js/inventario.js?c=<?php echo $scriptID; ?>"></script>