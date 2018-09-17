<?php

	
	include('is_logged.php');//Archivo verifica que el usario que intenta acceder a la URL esta logueado
	/* Connect To Database*/
	require_once ("../config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
	require_once ("../config/conexion.php");//Contiene funcion que conecta a la base de datos
	
	$action = (isset($_REQUEST['action'])&& $_REQUEST['action'] !=NULL)?$_REQUEST['action']:'';
	if (isset($_GET['id'])){
		$numero_factura=intval($_GET['id']);
		$del1="delete from facturas where numero_factura='".$numero_factura."'";
		$del2="delete from detalle_factura where numero_factura='".$numero_factura."'";
		if ($delete1=mysqli_query($con,$del1) and $delete2=mysqli_query($con,$del2)){
			?>
			<div class="alert alert-success alert-dismissible" role="alert">
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			  <strong>Aviso!</strong> Datos eliminados exitosamente
			</div>
			<?php 
		}else {
			?>
			<div class="alert alert-danger alert-dismissible" role="alert">
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			  <strong>Error!</strong> No se puedo eliminar los datos
			</div>
			<?php
			
		}
	}
	if($action == 'ajax'){
		// escaping, additionally removing everything that could be (html/javascript-) code
         $q = mysqli_real_escape_string($con,(strip_tags($_REQUEST['q'], ENT_QUOTES)));
		  $sTable = "facturas, clientes, users";
		 $sWhere = "";
		 $sWhere.=" WHERE 1";
		if ( $_GET['q'] != "" )
		{
		$sWhere.= " and  (DESC_CLIENTE like '%$q%' or DS_CODIGO_FACTURA like '%$q%')";
			
		}
		
		$sWhere.=" order by CS_FACTURA_ID desc";
		include 'pagination.php'; //include pagination file
		//pagination variables
		$page = (isset($_REQUEST['page']) && !empty($_REQUEST['page']))?$_REQUEST['page']:1;
		$per_page = 10; //how much records you want to show
		$adjacents  = 4; //gap between pages after number of adjacents
		$offset = ($page - 1) * $per_page;
		//Count the total number of row in your table*/
		
		$count_query   = mysqli_query($con, "SELECT * FROM (SELECT fac.*, IF(ISNULL(fac.NM_CLIENTE_ID),fac.DS_CLIENTE,CONCAT(CLIEN.DS_NOMBRES_USUARIO,' ',CLIEN.DS_APELLIDOS_USUARIO)) DESC_CLIENTE, CLIEN.NM_TELEFONO,CLIEN.NM_CELULAR,CLIEN.DS_CORREO,CLIEN.DS_DIRECCION, CONCAT(VENDEDOR.DS_NOMBRES_USUARIO,' ',VENDEDOR.DS_APELLIDOS_USUARIO) VENDEDOR FROM ft_factura fac
								LEFT JOIN us_usuario CLIEN ON CLIEN.NM_DOCUMENTO_ID = fac.NM_CLIENTE_ID
								INNER JOIN us_usuario VENDEDOR ON VENDEDOR.NM_DOCUMENTO_ID = fac.NM_VENDEDOR_ID) tmp  $sWhere");
		$row = mysqli_fetch_array($count_query);

		$numrows = count($row);
		$total_pages = ceil($numrows/$per_page);
		$reload = './facturas.php';
		//main query to fetch the data
		$sql="SELECT * FROM (SELECT fac.*, IF(ISNULL(fac.NM_CLIENTE_ID),fac.DS_CLIENTE,CONCAT(CLIEN.DS_NOMBRES_USUARIO,' ',CLIEN.DS_APELLIDOS_USUARIO)) DESC_CLIENTE, CLIEN.NM_TELEFONO,CLIEN.NM_CELULAR,CLIEN.DS_CORREO,CLIEN.DS_DIRECCION, CONCAT(VENDEDOR.DS_NOMBRES_USUARIO,' ',VENDEDOR.DS_APELLIDOS_USUARIO) VENDEDOR FROM ft_factura fac
								LEFT JOIN us_usuario CLIEN ON CLIEN.NM_DOCUMENTO_ID = fac.NM_CLIENTE_ID
								INNER JOIN us_usuario VENDEDOR ON VENDEDOR.NM_DOCUMENTO_ID = fac.NM_VENDEDOR_ID) tmp 
								$sWhere
								LIMIT $offset,$per_page";
		$query = mysqli_query($con, $sql);
		//loop through fetched data
		if ($numrows>0){
			echo mysqli_error($con);
			?>
			<div class="table-responsive">
			  <table class="table">
				<tr  class="info">
					<th>#</th>
					<th>Fecha</th>
					<th>Cliente</th>
					<th>Vendedor</th>
					<th>Estado</th>
					<th class='text-right'>Total</th>
					<th class='text-right'>Acciones</th>
					
				</tr>
				<?php
				while ($row=mysqli_fetch_array($query)){
						$id_factura=$row['CS_FACTURA_ID'];
						$numero_factura=$row['DS_CODIGO_FACTURA'];
						$fecha=date("d/m/Y", strtotime($row['DT_FECHA_CREACION']));
						$nombre_cliente=$row['DESC_CLIENTE'];
						$telefono_cliente=$row['NM_TELEFONO'];
						$email_cliente=$row['DS_CORREO'];
						$nombre_vendedor=$row['VENDEDOR'];
						$estado_factura=1;
						if ($estado_factura==1){$text_estado="Pagada";$label_class='label-success';}
						else{$text_estado="Pendiente";$label_class='label-warning';}
						$total_venta=$row['NM_PRECIO_TOTAL'];
					?>
					<tr>
						<td><?php echo $numero_factura; ?></td>
						<td><?php echo $fecha; ?></td>
						<td><a href="#" data-toggle="tooltip" data-placement="top" title="<i class='glyphicon glyphicon-phone'></i> <?php echo $telefono_cliente;?><br><i class='glyphicon glyphicon-envelope'></i>  <?php echo $email_cliente;?>" ><?php echo $nombre_cliente;?></a></td>
						<td><?php echo $nombre_vendedor; ?></td>
						<td><span class="label <?php echo $label_class;?>"><?php echo $text_estado; ?></span></td>
						<td class='text-right'><?php echo number_format ($total_venta,2); ?></td>					
					<td class="text-right">
						<!-- <a href="editar_factura.php?id_factura=<?php echo $id_factura;?>" class='btn btn-default' title='Editar factura' ><i class="glyphicon glyphicon-edit"></i></a> -->
						<a href="#" class='btn btn-default' title='Descargar factura' onclick="imprimir_factura('<?php echo $id_factura;?>');"><i class="glyphicon glyphicon-download"></i></a> 
						<!--<a href="#" class='btn btn-default' title='Borrar factura' onclick="eliminar('<?php echo $numero_factura; ?>')"><i class="glyphicon glyphicon-trash"></i> </a>-->
					</td>
						
					</tr>
					<?php
				}
				?>
				<tr>
					<td colspan=7><span class="pull-right"><?
					 echo paginate($reload, $page, $total_pages, $adjacents);
					?></span></td>
				</tr>
			  </table>
			</div>
			<?php
		}
	}
?>