<?php

header('Content-Type: application/json');
$pdo = new PDO("mysql:dbname=salaestudiodb;host=localhost;charset=utf8", "root", "root");

$accion = (isset($_GET['accion'])) ? $_GET['accion'] : 'leer';
switch ($accion) {
    case 'obtenerUsuario':
        $SQL = "SELECT NM_DOCUMENTO_ID AS id, CONCAT(NM_DOCUMENTO_ID, ' - ', DS_NOMBRES_USUARIO, ' ',DS_APELLIDOS_USUARIO) AS text FROM us_usuario WHERE NM_DOCUMENTO_ID = '" . $_GET['NM_DOCUMENTO'] . "'";
        $consulta = $pdo->prepare($SQL);
        $consulta->execute();
        $resultado1 = $consulta->fetch(PDO::FETCH_ASSOC);
        $SQL = "SELECT t1.CS_BANDA_ID, t1.DS_DESCRIPCION_BANDA, t1.DS_NOMBRE_BANDA, t1.DS_NOMBRE_BANDA AS text, t1.CS_BANDA_ID AS id FROM us_banda_usuario AS t1
		WHERE t1.CS_BANDA_ID = '" . $_GET['ID_BANDA'] . "'";
        $consulta = $pdo->prepare($SQL);
        $consulta->execute();
        $resultado2 = $consulta->fetch(PDO::FETCH_ASSOC);
        
        $SQL = "SELECT t10.TIPO, t9.NOMBRE, t9.ID_INSTRUMENTO, t9.ID_TIPO_INSTRUMENTO FROM rs_reserva_instrumentos AS t8 INNER JOIN rs_instrumentos AS t9 ON t8.ID_INSTRUMENTO = t9.ID_INSTRUMENTO INNER JOIN tp_instrumento AS t10 ON t9.ID_TIPO_INSTRUMENTO = t10.ID 
		WHERE t8.ID_RESERVA =  '" . $_GET['ID_RESERVA'] . "'";
        $consulta = $pdo->prepare($SQL);
        $consulta->execute();
        $resultado3 = $consulta->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode(array("usuario" => $resultado1, "banda" => $resultado2, 'instrumentos' => $resultado3));
        break;
    case 'guardar':

        $fecha1 = new DateTime(); //fecha servidor
        $fecha2 = DateTime::createFromFormat('Y-m-d H:i', $_POST['start']);
        $intervalo = $fecha1->diff($fecha2);

        if ($intervalo->invert == 1) {
            echo json_encode(array("respuesta" => "hora"));
            break;
        } else {
            $consulta = $pdo->prepare("SELECT * FROM rs_reserva_sala where sala=1 and start BETWEEN :start and :end");
            $res = $consulta->execute(array(
                "start" => $_POST['start'],
                "end" => $_POST['end']
            ));
            if ($consulta->rowCount() > 0) {
                echo json_encode(array("respuesta" => "error"));
                break;
            } else {

                $sentenciaSQL = $pdo->prepare("INSERT INTO rs_reserva_sala(documento, sala, start, end, title, DS_ESTADO, color,id_banda,descripcion) VALUES(:documento, 1,:start,:end,:title,:estado,:color,:banda,:descripcion)");
                $respuesta = $sentenciaSQL->execute(array(
                    "documento" => $_POST['documento'],
                    "start" => $_POST['start'],
                    "end" => $_POST['end'],
                    "title" => $_POST['title'],
                    "estado" => "Activo",
                    "color" => $_POST['color'],
                    "banda" => $_POST['id_banda'],
                    "descripcion" => $_POST['descripcion'],
                ));

                if ($respuesta) {
                    $ID_RESERVA = $pdo->lastInsertId();

                    if(isset($_POST["instrumentos"])){
                        foreach ($_POST["instrumentos"] as $ID_INSTRUMENTO){
                            $sentenciaSQL = $pdo->prepare("INSERT INTO rs_reserva_instrumentos(ID_RESERVA, ID_INSTRUMENTO) VALUES(:ID_RESERVA, :ID_INSTRUMENTO)");
                            $respuesta = $sentenciaSQL->execute(array(
                                "ID_RESERVA" => $ID_RESERVA,
                                "ID_INSTRUMENTO" => $ID_INSTRUMENTO,
                            ));
                        }
                    }
                    
                    $query = $pdo->prepare("SELECT
                                            t1.NM_DOCUMENTO_ID,
                                            t1.DS_NOMBRES_USUARIO,
                                            t1.DS_CORREO,
                                            t2.CS_BANDA_ID,
                                            t3.DS_NOMBRE_BANDA,
                                            (SELECT GROUP_CONCAT(t9.NOMBRE SEPARATOR ', ') FROM rs_reserva_instrumentos AS t8 INNER JOIN rs_instrumentos AS t9 ON t8.ID_INSTRUMENTO = t9.ID_INSTRUMENTO WHERE t8.ID_RESERVA = $ID_RESERVA) INSTRUMENTOS_RESERVA,
                                            (SELECT GROUP_CONCAT(CONCAT(t6.DS_NOMBRES_USUARIO,' ',t6.DS_APELLIDOS_USUARIO) SEPARATOR ', ') FROM us_banda_detalle_usuario t5 INNER JOIN us_usuario t6 ON t6.NM_DOCUMENTO_ID = t5.NM_DOCUMENTO_ID WHERE t5.ES_LIDER = 1 AND t5.CS_BANDA_ID = t3.CS_BANDA_ID) LIDER 
                                            FROM
                                            us_usuario AS t1
                                            INNER JOIN us_banda_detalle_usuario AS t2 ON t2.NM_DOCUMENTO_ID = t1.NM_DOCUMENTO_ID
                                            INNER JOIN us_banda_usuario AS t3 ON t2.CS_BANDA_ID = t3.CS_BANDA_ID

                                            WHERE t2.CS_BANDA_ID = :CS_BANDA_ID");
                    $query->execute(array("CS_BANDA_ID" => $_POST['id_banda']));
                    //$query->execute(array("CS_BANDA_ID" => -1));

                    $correo = "softban@gmail.com";
                    $headers = "From: $correo \r\n";
                    $headers .= "MIME-Version: 1.0\r\n";
                    $headers .= "Content-Type: text/html; charset=utf-8 \r\n";
                    foreach ($query->fetchAll(PDO::FETCH_ASSOC) as $row) {
                        $mensaje = "<html>"
                                . "<b>Hola " . $row["DS_NOMBRES_USUARIO"] . "</b>, se realizo una reserva a través de la aplicación de la banda <b>" . $row["DS_NOMBRE_BANDA"] . "</b>, de la cual eres integrante. Los siguientes datos corresponden a la reserva.<br/><br/>";
                        $mensaje .= "<b>Lider de la bada: </b>" . $row["LIDER"] . ".<br/>";
                        $mensaje .= "<b>Fecha: </b>" . date("Y-m-d", strtotime($_POST['start'])) . ".<br/>";
                        $mensaje .= "<b>Hora inicial: </b>" . date("H:i", strtotime($_POST['start'])) . ".<br/>";
                        $mensaje .= "<b>Hora final: </b>" . date("H:i", strtotime($_POST['end'])) . ".<br/>";
                        $mensaje .= "<b>Descripción: </b>" . $_POST['descripcion'] . "<br/>";
                        $mensaje .= "<b>Sala: </b> Sala 1 | hora: 24000<br/>";
                        if(!empty($row["INSTRUMENTOS_RESERVA"]))
                            $mensaje .= "<b>Instrumentos: </b>" . $row["INSTRUMENTOS_RESERVA"] . "<br/>";

                        if (mail($row["DS_CORREO"], "Reserva realizada", $mensaje, $headers)) {
                            //echo "Mensaje enviado";
                            //header("Location:login.php");
                        } else {
                            die("Algo falló con el envió de correo");
                        }
                    }
                    echo json_encode(array("respuesta" => "exitoso"));
                } else {
                    echo json_encode(array("respuesta" => "error"));
                }
                break;
            }
        }
        break;
    case 'eliminar':

        $fecha1 = new DateTime(); //fecha servidor
        $fecha2 = DateTime::createFromFormat('Y-m-d H:i:s', $_POST['start']);
        $intervalo = $fecha1->diff($fecha2);
        if ($intervalo->format('%d') == 0 and $intervalo->format('%h') < 8) {
            echo json_encode(array("respuesta" => "error"));
            break;
        } else {
            if (isset($_POST['id'])) {
                $sentenciaSQL = $pdo->prepare("DELETE FROM rs_reserva_sala WHERE id=:id");
                $respuesta = $sentenciaSQL->execute(array("id" => $_POST['id']));
                echo json_encode(array("respuesta" => "exitoso"));
                break;
            }
        }
        break;
    case 'factura':
        session_start();
        $cons = $pdo->prepare("SELECT * FROM ft_factura where ID_RESERVA=:id and DS_NOTAS_FACTURA = 'Sala1'");
        $resp = $cons->execute(array(
            "id" => $_POST['id']
        ));
        if ($cons->rowCount() > 0) {
            echo json_encode(array("respuesta" => "error"));
            break;
        } else {

            $consulta = $pdo->prepare("SELECT NM_VALOR_HORA_SALA FROM rs_sala where CS_SALA_ID=1");
            $consulta->execute();
            $resultado1 = $consulta->fetch(PDO::FETCH_ASSOC);

            $consulta2 = $pdo->prepare("SELECT max(CS_FACTURA_ID) FROM ft_factura");
            $consulta2->execute();
            $resultado2 = $consulta2->fetch(PDO::FETCH_ASSOC);

            $factura = $resultado2['max(CS_FACTURA_ID)'] + 1;

            $fecha1 = DateTime::createFromFormat('Y-m-d H:i:s', $_POST['start']);
            $fecha2 = DateTime::createFromFormat('Y-m-d H:i:s', $_POST['end']);
            $intervalo = $fecha1->diff($fecha2);

            $consulta = $pdo->prepare("SELECT
										CONCAT(t1.DS_NOMBRES_USUARIO,' ',t1.DS_APELLIDOS_USUARIO) CLIENTE,
										t2.DS_NOMBRE_BANDA,
										t3.NM_PORCENTAJE_INCENTIVO
										FROM rs_reserva_sala AS t
										LEFT JOIN us_usuario AS t1 ON t.documento = t1.NM_DOCUMENTO_ID
										LEFT JOIN us_banda_usuario AS t2 ON t.id_banda = t2.CS_BANDA_ID
										INNER JOIN us_tipo_usuario AS t3 ON t1.CS_TIPO_USUARIO_ID = t3.CS_TIPO_USUARIO
										WHERE t.id = '" . $_POST['id'] . "'");
            $consulta->execute();
            $dataReserva = $consulta->fetch(PDO::FETCH_ASSOC);

            $subtotal = $resultado1["NM_VALOR_HORA_SALA"] * $intervalo->format('%h');
            $descuento = $subtotal * ($dataReserva["NM_PORCENTAJE_INCENTIVO"] / 100);
            $iva = $subtotal * 0.16;
            $total = $subtotal + $iva - $descuento;

            $sentenciaSQL = $pdo->prepare("INSERT INTO ft_factura(DS_CODIGO_FACTURA, NM_VENDEDOR_ID, DS_NOTAS_FACTURA, NM_PRECIO_SUBTOTAL, NM_PRECIO_TOTAL, NM_PRECIO_DESCUENTO, NM_PRECIO_IVA, NM_CLIENTE_ID, ID_ESTADO, ID_FORMA_PAGO, ID_RESERVA, NM_PORCENTAJE_DESCUENTO) VALUES('" . str_pad($factura, 10, "0", STR_PAD_LEFT) . "'," . $_SESSION["NM_DOCUMENTO_ID"] . " ,'Reserva hecha para la banda " . $dataReserva["DS_NOMBRE_BANDA"] . " en la sala1.'," . $subtotal . "," . $total . "," . $descuento . ", " . $iva . ", " . $_POST['documento'] . ", 2, 1, " . $_POST['id'] . ", " . $dataReserva["NM_PORCENTAJE_INCENTIVO"] . ")");
            $respuesta = $sentenciaSQL->execute();

            $consulta2 = $pdo->prepare("SELECT max(CS_FACTURA_ID) FROM ft_factura");
            $consulta2->execute();
            $resultado2 = $consulta2->fetch(PDO::FETCH_ASSOC);


            $sentenciaSQL = $pdo->prepare("INSERT INTO ft_factura_detalle(CS_FACTURA_ID, NM_CANTIDAD_COMPRA, CS_PRODUCTO_ID, NM_PRECIO_TOTAL_PRODUCTO, NM_PRECIO_UNITARIO)VALUES(" . $resultado2['max(CS_FACTURA_ID)'] . ",1 ,4," . $total . ", " . $resultado1["NM_VALOR_HORA_SALA"] . ")");
            $respuesta = $sentenciaSQL->execute();

            echo json_encode(array("respuesta" => "exitoso", "id_factura" => $resultado2['max(CS_FACTURA_ID)']));
            break;
        }
        break;
    case 'multa':

        session_start();
        $cons = $pdo->prepare("SELECT * FROM ft_factura where ID_RESERVA=:id and DS_NOTAS_FACTURA = 'Sala1 - Multa'");
        $resp = $cons->execute(array(
            "id" => $_POST['id']
        ));
        if ($cons->rowCount() > 0) {
            echo json_encode(array("respuesta" => "error"));
            break;
        } else {

            $consulta = $pdo->prepare("SELECT NM_VALOR_HORA_SALA FROM rs_sala where CS_SALA_ID=1");
            $consulta->execute();
            $resultado1 = $consulta->fetch(PDO::FETCH_ASSOC);

            $consulta2 = $pdo->prepare("SELECT max(CS_FACTURA_ID) FROM ft_factura");
            $consulta2->execute();
            $resultado2 = $consulta2->fetch(PDO::FETCH_ASSOC);

            $factura = $resultado2['max(CS_FACTURA_ID)'] + 1;

            $fecha1 = DateTime::createFromFormat('Y-m-d H:i:s', $_POST['start']);
            $fecha2 = DateTime::createFromFormat('Y-m-d H:i:s', $_POST['end']);
            $intervalo = $fecha1->diff($fecha2);

            $subtotal = $resultado1["NM_VALOR_HORA_SALA"] * $intervalo->format('%h');
            $subtotal = $subtotal / 2;
            $iva = $subtotal * 0.16;
            $total = $subtotal + $iva;

            $sentenciaSQL = $pdo->prepare("INSERT INTO ft_factura(DS_CODIGO_FACTURA, NM_VENDEDOR_ID, DS_NOTAS_FACTURA, NM_PRECIO_SUBTOTAL, NM_PRECIO_TOTAL, NM_PRECIO_DESCUENTO, NM_PRECIO_IVA, NM_CLIENTE_ID, ID_ESTADO, ID_FORMA_PAGO, ID_RESERVA) VALUES('" . str_pad($factura, 10, "0", STR_PAD_LEFT) . "'," . $_SESSION["NM_DOCUMENTO_ID"] . " ,'Sala1'," . $subtotal . "," . $total . ",0, " . $iva . ", " . $_POST['documento'] . ", 2, 1, " . $_POST['id'] . ")");
            $respuesta = $sentenciaSQL->execute();

            $consulta2 = $pdo->prepare("SELECT max(CS_FACTURA_ID) FROM ft_factura");
            $consulta2->execute();
            $resultado2 = $consulta2->fetch(PDO::FETCH_ASSOC);


            $sentenciaSQL = $pdo->prepare("INSERT INTO ft_factura_detalle(CS_FACTURA_ID, NM_CANTIDAD_COMPRA, CS_PRODUCTO_ID, NM_PRECIO_TOTAL_PRODUCTO, NM_PRECIO_UNITARIO)VALUES(" . $resultado2['max(CS_FACTURA_ID)'] . ",1 ,5," . $total . ", " . $resultado1["NM_VALOR_HORA_SALA"] . ")");
            $respuesta = $sentenciaSQL->execute();

            $sentenciaSQL = $pdo->prepare("INSERT INTO rs_multas_reserva(CS_RESERVA_ID, NM_VALOR_MULTA_SALA, DS_ESTADO)VALUES(" . $_POST['id'] . "," . $total . ", '1')");
            $respuesta = $sentenciaSQL->execute();

            echo json_encode(array("respuesta" => "exitoso", "id_factura" => $resultado2['max(CS_FACTURA_ID)']));
            break;
        }

    default:
        session_start();
        $query1 = $pdo->prepare("SELECT CS_TIPO_USUARIO_ID FROM us_usuario WHERE NM_DOCUMENTO_ID=" . $_SESSION["NM_DOCUMENTO_ID"] . "");
        $query1->execute();
        $resultado1 = $query1->fetch(PDO::FETCH_ASSOC);
        //print_r($resultado1);
        if ($resultado1["CS_TIPO_USUARIO_ID"] == 1) {

            $query = $pdo->prepare("SELECT *, true AS editable FROM rs_reserva_sala where sala = 1");
            $query->execute();

            $resultado = $query->fetchAll(PDO::FETCH_ASSOC);
            echo json_encode($resultado);
            break;
        } else {

            $query = $pdo->prepare("SELECT *,  IF(documento=" . $_SESSION["NM_DOCUMENTO_ID"] . ",true, false) AS editable FROM rs_reserva_sala where sala = 1");
            $query->execute();

            $resultado = $query->fetchAll(PDO::FETCH_ASSOC);
            echo json_encode($resultado);
            break;
        }
}
?>