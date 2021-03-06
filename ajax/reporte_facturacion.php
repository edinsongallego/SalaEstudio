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
$sWhere .= " WHERE 1 ";
if ($_REQUEST['q'] != "") {
    $sWhere .= " and  (DS_CODIGO_FACTURA like '%$q%' or DS_CLIENTE like '%$q%' OR DT_FECHA like '%$q%' OR DS_NOTAS_FACTURA like '%$q%')";
}

$sWhere .= " ORDER BY DT_FECHA DESC";
include 'pagination.php'; //include pagination file
//pagination variables
$page = (isset($_REQUEST['page']) && !empty($_REQUEST['page'])) ? $_REQUEST['page'] : 1;
$per_page = 10; //how much records you want to show
$adjacents = 4; //gap between pages after number of adjacents
$offset = ($page - 1) * $per_page;
//Count the total number of row in your table*/
if (!isset($_REQUEST["reporte"])) {
    $count_query = mysqli_query($con, "SELECT * FROM (SELECT ft_factura.CS_FACTURA_ID,
                                                ft_factura.DS_CODIGO_FACTURA,
                                                ft_factura.NM_PRECIO_TOTAL,
                                                ft_factura.NM_PRECIO_SUBTOTAL,
                                                ft_factura.NM_PRECIO_DESCUENTO,
                                                ft_factura.NM_PRECIO_IVA,
                                                ft_factura.DS_NOTAS_FACTURA,
                                                DATE_FORMAT(ft_factura.DT_FECHA_CREACION, '%Y-%m-%d') AS DT_FECHA,
                                                IF(ISNULL(us_usuario.NM_DOCUMENTO_ID), ft_factura.DS_CLIENTE, CONCAT(us_usuario.DS_NOMBRES_USUARIO,' ',us_usuario.DS_APELLIDOS_USUARIO)) AS DS_CLIENTE,
                                                ft_factura.ID_ESTADO
                                                FROM
                                                ft_factura
                                                LEFT JOIN us_usuario ON ft_factura.NM_CLIENTE_ID = us_usuario.NM_DOCUMENTO_ID
                                                ) tmp
                                        $sWhere
                                        ");
print_r(mysqli_error($con));
    $row = mysqli_fetch_array($count_query);

    $numrows = count($row);
    $total_pages = ceil($numrows / $per_page);
    $reload = './reportes.php';
//main query to fetch the data
    $sql = "SELECT * FROM (SELECT               ft_factura.CS_FACTURA_ID,
                                                ft_factura.DS_CODIGO_FACTURA,
                                                ft_factura.NM_PRECIO_TOTAL,
                                                ft_factura.NM_PRECIO_SUBTOTAL,
                                                ft_factura.NM_PRECIO_DESCUENTO,
                                                ft_factura.NM_PRECIO_IVA,
                                                ft_factura.DS_NOTAS_FACTURA,
                                                DATE_FORMAT(ft_factura.DT_FECHA_CREACION, '%Y-%m-%d') AS DT_FECHA,
                                                IF(ISNULL(us_usuario.NM_DOCUMENTO_ID), ft_factura.DS_CLIENTE, CONCAT(us_usuario.DS_NOMBRES_USUARIO,' ',us_usuario.DS_APELLIDOS_USUARIO)) AS DS_CLIENTE,
                                                ft_factura.ID_ESTADO
                                                FROM
                                                ft_factura
                                                LEFT JOIN us_usuario ON ft_factura.NM_CLIENTE_ID = us_usuario.NM_DOCUMENTO_ID
                                                ) tmp
                                        $sWhere
					LIMIT $offset,$per_page";
    $query = mysqli_query($con, $sql);
} else {
    $sql = "SELECT * FROM (SELECT               ft_factura.CS_FACTURA_ID,
                                                ft_factura.DS_CODIGO_FACTURA,
                                                ft_factura.NM_PRECIO_TOTAL,
                                                ft_factura.NM_PRECIO_SUBTOTAL,
                                                ft_factura.NM_PRECIO_DESCUENTO,
                                                ft_factura.NM_PRECIO_IVA,
                                                ft_factura.DS_NOTAS_FACTURA,
                                                DATE_FORMAT(ft_factura.DT_FECHA_CREACION, '%Y-%m-%d') AS DT_FECHA,
                                                IF(ISNULL(us_usuario.NM_DOCUMENTO_ID), ft_factura.DS_CLIENTE, CONCAT(us_usuario.DS_NOMBRES_USUARIO,' ',us_usuario.DS_APELLIDOS_USUARIO)) AS DS_CLIENTE,
                                                ft_factura.ID_ESTADO
                                                FROM
                                                ft_factura
                                                LEFT JOIN us_usuario ON ft_factura.NM_CLIENTE_ID = us_usuario.NM_DOCUMENTO_ID
                                                ) tmp
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
            <td><?php echo strval($row["DS_CODIGO_FACTURA"]); ?></td>
            <td><?php echo $row["DS_NOTAS_FACTURA"]; ?></td>
            <td><?php echo $row["DT_FECHA"]; ?></td>
            <td><?php echo $row["DS_CLIENTE"]; ?></td>
            <td><?php echo number_format($row["NM_PRECIO_IVA"], 2); ?></td>
            <td><?php echo number_format($row["NM_PRECIO_DESCUENTO"], 2); ?></td>
            <td><?php echo number_format($row["NM_PRECIO_SUBTOTAL"], 2); ?></td>
            <td><?php echo number_format($row["NM_PRECIO_TOTAL"], 2); ?></td>
            <td><a href="#" class='btn btn-default' title='Descargar factura' onclick="imprimir_factura('<?php echo $row["CS_FACTURA_ID"]; ?>');"><i class="glyphicon glyphicon-download"></i></a> </td>
        </tr>
        <?php
    }
    if (!isset($_REQUEST["reporte"])) {
        ?>
        <tr>
            <td colspan=9 class="text-center"><?php
                echo paginate($reload, $page, $total_pages, $adjacents);
                ?></td>
        </tr>
        <?php
    }
}