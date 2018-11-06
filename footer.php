<!-- <div class="navbar navbar-default navbar-fixed-bottom">
	<div class="container">
		<p class="navbar-text pull-left">&copy <?php echo date('Y');?> La Sala Estudio
		</p>
	</div>
</div> -->
<div id="loading">
	                <ul class="bokeh">
	                    <li></li>
	                    <li></li>
	                    <li></li>
	                </ul>
	            </div>
<footer id="colophon" class="site-footer cover setcton_top_contactenos" style="background: url(img/footer.jpg)">
		<div class="footer_bg">
			<div class="container_stud">
				<div class="ContentServices">
					<div class="itemHServices">
						<div class="inner_item_h_Service" style="color: white;">
							<img class="logo_fot" src="img/logo1.png">
							<h3>UBICACIÓN</h3>
							<h4>Calle 11A #43F - 24 - Medellín, Colombia</h4>

							<h3>HORARIOS DE ATENCIÓN</h3>
							<h4>LUN - VIE 8am a 11pm</h4>
							<h4>SAB 9am a 11pm</h4>

							<h3>RESERVAS</h3>
							<h4>LUN - VIE 8am a 11pm</h4>
							<h4>SAB 9am a 11pm</h4>

						</div>
					</div>
					<div class="itemHServices">
						<div class="inner_item_h_Service" style="color: white;">
							<h3>PROYECTOS RECIENTES</h3>
							<br>



														<!-- the loop -->
															<!-- ********** -->
								<div class="itemRecient">
                                                                    <div class="imgResient" style="height: 68px;">
										<div class="absolute cover" style="background: url(img/instrumentos1.png)"></div>
									</div>
									<div class="label_resient">
										<h4>Lorem ipsum dolor sit amet, consectetur adipiscing elit</h4>
										<h4 class="co_red">Octubre 14, 2017</h4>
									</div>
								</div>
								<!-- ********** -->
															<!-- ********** -->
								<div class="itemRecient">
									<div class="imgResient" style="height: 101px;"> 
										<div class="absolute cover" style="background: url(img/instrumentos2.png)"></div>
									</div>
									<div class="label_resient">
										<h4>Nombre del evento, actividad o proyecto</h4>
										<h4 class="co_red">Octubre 14, 2017</h4>
									</div>
								</div>
								<!-- ********** -->
																				


						</div>
					</div>
					<div class="itemHServices">
						<div class="inner_item_h_Service">
							<h3>CONOCE NUESTRO ESPACIO</h3>
							<br>
							<div class="dum_video">
								<div class="absolute">
									<iframe width="100%" height="100%" src="https://www.youtube.com/embed/iyl4RuVHVnc"></iframe>


								</div>
								<img src="img/video.png">
							</div>
						</div>
					</div>
				</div> <!-- ContentServices -->
			</div>
		</div>
	</footer>

	<div class="subfooter">
		<div class="container_stud with_height">
			<div class="menu_header text_right">
				<div class="rel">
					<div class="center copycipy" style=" color: white;">Copyright © 2018 La Casa Estudio - Todos los derechos reservados</div>
				</div>
			</div>
		</div>
	</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
<!-- Include all compiled plugins (below), or include individual files as needed -->
<!-- Latest compiled and minified JavaScript -->

<script src="js/jquery.min.js"></script>
<script src="js/moment.min.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/alertify.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/fullcalendar.min.js"></script>
<script src="js/bootstrap-clockpicker.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>

<script src="js/es.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-validation/dist/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/jquery-validation/src/localization/messages_es.js"></script>
<script type="text/javascript">
	$(".itemHServices .h3service, .h3_labelin_twocol").mCustomScrollbar();

  jQuery(".contactenos_nav").click(function(e) {
    e.preventDefault();
    var height_header = jQuery(".head_primary").height();
      jQuery('html, body').animate({
          scrollTop: jQuery(".setcton_top_contactenos").offset().top-(height_header+5)
      }, 500);
  });
</script>

