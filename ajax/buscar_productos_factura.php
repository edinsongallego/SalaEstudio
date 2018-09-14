<?php 

include('is_logged.php');//Archivo verifica que el usario que intenta acceder a la URL esta logueado
/* Connect To Database*/
require_once ("../config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
require_once ("../config/conexion.php");//Contiene funcion que conecta a la base de datos

$term = isset($_REQUEST["q"])?$_REQUEST["q"]:"";

 $sql="SELECT *, if(ISNULL(CI),0,CI) CANTIDAD_INVENTARIO FROM (SELECT P.*, TU.DS_NOMBRE_UNIDAD, TU.DS_DESCRIPCION_UNIDAD, (SELECT SUM(NM_CANTIDAD_INVENTARIO) FROM tp_inventario_producto WHERE CS_PRODUCTO_ID = P.CS_PRODUCTO_ID GROUP BY CS_PRODUCTO_ID ) CI FROM  tp_producto P INNER JOIN tp_unidad_medida_producto TU ON P.FK_UNIDAD = TU.CS_UNIDAD_ID WHERE NM_ELIMINADO = 0 AND (P.DS_CODIGO_PRODUCTO LIKE '%".$term."%' OR P.DS_NOMBRE_PRODUCTO LIKE '%".$term."%' OR P.DS_DESCRIPCION_PRODUCTO LIKE '%".$term."%') LIMIT 10) tmp";

$query = mysqli_query($con, $sql);


while ($row=mysqli_fetch_array($query)){ ?>
	<tr>
		<td><?php echo $row['CS_PRODUCTO_ID']; ?></td>
		<td><?php echo $row['DS_CODIGO_PRODUCTO']; ?></td>
		<td><?php echo $row['DS_NOMBRE_PRODUCTO']; ?></td>
		<td><?php echo $row['DS_DESCRIPCION_PRODUCTO']; ?></td>
		<td><?php echo $row["CANTIDAD_INVENTARIO"]; ?></td>
		<td><input type="number" class="form-control" id="cantidad_<?php echo $row['CS_PRODUCTO_ID']; ?>"/></td>
		<td><input type="number" class="form-control" id="precio_<?php echo $row['CS_PRODUCTO_ID']; ?>" value="<?php echo $row['DB_PRECIO_VENTA_UND']; ?>"/></td>
		<td><button type="button" class="btn btn-primary btn_agregar_producto" id_prodcuto="<?php echo $row['CS_PRODUCTO_ID']; ?>" name=""><span class="glyphicon glyphicon-plus"></span></button></td>
	</tr>
<?php
}


mysqli_close($con);
?>			
