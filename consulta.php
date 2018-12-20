<?php 
session_start();
// Dados da conexão com o banco de dados

// Recebe os parâmetros enviados via GET
$acao = (isset($_GET['acao'])) ? $_GET['acao'] : '';
$parametro = (isset($_REQUEST['search'])) ? $_REQUEST['search'] : '';

// Configura uma conexão com o banco de dados

$conexao = new PDO("mysql:dbname=salaestudiodb;host=localhost","root","root");

// Verifica se foi solicitado uma consulta para o autocomplete
//if($acao == 'autocomplete'):
	$where = "WHERE NM_ELIMINADO = 0 AND CS_ESTADO_ID = 1";
	$where .= (!empty($parametro)) ? ' AND NM_DOCUMENTO_ID LIKE ?' : '';
        if($_SESSION['CS_TIPO_USUARIO_ID'] == 1){
            $sql = "SELECT NM_DOCUMENTO_ID, DS_NOMBRES_USUARIO, DS_APELLIDOS_USUARIO FROM us_usuario " . $where;
        
            $stm = $conexao->prepare($sql);
            $stm->bindValue(1, '%'.$parametro.'%');
            $stm->execute();
            $dados = $stm->fetchAll(PDO::FETCH_OBJ);
        }else{
            $sql = "SELECT t1.NM_DOCUMENTO_ID, t1.DS_NOMBRES_USUARIO, t1.DS_APELLIDOS_USUARIO 
                    FROM us_usuario t1
                    INNER JOIN us_banda_detalle_usuario t2 ON t1.NM_DOCUMENTO_ID = t2.NM_DOCUMENTO_ID
                    ".$where." AND t2.CS_BANDA_ID IN (SELECT us_banda_detalle_usuario.CS_BANDA_ID FROM us_banda_detalle_usuario WHERE us_banda_detalle_usuario.NM_DOCUMENTO_ID = '".$_SESSION['NM_DOCUMENTO_ID']."' AND us_banda_detalle_usuario.ES_LIDER = 1)"
                    . "GROUP BY t1.NM_DOCUMENTO_ID";
            
            $stm = $conexao->prepare($sql);
                $stm->bindValue(1, '%'.$parametro.'%');
                $stm->execute();
                $dados = $stm->fetchAll(PDO::FETCH_OBJ);
        }
	

	//print_r($dados);die;


	$resultado = array();

	foreach ($dados as $row) {
		$resultado[] = array('id' => $row->NM_DOCUMENTO_ID, "text" => $row->NM_DOCUMENTO_ID." - ".$row->DS_NOMBRES_USUARIO." ".$row->DS_APELLIDOS_USUARIO);
	}

	$json = json_encode(array("results" => $resultado));
	echo $json;
//endif;

// Verifica se foi solicitado uma consulta para preencher os campos do formulário
