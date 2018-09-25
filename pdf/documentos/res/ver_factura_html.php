<!DOCTYPE html> 
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

    <style type="text/css">
        table { vertical-align: top; }
        tr    { vertical-align: top; }
        td    { vertical-align: top; }
        .midnight-blue{
            background:#a6a8a9;
            padding: 4px 4px 4px;
            color:white;
            font-weight:bold;
            font-size:12px;
        }
        .silver{
            background:white;
            padding: 3px 4px 3px;
        }
        .clouds{
            background:#ecf0f1;
            padding: 3px 4px 3px;
        }
        .border-top{
            border-top: solid 1px #bdc3c7;

        }
        .border-left{
            border-left: solid 1px #bdc3c7;
        }
        .border-right{
            border-right: solid 1px #bdc3c7;
        }
        .border-bottom{
            border-bottom: solid 1px #bdc3c7;
        }
        table.page_footer {width: 100%; border: none; background-color: white; padding: 2mm;border-collapse:collapse; border: none;}

    </style>
</head>
<body>
    <table class="page_footer">
        <tr>

            <td style="width: 50%; text-align: left">
            </td>
            <td style="width: 50%; text-align: right">
                &copy; <?php echo "Copyright@";
echo $anio = date('Y'); ?>
            </td>
        </tr>
    </table>
    <table cellspacing="0" style="width: 100%;">
        <tr>

            <td style="width: 20%; color: #444444;background-color: black;text-align: center;">
                <img style="width: 50%;" src="<?php echo BASE_URL; ?>img/logo.png" alt="Logo"><br>

            </td>
            <td style="width: 45%; color: #34495e;font-size:12px;text-align:center;padding-left: 100px">
                <span style="color: #34495e;font-size:14px;font-weight:bold"><?php echo NOMBRE_EMPRESA; ?></span>
                <br><?php echo DIRECCION_EMPRESA; ?><br> 
                Teléfono: <?php echo TELEFONO_EMPRESA; ?><br>
                Email: <?php echo EMAIL_EMPRESA; ?>
            </td>
            <td style="width: 35%;text-align:right">
                FACTURA Nº <?php echo $numero_factura; ?><br>
                ESTADO: <?php echo strtoupper($rw_factura["DES_ESTADO"]); ?>
            </td>

        </tr>
    </table>
    <br>



    <table cellspacing="0" style="width: 100%; text-align: left; font-size: 11pt;">
        <tr>
            <td style="width:50%;" class='midnight-blue'>FACTURAR A</td>
        </tr>
        <tr>
            <td style="width:50%;" >
                <?php
                echo $rw_factura['DESC_CLIENTE'];
                if (!is_null($rw_factura["NM_CLIENTE_ID"])) {
                    echo "<br>";
                    echo $rw_factura['DS_DIRECCION'];
                    echo "<br> Teléfono: ";
                    echo $rw_factura['NM_TELEFONO'];
                    echo "<br> Celular: ";
                    echo $rw_factura['NM_TELEFONO'];
                    echo "<br> Email: ";
                    echo $rw_factura['DS_CORREO'];
                }
                echo "<br> Porcentaje incentivo descuento:  ";
                echo $rw_factura['NM_PORCENTAJE_DESCUENTO'] . "%";
                ?>

            </td>
        </tr>

<?php if (!empty($rw_factura['DS_NOTAS_FACTURA'])) { ?>
            <tr><td><br></td></tr>
            <tr><td style="width:50%;" class='midnight-blue'>NOTAS</td></tr>
            <tr><td><?php echo $rw_factura['DS_NOTAS_FACTURA']; ?></td></tr>
<?php } ?>
    </table>

    <br>
    <table cellspacing="0" style="width: 100%; text-align: left; font-size: 11pt;">
        <tr>
            <td style="width:35%;" class='midnight-blue'>VENDEDOR</td>
            <td style="width:25%;" class='midnight-blue'>FECHA</td>
            <td style="width:40%;" class='midnight-blue'>FORMA DE PAGO</td>
        </tr>
        <tr>
            <td style="width:35%;">
                <?php
                echo $rw_factura["VENDEDOR"];
                ?>
            </td>
            <td style="width:25%;"><?php echo date("d/m/Y", strtotime($rw_factura["DT_FECHA_CREACION"])); ?></td>
            <td style="width:40%;" >
                <?php
                echo $rw_factura["DES_FORMA_PAGO"];
                ?>
            </td>
        </tr>



    </table>
    <br>

    <table cellspacing="0" style="width: 100%; text-align: left; font-size: 10pt;">
        <tr>
            <th style="width: 10%;text-align:center" class='midnight-blue'>CÓDIGO</th>
            <th style="width: 40%" class='midnight-blue'>DESCRIPCION</th>
            <th style="width: 10%;text-align:center" class='midnight-blue'>CANT.</th>
            <th style="width: 15%;text-align: right" class='midnight-blue'>PRECIO UNIT.</th>
            <th style="width: 20%;text-align: right" class='midnight-blue'>PRECIO TOTAL</th>

        </tr>

        <?php
        $nums = 1;
        $sumador_total = 0;
        $sql = mysqli_query($con, "SELECT
							ft_factura_detalle.NM_PRECIO_UNITARIO,
							ft_factura_detalle.CS_PRODUCTO_ID,
							ft_factura_detalle.NM_PRECIO_TOTAL_PRODUCTO,
							ft_factura_detalle.NM_CANTIDAD_COMPRA,
							ft_factura_detalle.CS_FACTURA_ID,
							ft_factura_detalle.NM_ID_DETALLE_FACTURA,
							fac.NM_PRECIO_TOTAL,
							fac.NM_PRECIO_SUBTOTAL,
							tp_producto.DS_CODIGO_PRODUCTO,
							tp_producto.DS_NOMBRE_PRODUCTO,
							tp_producto.DS_DESCRIPCION_PRODUCTO,
							tp_producto.NM_PRECIO_UNITARIO_COMPRA_UND
						FROM
						ft_factura AS fac
						INNER JOIN ft_factura_detalle ON ft_factura_detalle.CS_FACTURA_ID = fac.CS_FACTURA_ID
						INNER JOIN tp_producto ON ft_factura_detalle.CS_PRODUCTO_ID = tp_producto.CS_PRODUCTO_ID
						WHERE fac.CS_FACTURA_ID='" . $id_factura . "'");

        while ($row = mysqli_fetch_array($sql)) {
            if ($nums % 2 == 0) {
                $clase = "clouds";
            } else {
                $clase = "silver";
            }
            ?>

            <tr>
                <td class='<?php echo $clase; ?>' style="width: 10%; text-align: center"><?php echo $row["DS_CODIGO_PRODUCTO"]; ?></td>
                <td class='<?php echo $clase; ?>' style="width: 35%; text-align: left"><?php echo $row["DS_NOMBRE_PRODUCTO"]; ?></td>
                <td class='<?php echo $clase; ?>' style="width: 15%; text-align: center"><?php echo $row["NM_CANTIDAD_COMPRA"]; ?></td>
                <td class='<?php echo $clase; ?>' style="width: 20%; text-align: right"><?php echo number_format($row["NM_PRECIO_UNITARIO"], 2); ?></td>
                <td class='<?php echo $clase; ?>' style="width: 20%; text-align: right"><?php echo number_format($row["NM_PRECIO_TOTAL_PRODUCTO"], 2); ?></td>

            </tr>

            <?php
            $nums++;
        }
        ?>
        
        <tr>
            <td colspan="4" style="widtd: 75%; text-align: right;"><br/>SUBTOTAL &#36; </td>
            <td style="widtd: 25%; text-align: right;"><br/><?php echo number_format($rw_factura["NM_PRECIO_SUBTOTAL"], 2); ?></td>
        </tr>
        <tr>
            <td colspan="4" style="widtd: 75%; text-align: right;">DESCUENTO &#36; </td>
            <td style="widtd: 25%; text-align: right;"><?php echo number_format($rw_factura["NM_PRECIO_DESCUENTO"], 2); ?></td>
        </tr>
        <tr>
            <td colspan="4" style="widtd: 75%; text-align: right;">IVA (<?php echo 16; ?>)% &#36; </td>
            <td style="widtd: 25%; text-align: right;"><?php echo number_format($rw_factura["NM_PRECIO_IVA"], 2); ?></td>
        </tr><tr>
            <td colspan="4" style="widtd: 75%; text-align: right;">TOTAL &#36; </td>
            <td style="widtd: 25%; text-align: right;"><?php echo number_format($rw_factura["NM_PRECIO_TOTAL"], 2); ?></td>
        </tr>
    </table>



    <br>
    <div style="font-size:11pt;text-align:center;font-weight:bold">Gracias por su compra!</div>


</body>
</html>