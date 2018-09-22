<?php
// checking for minimum PHP version
if (version_compare(PHP_VERSION, '5.3.7', '<')) {
    exit("Sorry, Simple PHP Login does not run on a PHP version smaller than 5.3.7 !");
} else if (version_compare(PHP_VERSION, '5.5.0', '<')) {
    // if you are using PHP 5.3 or PHP 5.4 you have to include the password_api_compatibility_library.php
    // (this library adds the PHP 5.5 password hashing functions to older versions of PHP)
    require_once("../libraries/password_compatibility_library.php");
}
if (empty($_POST['DS_NOMBRE_BANDA'])) {
    $errors[] = "Nombre de la banda vacío";
} elseif (empty($_POST['DS_DESCRIPCION_BANDA'])) {
    $errors[] = "Descripción de la banda vacío";
} else {
    require_once ("../config/db.php"); //Contiene las variables de configuracion para conectar a la base de datos
    require_once ("../config/conexion.php"); //Contiene funcion que conecta a la base de datos

    $DS_NOMBRE_BANDA = mysqli_real_escape_string($con, (strip_tags($_POST["DS_NOMBRE_BANDA"], ENT_QUOTES)));

    $DS_DESCRIPCION_BANDA = mysqli_real_escape_string($con, (strip_tags($_POST["DS_DESCRIPCION_BANDA"], ENT_QUOTES)));


    $date_added = date("Y-m-d H:i:s");

    // write new user's data into database
    $sql = "INSERT INTO us_banda_usuario (CS_BANDA_ID, DS_NOMBRE_BANDA, id_contacto_banda, DS_DESCRIPCION_BANDA)
                            VALUES(" . $NM_DOCUMENTO_CONTACTO_ID . ", '" . $DS_NOMBRE_BANDA . "'," . $NM_DOCUMENTO_CONTACTO_ID . ",'" . $DS_DESCRIPCION_BANDA . "');";

    

    $query_new_banda = mysqli_query($con, $sql);

    $query_new_banda_contacto = mysqli_query($con, $sql2);

    // if user has been added successfully
    if ($query_new_banda) {
        $messages[] = "La banda ha sido creada con éxito.";
    } else {
        $errors[] = "Lo sentimos , el registro falló. Por favor, regrese y vuelva a intentarlo.";
    }
} else {
    $errors[] = "Un error desconocido ocurrió.";
}

if (isset($errors)) {
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
    if (isset($messages)) {
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