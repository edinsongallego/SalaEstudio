<?php
include('is_logged.php'); //Archivo verifica que el usario que intenta acceder a la URL esta logueado
/* Connect To Database */
if(file_exists("./config/db.php")){
require_once ("./config/db.php"); //Contiene las variables de configuracion para conectar a la base de datos
require_once ("./config/conexion.php"); //Contiene funcion que conecta a la base de datos
}else{
 require_once ("../config/db.php"); //Contiene las variables de configuracion para conectar a la base de datos
require_once ("../config/conexion.php"); //Contiene funcion que conecta a la base de datos   
}
// escaping, additionally removing everything that could be (html/javascript-) code
$_REQUEST['q'] = isset($_REQUEST['q'])?$_REQUEST['q']:null;
$q = mysqli_real_escape_string($con, (strip_tags($_REQUEST['q'], ENT_QUOTES)));
$sTable = "facturas, clientes, users";
$sWhere = "";
$sWhere .= " WHERE tp_producto.NM_ELIMINADO = 0";
if ($_REQUEST['q'] != "") {
    $sWhere .= " and  (DS_CODIGO_PRODUCTO LIKE '%$q%' OR DS_NOMBRE_PRODUCTO LIKE '%$q%' OR DS_NOMBRE_VENDEDOR LIKE '%$q%')";
}

$sWhere .= " GROUP BY tp_producto.CS_PRODUCTO_ID ORDER BY DS_NOMBRE_PRODUCTO";
include 'pagination.php'; //include pagination file
//pagination variables
$page = (isset($_REQUEST['page']) && !empty($_REQUEST['page'])) ? $_REQUEST['page'] : 1;
$per_page = 10; //how much records you want to show
$adjacents = 4; //gap between pages after number of adjacents
$offset = ($page - 1) * $per_page;
//Count the total number of row in your table*/
if(!isset($_REQUEST["reporte"])){
$count_query = mysqli_query($con, "SELECT
                                        SUM(tp_inventario_producto.NM_CANTIDAD_INVENTARIO) AS NM_CANTIDAD_INVENTARIO,
                                        tp_producto.CS_PRODUCTO_ID,
                                        tp_producto.DS_CODIGO_PRODUCTO,
                                        tp_producto.DS_NOMBRE_PRODUCTO,
                                        tp_vendedor_producto.DS_NOMBRE_VENDEDOR
                                        FROM
                                        tp_inventario_producto
                                        INNER JOIN tp_producto ON tp_inventario_producto.CS_PRODUCTO_ID = tp_producto.CS_PRODUCTO_ID
                                        LEFT JOIN tp_vendedor_producto ON tp_inventario_producto.CS_VENDEDOR_PRODUCTO_ID = tp_vendedor_producto.CS_VENDEDOR_ID
                                        $sWhere
                                        ");
//print_r(mysqli_error($con));
$row = mysqli_fetch_array($count_query);

$numrows = count($row);
$total_pages = ceil($numrows / $per_page);
$reload = './facturas.php';
//main query to fetch the data
  $sql = "SELECT
                                        SUM(tp_inventario_producto.NM_CANTIDAD_INVENTARIO) AS NM_CANTIDAD_INVENTARIO,
                                        tp_producto.CS_PRODUCTO_ID,
                                        tp_producto.DS_CODIGO_PRODUCTO,
                                        tp_producto.DS_NOMBRE_PRODUCTO,
                                        tp_producto.NM_PRECIO_UNITARIO_COMPRA_UND,
                                        tp_vendedor_producto.DS_NOMBRE_VENDEDOR
                                        FROM
                                        tp_inventario_producto
                                        INNER JOIN tp_producto ON tp_inventario_producto.CS_PRODUCTO_ID = tp_producto.CS_PRODUCTO_ID
                                        LEFT JOIN tp_vendedor_producto ON tp_inventario_producto.CS_VENDEDOR_PRODUCTO_ID = tp_vendedor_producto.CS_VENDEDOR_ID
                                        $sWhere
					LIMIT $offset,$per_page";
 $query = mysqli_query($con, $sql);
}else{
     $sql = "SELECT
                                        SUM(tp_inventario_producto.NM_CANTIDAD_INVENTARIO) AS NM_CANTIDAD_INVENTARIO,
                                        tp_producto.CS_PRODUCTO_ID,
                                        tp_producto.DS_CODIGO_PRODUCTO,
                                        tp_producto.DS_NOMBRE_PRODUCTO,
                                        tp_producto.NM_PRECIO_UNITARIO_COMPRA_UND,
                                        tp_vendedor_producto.DS_NOMBRE_VENDEDOR
                                        FROM
                                        tp_inventario_producto
                                        INNER JOIN tp_producto ON tp_inventario_producto.CS_PRODUCTO_ID = tp_producto.CS_PRODUCTO_ID
                                        LEFT JOIN tp_vendedor_producto ON tp_inventario_producto.CS_VENDEDOR_PRODUCTO_ID = tp_vendedor_producto.CS_VENDEDOR_ID
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
            <td><?php echo $row["CS_PRODUCTO_ID"]; ?></td>
            <td><?php echo $row["DS_CODIGO_PRODUCTO"]; ?></td>
            <td><?php echo $row["DS_NOMBRE_PRODUCTO"];
        ; ?></td>
            <td><?php echo $row["NM_PRECIO_UNITARIO_COMPRA_UND"]; ?></td>
            <td><?php echo $row["DS_NOMBRE_VENDEDOR"]; ?></td>
            <td><?php echo $row["NM_CANTIDAD_INVENTARIO"]; ?></td>
        </tr>
        <?php
    }
    if(!isset($_REQUEST["reporte"])){
    ?>
    <tr>
        <td colspan=7 class="text-center"><?php
                echo paginate($reload, $page, $total_pages, $adjacents);
                ?></td>
    </tr>
    <?php
    }
}