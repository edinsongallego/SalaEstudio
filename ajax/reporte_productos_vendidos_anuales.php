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
    $sWhere .= " and  (tp_producto.DS_NOMBRE_PRODUCTO like '%$q%' or tp_producto.DS_CODIGO_PRODUCTO like '%$q%' OR ft_factura.DT_FECHA_CREACION like '%$q%')";
}

$sWhere .= " GROUP BY tp_producto.CS_PRODUCTO_ID,DATE_FORMAT(ft_factura.DT_FECHA_CREACION, '%Y') ORDER BY ft_factura.DT_FECHA_CREACION DESC";
include 'pagination.php'; //include pagination file
//pagination variables
$page = (isset($_REQUEST['page']) && !empty($_REQUEST['page'])) ? $_REQUEST['page'] : 1;
$per_page = 10; //how much records you want to show
$adjacents = 4; //gap between pages after number of adjacents
$offset = ($page - 1) * $per_page;
//Count the total number of row in your table*/
if (!isset($_REQUEST["reporte"])) {
    $count_query = mysqli_query($con, "SELECT
                                        SUM(ft_factura_detalle.NM_CANTIDAD_COMPRA) NM_CANTIDAD_COMPRA,
                                        SUM(ft_factura_detalle.NM_PRECIO_TOTAL_PRODUCTO) NM_PRECIO_TOTAL_PRODUCTO,
                                        SUM(ft_factura_detalle.NM_PRECIO_UNITARIO) NM_PRECIO_UNITARIO,
                                        tp_producto.DS_NOMBRE_PRODUCTO,
                                        tp_producto.DS_CODIGO_PRODUCTO,
                                        DATE_FORMAT(ft_factura.DT_FECHA_CREACION, '%Y') DT_FECHA
                                        FROM
                                        tp_producto
                                        INNER JOIN ft_factura_detalle ON ft_factura_detalle.CS_PRODUCTO_ID = tp_producto.CS_PRODUCTO_ID
                                        INNER JOIN ft_factura ON ft_factura_detalle.CS_FACTURA_ID = ft_factura.CS_FACTURA_ID
                                        $sWhere
                                        ");
print_r(mysqli_error($con));
    $row = mysqli_fetch_array($count_query);

    $numrows = count($row);
    $total_pages = ceil($numrows / $per_page);
    $reload = './reportes.php';
//main query to fetch the data
    $sql = "SELECT
                                        SUM(ft_factura_detalle.NM_CANTIDAD_COMPRA) NM_CANTIDAD_COMPRA,
                                        SUM(ft_factura_detalle.NM_PRECIO_TOTAL_PRODUCTO) NM_PRECIO_TOTAL_PRODUCTO,
                                        SUM(ft_factura_detalle.NM_PRECIO_UNITARIO) NM_PRECIO_UNITARIO,
                                        tp_producto.DS_NOMBRE_PRODUCTO,
                                        tp_producto.DS_CODIGO_PRODUCTO,
                                        DATE_FORMAT(ft_factura.DT_FECHA_CREACION, '%Y') DT_FECHA
                                        FROM
                                        tp_producto
                                        INNER JOIN ft_factura_detalle ON ft_factura_detalle.CS_PRODUCTO_ID = tp_producto.CS_PRODUCTO_ID
                                        INNER JOIN ft_factura ON ft_factura_detalle.CS_FACTURA_ID = ft_factura.CS_FACTURA_ID
                                        $sWhere
					LIMIT $offset,$per_page";
    $query = mysqli_query($con, $sql);
} else {
    $sql = "SELECT
                                        SUM(ft_factura_detalle.NM_CANTIDAD_COMPRA) NM_CANTIDAD_COMPRA,
                                        SUM(ft_factura_detalle.NM_PRECIO_TOTAL_PRODUCTO) NM_PRECIO_TOTAL_PRODUCTO,
                                        SUM(ft_factura_detalle.NM_PRECIO_UNITARIO) NM_PRECIO_UNITARIO,
                                        tp_producto.DS_NOMBRE_PRODUCTO,
                                        tp_producto.DS_CODIGO_PRODUCTO,
                                        DATE_FORMAT(ft_factura.DT_FECHA_CREACION, '%Y') DT_FECHA
                                        FROM
                                        tp_producto
                                        INNER JOIN ft_factura_detalle ON ft_factura_detalle.CS_PRODUCTO_ID = tp_producto.CS_PRODUCTO_ID
                                        INNER JOIN ft_factura ON ft_factura_detalle.CS_FACTURA_ID = ft_factura.CS_FACTURA_ID
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
            <td><?php echo $row["DT_FECHA"]; ?></td>
            <td><?php echo $row["DS_NOMBRE_PRODUCTO"]." - ".$row["DS_CODIGO_PRODUCTO"]; ?></td>
            <td><?php echo $row["NM_CANTIDAD_COMPRA"]; ?></td>
            <td><?php echo number_format($row["NM_PRECIO_TOTAL_PRODUCTO"], 2); ?></td>
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