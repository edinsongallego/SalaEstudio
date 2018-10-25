<?php
header('Content-Type: application/json');
$pdo = new PDO("mysql:dbname=salaestudiodb;host=localhost","root","root");

$accion= (isset($_GET['accion']))?$_GET['accion']:'leer';

switch ($accion) {
 	case 'guardar':

		/*$fecha1 = new DateTime();//fecha servidor
 		$fecha2 = DateTime::createFromFormat('Y-m-d H:i',$_POST['start']);
 		$intervalo = $fecha2->diff($fecha1);
 		print_r($intervalo);*/
 		$consulta = $pdo->prepare("SELECT * FROM rs_reserva_sala where sala=:sala and start BETWEEN :start and :end");
 		$res=$consulta->execute(array(
 			"sala"=> $_POST['sala'],
		 	"start"=> $_POST['start'],
		 	"end"=> $_POST['end']
 		));
 		if($consulta->rowCount()>0){
 			echo json_encode(array("respuesta" => "error"));
		 	break;
 		}
 		else{
 			$sentenciaSQL = $pdo->prepare("INSERT INTO rs_reserva_sala(documento, sala, start, end, title, 	DS_ESTADO)VALUES(:documento,:sala,:start,:end,:title,:estado)");
			$respuesta=$sentenciaSQL->execute(array(
		 		"documento"=> $_POST['documento'],
		 		"sala"=> $_POST['sala'],
		 		"start"=> $_POST['start'],
		 		"end"=> $_POST['end'],
		 		"title"=> $_POST['title'],
		 		"estado"=>"Activo"

		 	));
		 	echo json_encode(array("respuesta" => "exitoso"));
		 	break;
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
	 		echo json_encode(array("respuesta" => "exitoso"));
		 	break;
 		

 	default:
 	session_start();
 	//print_r($_SESSION);
	 		//Seleccionar los eventos de la bd

			$query1= $pdo->prepare("SELECT CS_TIPO_USUARIO_ID FROM us_usuario WHERE NM_DOCUMENTO_ID=".$_SESSION["NM_DOCUMENTO_ID"]."");
			$query1-> execute();
			$resultado1 = $query1->fetch(PDO::FETCH_ASSOC);
			//print_r($resultado1);
			if($resultado1["CS_TIPO_USUARIO_ID"] == 1){

				$query= $pdo->prepare("SELECT *, true AS editable FROM rs_reserva_sala");
				$query-> execute();

				$resultado = $query->fetchAll(PDO::FETCH_ASSOC);
				echo json_encode($resultado);
				break;
			}
			else{

				$query= $pdo->prepare("SELECT *,  IF(documento=".$_SESSION["NM_DOCUMENTO_ID"].",true, false) AS editable FROM rs_reserva_sala");
				$query-> execute();

				$resultado = $query->fetchAll(PDO::FETCH_ASSOC);
				echo json_encode($resultado);
				break;
			

			}
				
 } 



?>