<?php
/**
 * 
 */
class Producto
{
	
	public function __construct()
	{

	}

	public static function obtenerUnidades()
	{
        $db_connection = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
        
        $sql = "SELECT * FROM tp_unidad_medida_producto";

        $db_connection->query($sql);
        
        $result = $db_connection->query($sql);
        $r = array();
         while($row = $result->fetch_assoc())
            $r[] = $row;
        $db_connection->close();
        return $r;    

	}
}