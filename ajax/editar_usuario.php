<?php
include('is_logged.php'); //Archivo verifica que el usario que intenta acceder a la URL esta logueado
// checking for minimum PHP version
if (version_compare(PHP_VERSION, '5.3.7', '<')) {
    exit("Sorry, Simple PHP Login does not run on a PHP version smaller than 5.3.7 !");
} else if (version_compare(PHP_VERSION, '5.5.0', '<')) {
    // if you are using PHP 5.3 or PHP 5.4 you have to include the password_api_compatibility_library.php
    // (this library adds the PHP 5.5 password hashing functions to older versions of PHP)
    require_once("../libraries/password_compatibility_library.php");
}
if (empty($_POST['firstname2'])) {
    $errors[] = "Nombres vacíos";
} elseif (empty($_POST['lastname2'])) {
    $errors[] = "Apellidos vacíos";
} elseif (empty($_POST['estado'])) {
    $errors[] = "Estado Vacio";
} elseif (empty($_POST['tel'])) {
    $errors[] = "Telefono Vacio";
} elseif (empty($_POST['cel'])) {
    $errors[] = "Celular Vacio";
} elseif (empty($_POST['user_email2'])) {
    $errors[] = "El correo electrónico no puede estar vacío";
} elseif (strlen($_POST['user_email2']) > 64) {
    $errors[] = "El correo electrónico no puede ser superior a 64 caracteres";
} elseif (!filter_var($_POST['user_email2'], FILTER_VALIDATE_EMAIL)) {
    $errors[] = "Su dirección de correo electrónico no está en un formato de correo electrónico válida";
} elseif (
        !empty($_POST['firstname2']) && !empty($_POST['lastname2']) && !empty($_POST['user_email2']) && strlen($_POST['user_email2']) <= 64 && filter_var($_POST['user_email2'], FILTER_VALIDATE_EMAIL)
) {
    require_once ("../config/db.php"); //Contiene las variables de configuracion para conectar a la base de datos
    require_once ("../config/conexion.php"); //Contiene funcion que conecta a la base de datos
    // escaping, additionally removing everything that could be (html/javascript-) code
    $firstname = mysqli_real_escape_string($con, (strip_tags($_POST["firstname2"], ENT_QUOTES)));
    $lastname = mysqli_real_escape_string($con, (strip_tags($_POST["lastname2"], ENT_QUOTES)));
    $user_email = mysqli_real_escape_string($con, (strip_tags($_POST["user_email2"], ENT_QUOTES)));
    $estado = mysqli_real_escape_string($con, (strip_tags($_POST["estado"], ENT_QUOTES)));

    $tel = mysqli_real_escape_string($con, (strip_tags($_POST["tel"], ENT_QUOTES)));

    $cel = mysqli_real_escape_string($con, (strip_tags($_POST["cel"], ENT_QUOTES)));

    $direccion = mysqli_real_escape_string($con, (strip_tags($_POST["DS_DIRECCION"], ENT_QUOTES)));

    $user_id = $_POST['mod_id'];


    // write new user's data into database
    $sql = "UPDATE us_usuario SET DS_DIRECCION = '" . $direccion . "', DS_NOMBRES_USUARIO='" . $firstname . "', DS_APELLIDOS_USUARIO='" . $lastname . "', DS_CORREO='" . $user_email . "', CS_ESTADO_ID='" . $estado . "',NM_CELULAR='" . $cel . "',NM_TELEFONO='" . $tel . "', ENVIO_CORREO_ACTIVACION=1
                            WHERE NM_DOCUMENTO_ID='" . $user_id . "';";
    $query_update = mysqli_query($con, $sql);

    if (isset($_POST["enviar_correo"]) && $_POST["enviar_correo"] == 1) {
        $correo = "softban@gmail.com";
        $headers = "From: $correo \r\n";
        //$headers .= "Reply-To: $correo \r\n";
        $headers .= "MIME-Version: 1.0\r\n";
        $headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";
        $mensaje = "<html>"
                . "<b>Hola ".$firstname."</b>, tu cuenta fue activada por <b>".$_SESSION["DS_NOMBRES_USUARIO"]."</b>, ya puede ingresar al aplicativo.<br/><br/>";
        $mensaje .= "</html>";
        if (mail($user_email, "Cuenta activa", $mensaje, $headers)) {
            //echo "Mensaje enviado";
            //header("Location:login.php");
        }else{
            die("Algo falló con el envió de correo");
        }   
    }

    // if user has been added successfully
    if ($query_update) {
        $messages[] = "La cuenta ha sido modificada con éxito.";
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