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
          <li class="active"><a href="index.php"><i class='glyphicon glyphicon-home'></i> Inicio <span class="sr-only">(current)</span></a></li>

          <li><a href="nosotros.php"> Nosotros</a></li>

          <li><a href="servicios.php"> Servicios</a></li>

          <li><a href="contactenos.php"> Contactenos</a></li>
		  <li><a target="_blank" href="https://es-la.facebook.com/Sala.Estudio/"><img src='img/facebook.png'></img></a> </li>
                            <li><a target="_blank" href="http://www.thepicta.com/user/lasalaestudio/4339125963"><img src='img/instagram.png'></img></a> </li>
                            <li><a target="_blank" href="https://twitter.com/lasalaestudio"><img src='img/twitter.png'></img></a> </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="login.php"><i class='glyphicon glyphicon-log-in'></i> Iniciar Sesiòn</a></li>
        </ul>
      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </nav>
  <?php
}
?>