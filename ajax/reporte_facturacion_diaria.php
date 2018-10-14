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
    $sWhere .= " and  (DT_FECHA like '%$q%')";
}

$sWhere .= " GROUP BY DT_FECHA ORDER BY DT_FECHA DESC";
include 'pagination.php'; //include pagination file
//pagination variables
$page = (isset($_REQUEST['page']) && !empty($_REQUEST['page'])) ? $_REQUEST['page'] : 1;
$per_page = 10; //how much records you want to show
$adjacents = 4; //gap between pages after number of adjacents
$offset = ($page - 1) * $per_page;
//Count the total number of row in your table*/
if (!isset($_REQUEST["reporte"])) {
    $count_query = mysqli_query($con, "SELECT SUM(NM_PRECIO_TOTAL) NM_PRECIO_TOTAL,
                                                SUM(NM_PRECIO_SUBTOTAL)NM_PRECIO_SUBTOTAL,
                                                SUM(NM_PRECIO_DESCUENTO) NM_PRECIO_DESCUENTO,
                                                SUM(NM_PRECIO_IVA) NM_PRECIO_IVA,
                                                COUNT(DS_CODIGO_FACTURA) CANTIDAD,
                                                DT_FECHA
                                                FROM (SELECT
                                                ft_factura.DS_CODIGO_FACTURA,
                                                ft_factura.NM_PRECIO_TOTAL,
                                                ft_factura.NM_PRECIO_SUBTOTAL,
                                                ft_factura.NM_PRECIO_DESCUENTO,
                                                ft_factura.NM_PRECIO_IVA,
                                                DATE_FORMAT(ft_factura.DT_FECHA_CREACION, '%Y-%m-%d') AS DT_FECHA
                                                FROM
                                                ft_factura
                                                ) tmp
                                        $sWhere
                                        ");
print_r(mysqli_error($con));
    $row = mysqli_fetch_array($count_query);

    $numrows = count($row);
    $total_pages = ceil($numrows / $per_page);
    $reload = './reportes.php';
//main query to fetch the data
    $sql = "SELECT SUM(NM_PRECIO_TOTAL) NM_PRECIO_TOTAL,
                                                SUM(NM_PRECIO_SUBTOTAL)NM_PRECIO_SUBTOTAL,
                                                SUM(NM_PRECIO_DESCUENTO) NM_PRECIO_DESCUENTO,
                                                SUM(NM_PRECIO_IVA) NM_PRECIO_IVA,
                                                COUNT(DS_CODIGO_FACTURA) CANTIDAD,
                                                DT_FECHA
                                                FROM (SELECT
                                                ft_factura.DS_CODIGO_FACTURA,
                                                ft_factura.NM_PRECIO_TOTAL,
                                                ft_factura.NM_PRECIO_SUBTOTAL,
                                                ft_factura.NM_PRECIO_DESCUENTO,
                                                ft_factura.NM_PRECIO_IVA,
                                                DATE_FORMAT(ft_factura.DT_FECHA_CREACION, '%Y-%m-%d') AS DT_FECHA
                                                FROM
                                                ft_factura
                                                ) tmp
                                        $sWhere
					LIMIT $offset,$per_page";
    //echo $sql;die;
    $query = mysqli_query($con, $sql);
} else {
    $sql = "SELECT SUM(NM_PRECIO_TOTAL) NM_PRECIO_TOTAL,
                                                SUM(NM_PRECIO_SUBTOTAL)NM_PRECIO_SUBTOTAL,
                                                SUM(NM_PRECIO_DESCUENTO) NM_PRECIO_DESCUENTO,
                                                SUM(NM_PRECIO_IVA) NM_PRECIO_IVA,
                                                COUNT(DS_CODIGO_FACTURA) CANTIDAD,
                                                DT_FECHA
                                                FROM (SELECT
                                                ft_factura.DS_CODIGO_FACTURA,
                                                ft_factura.NM_PRECIO_TOTAL,
                                                ft_factura.NM_PRECIO_SUBTOTAL,
                                                ft_factura.NM_PRECIO_DESCUENTO,
                                                ft_factura.NM_PRECIO_IVA,
                                                DATE_FORMAT(ft_factura.DT_FECHA_CREACION, '%Y-%m-%d') AS DT_FECHA
                                                FROM
                                                ft_factura
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
            <td><?php echo strval($row["DT_FECHA"]); ?></td>
            <td><?php echo $row["CANTIDAD"]; ?></td>
            <td><?php echo number_format($row["NM_PRECIO_IVA"], 2); ?></td>
            <td><?php echo number_format($row["NM_PRECIO_DESCUENTO"], 2); ?></td>
            <td><?php echo number_format($row["NM_PRECIO_SUBTOTAL"], 2); ?></td>
            <td><?php echo number_format($row["NM_PRECIO_TOTAL"], 2); ?></td>
        </tr>
        <?php
    }
    if (!isset($_REQUEST["reporte"])) {
        ?>
        <tr>
            <td colspan=6 class="text-center"><?php
                echo paginate($reload, $page, $total_pages, $adjacents);
                ?></td>
        </tr>
        <?php
    }
}