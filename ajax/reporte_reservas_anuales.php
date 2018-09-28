<?php
include('is_logged.php'); //Archivo verifica que el usario que intenta acceder a la URL esta logueado
/* Connect To Database */
if (file_exists("./config/db.php")) {
    require_once ("./config/db.php"); //Contiene las variables de configuracion para conectar a la base de datos
    require_once ("./config/conexion.php"); //Contiene funcion que conecta a la base de datos
} else {
    require_once ("../config/db.php"); //Contiene las variables de configuracion para conectar a la base de datos
    require_once ("../config/conexion.php"); //Contiene funcion que conecta a la base de datos   
}
// escaping, additionally removing everything that could be (html/javascript-) code
$_REQUEST['q'] = isset($_REQUEST['q']) ? $_REQUEST['q'] : null;
$q = mysqli_real_escape_string($con, (strip_tags($_REQUEST['q'], ENT_QUOTES)));
$sTable = "facturas, clientes, users";
$sWhere = "";
$sWhere .= " WHERE rs_reserva_sala.DS_ESTADO = 'Activo'";
if ($_REQUEST['q'] != "") {
    $sWhere .= " and  (us_usuario.DS_NOMBRES_USUARIO like '%$q%' or us_usuario.DS_APELLIDOS_USUARIO like '%$q%' or rs_sala.DS_NOMBRE_SALA like '%$q%')";
}

$sWhere .= " GROUP BY DATE_FORMAT(rs_reserva_sala.DT_FECHA_CREACION, '%Y') ORDER BY rs_reserva_sala.DT_FECHA_CREACION DESC";
include 'pagination.php'; //include pagination file
//pagination variables
$page = (isset($_REQUEST['page']) && !empty($_REQUEST['page'])) ? $_REQUEST['page'] : 1;
$per_page = 10; //how much records you want to show
$adjacents = 4; //gap between pages after number of adjacents
$offset = ($page - 1) * $per_page;
//Count the total number of row in your table*/
if (!isset($_REQUEST["reporte"])) {
    $count_query = mysqli_query($con, "SELECT													COUNT(*) CANTIDAD,
                                    DATE_FORMAT(rs_reserva_sala.DT_FECHA_CREACION, '%Y') DT_FECHA_CREACION
                                    FROM
                                    rs_reserva_sala
                                    INNER JOIN us_usuario ON rs_reserva_sala.documento = us_usuario.NM_DOCUMENTO_ID
                                        $sWhere
                                        ");
//print_r(mysqli_error($con));
    $row = mysqli_fetch_array($count_query);

    $numrows = count($row);
    $total_pages = ceil($numrows / $per_page);
    $reload = './reportes.php';
//main query to fetch the data
    $sql = "SELECT													COUNT(*) CANTIDAD,
                                    DATE_FORMAT(rs_reserva_sala.DT_FECHA_CREACION, '%Y') DT_FECHA_CREACION
                                    FROM
                                    rs_reserva_sala
                                    INNER JOIN us_usuario ON rs_reserva_sala.documento = us_usuario.NM_DOCUMENTO_ID
                                        $sWhere
					LIMIT $offset,$per_page";
    $query = mysqli_query($con, $sql);
} else {
    $sql = "SELECT		COUNT(*) CANTIDAD,
                                DATE_FORMAT(rs_reserva_sala.DT_FECHA_CREACION, '%Y') DT_FECHA_CREACION
                                FROM
                                rs_reserva_sala
                                INNER JOIN us_usuario ON rs_reserva_sala.documento = us_usuario.NM_DOCUMENTO_ID
                                        $sWhere";
    $query = mysqli_query($con, $sql);
    $numrows = mysqli_num_rows($query);
}

//loop through fetched data
if ($numrows > 0) {
    ?>

    <?php
    while ($row = mysqli_fetch_array($query)) {
        ?>
        <tr>
            <td><?php echo $row["DT_FECHA_CREACION"]; ?></td>
            <td><?php echo $row["CANTIDAD"]; ?></td>
        </tr>
        <?php
    }
    if (!isset($_REQUEST["reporte"])) {
        ?>
        <tr>
            <td colspan=7 class="text-center"><?php
                echo paginate($reload, $page, $total_pages, $adjacents);
                ?></td>
        </tr>
        <?php
    }
}