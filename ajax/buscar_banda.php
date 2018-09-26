<?php


/* Connect To Database*/
	require_once ("../config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
	require_once ("../config/conexion.php");//Contiene funcion que conecta a la base de datos
	include('is_logged.php');//Archivo verifica que el usario que intenta acceder a la URL esta logueado
	$action = (isset($_REQUEST['action'])&& $_REQUEST['action'] !=NULL)?$_REQUEST['action']:'';
	if (isset($_GET['id'])){
		$user_id=intval($_GET['id']);
		$query=mysqli_query($con, "select * from us_banda_usuario where CS_BANDA_ID='".$user_id."'");
		//$rw_user=mysqli_fetch_array($query);
		//$count=$rw_user['user_id'];
		$count = mysqli_num_rows($query);
		if ($count==1){
                    try {
                        $delete1=mysqli_query($con,"delete from us_banda_usuario where CS_BANDA_ID='".$user_id."'");
                    } catch (Exception $ex) {
                        var_dump(mysql_error());die;
                    }
			if ($delete1){
				?>
				<div class="alert alert-success alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<strong>Aviso!</strong> Datos eliminados exitosamente.
				</div>
				<?php
			}else {
                            //echo "<pre>";print_r();echo "</pre>";
                            $errores = mysqli_error_list($con);
                            if(isset($errores[0]) && $errores[0]["errno"] == 1451){
                                ?>
				<div class="alert alert-warning alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<strong>Cuidado!</strong> Error de llave foranea.
				</div>
				<?php
                            }else{
				?>
				<div class="alert alert-danger alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<strong>Error!</strong> Lo siento algo ha salido mal intenta nuevamente.
				</div>
				<?php
                            }
			}

		} else {
			?>
			<div class="alert alert-danger alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<strong>Error!</strong> No se puede borrar el usuario administrador.
			</div>
			<?php
		}



	}
	if($action == 'ajax'){
		// escaping, additionally removing everything that could be (html/javascript-) code
		$q = mysqli_real_escape_string($con,(strip_tags($_REQUEST['q'], ENT_QUOTES)));
		 $aColumns = array('CS_BANDA_ID', 'DS_NOMBRE_BANDA','DS_DESCRIPCION_BANDA');//Columnas de busqueda
		 $sTable = "us_banda_usuario";
                 if($_SESSION["CS_TIPO_USUARIO_ID"] == 1){ 
                    $sWhere = "WHERE 1 ";
                 }else{
                     $sWhere = "WHERE t2.NM_DOCUMENTO_ID = '".$_SESSION["NM_DOCUMENTO_ID"]."' AND t2.ES_LIDER = 1 ";
                 }
		 if ( $_GET['q'] != "" )
		 {
		 	$sWhere = " AND (";
		 	for ( $i=0 ; $i<count($aColumns) ; $i++ )
		 	{
		 		$sWhere .= $aColumns[$i]." LIKE '%".$q."%' OR ";
		 	}
		 	$sWhere = substr_replace( $sWhere, "", -3 );
		 	$sWhere .= ')';
		 }
		 $sWhere.=" order by t1.CS_BANDA_ID desc";
		include 'pagination.php'; //include pagination file
		//pagination variables
		$page = (isset($_REQUEST['page']) && !empty($_REQUEST['page']))?$_REQUEST['page']:1;
		$per_page = 10; //how much records you want to show
		$adjacents  = 4; //gap between pages after number of adjacents
		$offset = ($page - 1) * $per_page;
		//Count the total number of row in your table*/
                if($_SESSION["CS_TIPO_USUARIO_ID"] == 1){ 
                    $count_query = mysqli_query($con, "SELECT count(*) AS numrows FROM us_banda_usuario t1  $sWhere");
                }else{
                    $count_query = mysqli_query($con, "SELECT count(*) AS numrows FROM us_banda_usuario t1 INNER JOIN us_banda_detalle_usuario t2 ON t1.CS_BANDA_ID = t2.CS_BANDA_ID  $sWhere");
                }
                
		$row= mysqli_fetch_array($count_query);
		$numrows = $row['numrows'];
		$total_pages = ceil($numrows/$per_page);
		$reload = './usuarios.php';
		//main query to fetch the data
                if($_SESSION["CS_TIPO_USUARIO_ID"] == 1){ 
                    $sql="SELECT * FROM  us_banda_usuario t1 $sWhere LIMIT $offset,$per_page";
                }else{
                    $sql="SELECT t1.* FROM us_banda_usuario t1 INNER JOIN us_banda_detalle_usuario t2 ON t1.CS_BANDA_ID = t2.CS_BANDA_ID $sWhere LIMIT $offset,$per_page";
                }
		$query = mysqli_query($con, $sql);
		//loop through fetched data
		if ($numrows>0){

			?>
			<div class="table-responsive" id="exampledt">
				<table class="table">

					<tr  class="info">
						<th>Cod. Banda</th>
						<th>Nombre Banda</th>
						<th>Descripciòn Banda</th>
						<th><span class="pull-right">Acciones</span></th>

					</tr>


					<?php
					while ($row=mysqli_fetch_array($query)){


						$CS_BANDA_ID=$row['CS_BANDA_ID'];
						$DS_NOMBRE_BANDA=$row['DS_NOMBRE_BANDA'];
						$DS_DESCRIPCION_BANDA=$row['DS_DESCRIPCION_BANDA'];
						

						?>

						<input type="hidden" value="<?php echo $row['DS_NOMBRE_BANDA'];?>" id="DS_NOMBRE_BANDA<?php echo $CS_BANDA_ID;?>">
						

						<input type="hidden" value="<?php echo $DS_DESCRIPCION_BANDA;?>" id="DS_DESCRIPCION_BANDA<?php echo $CS_BANDA_ID;?>">

						<input type="hidden" value="<?php echo $CS_BANDA_ID;?>" id="CS_BANDA_ID<?php echo $CS_BANDA_ID;?>">

						



						<tr>
							<td><?php echo $CS_BANDA_ID; ?></td>
							<td><?php echo $DS_NOMBRE_BANDA; ?></td>
							<td><?php echo $DS_DESCRIPCION_BANDA; ?></td>

							<td ><span class="pull-right">
								<a href="#" class='btn btn-default' title='Editar banda' onclick="obtener_datos_banda('<?php echo $CS_BANDA_ID;?>');" data-toggle="modal" data-target="#editarbanda"><i class="glyphicon glyphicon-edit"></i></a>
								<?php if($_SESSION["CS_TIPO_USUARIO_ID"] == 1){ ?>
								<a href="#" class='btn btn-default' title='Borrar banda' onclick="eliminar('<?php echo $CS_BANDA_ID; ?>')"><i class="glyphicon glyphicon-trash"></i> </a></span></td>
                                                                <?php } ?>    
							</tr>
							<?php
						}
						?>
						<tr>
							<td colspan=9><span class="pull-right">
								<?php
								echo paginate($reload, $page, $total_pages, $adjacents);
								?>

							</span>
						</td>
					</tr>



				</table>
			</div>
			<?php
		}
	}
	?>