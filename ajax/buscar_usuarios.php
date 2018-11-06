<?php
/* Connect To Database */
require_once ("../config/db.php"); //Contiene las variables de configuracion para conectar a la base de datos
require_once ("../config/conexion.php"); //Contiene funcion que conecta a la base de datos
include('is_logged.php'); //Archivo verifica que el usario que intenta acceder a la URL esta logueado
$action = (isset($_REQUEST['action']) && $_REQUEST['action'] != NULL) ? $_REQUEST['action'] : '';
if (isset($_GET['id'])) {
    $user_id = $_GET['id'];
    $SQL = "SELECT * FROM us_usuario WHERE NM_DOCUMENTO_ID = '" . $user_id . "'";
    $query = mysqli_query($con, $SQL);
    //$rw_user=mysqli_fetch_array($query);
    //$count=$rw_user['user_id'];
    $count = mysqli_num_rows($query);
    if ($count == 1) {
         $SQL = "SELECT
                                    Count(ft_factura.NM_CLIENTE_ID) AS NUM_FACTURAS_PENDIENTES
                                    FROM
                                    ft_factura
                                    WHERE
                                    ft_factura.NM_CLIENTE_ID = '$user_id' AND
                                    ft_factura.ID_ESTADO = 2";
        $count_query = mysqli_query($con, $SQL);
        $row = mysqli_fetch_array($count_query,MYSQLI_ASSOC);
        //print_r($row);die;
        if ($row["NUM_FACTURAS_PENDIENTES"] == 0) {
            if ($delete1 = mysqli_query($con, "UPDATE us_usuario SET NM_ELIMINADO = 1 WHERE NM_DOCUMENTO_ID = '" . $user_id . "'")) {
                ?>
                <div class="alert alert-success alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong>Aviso!</strong> Datos eliminados exitosamente.
                </div>
                <?php
            } else {
                ?>
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong>Error!</strong> Lo siento algo ha salido mal intenta nuevamente.
                </div>
                <?php
            }
        } else {
            ?>
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong>Error!</strong> Lo siento, pero este usuario tiene facturas pendientes por pagar.
                </div>
                <?php
        }
    } else {
        ?>
        <div class="alert alert-danger alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>Error!</strong> No se puede borrar el usuario administrador.
        </div>
        <?php
    }
}
if ($action == 'ajax') {
    // escaping, additionally removing everything that could be (html/javascript-) code
    $q = mysqli_real_escape_string($con, (strip_tags($_REQUEST['q'], ENT_QUOTES)));
    $aColumns = array('DS_NOMBRES_USUARIO', 'DS_APELLIDOS_USUARIO', 'NM_DOCUMENTO_ID'); //Columnas de busqueda
    $sTable = "us_usuario AS t2";
    $sWhere = "WHERE NM_ELIMINADO = 0 ";
    if ($_GET['q'] != "") {
        $sWhere .= " AND (";
        for ($i = 0; $i < count($aColumns); $i++) {
            $sWhere .= $aColumns[$i] . " LIKE '%" . $q . "%' OR ";
        }
        $sWhere = substr_replace($sWhere, "", -3);
        $sWhere .= ')';
    }
    $sWhere .= " order by NM_DOCUMENTO_ID desc";
    include 'pagination.php'; //include pagination file
    //pagination variables
    $page = (isset($_REQUEST['page']) && !empty($_REQUEST['page'])) ? $_REQUEST['page'] : 1;
    $per_page = 10; //how much records you want to show
    $adjacents = 4; //gap between pages after number of adjacents
    $offset = ($page - 1) * $per_page;
    //Count the total number of row in your table*/
    $count_query = mysqli_query($con, "SELECT count(*) AS numrows FROM $sTable  $sWhere");
    $row = mysqli_fetch_array($count_query);
    $numrows = $row['numrows'];
    $total_pages = ceil($numrows / $per_page);
    $reload = './usuarios.php';
    //main query to fetch the data
    $sql = "SELECT *, (SELECT GROUP_CONCAT(t.DS_DESCRIPCION_BANDA SEPARATOR ', ') FROM us_banda_usuario t INNER JOIN us_banda_detalle_usuario t1 ON t1.CS_BANDA_ID = t.CS_BANDA_ID WHERE t1.NM_DOCUMENTO_ID = t2.NM_DOCUMENTO_ID) BANDAS FROM  $sTable $sWhere LIMIT $offset,$per_page";
    $query = mysqli_query($con, $sql);
    //loop through fetched data
    if ($numrows > 0) {
        ?>
        <div class="table-responsive" id="exampledt">
            <table class="table">

                <tr  class="info">
                    <th>Identificación</th>
                    <th>Nombres y Apellidos</th>
                    <th>Email</th>
                    <th>Estado</th>
                    <th>Fecha Creación</th>
                    <th>Banda(s)</th>
                    <th><span class="pull-right">Acciones</span></th>

                </tr>


        <?php
        while ($row = mysqli_fetch_array($query)) {
            $NM_DOCUMENTO_ID = $row['NM_DOCUMENTO_ID'];
            $DS_NOMBRES_USUARIO = $row['DS_NOMBRES_USUARIO'] . " " . $row["DS_APELLIDOS_USUARIO"];
            $DS_CORREO = $row['DS_CORREO'];
            $CS_ESTADO_ID = $row['CS_ESTADO_ID'];
            $NM_TELEFONO = $row['NM_TELEFONO'];
            $NM_CELULAR = $row['NM_CELULAR'];
            $DT_FECHA_CREACION = date('d/m/Y', strtotime($row['DT_FECHA_CREACION']));
            $DS_DIRECCION = $row['DS_DIRECCION'];
            ?>

                    <input type="hidden" value="<?php echo $row['DS_NOMBRES_USUARIO']; ?>" id="nombres<?php echo $NM_DOCUMENTO_ID; ?>">
                    <input type="hidden" value="<?php echo $row['DS_APELLIDOS_USUARIO']; ?>" id="apellidos<?php echo $NM_DOCUMENTO_ID; ?>">

                    <input type="hidden" value="<?php echo $DS_CORREO; ?>" id="email<?php echo $NM_DOCUMENTO_ID; ?>">

                    <input type="hidden" value="<?php echo $CS_ESTADO_ID; ?>" id="estado<?php echo $NM_DOCUMENTO_ID; ?>">

                    <input type="hidden" value="<?php echo $NM_TELEFONO; ?>" id="telefono<?php echo $NM_DOCUMENTO_ID; ?>">

                    <input type="hidden" value="<?php echo $NM_CELULAR; ?>" id="celular<?php echo $NM_DOCUMENTO_ID; ?>">

                   <input type="hidden" value="<?php echo $DS_DIRECCION; ?>" id="direccion<?php echo $NM_DOCUMENTO_ID; ?>">
     

                    <tr>
                        <td><?php echo $NM_DOCUMENTO_ID; ?></td>
                        <td><?php echo $DS_NOMBRES_USUARIO; ?></td>
                        <td><?php echo $DS_CORREO; ?></td>
                        <td ><?php
            if ($CS_ESTADO_ID == 1) {
                echo "Activo";
            } else {
                echo "Inactivo";
            }
            ?></td>
                        <td><?php echo $DT_FECHA_CREACION; ?></td>
                        <td><?php echo $row["BANDAS"]; ?></td>    
                        <td ><span class="pull-right">
                                <a href="#" class='btn btn-default' title='Editar usuario' onclick="obtener_datos('<?php echo $NM_DOCUMENTO_ID; ?>');" data-toggle="modal" data-target="#myModal2"><i class="glyphicon glyphicon-edit"></i></a>
                                <a href="#" class='btn btn-default' title='Cambiar contraseña' onclick="get_user_id('<?php echo $NM_DOCUMENTO_ID; ?>');" data-toggle="modal" data-target="#myModal3"><i class="glyphicon glyphicon-cog"></i></a>
                                <a href="#" class='btn btn-default' title='Borrar usuario' onclick="eliminar('<?php echo $NM_DOCUMENTO_ID; ?>')"><i class="glyphicon glyphicon-trash"></i> </a></span></td>

                    </tr>
                            <?php
                        }
                        ?>
                <tr>
                    <td colspan=9><span class="pull-right">
        <?php
        echo paginate($reload, $page, $total_pages, $adjacents);
        ?>

                        </span>
                    </td>
                </tr>



            </table>
        </div>
                            <?php
                        }
                    }
                    ?>