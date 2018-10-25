<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Banda
 *
 * @author Oscar
 */
class Banda {

    static $cnn;

    public function __construct() {
        
    }

    public static function obtenerBandaUsuarioBanda($id_usuario_banda, $cnn) {
        self::$cnn = $cnn;
        $SQL = "SELECT * FROM us_banda_usuario t2 
                WHERE CS_BANDA_ID = '$id_usuario_banda'";
        $result = mysqli_query(self::$cnn, $SQL);
        if (mysqli_num_rows($result) > 0) {
            return mysqli_fetch_all($result, MYSQLI_ASSOC);
        } else {
            return null;
        }
    }

    public static function regustrarBandaUsuarioBanda($id_usuario_banda) {
        $SQL = "INSERT INTO us_banda_usuario (ID_USUARIO_BANDA) VALUES('$id_usuario_banda')";
        return mysqli_query(self::$cnn, $SQL);
    }

    public static function obtenerIntegrantesBanda() {
        $sql = "SELECT
                us_banda_detalle_usuario.ES_LIDER,
                us_usuario.NM_DOCUMENTO_ID,
                us_usuario.CS_TIPO_DOCUMENTO_ID,
                us_usuario.DS_NOMBRES_USUARIO,
                us_usuario.DS_APELLIDOS_USUARIO,
                us_usuario.NM_TELEFONO,
                us_usuario.NM_CELULAR,
                us_usuario.DS_CORREO,
                us_usuario.DS_DIRECCION,
                us_usuario.DS_CONTRASENA,
                us_usuario.CS_TIPO_USUARIO_ID,
                us_usuario.CS_ESTADO_ID,
                us_usuario.DT_FECHA_CREACION,
                us_usuario.RESTAURAR_CONTRASENA,
                CONCAT(us_usuario.DS_NOMBRES_USUARIO,' ',us_usuario.DS_APELLIDOS_USUARIO) AS DS_NOMBRE_USUARIO
                FROM
                us_usuario
                INNER JOIN us_banda_detalle_usuario ON us_banda_detalle_usuario.NM_DOCUMENTO_ID = us_usuario.NM_DOCUMENTO_ID
                WHERE
                us_banda_detalle_usuario.CS_BANDA_ID = $id_banda 
            ";
        $query = mysqli_query(self::$cnn, $sql);
        return mysqli_fetch_all($query, MYSQLI_ASSOC);
    }

}
