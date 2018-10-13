<?php 

/**
 * 
 */
class Factura
{
	static $cnn;
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

    public static function obtenerMediosDePago($cnn)
    {
        self::$cnn = $cnn;
        $SQL = "SELECT * from ft_forma_pago";
        mysqli_set_charset(self::$cnn,"utf8");
        $result=mysqli_query(self::$cnn,$SQL); 
        return mysqli_fetch_all($result, MYSQLI_ASSOC);
    }

    public static function obtenerProductosFactura($id_factura, $cnn)
    {
        self::$cnn = $cnn;
        $SQL = "SELECT t1.CS_PRODUCTO_ID AS ID_PRODUCTO, t1.NM_CANTIDAD_COMPRA AS CANTIDAD_PRODUCTO, t1.NM_PRECIO_UNITARIO AS PRECIO_PRODUCTO, t1.NM_PRECIO_TOTAL_PRODUCTO AS PRECIO_TOTAL_PRODUCTO, t1.NM_ID_DETALLE_FACTURA, (SELECT SUM(t2.NM_CANTIDAD_INVENTARIO) FROM tp_inventario_producto t2 WHERE t2.CS_PRODUCTO_ID = t1.CS_PRODUCTO_ID GROUP BY t2.CS_PRODUCTO_ID) CANTIDAD_INVENTARIO, t3.DS_NOMBRE_PRODUCTO AS DS_PRODUCTO FROM ft_factura_detalle t1 INNER JOIN tp_producto t3 ON t3.CS_PRODUCTO_ID = t1.CS_PRODUCTO_ID
                WHERE CS_FACTURA_ID = '$id_factura'
                ";
        $result=mysqli_query(self::$cnn,$SQL); 
        return mysqli_fetch_all($result, MYSQLI_ASSOC);
    }

    public static function obtenerFacturasPendientesDePagoUsuario($id_cliente, $cnn)
    {
        self::$cnn = $cnn;
        $SQL = "SELECT * from ft_factura t1 WHERE t1.ID_ESTADO = 2 AND t1.NM_CLIENTE_ID = '".$id_cliente."'";
        $result=mysqli_query(self::$cnn,$SQL); 
        return mysqli_fetch_all($result, MYSQLI_ASSOC);   
    }

    public static function pagarFactura($id_factura, $id_forma_pago, $notas, $cnn)
    {
        self::$cnn = $cnn;
        $SQL = "UPDATE ft_factura SET ID_ESTADO = 1, ID_FORMA_PAGO = '".$id_forma_pago."', DS_NOTAS_FACTURA = '".$notas."' WHERE CS_FACTURA_ID = $id_factura";
        return mysqli_query(self::$cnn,$SQL); 
    }    

	public static function obtenerEstadoFactura(){
        $db_connection = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
       	$sql = "SELECT * FROM ft_estado";
        
        $db_connection->query($sql);
        
        $result = $db_connection->query($sql);
        $row = $result->fetch_all();
        $db_connection->close();
        return $row;    

    }    
}