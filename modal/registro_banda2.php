<?php
if (isset($con)) {
    ?>
    <!-- Modal -->
    <div class="modal fade" id="newBanda" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i> Agregar nueva banda</h4>
                </div>
                <form class="form-horizontal" method="post" id="guardar_banda2" name="guardar_banda2" autocomplete="off">
                    <div class="modal-body">
                        <div id="resultados_ajax_banda2"></div>


                        <div class="form-group row">
                            <label for="firstname" class="col-sm-3 control-label">*Nombre Banda</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="DS_NOMBRE_BANDA" name="DS_NOMBRE_BANDA" placeholder="*Nombre Banda" data-rule-validarExistenciaNombreBanda="true" class="form-control" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="lastname" class="col-sm-3 control-label">*Género</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="DS_DESCRIPCION_BANDA" name="DS_DESCRIPCION_BANDA" data-rule-generoSoloLetras="true" placeholder="*Género Banda" class="form-control" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">*Líder banda</label>
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
                    <div class="modal-footer" style="text-align: center;">
                        <button id="btn_cancelar" class="btn btn-danger">Cancelar</button>
                        <button type="submit" class="btn btn-primary" id="guardar_datos_banda">Guardar</button>
                    </div>

                </form>



            </div>
        </div>
    </div>
    <?php
}
?>

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

    function limpia(e) {
        var val = $(e).val();
        var tam = val.length;
        for (i = 0; i < tam; i++) {
            if (!isNaN(val[i]))
                $(e).val("");
        }
    }


//-->
</script>


<script>

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

