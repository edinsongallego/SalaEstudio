<?php 

/**
 * 
 */
class Factura
{
	
	public function __construct()
	{
		
	}

	public static function obtenerSiguienteConsecutivoFactura(){
        $db_connection = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
       	$sql = "SELECT IFNULL(MAX(CS_FACTURA_ID),0) + 1 AS proximo_consecutivo  FROM ft_factura";
        
        $db_connection->query($sql);
        
        $result = $db_connection->query($sql);
        $row = $result->fetch_row();
        $db_connection->close();
        return $row;    

    }
}