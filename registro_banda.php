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
$active_perfil = "";
$active_reg_banda = "active";
$title = "Registro Banda | Sala Estudio";
?>
<!DOCTYPE html>
<html lang="en">
    <head>

        <?php include("head.php"); ?>

    </head>
    <body>
        <?php
        include_once("navbar_banda.php");
        ?>
        <div class="container">
            <form class="form-horizontal" method="post" id="guardar_banda2" name="guardar_banda2" autocomplete="off">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Datos de la banda</h3>
                    </div>
                    <div class="panel-body">
                        <div id="resultados_ajax_banda2"></div>


                        <div class="form-group row">
                            <label for="firstname" class="col-sm-3 control-label">*Nombre Banda</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="DS_NOMBRE_BANDA" name="DS_NOMBRE_BANDA" placeholder="*Nombre Banda"  class="form-control" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="lastname" class="col-sm-3 control-label">*Género</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="DS_DESCRIPCION_BANDA" name="DS_DESCRIPCION_BANDA" placeholder="*Género Banda" class="form-control" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">*Lider banda</label>
                            <div class="col-sm-8">
                                <select name="id_lider_banda" required="required" id="id_lider" style="width:100%"></select>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">*Integrantes de la banda</label>
                            <div class="col-md-8" id="ctn_id_integrantes">
                                <select required="required" style="width:100%" name="integrantes[]" class="form-control" id="id_integrantes"></select>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer" style="text-align: center;">
                        <button id="btn_cancelar" class="btn btn-danger">Cancelar</button>
                        <button type="submit" class="btn btn-primary" id="guardar_datos_banda">Guardar</button>
                    </div>
                </div>
            </form>
        </div>
        <?php
        include("footer.php");
        ?>
        <script type="text/javascript" src="js/usuarios.js"></script>

        <script>
            $("#guardar_banda").submit(function (event) {
                $('#guardar_datos').attr("disabled", true);

                var parametros = $(this).serialize();
                $.ajax({
                    type: "POST",
                    url: "ajax/nuevo_banda.php",
                    data: parametros,
                    beforeSend: function (objeto) {
                        $("#resultados_ajax_banda").html("Mensaje: Cargando...");
                    },
                    success: function (datos) {
                        $("#resultados_ajax_banda").html(datos);
                        $('#guardar_datos').attr("disabled", false);
                        $("#guardar_banda")[0].reset();
                    }
                });
                event.preventDefault();

            })
        </script>

        <script>

            function numeros(e) {
                key = e.keyCode || e.which;
                tecla = String.fromCharCode(key).toLowerCase();
                letras = " 0123456789";
                especiales = [8, 37, 39, 46];

                tecla_especial = false
                for (var i in especiales) {
                    if (key == especiales[i]) {
                        tecla_especial = true;
                        break;
                    }
                }

                if (letras.indexOf(tecla) == -1 && !tecla_especial)
                    return false;
            }

            function soloLetras(e) {
                key = e.keyCode || e.which;
                tecla = String.fromCharCode(key).toLowerCase();
                letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
                especiales = [8, 37, 39, 46];

                tecla_especial = false
                for (var i in especiales) {
                    if (key == especiales[i]) {
                        tecla_especial = true;
                        break;
                    }
                }

                if (letras.indexOf(tecla) == -1 && !tecla_especial)
                    return false;
            }

            function limpia() {
                var val = document.getElementById("miInput").value;
                var tam = val.length;
                for (i = 0; i < tam; i++) {
                    if (!isNaN(val[i]))
                        document.getElementById("miInput").value = '';
                }
            }

            function validateMail(idMail)
            {
                //Creamos un objeto
                object = document.getElementById(idMail);
                valueForm = object.value;

                // Patron para el correo
                var patron = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/;
                if (valueForm.search(patron) == 0)
                {
                    //Mail correcto
                    object.style.color = "#000";
                    return;
                }
                //Mail incorrecto
                object.style.color = "#f00";
            }


//-->
        </script>





    </body>
</html>
