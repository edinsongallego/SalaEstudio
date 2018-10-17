<?php
if (version_compare(PHP_VERSION, '5.3.7', '<')) {
    exit("Lo sentimos, La sala estudio no se ejecuta en una versión de PHP menor que 5.3.7.");
} else if (version_compare(PHP_VERSION, '5.5.0', '<')) {

    require_once("libraries/password_compatibility_library.php");
}

// include the configs / constants for the database connection
require_once("config/db.php");
require_once("classes/Login.php");

$login = new Login();



// ... ask if we are logged in here:
if ($login->isUserLoggedIn() == true) {
    // the user is logged in. you can do whatever you want here.
    // for demonstration purposes, we simply show the "you are logged in" view.
    if ($_SESSION['CS_TIPO_USUARIO_ID'] == 1) {
        header("location: usuarios.php");
    }else{
        header("location: home_banda.php");
    }


}

?>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<style type="text/css">
    label{
        color: white;
    }
</style>
<nav class="navbar navbar-default ">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><img src="img/logo.png" width="80" height="80"></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="index.php"><i class='glyphicon glyphicon-home'></i> Inicio <span class="sr-only">(current)</span></a></li>

                <li><a href="nosotros.php"> Nosotros</a></li>

                <li><a href="servicios.php"> Servicios</a></li>

                <li><a href="contactenos.php"> Contactenos</a></li>
                <li><a target="_blank" href="https://es-la.facebook.com/Sala.Estudio/"><img src='img/facebook.png'></img></a> </li>
                <li><a target="_blank" href="http://www.thepicta.com/user/lasalaestudio/4339125963"><img src='img/instagram.png'></img></a> </li>
                <li><a target="_blank" href="https://twitter.com/lasalaestudio"><img src='img/twitter.png'></img></a> </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="login.php"><i class='glyphicon glyphicon-log-in'></i> Iniciar Sesiòn</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
        <title>Sala Estudio</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <!-- CSS  -->
        <link href="css/login.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link rel=icon href=img/logo.png  type="image/png">
        <?php include("head.php"); ?>
    </head>
    <body>
        <div class="container">
            <div class="card card-container" style="width:40%">
                <img id="profile-img" class="profile-img-card" src="img/logo.png" />
                <p id="profile-name" class="profile-name-card"></p>
                <form method="post" accept-charset="utf-8" id="guardar_usuario2" name="guardar_usuario2" autocomplete="off" role="form" class="form-signin">

                    <div id="resultados_ajax2"></div>

                    <ul class="errorMessages" style="color: red; display: none"></ul>

                    <label for="NM_DOCUMENTO_ID">*Identificación:</label>
                    <input type="text" class="form-control" id="NM_DOCUMENTO_ID" name="NM_DOCUMENTO_ID" placeholder="*Identificación" title="Identificación ( sólo Números)" onkeypress="return numeros(event)" onblur="limpia(this)" id="miInput" class="form-control" minlength="5" maxlength="15" required >

                    <p>
                        <label for="CS_TIPO_DOCUMENTO_ID">*Tipo Documento:</label>
                        <select required="required" name="CS_TIPO_DOCUMENTO_ID" id="CS_TIPO_DOCUMENTO_ID" title="Tipo Documento ( campo requerido)" class="form-control" >
                            <option value style="display: none" selected>*Seleccione una opción</option>
                            <option value="1">Cedula Ciudadania</option>
                            <option value="2">Tarjeta Identidad</option>
                            <option value="3">Pasaporte</option>
                            <option value="4">Cedula Extranjera</option>
                        </select>
                    </p>

                   

                    <label for="DS_NOMBRES_USUARIO">*Nombre:</label>
                    <input type="text" class="form-control" id="DS_NOMBRES_USUARIO" name="DS_NOMBRES_USUARIO" placeholder="*Nombres" title="Nombre de usuario ( sólo letras )" onkeypress="return soloLetras(event)" onblur="limpia(this)" id="miInput" class="form-control"  required>

                    <label for="DS_APELLIDOS_USUARIO">*Apellidos:</label>
                    <input type="text" class="form-control" id="DS_APELLIDOS_USUARIO" name="DS_APELLIDOS_USUARIO" placeholder="*Apellidos" title="Apellidos de usuario ( sólo letras )" onkeypress="return soloLetras(event)" onblur="limpia(this)" id="miInput" class="form-control"  required>

                    <label for="NM_TELEFONO">*Teléfono:</label>
                    <input type="text" class="form-control" id="NM_TELEFONO" name="NM_TELEFONO" placeholder="*Teléfono" title="Teléfono( sólo numeros)" onkeypress="return numeros(event, this)" onblur="limpia(this)" id="miInput" class="form-control" minlength="7" maxlength="7"  required>

                    <label for="NM_CELULAR">*Celular:</label>
                    <input type="text" class="form-control" id="NM_CELULAR" name="NM_CELULAR" placeholder="*Celular" title="Celular( sólo numeros)" onkeypress="return numeros(event, this)" class="form-control" minlength="10" maxlength="10"  required>

                    <label for="DS_CORREO">*Email:</label>
                    <input type="email" name="DS_CORREO" id="DS_CORREO" placeholder="*Email" value="" size='30' maxlength='100' title="Dirección de correo" onKeyUp="validateMail(this)" class="form-control" required>


                    <p>
                        <label for="CS_TIPO_USUARIO_ID">*Tipo Usuario:</label>
                        <select name="CS_TIPO_USUARIO_ID" id="CS_TIPO_USUARIO_ID" title="Tipo Usuario( campo requerido)" class="form-control"  required>
                            <option value style="display: none">Seleccione</option>
                            <?php
                                foreach (Login::obtenerListadoPerfiles(array(3,4)) as $row) {
                                    ?>
                                    <option value="<?php echo $row["CS_TIPO_USUARIO"]; ?>"><?php echo $row["DS_NOMBRE_TIPO_USUARIO"]; ?></option>
                                    <?php
                                }
                            ?>
                        </select>
                    </p>
                     <p>
                        <label for="BANDA_ID">Tienes Banda, por favor seleccionela:</label>
                        <select name="BANDA_ID" id="BANDA_ID" title="" class="form-control" >
                        </select>
                    </p>

                    <p>
                        <label for="ES_LIDER">Es lider de la banda:</label>
                        <div class="radio" style="display: inline; margin-right: 20px">
                          <label><input type="radio" value="No" name="ES_LIDER" checked>No</label>
                        </div>
                        <div class="radio" style="display: inline;">
                          <label><input type="radio" value="Si" name="ES_LIDER" >Si</label>
                        </div>
                        
                    </p>

                    <label for="DS_DIRECCION">Dirección:</label>
                    <input type="text" name="DS_DIRECCION" id="DS_CORREO" placeholder="Dirección" value="" title="Dirección de la vivienda" class="form-control">



                    <a href="login.php">Ya estas registrado? Inicia Sesiòn</a>
                    <button type="submit" class="btn btn-lg btn-success btn-block btn-signin" name="registrarse" id="registrarse">Registrarse</button>

                </form><!-- /form -->

            </div><!-- /card-container -->
        </div><!-- /container -->

        <?php
        include("footer.php");
        ?>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

    </body>
</html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<script>

                        $('#BANDA_ID').select2({
                            allowClear: false,
                            language: "es",
                            placeholder: "Seleccione una banda en caso de pertenecer a alguna",
                            default: false,
                            ajax: {
                                url: 'ajax/autocomplete/bandas.php',
                                cache: "true",
                                type: 'POST',
                                dataType: 'json',
                                data: function (data, page) {
                                    data["id_usuarios_existentes"] = $("#id_lider").val();
                                    data["search"] = data.term;
                                    return data;
                                },
                                results: function (data, page) {
                                    return {results: data.results};
                                }
                            },
                        });


                        $(document).ready(function () {
                            $("#NM_CELULAR, #NM_TELEFONO").keyup(function (e) {
                                var valorInicial = $(this).val();
                                var valor = $(this).val().replace(/^0*/, '');
                                if (valorInicial.length != valor.length)
                                    $(this).val(valor);
                            });

                            $("#guardar_usuario2").submit(function (event) {

                                event.preventDefault();
                                if ($('#guardar_usuario2')[0].checkValidity()) {
                                    if (validateMail(document.getElementById("DS_CORREO"))) {
                                        $("#loading").show();
                                        $('#registrarse').attr("disabled", true);

                                        var parametros = $(this).serialize();
                                        $.ajax({
                                            type: "POST",
                                            url: "ajax/nuevo_usuario2.php",
                                            data: parametros,
                                            beforeSend: function (objeto) {
                                                $("#resultados_ajax2").html("Mensaje: Cargando...");
                                            },
                                            success: function (datos) {
                                                $("#loading").hide();
                                                $("#resultados_ajax2").html(datos);
                                               // alertify.warning(datos);
                                                $('#registrarse').attr("disabled", false);
                                                $("#NM_DOCUMENTO_ID").focus();
                                                //load(1);
                                                if(datos.search("Error!")<=-1){
                                                    $("#guardar_usuario2")[0].reset();
                                                    $("#BANDA_ID").empty().trigger('change');
                                                }
                                                setTimeout(function(){$("#resultados_ajax2").html("");}, 8000);
                                            }
                                        });
                                    } else {
                                        $("#DS_CORREO").focus();
                                        alertify.error("Verifique la estructura del correo.")
                                    }
                                }
                            });

                        });

</script>
<script>

    function numeros(e, t) {
        //.replace(/^0*/, '')return false;
        //console.log($(t).val()+ String.fromCharCode(key).toLowerCase());
        key = e.keyCode || e.which;

        var key = window.Event ? e.which : e.keyCode;
        return ((key >= 48 && key <= 57) || (key == 8))

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

    function pierdeFoco(e) {
        var valor = e.value.replace(/^0*/, '');
        e.value = valor;
        return true;
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

    function limpia(e) {
        var val = $(e).val();
        var tam = val.length;
        for (i = 0; i < tam; i++) {
            if (!isNaN(val[i]))
                $(this).val('');
        }
    }

    function validateMail(object)
    {
        //Creamos un objeto 
        // object=document.getElementById(idMail);
        valueForm = object.value;

        // Patron para el correo
        var patron = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/;
        if (valueForm.search(patron) == 0)
        {
            //Mail correcto
            object.style.color = "#000";
            return true;
        }
        //Mail incorrecto
        object.style.color = "#f00";
        return false;
    }
//-->

    var createAllErrors = function () {
        var form = $(this),
                errorList = $("ul.errorMessages", form);

        var showAllErrorMessages = function () {
            errorList.empty();

            // Find all invalid fields within the form.
            var invalidFields = form.find(":invalid").each(function (index, node) {

                // Find the field's corresponding label
                var label = $("label[for=" + node.id + "] "),
                        // Opera incorrectly does not fill the validationMessage property.
                        message = node.validationMessage || 'Invalid value.';

                errorList
                        .show()
                        .append("<li><span>" + label.html() + "</span> " + message + "</li>");
            });
        };

        // Support Safari
        form.on("submit", function (event) {
            if (this.checkValidity && !this.checkValidity()) {
                $(this).find(":invalid").first().focus();
                event.preventDefault();
            }
        });

        $("input[type=submit], button:not([type=button])", form)
                .on("click", showAllErrorMessages);

        $("input", form).on("keypress", function (event) {
            var type = $(this).attr("type");
            if (/date|email|month|number|search|tel|text|time|url|week/.test(type)
                    && event.keyCode == 13) {
                showAllErrorMessages();
            }
        });
    };

    //	$( "form" ).each( createAllErrors );
</script>


