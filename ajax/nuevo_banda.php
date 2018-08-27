<?php

// checking for minimum PHP version
if (version_compare(PHP_VERSION, '5.3.7', '<')) {
    exit("Sorry, Simple PHP Login does not run on a PHP version smaller than 5.3.7 !");
} else if (version_compare(PHP_VERSION, '5.5.0', '<')) {
    // if you are using PHP 5.3 or PHP 5.4 you have to include the password_api_compatibility_library.php
    // (this library adds the PHP 5.5 password hashing functions to older versions of PHP)
    require_once("../libraries/password_compatibility_library.php");
}
        if (empty($_POST['NM_DOCUMENTO_CONTACTO_ID'])){
            $errors[] = "Numero de documento vacíos";
        } elseif (empty($_POST['CS_TIPO_DOCUMENTO_ID'])){
            $errors[] = "Tipo documento vacíos";
        }  elseif (empty($_POST['DS_NOMBRE_CONTACTO'])) {
            $errors[] = "Nombre de lider vacío";
        }  elseif (empty($_POST['DS_APELLIDO_CONTACTO'])) {
            $errors[] = "Apellidos de lider vacío";
        }  elseif (empty($_POST['DS_NOMBRE_BANDA'])) {
            $errors[] = "Nombre de la banda vacío";
        }  elseif (empty($_POST['DS_DESCRIPCION_BANDA'])) {
            $errors[] = "Descripción de la banda vacío";
        } elseif (empty($_POST['DS_CORREO_CONTACTO'])) {
            $errors[] = "Correo de lider vacío";
        }   elseif (strlen($_POST['DS_NOMBRE_CONTACTO']) > 64 || strlen($_POST['DS_NOMBRE_CONTACTO']) < 2) {
            $errors[] = "Nombre de lider no puede ser inferior a 2 o más de 64 caracteres";
        } elseif (!preg_match('/^[a-z\d]{2,64}$/i', $_POST['DS_NOMBRE_CONTACTO'])) {
            $errors[] = "Nombre de lider no encaja en el esquema de nombre: Sólo aZ y los números están permitidos , de 2 a 64 caracteres";
        }   elseif (!filter_var($_POST['DS_CORREO_CONTACTO'], FILTER_VALIDATE_EMAIL)) {
            $errors[] = "Su dirección de correo electrónico no está en un formato de correo electrónico válida";
        } elseif (
            !empty($_POST['DS_NOMBRE_CONTACTO'])
            && !empty($_POST['NM_DOCUMENTO_CONTACTO_ID'])
            && !empty($_POST['CS_TIPO_DOCUMENTO_ID'])
            && strlen($_POST['DS_NOMBRE_CONTACTO']) <= 64
            && strlen($_POST['DS_NOMBRE_CONTACTO']) >= 2
            && preg_match('/^[a-z\d]{2,64}$/i', $_POST['DS_NOMBRE_CONTACTO'])
            && !empty($_POST['DS_CORREO_CONTACTO'])
            && strlen($_POST['DS_CORREO_CONTACTO']) <= 64
            && filter_var($_POST['DS_CORREO_CONTACTO'], FILTER_VALIDATE_EMAIL)
        ) {
            require_once ("../config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
            require_once ("../config/conexion.php");//Contiene funcion que conecta a la base de datos

                // escaping, additionally removing everything that could be (html/javascript-) code
                $DS_NOMBRE_CONTACTO = mysqli_real_escape_string($con,(strip_tags($_POST["DS_NOMBRE_CONTACTO"],ENT_QUOTES)));

                $CS_TIPO_DOCUMENTO_ID = mysqli_real_escape_string($con,(strip_tags($_POST["CS_TIPO_DOCUMENTO_ID"],ENT_QUOTES)));

                $DS_APELLIDO_CONTACTO = mysqli_real_escape_string($con,(strip_tags($_POST["DS_APELLIDO_CONTACTO"],ENT_QUOTES)));

                $DS_NOMBRE_BANDA = mysqli_real_escape_string($con,(strip_tags($_POST["DS_NOMBRE_BANDA"],ENT_QUOTES)));

                $DS_DESCRIPCION_BANDA = mysqli_real_escape_string($con,(strip_tags($_POST["DS_DESCRIPCION_BANDA"],ENT_QUOTES)));



                $NM_DOCUMENTO_CONTACTO_ID = mysqli_real_escape_string($con,(strip_tags($_POST["NM_DOCUMENTO_CONTACTO_ID"],ENT_QUOTES)));

                $DS_CORREO_CONTACTO = mysqli_real_escape_string($con,(strip_tags($_POST["DS_CORREO_CONTACTO"],ENT_QUOTES)));

                $date_added=date("Y-m-d H:i:s");


                // check if user or email address already exists
                $sql = "SELECT * FROM us_banda_usuario WHERE DS_NOMBRE_BANDA = '" . $DS_NOMBRE_BANDA . "';";
                $query_check_user_name = mysqli_query($con,$sql);
                $query_check_user=mysqli_num_rows($query_check_user_name);
                if ($query_check_user == 1) {
                    $errors[] = "Lo sentimos , el nombre de la banda ya está en uso.";
                } else {
                    // write new user's data into database
                    $sql = "INSERT INTO us_banda_usuario (CS_BANDA_ID, DS_NOMBRE_BANDA, id_contacto_banda, DS_DESCRIPCION_BANDA)
                            VALUES(".$NM_DOCUMENTO_CONTACTO_ID.", '".$DS_NOMBRE_BANDA."',".$NM_DOCUMENTO_CONTACTO_ID.",'" . $DS_DESCRIPCION_BANDA . "');";

                    $sql2 = "INSERT INTO us_contactos_banda_usuario (NM_DOCUMENTO_CONTACTO_ID, CS_TIPO_DOCUMENTO_ID, DS_NOMBRE_CONTACTO, DS_APELLIDO_CONTACTO, DS_CORREO_CONTACTO)
                            VALUES(".$NM_DOCUMENTO_CONTACTO_ID.",".$CS_TIPO_DOCUMENTO_ID.",'" . $DS_NOMBRE_CONTACTO . "', '".$DS_APELLIDO_CONTACTO."', '".$DS_CORREO_CONTACTO."');";


                    $query_new_banda = mysqli_query($con,$sql);

                    $query_new_banda_contacto = mysqli_query($con,$sql2);

                    // if user has been added successfully
                    if ($query_new_banda) {
                        $messages[] = "La banda ha sido creada con éxito.";
                    } else {
                        $errors[] = "Lo sentimos , el registro falló. Por favor, regrese y vuelva a intentarlo.";
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