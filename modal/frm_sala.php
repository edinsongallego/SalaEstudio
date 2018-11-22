<?php
    ?>
    <!-- Modal -->
    <div class="modal fade" id="modalSala" tabindex="-1" role="dialog" aria-labelledby="">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i> Sala</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" method="post" id="frm_sala" name="guardar_sala" autocomplete="off">
                        <div id="resultados_ajax_salas"></div>
                        <div class="form-group">
                            <label for="nombre" class="col-sm-3 control-label">*Nombre</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre de la sala" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="valor" class="col-sm-3 control-label">*Valor hora</label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" id="valor" name="valor" placeholder="Valor hora en la sala" required pattern="^[0-9]{1,6}?$" title="Ingresa sólo números">
                            </div>
                        </div> 
                        <div class="form-group">
                            <label for="capacidad" class="col-sm-3 control-label">*Capacidad</label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" id="capacidad" name="capacidad" placeholder="Capacidad de personas en la sala" required title="Ingresa sólo números">
                            </div>
                        </div> 
                        

                        <div class="form-group">
                            <label for="descripcion" class="col-sm-3 control-label">*Descripción</label>
                            <div class="col-sm-8">
                                <textarea class="form-control" id="descripcion" name="descripcion" placeholder="Descripción de la sala" required maxlength="255" ></textarea>
                            </div>
                        </div>
                        <input type="hidden" id="id_sala" name="id_sala" value=""/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary" id="guardar_datos">Guardar</button>
                </div>
                </form>
            </div>
        </div>
    </div>
    <?php

?>