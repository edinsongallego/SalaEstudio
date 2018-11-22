<?php

require_once("../config/db.php");
include_once "../classes/Login.php";
session_start();
$i = 0;
foreach (Login::obtenerSalas() as $sala) {
    ?>
    <div class="col-xs-12 col-sm-8 col-md-6 col-lg-6 col-xl-6">
        <div class="card">
            <div class="card-block block-1">
                <h3 class="card-title"><?php echo $sala["DS_NOMBRE_SALA"]; ?>:</h3>
                <p class="card-text"><?php echo $sala["DS_DESCRIPCION_SALA"]; ?></p>
                <h3 class="card-title">PRECIO:</h3>
                <p class="card-text">1 hora • $ <?php echo @number_format($sala["NM_VALOR_HORA_SALA"], 2, ",", "."); ?></p>
                <div>
                    <a style="color: white !important" id="btnagregar" class="btn btn-success" href="reservassala1.php?sala=<?php echo $sala["CS_SALA_ID"]; ?>"><b>Reservar</b></a>
                    <?php if($_SESSION["CS_TIPO_USUARIO_ID"] == 1){ ?>
                        <a style="color: white !important" class="btn btn-primary editar_sala" id_sala="<?php echo $sala["CS_SALA_ID"]; ?>">Editar</a>
                        <a style="color: white !important" class="btn btn-danger eliminar_sala" id_sala="<?php echo $sala["CS_SALA_ID"]; ?>">Eliminar</a>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
<?php } ?>