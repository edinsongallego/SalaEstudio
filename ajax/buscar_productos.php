<?php

	include('is_logged.php');//Archivo verifica que el usario que intenta acceder a la URL esta logueado
	/* Connect To Database*/
	require_once ("../config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
	require_once ("../config/conexion.php");//Contiene funcion que conecta a la base de datos
	
	$action = (isset($_REQUEST['action'])&& $_REQUEST['action'] !=NULL)?$_REQUEST['action']:'';
	if (isset($_GET['id'])){
		$id_producto=intval($_GET['id']);
		if (isset($_GET['id'])){
			if ($delete1=mysqli_query($con,"UPDATE tp_producto SET NM_ELIMINADO = 1 WHERE CS_PRODUCTO_ID='".$id_producto."'")){
			?>
			<div class="alert alert-success alert-dismissible" role="alert">
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			  <strong>Aviso!</strong> Datos eliminados exitosamente.
			</div>
			<?php 
		}else {
			?>
			<div class="alert alert-danger alert-dismissible" role="alert">
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			  <strong>Error!</strong> Lo siento algo ha salido mal intenta nuevamente.
			</div>
			<?php
			
		}
			
		} else {
			?>
			<div class="alert alert-danger alert-dismissible" role="alert">
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			  <strong>Error!</strong> No se pudo eliminar éste  producto. Existen cotizaciones vinculadas a éste producto. 
			</div>
			<?php
		}
		
		
		
	}
	if($action == 'ajax'){
		// escaping, additionally removing everything that could be (html/javascript-) code
         $q = mysqli_real_escape_string($con,(strip_tags($_REQUEST['q'], ENT_QUOTES)));
		 $aColumns = array('DS_CODIGO_PRODUCTO', 'DS_NOMBRE_PRODUCTO');//Columnas de busqueda
		 $sTable = "tp_producto";
		 $sWhere = "";
		 $_GET['q'] = (strlen($_GET['q'])==0?"":$_GET['q']);
		if ( true )
		{
			$sWhere = "WHERE NM_ELIMINADO = 0 AND (";
			for ( $i=0 ; $i<count($aColumns) ; $i++ )
			{
				$sWhere .= $aColumns[$i]." LIKE '%".$q."%' OR ";
			}
			$sWhere = substr_replace( $sWhere, "", -3 );
			$sWhere .= ')';
		}
		$sWhere.=" order by CS_PRODUCTO_ID desc";
		include 'pagination.php'; //include pagination file
		//pagination variables
		$page = (isset($_REQUEST['page']) && !empty($_REQUEST['page']))?$_REQUEST['page']:1;
		$per_page = 10; //how much records you want to show
		$adjacents  = 4; //gap between pages after number of adjacents
		$offset = ($page - 1) * $per_page;
		//Count the total number of row in your table*/
		$count_query   = mysqli_query($con, "SELECT count(*) AS numrows FROM $sTable $sWhere");
		$row= mysqli_fetch_array($count_query);
		$numrows = $row['numrows'];
		$total_pages = ceil($numrows/$per_page);
		$reload = './productos.php';
		//main query to fetch the data
		$sql="SELECT P.*, TU.DS_NOMBRE_UNIDAD, TU.DS_DESCRIPCION_UNIDAD FROM  $sTable P INNER JOIN tp_unidad_medida_producto TU ON P.FK_UNIDAD = TU.CS_UNIDAD_ID $sWhere LIMIT $offset,$per_page";
		$query = mysqli_query($con, $sql);
		//loop through fetched data
		if ($numrows>0){
			
			?>
			<div class="table-responsive">
			  <table class="table">
				<tr  class="info">
					<th>Código</th>
					<th>Producto</th>
					<th>Unidad</th>
					<th>Estado</th>
					<th>Agregado</th>
					<th class='text-right'>Precio de venta</th>
					<th class='text-right'>Precio de compra</th>
					<th class='text-right'>Acciones</th>
					
				</tr>
				<?php
				while ($row=mysqli_fetch_array($query)){
						$id_producto=$row['CS_PRODUCTO_ID'];
						$codigo_producto=$row['DS_CODIGO_PRODUCTO'];
						$nombre_producto=$row['DS_NOMBRE_PRODUCTO'];
						$status_producto=$row['NM_ESTADO'];
						if ($status_producto==1){$estado="Activo";}
						else {$estado="Inactivo";}
						$date_added= date('d/m/Y', strtotime($row['DT_FECHA_CREACION']));
						$precio_producto=$row['DB_PRECIO_VENTA_UND'];
						$precio_compra_producto=$row['NM_PRECIO_UNITARIO_COMPRA_UND'];
					?>
					
					<input type="hidden" value="<?php echo $codigo_producto;?>" id="codigo_producto<?php echo $id_producto;?>">
					<input type="hidden" value="<?php echo $nombre_producto;?>" id="nombre_producto<?php echo $id_producto;?>">
					<input type="hidden" value="<?php echo $estado;?>" id="estado<?php echo $id_producto;?>">
					<input type="hidden" value="<?php echo $precio_producto;?>" id="precio_producto<?php echo $id_producto;?>">
					<input type="hidden" value="<?php echo $precio_compra_producto;?>" id="precio_compra_producto<?php echo $id_producto;?>">					
					<input type="hidden" value="<?php echo $row['FK_UNIDAD'];?>" id="unidad_producto<?php echo $id_producto;?>">
					<input type="hidden" value="<?php echo $row['DS_DESCRIPCION_PRODUCTO'];?>" id="descripcion_producto<?php echo $id_producto;?>">
					<tr>
						
						<td><?php echo $codigo_producto; ?></td>
						<td><?php echo $nombre_producto; ?></td>
						<td><?php echo $row['DS_NOMBRE_UNIDAD']; ?>(<?php echo $row['DS_DESCRIPCION_UNIDAD']; ?>)</td>
						<td><?php echo $estado;?></td>
						<td><?php echo $date_added;?></td>
						<td><span class='pull-right'>$<?php echo number_format($precio_producto,2);?></span></td>
						<td><span class='pull-right'>$<?php echo number_format($precio_compra_producto,2);?></span></td>
					<td ><span class="pull-right">
					<a href="#" class='btn btn-default' title='Editar producto' onclick="obtener_datos('<?php echo $id_producto;?>');" data-toggle="modal" data-target="#myModal2"><i class="glyphicon glyphicon-edit"></i></a> 
					<a href="#" class='btn btn-default' title='Borrar producto' onclick="eliminar('<?php echo $id_producto; ?>')"><i class="glyphicon glyphicon-trash"></i> </a></span></td>
						
					</tr>
					<?php
				}
				?>
				<tr>
					<td colspan=8><span class="pull-right"><?php
					 echo paginate($reload, $page, $total_pages, $adjacents);
					?></span></td>
				</tr>
			  </table>
			</div>
			<?php
		}
	}
?>