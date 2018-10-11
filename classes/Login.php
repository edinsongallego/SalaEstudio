<?php

/**
 * Class login
 * handles the user's login and logout process
 */
class Login
{
    /**
     * @var object The database connection
     */
    private $db_connection = null;
    /**
     * @var array Collection of error messages
     */
    public $errors = array();
    /**
     * @var array Collection of success / neutral messages
     */
    public $messages = array();

    /**
     * the function "__construct()" automatically starts whenever an object of this class is created,
     * you know, when you do "$login = new Login();"
     */
    public function __construct()
    {
        // create/read session, absolutely necessary
        session_start();

        // check the possible login actions:
        // if user tried to log out (happen when user clicks logout button)
        if (isset($_GET["logout"])) {
            $this->doLogout();
        }
        // login via post data (if user just submitted a login form)
        elseif (isset($_POST["login"])) {
            $this->dologinWithPostData();
        }
    }

    public static function obtenerListadoPerfiles($id = array()){
        $db_connection = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
        if (count($id) > 0) {
            $sql = "SELECT * FROM us_tipo_usuario WHERE CS_TIPO_USUARIO IN (".implode(",", $id).")";
        }else{
            $sql = "SELECT * FROM us_tipo_usuario";
        }

        $db_connection->query($sql);
        
        $result = $db_connection->query($sql);
        $r = array();
         while($row = $result->fetch_assoc())
            $r[] = $row;
        $db_connection->close();
        return $r;    

    }

    /**
     * log in with post data
     */
    private function dologinWithPostData()
    {
        // check login form contents
        if (empty($_POST['DS_CORREO'])) {
            $this->errors[] = "El campo usuario esta vacio";
        } elseif (empty($_POST['DS_CONTRASENA'])) {
            $this->errors[] = "El campo contraseña esta vacio";
        } elseif (!empty($_POST['DS_CORREO']) && !empty($_POST['DS_CONTRASENA'])) {

            // create a database connection, using the constants from config/db.php (which we loaded in index.php)
            $this->db_connection = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

            // change character set to utf8 and check it
            if (!$this->db_connection->set_charset("utf8")) {
                $this->errors[] = $this->db_connection->error;
            }

            // if no connection errors (= working database connection)
            if (!$this->db_connection->connect_errno) {

                // escape the POST stuff
                $DS_CORREO = $this->db_connection->real_escape_string($_POST['DS_CORREO']);

                // database query, getting all the info of the selected user (allows login via email address in the
                // username field)
                $sql = "SELECT NM_DOCUMENTO_ID, DS_NOMBRES_USUARIO, DS_CORREO, DS_CONTRASENA, CS_TIPO_USUARIO_ID, CS_ESTADO_ID, RESTAURAR_CONTRASENA, NM_ELIMINADO
                FROM us_usuario
                WHERE DS_CORREO = '" . $DS_CORREO . "';";
                $result_of_login_check = $this->db_connection->query($sql);

                // if this user exists
                if (@$result_of_login_check->num_rows == 1) {

                    // get result row (as an object)
                    $result_row = $result_of_login_check->fetch_object();

                    // using PHP 5.5's password_verify() function to check if the provided password fits
                    // the hash of that user's password

                    
                    if (password_verify($_POST['DS_CONTRASENA'], $result_row->DS_CONTRASENA)) {

                        // write user data into PHP SESSION (a file on your server)
                        $_SESSION['NM_DOCUMENTO_ID'] = $result_row->NM_DOCUMENTO_ID;
                        $_SESSION['DS_NOMBRES_USUARIO'] = $result_row->DS_NOMBRES_USUARIO;
                        $_SESSION['DS_CORREO'] = $result_row->DS_CORREO;
                        $_SESSION['CS_TIPO_USUARIO_ID'] = $result_row->CS_TIPO_USUARIO_ID;
                        $_SESSION['CS_ESTADO_ID'] = $result_row->CS_ESTADO_ID;
                        $_SESSION['RESTAURAR_CONTRASENA'] = $result_row->RESTAURAR_CONTRASENA;
                        $_SESSION['user_login_status'] = 1;


                    } else {
                        $this->errors[] = "Usuario y/o contraseña no coinciden.";
                    }

                    if ($result_row->CS_ESTADO_ID == 2) {
                        $this->errors[] = "Usuario Inactivo favor comunicarse con el administrador";
                        $_SESSION['user_login_status'] = 0;
                    }else if ($result_row->NM_ELIMINADO == 1) {
                        $this->errors[] = "Usuario eliminado favor comunicarse con el administrador";
                        $_SESSION['user_login_status'] = 0;
                    }

                } else {
                    $this->errors[] = "Usuario y/o contraseña no coinciden.";
                }
            } else {
                $this->errors[] = "Problema de conexión de base de datos.";
            }
        }
    }

    /**
     * perform the logout
     */
    public function doLogout()
    {
        // delete the session of the user
        $_SESSION = array();
        session_destroy();
        // return a little feeedback message
        $this->messages[] = "Has sido desconectado.";

    }

    /**
     * simply return the current state of the user's login
     * @return boolean user's login status
     */
    public function isUserLoggedIn()
    {
        if (isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] == 1 AND isset($_SESSION['CS_TIPO_USUARIO_ID']) AND isset($_SESSION['CS_ESTADO_ID'])) {
            return true;
        }
        // default return
        return false;
    }

    public static function inicioSession()
    {
        session_start();
        if (isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] == 1 AND isset($_SESSION['CS_TIPO_USUARIO_ID']) AND isset($_SESSION['CS_ESTADO_ID'])) {

            return true;
        }
        // default return
        return false;
    }
}
