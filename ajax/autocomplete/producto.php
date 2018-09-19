<?php
include("../../config/db.php");
include("../../config/conexion.php");
/* If connection to database, run sql statement. */
if ($con)
{
	$term = (isset($_REQUEST['search'])) ? $_REQUEST['search'] : '';
	$fetch = mysqli_query($con,"SELECT * FROM tp_producto  WHERE DS_CODIGO_PRODUCTO LIKE '%" . mysqli_real_escape_string($con,($term)) . "%' OR DS_NOMBRE_PRODUCTO LIKE '%" . mysqli_real_escape_string($con,($term)) . "%' LIMIT 50"); 

    $resultado = array();

	while ($row = mysqli_fetch_array($fetch, MYSQLI_ASSOC)) {
		$resultado[] = array('id' => $row['CS_PRODUCTO_ID'], "text" => $row['DS_CODIGO_PRODUCTO']."-".$row['DS_NOMBRE_PRODUCTO'], 'modelo' => $row);
	}

	echo json_encode(array("results" => $resultado));

	
}

/* Free connection resources. */
mysqli_close($con);

/* Toss back results as json encoded array. */
?>