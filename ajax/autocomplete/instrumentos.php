<?php

include("../../config/db.php");
include("../../config/conexion.php");
/* If connection to database, run sql statement. */
if ($con) {
    $term = (isset($_REQUEST['term'])) ? $_REQUEST['term'] : '';
    $SQL = "SELECT
                t1.TIPO,
                t2.ID_INSTRUMENTO,
                t2.NOMBRE,
                t2.ID_TIPO_INSTRUMENTO
                FROM
                tp_instrumento AS t1
                INNER JOIN rs_instrumentos AS t2 ON t2.ID_TIPO_INSTRUMENTO = t1.ID
                WHERE t2.NOMBRE LIKE '%" . mysqli_real_escape_string($con, ($term)) . "%' OR t1.TIPO LIKE '%" . mysqli_real_escape_string($con, ($term)) . "%' "
            . " ORDER BY t2.NOMBRE LIMIT 50";
    $fetch = mysqli_query($con, $SQL);

    $resultado = array();

    while ($row = mysqli_fetch_array($fetch, MYSQLI_ASSOC)) {
        $resultado[] = array('id' => $row['ID_INSTRUMENTO'], "text" => $row['NOMBRE'], 'modelo' => $row);
    }

    echo json_encode(array("results" => $resultado));
}

/* Free connection resources. */
mysqli_close($con);

/* Toss back results as json encoded array. */
?>