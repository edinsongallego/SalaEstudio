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
        if (empty($_REQUEST['nombre'])){
            $errors[] = "Faltan el nombre.";
        }  elseif (empty($_REQUEST['valor'])){
            $errors[] = "Falta el valor";
        }  elseif (empty($_REQUEST['capacidad'])){
            $errors[] = "Falta la capacidad de la sala.";
        }  elseif (empty($_REQUEST['descripcion'])){
            $errors[] = "Falta la descripción.";
        }  else {
            require_once ("../config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
            require_once ("../config/conexion.php");//Contiene funcion que conecta a la base de datos
            
            if(!isset($_REQUEST["id_sala"]) || empty($_REQUEST["id_sala"])){
                $sql = "INSERT INTO rs_sala (DS_NOMBRE_SALA, DS_DESCRIPCION_SALA, NM_VALOR_HORA_SALA, NM_CAPACIDAD_SALA)
                            VALUES('".$_REQUEST['nombre']."', '".$_REQUEST["descripcion"]."', '".$_REQUEST["valor"]."',".$_REQUEST['capacidad'].");";
                $mensaje = "La sala fue insertada.";
            }else{
                $sql = "UPDATE rs_sala SET DS_NOMBRE_SALA = '".$_REQUEST['nombre']."', DS_DESCRIPCION_SALA = '".$_REQUEST["descripcion"]."', NM_VALOR_HORA_SALA = '".$_REQUEST["valor"]."', NM_CAPACIDAD_SALA= '".$_REQUEST['capacidad']."' WHERE CS_SALA_ID = '".$_REQUEST["id_sala"]."'";           
                $mensaje = "La sala fue actualizada.";
            }
            
            $query_new_user_insert = mysqli_query($con,$sql);
            if ($query_new_user_insert) {
	        $messages[] = $mensaje;
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