<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<?php
//error_reporting(0);

ob_start();?>
<style type="text/css">
<!--
.Estilo15 {
	color: #CC3300;
	font-family: Arial, Helvetica, sans-serif;
}
.Estilo17 {color: #CC3300}
-->
</style>
<br>
<br>
<table align="center" border="1" style="width: 1110px">
<tr>
 <td colspan="<?php echo count($columnas); ?>" align="center"><strong><?php echo NOMBRE_EMPRESA;?> </strong></td>
 
 
</tr>
    <tr>
<?php
foreach ($columnas as $c){
    ?>
        <td width="66" bgcolor="#C5E8AA" style="width: 150px"><strong><?php echo $c; ?></strong></td>
    <?php
}

?>
    </tr>