<?php $title = "Salas | Sala Estudio";
require_once("config/db.php");
include_once "classes/Login.php";

//if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
if(!Login::inicioSession()){
	header("location: login.php");
	exit;
}
$active_reservas = "active";
$active_maestros = "";
$title = "Reservas | Sala Estudio";
?>

<html lang="en">
<head>
	<?php include("head.php");?>
	<link rel="stylesheet" href="css/salas.css">
	
</head>
<body>
	<?php
        if ($_SESSION['CS_TIPO_USUARIO_ID'] == 1) {
            include("navbar.php");
        } else if ($_SESSION['CS_TIPO_USUARIO_ID'] == 3) {
            include("navbar_banda.php");
        } else if ($_SESSION['CS_TIPO_USUARIO_ID'] == 4) {
            include("navbar_docente.php");
        }
        ?>
	<section id="what-we-do">
		<div class="container-fluid">
			<div class="page-header">
			  <h2 class="section-title mb-2 h1">NUESTRAS SALAS</h2>
			</div>
                    
			<div class="row">
                            <div class="col-xs-12 col-sm-8 col-md-12 col-lg-12 col-xl-12"></div>
                            <?php if($_SESSION["CS_TIPO_USUARIO_ID"] == 1){ ?>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 text-right">
                                <a id="btn_adicionar_sala" class="btn btn-primary"><i class="glyphicon glyphicon-plus" style="margin-right: 25px;margin-left: 25px;margin-top: 5px;margin-bottom: 5px;"  title="Adicionar nueva sala"></i></a>
                            </div>
                            <?php } ?>
                            <div id="ctn_salas_add">
                                <?php
                                $i = 0;
                                foreach (Login::obtenerSalas() as $sala) {
                                 ?>
				<div class="col-xs-12 col-sm-8 col-md-6 col-lg-6 col-xl-6">
					<div class="card">
						<div class="card-block block-1">
							<h3 class="card-title"><?php echo $sala["DS_NOMBRE_SALA"]; ?>:</h3>
							<p class="card-text"><?php echo $sala["DS_DESCRIPCION_SALA"]; ?></p>
							<h3 class="card-title">PRECIO:</h3>
							<p class="card-text">1 hora • $ <?php echo @number_format($sala["NM_VALOR_HORA_SALA"], 2, ",", "."); ?></p>
                                                        <div>
                                                            <a style="color: white !important" id="btnagregar" class="btn btn-success" href="reservassala1.php?sala=<?php echo $sala["CS_SALA_ID"]; ?>"><b>Reservar</b></a>
                                                            <?php if($_SESSION["CS_TIPO_USUARIO_ID"] == 1){ ?>
                                                            <a style="color: white !important" class="btn btn-primary editar_sala" id_sala="<?php echo $sala["CS_SALA_ID"]; ?>" title="Editar sala">Editar</a>
                                                            <a style="color: white !important" class="btn btn-danger eliminar_sala" id_sala="<?php echo $sala["CS_SALA_ID"]; ?>" title="Eliminar sala">Eliminar</a>
                                                            <?php } ?>
                                                        </div>
						</div>
					</div>
				</div>
                                <?php } ?>
                            </div>
			</div>
		</div>	
	</section>

<?php
include("modal/frm_sala.php");
include("footer.php");
?>
</body>
<script type="text/javascript">
    $(document).ready(function(){
        $("#frm_sala").validate();
        $(document).on("click", "#btn_adicionar_sala", function(){
           reseter_frm_sala();
           $("#modalSala").modal("toggle");
       }); 
       
       $(document).on("click", "#guardar_datos", function(e){
            e.preventDefault();
            if($("#frm_sala").valid()){
                $("#guardar_datos").attr("disabled", "disabled");
                $("#loading").show();
                $.post('ajax/agregar_sala.php',$("#frm_sala").serialize(),function(data){
                     recargar_salas(); 
                     $("#resultados_ajax_salas").html(data.htmlResult);
                     setTimeout(function(){ $("#modalSala").modal("toggle"); $("#guardar_datos").prop("disabled", false);},2000);
                     $("#loading").hide();
                }, "JSON");
            }
       }); 
       
       function recargar_salas(){
           $("#ctn_salas_add").load('ajax/buscar_salas.php');
       }
       
       function reseter_frm_sala(){
           $("#id_sala").val("");
           $("#resultados_ajax_salas").html("");
           $("#frm_sala")[0].reset();
       }
       
       $(document).on("click", ".editar_sala", function(){
            $("#loading").show();
            reseter_frm_sala();
            $.post('ajax/buscar_sala.php',{id_sala:$(this).attr("id_sala")},function(data){
               $("#nombre").val(data.DS_NOMBRE_SALA);
               $("#valor").val(data.NM_VALOR_HORA_SALA);
               $("#capacidad").val(data.NM_CAPACIDAD_SALA);
               $("#descripcion").val(data.DS_DESCRIPCION_SALA);
               $("#id_sala").val(data.CS_SALA_ID);
               $("#modalSala").modal("toggle");
               $("#loading").hide();
            },"JSON")
       }); 
       
       $(document).on("click", ".eliminar_sala", function(){
           if(confirm("¿Desea eliminar esta sala?")){
               $("#loading").show();
               $.post('ajax/eliminar_sala.php',{id_sala:$(this).attr("id_sala")},function(data){
                   $("#loading").hide();
                   if(data.result){
                       recargar_salas();
                       alertify.success(data.mensaje);
                   }else{
                        alertify.error(data.mensaje);
                   }
               }, "JSON");
           }
            
        });
       
    });
</script>
</html>
