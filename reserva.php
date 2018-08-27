<?php
header('Content-Type: application/json');
$pdo = new PDO("mysql:dbname=salaestudiodb;host=localhost","root","root");

$accion= (isset($_GET['accion']))?$_GET['accion']:'leer';

switch ($accion) {
 	case 'guardar':
 		$consulta = $pdo->prepare("SELECT * FROM rs_reserva_sala where CS_SALA_ID=:sala and 	DT_FECHA_INICIAL BETWEEN :start and :end");
 		$res=$consulta->execute(array(
 			"sala"=> $_POST['sala'],
		 	"start"=> $_POST['start'],
		 	"end"=> $_POST['end']
 		));
 		/*$filas=$res->fetchAll();
 		if(count($filas)>0){
 			echo json_encode("error");
		 	break;
 		}
 		else{*/
 			$sentenciaSQL = $pdo->prepare("INSERT INTO rs_reserva_sala(documento, sala, start, end, title, 	DS_ESTADO)VALUES(:documento,:sala,:start,:end,:title,:estado)");
			$respuesta=$sentenciaSQL->execute(array(
		 		"documento"=> $_POST['documento'],
		 		"sala"=> $_POST['sala'],
		 		"start"=> $_POST['start'],
		 		"end"=> $_POST['end'],
		 		"title"=> $_POST['title'],
		 		"estado"=>"Activo"

		 	));
		 	echo json_encode($respuesta);
		 	break;
 		//}
	case 'eliminar':
 		$respuesta = false;
 		if(isset($_POST['id'])){

 			$sentenciaSQL = $pdo->prepare("DELETE FROM rs_reserva_sala WHERE id=:id");
 			$respuesta=$sentenciaSQL->execute(array("id"=> $_POST['id']));

 		}
 		echo json_encode($respuesta);	
 		break;
 	case 'modificar':
 		$sentenciaSQL = $pdo->prepare("UPDATE rs_reserva_sala SET documento=:documento, sala=:sala, start=:start, end=:end, title=:title WHERE id=:id");

 		$respuesta=$sentenciaSQL->execute(array(
 			"id"=> $_POST['id'],
 			"documento"=> $_POST['documento'],
 			"sala"=> $_POST['sala'],
 			"start"=> $_POST['start'],
 			"end"=> $_POST['end'],
 			"title"=> $_POST['title']
 		));

		echo json_encode($respuesta);
 		break;
 	
 	default:
	 		//Seleccionar los eventos de la bd
			$query= $pdo->prepare("SELECT * FROM rs_reserva_sala");
			$query-> execute();

			$resultado = $query->fetchAll(PDO::FETCH_ASSOC);
			echo json_encode($resultado);
 		break;
 } 



?>