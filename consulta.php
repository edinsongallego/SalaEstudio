<?php 
// Dados da conexão com o banco de dados

// Recebe os parâmetros enviados via GET
$acao = (isset($_GET['acao'])) ? $_GET['acao'] : '';
$parametro = (isset($_REQUEST['search'])) ? $_REQUEST['search'] : '';

// Configura uma conexão com o banco de dados

$conexao = new PDO("mysql:dbname=salaestudiodb;host=localhost","root","root");

// Verifica se foi solicitado uma consulta para o autocomplete
//if($acao == 'autocomplete'):
	$where = (!empty($parametro)) ? 'WHERE NM_DOCUMENTO_ID LIKE ?' : '';
	$sql = "SELECT NM_DOCUMENTO_ID, DS_NOMBRES_USUARIO, DS_APELLIDOS_USUARIO FROM us_usuario " . $where;

	$stm = $conexao->prepare($sql);
	$stm->bindValue(1, '%'.$parametro.'%');
	$stm->execute();
	$dados = $stm->fetchAll(PDO::FETCH_OBJ);

	//print_r($dados);die;


	$resultado = array();

	foreach ($dados as $row) {
		$resultado[] = array('id' => $row->NM_DOCUMENTO_ID, "text" => $row->NM_DOCUMENTO_ID." - ".$row->DS_NOMBRES_USUARIO." ".$row->DS_APELLIDOS_USUARIO);
	}

	$json = json_encode(array("results" => $resultado));
	echo $json;
//endif;

// Verifica se foi solicitado uma consulta para preencher os campos do formulário
