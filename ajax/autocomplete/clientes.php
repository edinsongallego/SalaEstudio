<?php
include("../../config/db.php");
include("../../config/conexion.php");
/* If connection to database, run sql statement. */
if ($con)
{
	$term = (isset($_REQUEST['search'])) ? $_REQUEST['search'] : '';
	$fetch = mysqli_query($con,"SELECT * FROM (SELECT *, CONCAT(DS_NOMBRES_USUARIO, ' ',DS_APELLIDOS_USUARIO) DS_NOMBRE, (SELECT DT_FECHA_CREACION FROM ft_factura WHERE NM_CLIENTE_ID = cl.NM_DOCUMENTO_ID ORDER BY CS_FACTURA_ID DESC LIMIT 1) ULTIMA_COMPRA FROM us_usuario cl) tmp  WHERE DS_NOMBRE LIKE '%" . mysqli_real_escape_string($con,($term)) . "%' OR NM_DOCUMENTO_ID LIKE '%" . mysqli_real_escape_string($con,($term)) . "%' LIMIT 50"); 

    $resultado = array();

	while ($row = mysqli_fetch_array($fetch, MYSQLI_ASSOC)) {
		$resultado[] = array('id' => $row['NM_DOCUMENTO_ID'], "text" => $row['DS_NOMBRE'], 'modelo' => $row);
	}

	if (count($resultado) > 0) {
		echo json_encode(array("results" => $resultado));
	}else{
		echo json_encode(array("results" => array(array('id' => -1*rand(), 'text' => $term, 'modelo' => array()))));

	}
	
}

/* Free connection resources. */
mysqli_close($con);

/* Toss back results as json encoded array. */
?>