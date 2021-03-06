<?php

// checking for minimum PHP version
if (version_compare(PHP_VERSION, '5.3.7', '<')) {
    exit("Sorry, Simple PHP Login does not run on a PHP version smaller than 5.3.7 !");
} else if (version_compare(PHP_VERSION, '5.5.0', '<')) {
    // if you are using PHP 5.3 or PHP 5.4 you have to include the password_api_compatibility_library.php
    // (this library adds the PHP 5.5 password hashing functions to older versions of PHP)
    require_once("../libraries/password_compatibility_library.php");
}       
        if (empty($_POST['NM_DOCUMENTO_ID'])){
            $errors[] = "Numerode documento vacíos";
        } elseif (empty($_POST['CS_TIPO_DOCUMENTO_ID'])){
            $errors[] = "Tipo documento vacíos";
        }  elseif (empty($_POST['DS_NOMBRES_USUARIO'])) {
            $errors[] = "Nombre de usuario vacío";
        }  elseif (empty($_POST['DS_APELLIDOS_USUARIO'])) {
            $errors[] = "Apellidos de usuario vacío";
        }  elseif (empty($_POST['NM_TELEFONO'])) {
            $errors[] = "Telefono de usuario vacío";
        }  elseif (empty($_POST['NM_CELULAR'])) {
            $errors[] = "Celular de usuario vacío";
        } elseif (empty($_POST['DS_CORREO'])) {
            $errors[] = "Correo de usuario vacío";
        }   elseif (strlen($_POST['DS_NOMBRES_USUARIO']) > 64 || strlen($_POST['DS_NOMBRES_USUARIO']) < 2) {
            $errors[] = "Nombre de usuario no puede ser inferior a 2 o más de 64 caracteres";
        } elseif (!filter_var($_POST['DS_CORREO'], FILTER_VALIDATE_EMAIL)) {
            $errors[] = "Su dirección de correo electrónico no está en un formato de correo electrónico válida";
        } elseif (
            !empty($_POST['DS_NOMBRES_USUARIO'])
            && !empty($_POST['NM_DOCUMENTO_ID'])
            && !empty($_POST['CS_TIPO_DOCUMENTO_ID'])
            && strlen($_POST['DS_NOMBRES_USUARIO']) <= 64
            && strlen($_POST['DS_NOMBRES_USUARIO']) >= 2
            && !empty($_POST['DS_CORREO'])
            && strlen($_POST['DS_CORREO']) <= 64
            && filter_var($_POST['DS_CORREO'], FILTER_VALIDATE_EMAIL)
        ) {
            require_once ("../config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
            require_once ("../config/conexion.php");//Contiene funcion que conecta a la base de datos
            
                // escaping, additionally removing everything that could be (html/javascript-) code
                $DS_NOMBRES_USUARIO = mysqli_real_escape_string($con,(strip_tags($_POST["DS_NOMBRES_USUARIO"],ENT_QUOTES)));

                $CS_TIPO_DOCUMENTO_ID = mysqli_real_escape_string($con,(strip_tags($_POST["CS_TIPO_DOCUMENTO_ID"],ENT_QUOTES)));

                $DS_APELLIDOS_USUARIO = mysqli_real_escape_string($con,(strip_tags($_POST["DS_APELLIDOS_USUARIO"],ENT_QUOTES)));

                $NM_TELEFONO = mysqli_real_escape_string($con,(strip_tags($_POST["NM_TELEFONO"],ENT_QUOTES)));

                $NM_CELULAR = mysqli_real_escape_string($con,(strip_tags($_POST["NM_CELULAR"],ENT_QUOTES)));

                $CS_TIPO_USUARIO_ID = mysqli_real_escape_string($con,(strip_tags($_POST["CS_TIPO_USUARIO_ID"],ENT_QUOTES)));

                $NM_DOCUMENTO_ID = mysqli_real_escape_string($con,(strip_tags($_POST["NM_DOCUMENTO_ID"],ENT_QUOTES)));
                
                $DS_DIRECCION = mysqli_real_escape_string($con,(strip_tags($_POST["DS_DIRECCION"],ENT_QUOTES)));

                $DS_CORREO = mysqli_real_escape_string($con,(strip_tags($_POST["DS_CORREO"],ENT_QUOTES)));
                $user_password = $_POST['NM_DOCUMENTO_ID'];
                $date_added=date("Y-m-d H:i:s");
                // crypt the user's password with PHP 5.5's sha1() function, results in a 60 character
                // hash string. the PASSWORD_DEFAULT constant is defined by the PHP 5.5, or if you are using
                // PHP 5.3/5.4, by the password hashing compatibility library
                $user_password_hash = sha1($user_password);
                
                 $sql = "SELECT * FROM us_usuario WHERE NM_DOCUMENTO_ID = '" . $NM_DOCUMENTO_ID . "' LIMIT 1;";
                 $std =  mysqli_query($con, $sql);
                if(mysqli_num_rows($std)>0){
                    $errors[] = "Lo sentimos, este número de documento ya fue vinculado a una cuenta eliminada. Contactese con el administrador, para reactivar la cuenta.";
                }else{
                    // check if user or email address already exists
                    $sql = "SELECT * FROM us_usuario WHERE  DS_CORREO = '" . $DS_CORREO . "' OR NM_DOCUMENTO_ID = '" . $NM_DOCUMENTO_ID . "' LIMIT 1;";
                    $query_check_user_name = mysqli_query($con, $sql);

                    $query_check_user = mysqli_num_rows($query_check_user_name);
                    if ($query_check_user == 1) {
                        $row = mysqli_fetch_assoc($query_check_user_name);
                        if ($row["DS_CORREO"] == $DS_CORREO) {
                            $errors[] = "Lo sentimos , la dirección de correo electrónico ya está en uso.";
                        } else if ($row["NM_DOCUMENTO_ID"] == $NM_DOCUMENTO_ID) {
                            $errors[] = "Lo sentimos , este número de documento ya fue registrado.";
                        }
                    } else {
                        // write new user's data into database
                        $sql = "INSERT INTO us_usuario (DS_DIRECCION, NM_DOCUMENTO_ID, CS_TIPO_DOCUMENTO_ID, DS_NOMBRES_USUARIO, DS_APELLIDOS_USUARIO, NM_TELEFONO, NM_CELULAR, DS_CORREO, DS_CONTRASENA, CS_TIPO_USUARIO_ID, CS_ESTADO_ID, ENVIO_CORREO_ACTIVACION)
                                VALUES('".$DS_DIRECCION."','".$NM_DOCUMENTO_ID."',".$CS_TIPO_DOCUMENTO_ID.",'" . $DS_NOMBRES_USUARIO . "', '" . $DS_APELLIDOS_USUARIO . "', " . $NM_TELEFONO . ",".$NM_CELULAR.",'".$DS_CORREO."','".$user_password_hash."','".$CS_TIPO_USUARIO_ID."',2,1);";


                        $query_new_user_insert = mysqli_query($con,$sql);

                        // if user has been added successfully
                        if ($query_new_user_insert) {
                            $messages[] = "La cuenta ha sido creada con éxito.";
                        } else {
                            $errors[] = "Lo sentimos , el registro falló. ". mysqli_error($con);
                        }
                    }
                }
        } else {
            $errors[] = "Un error desconocido ocurrió.";
        }
        
        if (isset($errors)){
            
            ?>
            <div class="alert alert-danger" role="alert">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>Error!</strong> 
                    <?php
                        foreach ($errors as $error) {
                                echo $error;
                            }
                        ?>
            </div>
            <?php
            }
            if (isset($messages)){
                
                ?>
                <div class="alert alert-success" role="alert">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <strong>¡Bien hecho!</strong>
                        <?php
                            foreach ($messages as $message) {
                                    echo $message;
                                }
                            ?>
                </div>
                <?php
            }

?>