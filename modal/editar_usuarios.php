<?php
if (isset($con)) {
    ?>
    <!-- Modal -->
    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i> Editar usuario</h4>
                </div>
                <form class="form-horizontal" method="post" id="editar_usuario" name="editar_usuario" autocomplete="off">
                <div class="modal-body">
                        <div id="resultados_ajax2"></div>
                        <div class="form-group">
                            <label for="firstname2" class="col-sm-3 control-label">*Nombres</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="firstname2" name="firstname2" placeholder="Nombres"placeholder="*Nombres" title="Nombre de usuario ( sólo letras )" onkeypress="return soloLetras(event)" class="form-control"  required>
                                <input type="hidden" id="mod_id" name="mod_id">
                            </div>


                        </div>
                        <div class="form-group">
                            <label for="lastname2" class="col-sm-3 control-label">*Apellidos</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="lastname2" name="lastname2" placeholder="*Apellidos" title="Apellidos de usuario ( sólo letras )" onkeypress="return soloLetras(event)" class="form-control"  required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="Teléfono" class="col-sm-3 control-label">*Teléfono</label>
                            <div class="col-sm-8">
                                <input type="tel" class="form-control" id="tel" name="tel" placeholder="*Teléfono" title="Teléfono( sólo Números)" onkeypress="return numeros(event)" onKeyUp="pierdeFoco(this)" class="form-control" minlength="7" maxlength="7"  required>

                            </div>
                        </div>

                        <div class="form-group">
                            <label for="Celular" class="col-sm-3 control-label">*Celular</label>
                            <div class="col-sm-8">
                                <input type="tel" class="form-control" id="cel" name="cel" placeholder="*Celular" title="Celular( sólo Números)" onkeypress="return numeros(event)" onKeyUp="pierdeFoco(this)" class="form-control" minlength="10" maxlength="10"  required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="user_email2" class="col-sm-3 control-label">*Email</label>
                            <div class="col-sm-8">
                                <input type="email" class="form-control" id="user_email2" name="user_email2" placeholder="Correo electrónico" value="" title='Dirección de correo'required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="user_Email" class="col-sm-3 control-label">Dirección</label>
                            <div class="col-sm-8">
                                <input type="text" name="DS_DIRECCION" id="DS_DIRECCION_EDIT" placeholder="Dirección" value="" title='Dirección de la vivienda' class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="estado" class="col-sm-3 control-label">*Estado</label>
                            <div class="col-sm-8"> 
                                <select name="estado" data-rule-validarInactivacionReservaUsuarioEdt="true" data-rule-validarInactivacionUsuarioEdt="true" validarIntegranteBandaUsuario="true" id="estado" class="form-control">
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="enviar_correo" class="col-sm-3 control-label">Enviar correo de activación</label>
                            <div class="col-sm-8" class="checkbox">
                                <input type="checkbox" value="1" name="enviar_correo" id="enviar_correo" disabled="disabled">
                            </div>
                        </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary" id="actualizar_datos">Actualizar datos</button>
                </div>
                </form>
            </div>
        </div>
    </div>
    <?php
}
?>

<script>
    setTimeout(function(e){
        $(document).ready(function(){
            $("#estado").change(function(e){
                if ($(this).val() == 1) {
                    $("#enviar_correo").removeAttr("disabled");
                }else{
                    $("#enviar_correo").attr("disabled","disabled");
                    $("#enviar_correo").prop("checked", false);

                }
            });
        });
    },100);
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


</script>