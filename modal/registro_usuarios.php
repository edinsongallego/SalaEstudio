<?php
if (isset($con)) {
    ?>
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i> Agregar nuevo usuario</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" method="post" id="guardar_usuario" name="guardar_usuario" autocomplete="off">
                        <div id="resultados_ajax"></div>


                        <div class="form-group">

                            <label for="Identificación" class="col-sm-3 control-label">*Identificación</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="NM_DOCUMENTO_ID" name="NM_DOCUMENTO_ID" placeholder="*Identificación" title="Identificación ( sólo Números)" onkeypress="return numeros(event)" onblur="limpia(this)" id="miInput" class="form-control" minlength="5" maxlength="15" required >
                            </div>
                        </div>
                        <div class="form-group">

                            <label for="tipo_id" class="col-sm-3 control-label">*Tipo Identificación</label>
                            <div class="col-sm-8">

                                <select name="CS_TIPO_DOCUMENTO_ID" id="CS_TIPO_DOCUMENTO_ID" class="form-control" required>
                                    <option value style="display: none">Seleccione</option>
                                    <option value="1">Cedula Ciudadanía</option>
                                    <option value="2">Tarjeta Identidad</option>
                                    <option value="3">Pasaporte</option>
                                    <option value="4">Cedula Extranjera</option>
                                </select>


                            </div>
                        </div>
                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">*Nombres</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="DS_NOMBRES_USUARIO" name="DS_NOMBRES_USUARIO" placeholder="*Nombres" title="Nombre de usuario ( sólo letras )" onkeypress="return soloLetras(event)" onblur="limpia(this)" id="miInput" class="form-control"  required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-3 control-label">*Apellidos</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="DS_APELLIDOS_USUARIO" name="DS_APELLIDOS_USUARIO" placeholder="*Apellidos" title="Apellidos de usuario ( sólo letras )" onkeypress="return soloLetras(event)" onblur="limpia(this)" id="miInput" class="form-control"  required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Teléfono" class="col-sm-3 control-label">*Teléfono</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="NM_TELEFONO" name="NM_TELEFONO" placeholder="*Teléfono" title="Teléfono( sólo Números)" onkeypress="return numeros(event)" onblur="limpia(this)" id="miInput" class="form-control" minlength="7" maxlength="7"  required>


                            </div>
                        </div>

                        <div class="form-group">
                            <label for="Celular" class="col-sm-3 control-label">*Celular</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="NM_CELULAR" name="NM_CELULAR" placeholder="*Celular" title="Celular( sólo Números)" onkeypress="return numeros(event)" onblur="limpia(this)" id="miInput" class="form-control" minlength="10" maxlength="10"  required>

                            </div>
                        </div>
                        <div class="form-group">
                            <label for="user_Email" class="col-sm-3 control-label">*Email</label>
                            <div class="col-sm-8">
                                <input type="email" name="DS_CORREO" id="DS_CORREO" placeholder="*Email" value="" size='30' maxlength='100' title='Dirección de correo' class="form-control" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="user_Email" class="col-sm-3 control-label">Dirección</label>
                            <div class="col-sm-8">
                                <input type="text" name="DS_DIRECCION" id="DS_DIRECCION" placeholder="Dirección" value="" title='Dirección de la vivienda' class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="tipo_usu" class="col-sm-3 control-label">*Tipo Usuario</label>
                            <div class="col-sm-8">

                                <select name="CS_TIPO_USUARIO_ID" id="CS_TIPO_USUARIO_ID" class="form-control" required="required">
                                    <option value style="display: none">Seleccione</option>
                                    <?php
                                    foreach (Login::obtenerListadoPerfiles(array(1,3,4,5)) as $row) {
                                        ?>
                                        <option value="<?php echo $row["CS_TIPO_USUARIO"]; ?>"><?php echo $row["DS_NOMBRE_TIPO_USUARIO"]; ?></option>
                                        <?php
                                    }
                                    ?>

                                </select>

                            </div>
                        </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary" id="guardar_datos">Guardar datos</button>
                </div>
                </form>
            </div>
        </div>
    </div>
    <?php
}
?>

<script type="text/javascript">
    setTimeout(function () {
        $(document).ready(function () {
            $("#NM_CELULAR, #NM_TELEFONO").keyup(function (e) {
                var valorInicial = $(this).val();
                var valor = $(this).val().replace(/^0*/, '');
                if (valorInicial.length != valor.length)
                    $(this).val(valor);
            });
        });
    }, 500);

    function numeros(e) {
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

//-->
</script>


<script>

    function validateMail(object)
    {
        //Creamos un objeto 
        //object=document.getElementById(idMail);
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
</script>

