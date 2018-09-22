<?php
 session_start();    
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
        if (empty($_REQUEST['Inventario'])){
            $errors[] = "Faltan los datos para realizar la entrada.";
        } elseif (empty($_REQUEST['Inventario']["id_producto"])){
            $errors[] = "Falta el producto.";
        }  elseif (empty($_REQUEST['Inventario']["cantidad"])){
            $errors[] = "Falta la cantidad del producto.";
        }  elseif (empty($_REQUEST['Inventario']["precio_co"])){
            $errors[] = "Falta el precio de compra del producto.";
        }  elseif (empty($_REQUEST['Inventario']["id_vendedor"])){
            $errors[] = "Falta el proveedor del producto.";
        } else {
            require_once ("../config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
            require_once ("../config/conexion.php");//Contiene funcion que conecta a la base de datos
            $sql = "INSERT INTO tp_inventario_producto (CS_PRODUCTO_ID, NM_CANTIDAD_INVENTARIO, CS_VENDEDOR_PRODUCTO_ID, DT_FECHA_CREACION, NM_PRECIO_UNITARIO_COMPRA)
                            VALUES('".$_REQUEST['Inventario']['id_producto']."', '".$_REQUEST['Inventario']['cantidad']."','".$_REQUEST['Inventario']["id_vendedor"]."', NOW(), '".$_REQUEST['Inventario']['precio_co']."');";
            
            $query_new_user_insert = mysqli_query($con,$sql);
            if ($query_new_user_insert) {
	       $id_entrada = mysqli_insert_id($con);

                $messages[] = "La entrada del inventario fue realizada exitosamente.";
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
           $respuesta["result"] = true;
           $respuesta["htmlResult"] = '<div class="alert alert-success" role="alert">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>¡Bien hecho!</strong>';
                    
                    foreach ($messages as $message) {
                            $respuesta["htmlResult"] .= $message;
                    }
        }

    echo json_encode($respuesta);
    mysqli_close($con);
?>