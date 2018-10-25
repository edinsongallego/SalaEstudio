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
$active_perfil = "active";
$title = "Menu Banda | Sala Estudio";
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <?php include("head.php"); ?>
    </head>
    <body>
        <?php
        include("modal/cambiar_password.php");
        ?> 
        <?php
        if ($_SESSION['CS_TIPO_USUARIO_ID'] == 1) {
            include("navbar.php");
        } else if ($_SESSION['CS_TIPO_USUARIO_ID'] == 3) {
            include("navbar_banda.php");
        } else if ($_SESSION['CS_TIPO_USUARIO_ID'] == 4) {
            include("navbar_docente.php");
        }
        ?>

        <div class="container container-fluid">
        <div class="row">
            
                <div class="offset-lg-4 col-lg-4 col-sm-6 col-12"></div>  
                <div class="offset-lg-4 col-lg-4 col-sm-6 col-12 main-section text-center">
                    <div class="row">
                        <div class="col-lg-12 col-sm-12 col-12 profile-header"></div>
                    </div>
                    <div class="row user-detail">
                        <div class="col-lg-12 col-sm-12 col-12">

                            <img src="img/logo.png" style="background-color: black;" class="rounded-circle img-thumbnail">


<?php
$resultado = mysqli_query($con, "select * from us_usuario where NM_DOCUMENTO_ID='" . $_SESSION['NM_DOCUMENTO_ID'] . "'");
if (!$resultado) {
    echo 'No se pudo ejecutar la consulta: ' . mysqli_error();
    exit;
}
$fila = mysqli_fetch_row($resultado);
?>

                            <p> Nombres: <?php echo $fila[2]; ?></p>
                            <p> Apellidos: <?php echo $fila[3]; ?></p>
                            <p> Telefono: <?php echo $fila[4]; ?></p>
                            <p> Celular: <?php echo $fila[5]; ?></p>
                            <p><i class="fa fa-map-marker" aria-hidden="true"></i> Correo: <?php echo $fila[6]; ?></p>



                            <hr>
                        </div>
                    </div>
                    <div class="row user-social-detail">
                        <div class="col-lg-12 col-sm-12 col-12">
                            <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                            <a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
                            <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                        </div>
                    </div>
                </div>
                
                <div class="offset-lg-4 col-lg-4 col-sm-6 col-12"></div> 
          
        </div>
        </div>
        <hr>
<?php
include("footer.php");
?>
        <script type="text/javascript" src="js/usuarios.js"></script>





    </body>
</html>
<script>
    $("#guardar_usuario").submit(function (event) {
        $('#guardar_datos').attr("disabled", true);

        var parametros = $(this).serialize();
        $.ajax({
            type: "POST",
            url: "ajax/nuevo_usuario.php",
            data: parametros,
            beforeSend: function (objeto) {
                $("#resultados_ajax").html("Mensaje: Cargando...");
            },
            success: function (datos) {
                $("#resultados_ajax").html(datos);
                $('#guardar_datos').attr("disabled", false);
                load(1);
            }
        });
        event.preventDefault();
    })

    $("#editar_usuario").submit(function (event) {
        $('#actualizar_datos2').attr("disabled", true);

        var parametros = $(this).serialize();
        $.ajax({
            type: "POST",
            url: "ajax/editar_usuario.php",
            data: parametros,
            beforeSend: function (objeto) {
                $("#resultados_ajax2").html("Mensaje: Cargando...");
            },
            success: function (datos) {
                $("#resultados_ajax2").html(datos);
                $('#actualizar_datos2').attr("disabled", false);
                load(1);
            }
        });
        event.preventDefault();
    })

    $("#editar_password").submit(function (event) {
        $('#actualizar_datos3').attr("disabled", true);

        var parametros = $(this).serialize();
        $.ajax({
            type: "POST",
            url: "ajax/editar_password.php",
            data: parametros,
            beforeSend: function (objeto) {
                $("#resultados_ajax3").html("Mensaje: Cargando...");
            },
            success: function (datos) {
                $("#resultados_ajax3").html(datos);
                $('#actualizar_datos3').attr("disabled", false);
                load(1);
                $("#mensaje_restaurar_contrasena").hide();
                $("#opt_menu_cambiar_clave").hide();
            }
        });
        event.preventDefault();
    })
    function get_user_id(id) {
        $("#user_id_mod").val(id);
    }

    function obtener_datos(id) {
        var nombres = $("#nombres" + id).val();
        var apellidos = $("#apellidos" + id).val();
        var usuario = $("#usuario" + id).val();
        var email = $("#email" + id).val();

        $("#mod_id").val(id);
        $("#firstname2").val(nombres);
        $("#lastname2").val(apellidos);
        $("#user_name2").val(usuario);
        $("#user_email2").val(email);

    }
</script>