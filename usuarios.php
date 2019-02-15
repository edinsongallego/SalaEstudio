<?php
/**
 * Short Desc
 *
 * Long Desc
 *
 * @package          SalaEstudio
 * @category         aja
 * @author           oscar<oscar@gmail.com>
 */
include_once "classes/Login.php";

//if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
if (!Login::inicioSession()) {
    header("location: login.php");
    exit;
}

/* Connect To Database */
require_once ("config/db.php"); //Conti ene las variables de configuracion para conectar a la base de datos
require_once ("config/conexion.php"); //Contiene funcion que conecta a la base de datos
$active_facturas = "";
$active_productos = "";
$active_clientes = "";
$active_reservas = "";
$active_usuarios = "active";
$title = "Usuarios | Sala Estudio";
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <?php include("head.php"); ?>
    </head>
    <body>
        <?php
        include("navbar.php");
        ?>
        <div class="container">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <div class="btn-group pull-right">
                        <button type='button' class="btn btn-info" id="btn_nuevo_usuario"><span class="glyphicon glyphicon-plus" ></span> Nuevo Usuario</button>
                    </div>
                    <h4><i class='glyphicon glyphicon-search'></i> Buscar Usuarios</h4>
                </div>
                <div class="panel-body" style="min-height:400px;height: auto;">
                    <?php
                    include("modal/registro_usuarios.php");
                    include("modal/editar_usuarios.php");
                    ?>
                    <form class="form-horizontal" role="form" id="datos_cotizacion"autocomplete="off">



                        <div class="form-group row">
                            <label for="q" class="col-md-2 control-label">Usuario</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="q" placeholder="Buscar por Nombre, Apellidos e Identificación" onkeyup='load(1);'>
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
        <script type="text/javascript" src="js/usuarios.js?v=1"></script>





    </body>
</html>

<script type="text/javascript">
                                    $("#btn_nuevo_usuario").click(function (e) {
                                        e.preventDefault();
                                        $("#myModal").modal('toggle');
                                        limpiar_formulario_nuevo();
                                    })

                                    $("#guardar_usuario").submit(function (event) {
                                        event.preventDefault();
                                        if ($('#guardar_usuario').valid()) {
                                            if (validateMail(document.getElementById("DS_CORREO"))) {

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
                                                        if (datos.search("Error!") <= -1) {
                                                            load(1);
                                                            setTimeout(function () {
                                                                $("#myModal").modal('toggle');
                                                                limpiar_formulario_nuevo();
                                                            }, 800);
                                                        }
                                                    }
                                                });
                                            } else {
                                                $("#DS_CORREO").focus();
                                                alertify.error("Verifique la estructura del correo.")
                                            }
                                        }

                                    })

                                    $("#editar_usuario").submit(function (event) {
                                        $('#actualizar_datos2').attr("disabled", true);

                                        var parametros = $(this).serialize();
                                        if ($("#editar_usuario").valid()) {
                                            $("#loading").toggle();
                                            $.ajax({
                                                type: "POST",
                                                url: "ajax/editar_usuario.php",
                                                data: parametros,
                                                beforeSend: function (objeto) {
                                                    $("#resultados_ajax2").html("Mensaje: Cargando...");
                                                },
                                                success: function (datos) {
                                                    $("#loading").toggle();
                                                    $("#resultados_ajax2").html(datos);
                                                    $('#actualizar_datos2').attr("disabled", false);
                                                    if (datos.search("Error!") <= -1) {
                                                        load(1);
                                                        setTimeout(function () {
                                                            $("#myModal2").modal("toggle");
                                                            limpiar_formulario_edt();
                                                        }, 1500);
                                                    }
                                                }
                                            });
                                        }
                                        event.preventDefault();
                                    })

                                    function limpiar_formulario_edt() {
                                        $("#editar_usuario")[0].reset();
                                        $("#resultados_ajax2").html("");
                                    }

                                    function limpiar_formulario_nuevo() {
                                        $("#resultados_ajax").html("");
                                        $("#guardar_usuario")[0].reset();
                                    }

                                    function obtener_datos(id) {
                                        limpiar_formulario_edt();
                                        var nombres = $("#nombres" + id).val();
                                        var apellidos = $("#apellidos" + id).val();
                                        var usuario = $("#usuario" + id).val();
                                        var email = $("#email" + id).val();
                                        var estado = $("#estado" + id).val();
                                        var telefono = $("#telefono" + id).val();
                                        var celular = $("#celular" + id).val();
                                        var direccion = $("#direccion" + id).val();

                                        $("#mod_id").val(id);
                                        $("#firstname2").val(nombres);
                                        $("#lastname2").val(apellidos);
                                        $("#user_email2").val(email);
                                        $("#tel").val(telefono);
                                        $("#cel").val(celular);
                                        $("#DS_DIRECCION_EDIT").val(direccion);


                                        if (estado == 1) {
                                            $('#estado').empty();
                                            $('#estado').append('<option value="">Seleccione</option><option value="1" selected>Activo</option><option value="2">Inactivo</option>');
                                        } else if (estado == 2) {
                                            $('#estado').empty();
                                            $('#estado').append('<option value="">Seleccione</option><option value="1">Activo</option><option value="2" selected>Inactivo</option>');
                                        }



                                    }


                                    $(function ()
                                    {
                                        $('#guardar_usuario').validate({
                                            ignoreTitle: true,
                                        });

                                        $("#editar_usuario").validate({
                                            ignoreTitle: true,
                                        });

                                        $("#editar_password").validate({
                                            ignoreTitle: true,
                                            rules: {
                                                user_password_new3: "required",
                                                user_password_repeat3: {
                                                    equalTo: "#user_password_new3"
                                                }
                                            }
                                        });

                                          $.validator.addMethod("validarInactivacionUsuarioEdt", function (value, element) {
                                             var isSuccess = false;
                                             if(value == 2){

                                             $.ajax({ url: "ajax/buscar_usuarios.php", 
                                                data: {'action':'validarFacturasAsociadaUsuario','ID_USUARIO':$("#mod_id").val()}, 
                                                async: false, 
                                                success: 
                                                    function(msg) { isSuccess = msg === "true" ? true : false }
                                              });
                                          }else{
                                            isSuccess = true;
                                          }
                                        return isSuccess;
                                        }, "Lo sentimos, pero este usuario tiene facturas pendientes por pagar. Por lo que no puede ser inactivado.");

                                          $.validator.addMethod("validarInactivacionReservaUsuarioEdt", function (value, element) {
                                             var isSuccess = false;
                                             if(value == 2){

                                             $.ajax({ url: "ajax/buscar_usuarios.php", 
                                                data: {'action':'validarReservasAsociadaUsuario','ID_USUARIO':$("#mod_id").val()}, 
                                                async: false, 
                                                success: 
                                                    function(msg) { isSuccess = msg === "true" ? true : false }
                                              });
                                          }else{
                                            isSuccess = true;
                                          }
                                        return isSuccess;
                                        }, "Lo sentimos, pero este usuario tiene reservas activas y vigentes a la fecha. Por lo que no puede ser inactivado.");

                                          $.validator.addMethod("validarIntegranteBandaUsuario", function (value, element) {
                                             var isSuccess = false;
                                             if(value == 2){

                                             $.ajax({ url: "ajax/buscar_usuarios.php", 
                                                data: {'action':'validarIntegranteBandaUsuario','ID_USUARIO':$("#mod_id").val()}, 
                                                async: false, 
                                                success: 
                                                    function(msg) { isSuccess = msg === "true" ? true : false }
                                              });
                                          }else{
                                            isSuccess = true;
                                          }
                                        return isSuccess;
                                        }, "Lo sentimos, pero este usuario esta asociado a banda(s) activa(s). Por lo que no puede ser inactivado.");
                                    });
</script>
