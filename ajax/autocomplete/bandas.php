<?php
include("../../config/db.php");
include("../../config/conexion.php");
/* If connection to database, run sql statement. */
if ($con)
{
	$term = (isset($_REQUEST['search'])) ? $_REQUEST['search'] : '';
	$SQL = "SELECT * FROM us_banda_usuario WHERE DS_NOMBRE_BANDA LIKE '%" . mysqli_real_escape_string($con,($term)) . "%' LIMIT 50";
	$fetch = mysqli_query($con,$SQL); 

    $resultado = array();

	while ($row = mysqli_fetch_array($fetch, MYSQLI_ASSOC)) {
		$resultado[] = array('id' => $row['CS_BANDA_ID'], "text" => $row['DS_NOMBRE_BANDA'], 'modelo' => $row);
	}

	echo json_encode(array("results" => $resultado));

	
}

/* Free connection resources. */
mysqli_close($con);

/* Toss back results as json encoded array. */
?>