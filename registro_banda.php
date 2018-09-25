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
        include("modal/cambiar_password.php");
        ?>
        <div class="container">
            <div class="row">
                <div class="panel-body" style="height:600px;">

                    <div class="col-md-10">

                        <div class="user-social-detail"><h4 style="color: white;text-align: center;">Registro Banda</h4></div>
                        <br>

                        <form class="form-horizontal" method="post" id="guardar_banda" name="guardar_banda"autocomplete="off">
                            <div id="resultados_ajax_banda"></div>



                            <div class="form-group" >
                                <label for="tipo_usu" class="col-sm-3 control-label">*Tipo Identificación</label>
                                <div class="col-sm-8">

                                    <select name="CS_TIPO_DOCUMENTO_ID" id="CS_TIPO_DOCUMENTO_ID" class="form-control">
                                        <option value="">Seleccione</option>
                                        <option value="1">Cédula Ciudadanía</option>
                                        <option value="2">Tarjeta Identidad</option>
                                        <option value="4">Pasaporte</option>
                                        <option value="4">Cédula Extranjera </option>

                                    </select>

                                </div>
                            </div>


                            <div class="form-group">
                                <label for="firstname" class="col-sm-3 control-label">*Identificación</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="NM_DOCUMENTO_CONTACTO_ID" name="NM_DOCUMENTO_CONTACTO_ID" placeholder="*Identificación" title="Identificación ( sólo Números)" onkeypress="return numeros(event)" onblur="limpia()" id="miInput" class="form-control" minlength="8" maxlength="15" required >
                                </div>
                            </div>


                            <div class="form-group">
                                <label for="firstname" class="col-sm-3 control-label">*Nombres Lider</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="DS_NOMBRE_CONTACTO" name="DS_NOMBRE_CONTACTO" placeholder="*Nombre Lider"  title="Nombre Lider(sólo letras )" onkeypress="return soloLetras(event)" onblur="limpia()" id="miInput" class="form-control"  required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="firstname" class="col-sm-3 control-label">*Apellidos Lider</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="DS_APELLIDO_CONTACTO" name="DS_APELLIDO_CONTACTO" placeholder="*Apellidos Lider" title="Apellidos  Lider (sólo letras )" onkeypress="return soloLetras(event)" onblur="limpia()" id="miInput" class="form-control"  required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="user_Email" class="col-sm-3 control-label">*Email</label>
                                <div class="col-sm-8">
                                    <input type="Email" name="DS_CORREO_CONTACTO" id="DS_CORREO_CONTACTO" placeholder="*Email" value="" size='30' maxlength='100' title='direccion de correo' onKeyUp="javascript:validateMail('correo')" class="form-control" required>

                                </div>
                            </div>


                            <div class="form-group">
                                <label for="firstname" class="col-sm-3 control-label">*Nombre Banda</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="DS_NOMBRE_BANDA" name="DS_NOMBRE_BANDA" placeholder="*Nombre Banda" onblur="limpia()" class="form-control"  required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="lastname" class="col-sm-3 control-label">*Descripción</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="DS_DESCRIPCION_BANDA" name="DS_DESCRIPCION_BANDA" placeholder="*Descripción Banda" onblur="limpia()" class="form-control"  required>
                                </div>
                            </div>


                    </div>
                    <div class="form-group">
                        <div class="col-sm-8">
                            <button type="submit" class="btn btn-primary float-right" id="guardar_datos">Guardar</button>
                        </div>
                    </div>

                    </form>
                </div>

            </div>
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
