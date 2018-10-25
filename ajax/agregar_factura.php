<?php
 session_start();    
 include_once "../classes/Factura.php";     
 include_once "../classes/Inventario.php";     
//rint_r($_SESSION["NM_DOCUMENTO_ID"]);
//print_r($_REQUEST['PRODUCTO']);die;
// checking for minimum PHP version
if (version_compare(PHP_VERSION, '5.3.7', '<')) {
    exit("Sorry, Simple PHP Login does not run on a PHP version smaller than 5.3.7 !");
} else if (version_compare(PHP_VERSION, '5.5.0', '<')) {
    // if you are using PHP 5.3 or PHP 5.4 you have to include the password_api_compatibility_library.php
    // (this library adds the PHP 5.5 password hashing functions to older versions of PHP)
    require_once("../libraries/password_compatibility_library.php");
}       
        if (empty($_REQUEST['Venta'])){
            $errors[] = "Faltan los datos  de la venta.";
        } elseif (empty($_REQUEST['Venta']["id_cliente"])){
            $errors[] = "Falta el cliente";
        }  elseif (empty($_REQUEST['Venta']["codigo"])){
            $errors[] = "Falta el código de la factura.";
        }  elseif (empty($_REQUEST['Venta']["estado"])){
            $errors[] = "Falta el estado de la factura.";
        }  elseif (!isset($_REQUEST['PRODUCTO'])) {
            $errors[] = "Se deben adicionar productos a la venta.";
        }  elseif (count($_REQUEST['PRODUCTO'])<=0) {
            $errors[] = "Se deben adicionar productos a la venta.";
        }   else {
        	require_once ("../config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
            require_once ("../config/conexion.php");//Contiene funcion que conecta a la base de datos
            if($_REQUEST['Venta']["id_cliente"] < 0)
            	$_REQUEST['Venta']["id_cliente"] = "null";
            else
            	$_REQUEST['Venta']["cliente"] = null;
            $sql = "INSERT INTO ft_factura (NM_PRECIO_DESCUENTO, NM_PORCENTAJE_DESCUENTO, DS_CODIGO_FACTURA, NM_VENDEDOR_ID, DS_NOTAS_FACTURA, NM_PRECIO_SUBTOTAL, NM_PRECIO_TOTAL, NM_PRECIO_IVA, DT_FECHA_CREACION, NM_CLIENTE_ID, DS_CLIENTE,ID_ESTADO)
                            VALUES('".$_REQUEST['Venta']['precio_descuento']."','".$_REQUEST['Venta']['porcentaje_descuento_incentivo']."','".$_REQUEST['Venta']['codigo']."', '".$_SESSION["NM_DOCUMENTO_ID"]."','".$_REQUEST['Venta']["nota"]."', '".$_REQUEST['Venta']['precio_subtotal']."', ".$_REQUEST['Venta']['precio_total']. ",".$_REQUEST['Venta']['precio_iva'].",'".date("Y-m-d h:i:s")."',".$_REQUEST['Venta']["id_cliente"].",'".$_REQUEST['Venta']["cliente"]."', '".$_REQUEST['Venta']["estado"]."');";
            
            $query_new_user_insert = mysqli_query($con,$sql);
            if ($query_new_user_insert) {
	            $id_factura = mysqli_insert_id($con);

	            foreach ($_REQUEST['PRODUCTO'] as $id_producto => $producto) {
	            	$SQL = "INSERT INTO ft_factura_detalle(CS_FACTURA_ID,NM_CANTIDAD_COMPRA,CS_PRODUCTO_ID, NM_PRECIO_TOTAL_PRODUCTO, NM_PRECIO_UNITARIO) VALUES('".$id_factura."','".$producto['CANTIDAD_PRODUCTO']."','".$producto['ID_PRODUCTO']."','".$producto['PRECIO_TOTAL_PRODUCTO']."','".$producto['PRECIO_PRODUCTO']."')";
	            	if(mysqli_query($con,$SQL)){
	            		continue;
	            	}else{
	            		$messages[] = "Error insertando el detalle de la factura ".$id_factura;
	            	}
	            }

                $messages[] = "La factura fue creada exitosamente.";
            } else {
                $errors[] = mysqli_error($con);
            }
            
        }
        
        $respuesta = array();
        if (isset($errors)){
            $respuesta["result"] = false;

           $respuesta["htmlResult"] = '<div class="alert alert-danger" role="alert">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>Error!</strong>';

                        foreach ($errors as $error) {
                                $respuesta["htmlResult"] .= $error;
                            }
            $respuesta["htmlResult"] .= '</div>';

        }
        if (isset($messages)){
        	//if ($_REQUEST['Venta']["estado"] == 1) {
        	Inventario::descontarProductosInventario($_REQUEST['PRODUCTO'],$con);
        	//} 

           $respuesta["result"] = true;
           $respuesta["htmlResult"] = '<div class="alert alert-success" role="alert">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>¡Bien hecho!</strong>';
                    
                    foreach ($messages as $message) {
                            $respuesta["htmlResult"] .= $message;
                    }
            $num_fact = Factura::obtenerSiguienteConsecutivoFactura();
            $respuesta["consecutivoFactura"] = str_pad($num_fact[0], 10, "0", STR_PAD_LEFT);
            $respuesta["idFactura"] = $id_factura;
        }

    echo json_encode($respuesta);
    mysqli_close($con);
?>