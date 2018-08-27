<?php 
// Dados da conexão com o banco de dados


// Recebe os parâmetros enviados via GET
$acao = (isset($_GET['acao'])) ? $_GET['acao'] : '';
$parametro = (isset($_GET['parametro'])) ? $_GET['parametro'] : '';

// Configura uma conexão com o banco de dados

$conexao = new PDO("mysql:dbname=salaestudiodb;host=localhost","root","root");

// Verifica se foi solicitado uma consulta para o autocomplete
if($acao == 'autocomplete'):
	$where = (!empty($parametro)) ? 'WHERE NM_DOCUMENTO_ID LIKE ?' : '';
	$sql = "SELECT NM_DOCUMENTO_ID, DS_NOMBRES_USUARIO, DS_APELLIDOS_USUARIO FROM us_usuario " . $where;

	$stm = $conexao->prepare($sql);
	$stm->bindValue(1, '%'.$parametro.'%');
	$stm->execute();
	$dados = $stm->fetchAll(PDO::FETCH_OBJ);

	$json = json_encode($dados);
	echo $json;
endif;

// Verifica se foi solicitado uma consulta para preencher os campos do formulário
