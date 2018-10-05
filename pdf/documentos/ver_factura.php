<?php
	include_once "../../classes/Factura.php";
	include_once "../../classes/Login.php";
	require_once '../../vendor/autoload.php';
	use mikehaertl\wkhtmlto\Pdf;
	if(!Login::inicioSession()){
		header("location: ../../login.php");
		exit;
	}
    /* Connect To Database*/
	include("../../config/db.php");
	include("../../config/conexion.php");
	$id_factura= intval($_GET['id_factura']);
	$SQL = "SELECT fac.*, IF(ISNULL(fac.NM_CLIENTE_ID),fac.DS_CLIENTE,CONCAT(CLIEN.DS_NOMBRES_USUARIO,' ',CLIEN.DS_APELLIDOS_USUARIO)) DESC_CLIENTE, CLIEN.NM_TELEFONO,CLIEN.NM_CELULAR,CLIEN.DS_CORREO,CLIEN.DS_DIRECCION, CONCAT(VENDEDOR.DS_NOMBRES_USUARIO,' ',VENDEDOR.DS_APELLIDOS_USUARIO) VENDEDOR, est.DES_ESTADO, pag.DES_FORMA_PAGO FROM ft_factura fac
								LEFT JOIN us_usuario CLIEN ON CLIEN.NM_DOCUMENTO_ID = fac.NM_CLIENTE_ID
								INNER JOIN us_usuario VENDEDOR ON VENDEDOR.NM_DOCUMENTO_ID = fac.NM_VENDEDOR_ID
								INNER JOIN ft_estado est ON est.ID_ESTADO = fac.ID_ESTADO 
								LEFT JOIN ft_forma_pago pag ON pag.ID_FORMA_PAGO = fac.ID_FORMA_PAGO 
								WHERE CS_FACTURA_ID='".$id_factura."'";
	$sql_count=mysqli_query($con,$SQL);
	
	$sql_factura=mysqli_fetch_array($sql_count);

	if (count($sql_factura)==0)
	{
	echo "<script>alert('Factura no encontrada')</script>";
	echo "<script>window.close();</script>";
	exit;
	}else{
		$rw_factura = $sql_factura;
	}
	$numero_factura=$rw_factura['DS_CODIGO_FACTURA'];
	$id_cliente=$rw_factura['NM_CLIENTE_ID'];
	$id_vendedor=$rw_factura['NM_VENDEDOR_ID'];
	$fecha_factura=$rw_factura['DT_FECHA_CREACION'];
        $porcentaje_incentivo_descuento=$rw_factura['NM_PORCENTAJE_DESCUENTO'];
	$condiciones=1;
	require_once(dirname(__FILE__).'/../html2pdf.class.php');
    // get the HTML
     ob_start();
     include(dirname('__FILE__').'/res/ver_factura_html.php');
	 $html = ob_get_contents();
     ob_end_clean();
     //echo $html;die;
     $pdf = new Pdf;
		// On some systems you may have to set the path to the wkhtmltopdf executable
		// $pdf->binary = 'C:\...';

	    $pdf->addPage($html);

		$pdf->setOptions(array(
		    //'use-xserver',
		    'binary' => 'C:/wkhtmltopdf/bin/wkhtmltopdf',
		    'ignoreWarnings' => true,
		    'commandOptions' => array(
		        'useExec' => true,      // Can help if generation fails without a useful error message
		        //'enableXvfb' => true,
		        'procEnv' => array(
		            // Check the output of 'locale' on your system to find supported languages
		            'LANG' => 'es_ES.utf-8',
		        ),
		    ),
		));
		if (!$pdf->send()) {
		    $error = $pdf->getError();
		    print_r($error);
		    // ... handle error here
		}
	    die();
