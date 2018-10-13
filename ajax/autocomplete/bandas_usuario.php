<?php
include("../../config/db.php");
include("../../config/conexion.php");
/* If connection to database, run sql statement. */
if ($con)
{
	if(!empty($_REQUEST["id_usuario"])){
		$term = (isset($_REQUEST['search'])) ? $_REQUEST['search'] : '';
		$SQL = "SELECT * FROM us_banda_usuario t1 INNER JOIN us_banda_detalle_usuario t2 ON t2.CS_BANDA_ID = t1.CS_BANDA_ID WHERE t2.NM_DOCUMENTO_ID = '".$_REQUEST["id_usuario"]."' AND t1.DS_NOMBRE_BANDA LIKE '%" . mysqli_real_escape_string($con,($term)) . "%' LIMIT 50";
		$fetch = mysqli_query($con,$SQL); 

	    $resultado = array();

		while ($row = mysqli_fetch_array($fetch, MYSQLI_ASSOC)) {
			$resultado[] = array('id' => $row['CS_BANDA_ID'], "text" => $row['DS_NOMBRE_BANDA'], 'modelo' => $row);
		}

		echo json_encode(array("results" => $resultado));
	}else{
		echo json_encode(array("results" => array()));
	}
	
}

/* Free connection resources. */
mysqli_close($con);

/* Toss back results as json encoded array. */
?>