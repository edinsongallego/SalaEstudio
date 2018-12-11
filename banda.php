<?php
session_start();
if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
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
$active_banda = "active";
$title = "Banda | Sala Estudio";
$scriptID = uniqid();
?>
<!DOCTYPE html>
<html lang="es">
    <head>
        <?php include("head.php"); ?>
         <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
    </head>
    <body>
        <?php
        if($_SESSION["CS_TIPO_USUARIO_ID"] == 1){ 
            include("navbar.php");
        }else{
            include("navbar_banda.php");
        }
        ?>
        <div class="container">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <?php if($_SESSION["CS_TIPO_USUARIO_ID"] == 1){ ?>
                    <div class="btn-group pull-right">
                        <button type='button' class="btn btn-info" id="btn_nueva_banda"><span class="glyphicon glyphicon-plus" ></span> Nuevo Banda</button>
                    </div>
                    <?php } ?>
                    <h4><i class='glyphicon glyphicon-search'></i> Buscar Banda</h4>
                </div>
                <div class="panel-body"style="height:700px;">
                    <?php
                    include("modal/registro_banda2.php");
                    include("modal/editar_banda.php");
                    ?>
                    <form class="form-horizontal" role="form" id="datos_cotizacion"autocomplete="off">



                        <div class="form-group row">
                            <label for="q" class="col-md-2 control-label">Banda</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="q" placeholder="Buscar por Nombre, Código y Género" onkeyup='load(1);'>
                            </div>
                            <div class="col-md-3">
                                <button type="button" class="btn btn-default" onclick='load(1);'>
                                    <span class="glyphicon glyphicon-search" ></span> Buscar</button>


                                <span id="loader"></span>
                            </div>


                        </div>



                    </form>
                    <div id="resultados"></div><!-- Carga los datos ajax -->
                    <div class='outer_div'></div><!-- Carga los datos ajax -->

                </div>
            </div>

        </div>
        <hr>
        <?php
        include("footer.php");
        ?>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
        <script type="text/javascript" src="js/banda.js?c=<?php echo $scriptID; ?>"></script>
    </body>
</html>