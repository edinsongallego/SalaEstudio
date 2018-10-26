 <?php
		if (isset($title))
		{
	?>
<nav class="navbar navbar-default ">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><img src="img/logo.png" width="80" height="80"></a>
    </div> 

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav"> 
        <li class="<?php echo @$active_facturas;?>"><a href="facturas.php"><i class='glyphicon glyphicon-list-alt'></i> Facturas <span class="sr-only">(current)</span></a></li>
        <li class="<?php echo @$active_inventario;?>"><a href="inventario.php"><i class='glyphicon glyphicon-list'></i> Inventarios <span class="sr-only">(current)</span></a></li>
        <li class="<?php echo @$active_ventas;?>"><a href="ventas.php"><i class='glyphicon glyphicon-shopping-cart'></i> Ventas <span class="sr-only">(current)</span></a></li>

        <li class="<?php echo @$active_productos;?>"><a href="productos.php"><i class='glyphicon glyphicon-barcode'></i> Productos</a></li>
		
	    <li class="<?php echo @$active_usuarios;?>"><a href="usuarios.php"><i  class='glyphicon glyphicon-lock'></i> Usuarios</a></li>
		  <li class="<?php echo @$active_reservas;?>"><a href="reservassala1.php"><i class='glyphicon glyphicon-user'></i> Reservas <span class="sr-only">(current)</span></a></li>
			  <!--<li class="<?php echo $active_maestros;?>"><a href="reserva.html"><i class='glyphicon glyphicon-user'></i> Maestros <span class="sr-only">(current)</span></a></li>-->
        <li class="<?php echo @$active_banda;?>"><a href="banda.php" onclick="get_user_id('<?php echo $_SESSION['NM_DOCUMENTO_ID']; ?>');"><i  class='glyphicon glyphicon-headphones'></i>Banda</a></li>
        <li class="<?php echo @$active_reporte;?>"><a href="reportes.php"  onclick="get_user_id('<?php echo $_SESSION['NM_DOCUMENTO_ID']; ?>');"><i  class='glyphicon glyphicon-dashboard'></i>Reportes</a></li>
        <?php if ($_SESSION['RESTAURAR_CONTRASENA'] == 1): ?>
        <li id="opt_menu_cambiar_clave" class="<?php echo $active_reservas;?>"><a href="" data-toggle="modal" data-target="#myModal3" onclick="get_user_id('<?php echo $_SESSION['NM_DOCUMENTO_ID']; ?>');"><i  class='glyphicon glyphicon-lock'></i>Cambiar Clave</a></li>
        <?php endif ?>
        
       </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#" target='_blank'><i class='glyphicon glyphicon-envelope'></i> Soporte</a></li>
    <li><a href="login.php?logout"><i class='glyphicon glyphicon-off'></i> <?php $_SESSION['user_login_status'] ?> Salir</a></li>

   
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<?php if ($_SESSION['RESTAURAR_CONTRASENA'] == 1): ?>
    <div id="mensaje_restaurar_contrasena" class="alert alert-warning fade in alert-dismissible">
      <a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
      <strong>Atención!</strong> Por favor modifique su contraseña.
    </div>
  <?php endif ?>
	<?php
		}

