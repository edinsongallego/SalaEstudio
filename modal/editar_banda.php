<?php
if (isset($con)) {
    ?>
    <!-- Modal -->
    <div class="modal fade" id="editarbanda" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i> Editar banda</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" method="post" id="editar_banda" name="editar_banda"autocomplete="off">
                        <div id="resultados_editar"></div>

                        <div class="form-group row">
                            <label for="firstname" class="col-sm-3 control-label">*Nombre Banda</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="nombrebanda" name="nombrebanda" placeholder="*Nombre Banda" class="form-control" >
                                <input type="hidden" id="mod_id_banda" name="mod_id_banda">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="lastname" class="col-sm-3 control-label">*Descripción</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="descripcionbanda" name="descripcionbanda" placeholder="*Descripción Banda" class="form-control" >
                            </div>
                        </div>


                </div>
                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-8">
                        <button type="submit" class="btn btn-primary float-right" id="guardar_datos_banda">Guardar</button>
                    </div>
                </div>

                </form>
            </div>
        </div>
    </div>
    <?php
}
?>