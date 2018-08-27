    <?php
      

                  $mysqli = new mysqli("localhost", "root", "", "salaestudiodb"); 
                  $id = $_GET['id'];
                  $tipo_id = $_GET['tipo_id'];
                  $nombres = $_GET['nombres']; 
                  $apellidos = $_GET['apellidos'];
                  $tel = $_GET['tel']; 
                  $cel = $_GET['cel'];
                  $correo = $_GET['correo']; 
                  $contrasena= md5($_GET['contrasena']);
                  $tipo_usu = $_GET['tipo_usu'];
                  $estado = 2;
                   
                   
                                                 
                  $sql = $mysqli->query("INSERT INTO us_usuario(NM_DOCUMENTO_ID, CS_TIPO_DOCUMENTO_ID, DS_NOMBRES_USUARIO, DS_APELLIDOS_USUARIO, NM_TELEFONO, NM_CELULAR, DS_CORREO, DS_CONTRASENA, CS_TIPO_USUARIO_ID, CS_ESTADO_ID, DT_FECHA_CREACION) VALUES ($id,$tipo_id,'$nombres','$apellidos',$tel,$cel,'$correo','$contrasena',$tipo_usu,$estado,now())");             
                  
      ?>    

                <SCRIPT LANGUAGE="javascript"> 
            alert("usuario Registrado Correctamente"); 
            </SCRIPT> 
            <META HTTP-EQUIV="Refresh" CONTENT="0; URL=index.php">
