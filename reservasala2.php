<?php
header('Content-Type: application/json');
$pdo = new PDO("mysql:dbname=salaestudiodb;host=localhost","root","root");

$accion= (isset($_GET['accion']))?$_GET['accion']:'leer';

switch ($accion) {
 	case 'guardar':

		$fecha1 = new DateTime();//fecha servidor
 		$fecha2 = DateTime::createFromFormat('Y-m-d H:i',$_POST['start']);
 		$intervalo = $fecha1->diff($fecha2);
 		
 		if($intervalo->invert==1){
 			echo json_encode(array("respuesta" => "hora"));
 			break;
 		}
 		else{
 				$consulta = $pdo->prepare("SELECT * FROM rs_reserva_sala where sala=2 and start BETWEEN :start and :end");
		 		$res=$consulta->execute(array(
				 	"start"=> $_POST['start'],
				 	"end"=> $_POST['end']
		 		));
		 		if($consulta->rowCount()>0){
		 			echo json_encode(array("respuesta" => "error"));
				 	break;
		 		}
		 		else{
		 			$sentenciaSQL = $pdo->prepare("INSERT INTO rs_reserva_sala(documento, sala, start, end, title, 	DS_ESTADO)VALUES(:documento, 2,:start,:end,:title,:estado)");
					$respuesta=$sentenciaSQL->execute(array(
				 		"documento"=> $_POST['documento'],
				 		"start"=> $_POST['start'],
				 		"end"=> $_POST['end'],
				 		"title"=> $_POST['title'],
				 		"estado"=>"Activo"

				 	));
				 	echo json_encode(array("respuesta" => "exitoso"));
				 	break;
		 		}

 		}
 	
	case 'eliminar':
 	
 		$fecha1 = new DateTime();//fecha servidor
 		$fecha2 = DateTime::createFromFormat('Y-m-d H:i:s',$_POST['start']);
 		$intervalo = $fecha1->diff($fecha2);
		if ($intervalo->format('%d')==0 and $intervalo->format('%h')<8) {
			echo json_encode(array("respuesta" => "error"));
		 	break;
		}else{
			if(isset($_POST['id'])){
	 			$sentenciaSQL = $pdo->prepare("DELETE FROM rs_reserva_sala WHERE id=:id");
	 			$respuesta=$sentenciaSQL->execute(array("id"=> $_POST['id']));
	 			echo json_encode(array("respuesta" => "exitoso"));
				break;
	 		}
	 		
		}	
 	case 'factura':
 			session_start();
 			$cons = $pdo->prepare("SELECT * FROM ft_factura where ID_RESERVA=:id and DS_NOTAS_FACTURA = 'Sala2'");
		 		$resp=$cons->execute(array(
				 	"id"=> $_POST['id']
		 		));
		 	if($cons->rowCount()>0){
	 			echo json_encode(array("respuesta" => "error"));
	 			break;
 			}else{

 				$consulta = $pdo->prepare("SELECT NM_VALOR_HORA_SALA FROM rs_sala where CS_SALA_ID=2 ");
	 			$consulta-> execute();
				$resultado1 = $consulta->fetch(PDO::FETCH_ASSOC);

				$consulta2 = $pdo->prepare("SELECT max(CS_FACTURA_ID) FROM ft_factura");
	 			$consulta2-> execute();
				$resultado2 = $consulta2->fetch(PDO::FETCH_ASSOC);

				$factura = $resultado2['max(CS_FACTURA_ID)'] + 1;

				$fecha1 = DateTime::createFromFormat('Y-m-d H:i:s',$_POST['start']);
				$fecha2 = DateTime::createFromFormat('Y-m-d H:i:s',$_POST['end']);
				$intervalo = $fecha1->diff($fecha2);

				$subtotal = $resultado1["NM_VALOR_HORA_SALA"] * $intervalo->format('%h');
				$iva = $subtotal * 0.16;
				$total = $subtotal + $iva;

				$sentenciaSQL = $pdo->prepare("INSERT INTO ft_factura(DS_CODIGO_FACTURA, NM_VENDEDOR_ID, DS_NOTAS_FACTURA, NM_PRECIO_SUBTOTAL, NM_PRECIO_TOTAL, NM_PRECIO_IVA, NM_CLIENTE_ID, ID_ESTADO, ID_FORMA_PAGO, ID_RESERVA)VALUES('000000000".$factura."',".$_SESSION["NM_DOCUMENTO_ID"]." ,'Sala2',".$subtotal.",".$total.", ".$iva.", ".$_POST['documento'].", 2, 1, ".$_POST['id'].")");
				$respuesta=$sentenciaSQL->execute();

				$consulta2 = $pdo->prepare("SELECT max(CS_FACTURA_ID) FROM ft_factura");
	 			$consulta2-> execute();
				$resultado2 = $consulta2->fetch(PDO::FETCH_ASSOC);


				$sentenciaSQL = $pdo->prepare("INSERT INTO ft_factura_detalle(CS_FACTURA_ID, NM_CANTIDAD_COMPRA, CS_PRODUCTO_ID, NM_PRECIO_TOTAL_PRODUCTO, NM_PRECIO_UNITARIO)VALUES(".$resultado2['max(CS_FACTURA_ID)'].",1 ,4,".$total.", ".$resultado1["NM_VALOR_HORA_SALA"].")");
				$respuesta=$sentenciaSQL->execute();

				echo json_encode(array("respuesta" => "exitoso"));
				break;

 			}
 	case 'multa':

 			session_start();
 			$cons = $pdo->prepare("SELECT * FROM ft_factura where ID_RESERVA=:id and DS_NOTAS_FACTURA = 'Sala2 - Multa'");
		 		$resp=$cons->execute(array(
				 	"id"=> $_POST['id']
		 		));
		 	if($cons->rowCount()>0){
	 			echo json_encode(array("respuesta" => "error"));
	 			break;
 			}else{

 				$consulta = $pdo->prepare("SELECT NM_VALOR_HORA_SALA FROM rs_sala where CS_SALA_ID = 2");
	 			$consulta-> execute();
				$resultado1 = $consulta->fetch(PDO::FETCH_ASSOC);

				$consulta2 = $pdo->prepare("SELECT max(CS_FACTURA_ID) FROM ft_factura");
	 			$consulta2-> execute();
				$resultado2 = $consulta2->fetch(PDO::FETCH_ASSOC);

				$factura = $resultado2['max(CS_FACTURA_ID)'] + 1;

				$fecha1 = DateTime::createFromFormat('Y-m-d H:i:s',$_POST['start']);
				$fecha2 = DateTime::createFromFormat('Y-m-d H:i:s',$_POST['end']);
				$intervalo = $fecha1->diff($fecha2);

				$subtotal = $resultado1["NM_VALOR_HORA_SALA"] * $intervalo->format('%h');
				$subtotal = $subtotal / 2;
				$iva = $subtotal * 0.16;
				$total = $subtotal + $iva;

				$sentenciaSQL = $pdo->prepare("INSERT INTO ft_factura(DS_CODIGO_FACTURA, NM_VENDEDOR_ID, DS_NOTAS_FACTURA, NM_PRECIO_SUBTOTAL, NM_PRECIO_TOTAL, NM_PRECIO_IVA, NM_CLIENTE_ID, ID_ESTADO, ID_FORMA_PAGO, ID_RESERVA)VALUES('000000000".$factura."',".$_SESSION["NM_DOCUMENTO_ID"]." ,'Sala2 - Multa',".$subtotal.",".$total.", ".$iva.", ".$_POST['documento'].", 2, 1, ".$_POST['id'].")");
				$respuesta=$sentenciaSQL->execute();

				$consulta2 = $pdo->prepare("SELECT max(CS_FACTURA_ID) FROM ft_factura");
	 			$consulta2-> execute();
				$resultado2 = $consulta2->fetch(PDO::FETCH_ASSOC);


				$sentenciaSQL = $pdo->prepare("INSERT INTO ft_factura_detalle(CS_FACTURA_ID, NM_CANTIDAD_COMPRA, CS_PRODUCTO_ID, NM_PRECIO_TOTAL_PRODUCTO, NM_PRECIO_UNITARIO)VALUES(".$resultado2['max(CS_FACTURA_ID)'].",1 ,5,".$total.", ".$resultado1["NM_VALOR_HORA_SALA"].")");
				$respuesta=$sentenciaSQL->execute();

				$sentenciaSQL = $pdo->prepare("INSERT INTO rs_multas_reserva(CS_RESERVA_ID, NM_VALOR_MULTA_SALA, DS_ESTADO)VALUES(".$_POST['id'].",".$total.", '1')");
				$respuesta=$sentenciaSQL->execute();

				echo json_encode(array("respuesta" => "exitoso"));
				break;

 			}

 	default:
 	session_start();
 	//print_r($_SESSION);
	 		//Seleccionar los eventos de la bd

			$query1= $pdo->prepare("SELECT CS_TIPO_USUARIO_ID FROM us_usuario WHERE NM_DOCUMENTO_ID=".$_SESSION["NM_DOCUMENTO_ID"]."");
			$query1-> execute();
			$resultado1 = $query1->fetch(PDO::FETCH_ASSOC);
			//print_r($resultado1);
			if($resultado1["CS_TIPO_USUARIO_ID"] == 1){

				$query= $pdo->prepare("SELECT *, true AS editable FROM rs_reserva_sala where sala = 2");
				$query-> execute();

				$resultado = $query->fetchAll(PDO::FETCH_ASSOC);
				echo json_encode($resultado);
				break;
			}
			else{

				$query= $pdo->prepare("SELECT *,  IF(documento=".$_SESSION["NM_DOCUMENTO_ID"].",true, false) AS editable FROM rs_reserva_sala where sala = 2");
				$query-> execute();

				$resultado = $query->fetchAll(PDO::FETCH_ASSOC);
				echo json_encode($resultado);
				break;
			

			}
				
 } 



?>