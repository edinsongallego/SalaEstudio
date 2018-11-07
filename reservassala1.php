
<?php
$title = "Reservas | Sala Estudio";

require_once("config/db.php");
include_once "classes/Login.php";

//if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
if (!Login::inicioSession()) {
    header("location: login.php");
    exit;
}
$active_reservas = "active";
$title = "Reservas | Sala Estudio";
?>
<!DOCTYPE html>
<html lagn="en">
    <head>	
        <meta charset="utf-8">
        <title>Reservas | Sala Estudio</title>
        <?php include("head.php"); ?>
        <link rel="stylesheet" type="text/css" href="css/alertify.css">
        <link rel="stylesheet" type="text/css" href="css/default.css">
        <link rel="stylesheet" type="text/css" href="css/jquery-ui.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
        <!-- FULL CALENDAR -->
        <link rel="stylesheet" href="css/fullcalendar.min.css">

        <link rel="stylesheet" href="css/bootstrap-clockpicker.css">

        <link rel="stylesheet" type="text/css" href="css/custom.css">
        <script src="js/jquery.min.js"></script>
        <script src="js/moment.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui.min.js"></script>
        <script src="js/alertify.js"></script>
        <!-- FULL CALENDAR -->
        <link rel="stylesheet" href="css/fullcalendar.min.css">
        <script src="js/fullcalendar.min.js"></script>
        <script src="js/es.js"></script>

        <script src="js/bootstrap-clockpicker.js"></script>
        <link rel="stylesheet" href="css/bootstrap-clockpicker.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />


        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

        <style>
            .fc th{
                padding: 10px 0px;
                vertical-align: middle;
                background: #000000;
                color: #FFFFFF;
            }
        </style>
    </head>
    <body>
        <?php
        if ($_SESSION['CS_TIPO_USUARIO_ID'] == 1) {
            include("navbar.php");
        } elseif ($_SESSION['CS_TIPO_USUARIO_ID'] == 2) {
            include("navbar_banda.php");
        } elseif ($_SESSION['CS_TIPO_USUARIO_ID'] == 4) {
            include("navbar_docente.php");
        }
        ?>
        <div class="container">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="form-group col-md-8">
                    <select id="selectSala" class="form-control" name="sala" style="text-align-last:center;">
                        <?php
                        $i = 0;
                        foreach (Login::obtenerSalas() as $sala) {
                            ?>
                            <option <?php echo (isset($_GET["sala"]) ? ($_GET["sala"] == $sala["CS_SALA_ID"] ? "selected" : "") : "") ?> value="<?php echo $sala["CS_SALA_ID"]; ?>"><?php echo $sala["DS_NOMBRE_SALA"] . " | " . $sala["DS_DESCRIPCION_SALA"] . " | hora: $" . $sala["NM_VALOR_HORA_SALA"]; ?></option>
                        <?php }
                        ?>
                    </select><br/>
                </div>
                <div class="col-md-2"></div>
            </div>
            <div class="row">
                <div id="CalendarioWeb"></div><br/><br/><br/>
            </div>
        </div>	

        <!-- Modal (Agregar, Modificar, Eliminar) -->
        <div id="Modalevento" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i> Reservar</h4>  
                    </div>
                    <div class="modal-body">
                        <input type="hidden" id="txtid" name="txtid">
                        <input type="hidden" id="txtfechafinal" name="txtfechainicial"/><br/>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label><b>*Documento:</b></label>
                                <select id="txtdocumento" style="width: 99%" required>
                                </select><br/>
                            </div>
                            <div class="form-group col-md-6">
                                <label><b>*Banda:</b></label>
                                <select id="id_banda" style="width: 99%" required>
                                </select><br/>
                            </div>  		
                        </div>
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label><b>Fecha:</b></label>
                                <input type="text" id="txtfechainicial" class="form-control" placeholder="Fecha reserva"><br/>
                            </div>
                            <div class="form-group col-md-4">
                                <label><b>*Hora Inicial:</b></label>
                                <div class="input-group" data-autoclose="true">
                                    <input type="text" id="txthoraini" class="form-control" placeholder="Hora inicial" required onkeypress="return valida(event)"><br/>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-time"></span>
                                    </span>
                                </div>
                            </div>

                            <div class="form-group col-md-4">
                                <label><b>*Hora Final:</b></label>
                                <div class="input-group" data-autoclose="true">
                                    <input type="text" id="txthorafin" class="form-control" placeholder="Hora inicial" required onkeypress="return valida(event)"><br/>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-time"></span>
                                    </span>
                                </div>

                            </div>  		
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label><b>Instrumentos:</b></label><br/>
                                <select name="instrumentos[]" id="instrumentos" style="width: 98%" class="form-control"></select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label><b>Sala:</b></label>
                                <input type="text" id="txtsala" class="form-control" value="Sala 1 | hora: 24000" disabled="disabled"><br/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label><b>Descripción:</b></label>
                                <textarea id="txtdescripcion" rows="3" class="form-control"></textarea>
                            </div>		
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label><b>Seleccione color:</b></label>
                                <input type="color" value="#ff8000" id = "txtcolor">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <input type="checkbox" id="chkcondiciones" name="acepto" value="acepta"/><label for="condiciones">Acepta los <a href="#terminoscondi"	data-toggle="modal" data-target="#terminoscondi">terminos y condiciones</a></label>	
                            </div>		
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">

                            </div>
                        </div>  	
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="btnagregar" class="btn btn-primary"><b>Guardar</b></button>
                        <button type="button" data-dismiss="modal" class="btn btn-default"><b>Cerrar</b></button>
                        <button type="button" id="btnfactura" class="btn btn-primary"><b>Generar Factura</b></button>
                        <button type="button" id="btneliminar" class="btn btn-danger"><b>Cancelar</b></button>
                        <button type="button" id="btnmulta" class="btn btn-danger"><b>Multar</b></button>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="terminoscondi" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i> Términos y condiciones</h4> 
                    </div>
                    <div class="modal-body">
                        <h5>
                            <p>•	Se debe cancelar con 8 horas mínimas de anticipación o multa del 50%
                            <p>•	Solo se pueden ingresar productos de la tienda SALA ESTUDIO
                            <p>•	Prohibido fumar dentro de la sala y espacios comunes
                            <p>•	Siempre hay personal disponible para atender cualquier problema dentro de la sala, en lo que respecta a equipos
                            <p>•	Informar ante una anomalía o un daño de los equipos a la hora de ingresar a la sala
                            <p>•	Antes de ingresar a la sala, se debe verificar el buen estado de los equipos. Cualquier daño en uno de los equipos, es responsabilidad del usuario.
                            <p>•	No esta permitido exceder el número máximo de integrantes por sala. Sala 1=8 Sala 2=12
                            <p>•	La sala estudio no se hace responsable de objetos dejados en los lugares comunes. Verificar siempre al abandonar el lugar
                            <p>•	Se recomienda llegar 10 minutos antes para garantizar el uso correcto de los horarios por sala.
                            <p>•	Luego de 15 minutos, la sala estudio no responde por una reserva perdida
                            <p>•	Siempre informar al encargado de la sala cuando se hace un consumo de la tienda
                        </h5>
                        <h4>POLITICAS DE USO</h4>
                        <h5>
                            <p>•	El uso de las salas y equipos musicales por parte de personas, será analizado y autorizado en la modalidad de alquiler.  
                            <p>•	Recuerde cancelar con un día de anticipación la reserva de la sala y los equipos musicales. Este procedimiento lo debe realizar al correo electrónico de la “SALA ESTUDIO”. 
                            <p>•	Hacer buen uso de la  sala o del equipo musical asignado. 
                            <p>•	Responder económicamente ante cualquier daño ocasionado a la sala o al equipo musical. Se tendrá en cuenta las políticas establecidas por la Dirección Administrativa y Financiera. 
                            <p>•	Diligencie los formatos para la reserva y el control de las salas  y los equipos musicales.  
                            <p>•	Borrar el tablero acrílico una vez finalice la sesión de clase u entrenamiento.   
                            <p>•	Evite fumar y  consumir alimentos y bebidas dentro de las salas de música. 
                            <p>•	Cumplir con los horarios asignados en su reserva para no perjudicar al usuario siguiente. 
                            <p>•	Contribuir con el aseo, el cuidado del mobiliario y el buen uso de la infraestructura (planta física e instalaciones) de la “SALA ESTUDIO”. 
                            <p>•	Para los tableros de las salas, utilice solo los marcadores sugeridos por la “SALA ESTUDIO”. 
                            <p>•	Evite utilizar salas  que no ha reservado, esto puede perjudicar al usuario que si la tiene. 
                            <p>•	Evite colocar láminas adhesivas y cintas en los tableros. Esto  daña el acrílico del tablero. 
                            <p>•	No exceda la capacidad establecida en las salas. 
                            <p>•	Cuando tenga dudas sobre el funcionamiento de los equipos de la sala, solicite ayuda al personal de logística de “SALA ESTUDIO” 
                        </h5>
                        <h4>RECOMENDACIONES</h4>
                        <h5>
                            <p>• Recordar con 24 horas de anticipación por medio de un correo 
                        </h5>
                    </div>
                    <div class="modal-footer">
                        <a href="#" data-dismiss="modal" class="btn btn-danger">Cerrar</a>
                    </div>
                </div>
            </div>
        </div>

        <div id="loading">
            <ul class="bokeh">
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </div>
        <?php
        include("footer.php");
        ?>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
        <script type="text/javascript">
            var NuevoEvento;
            var sw1 = true;
            
            $(document).ready(function () {
                $("#selectSala").change(function (e) {
                    $('#CalendarioWeb').fullCalendar('refetchEvents');
                });
                $('#CalendarioWeb').fullCalendar({
                    /*validRange: function(nowDate){
                     //(console.log( nowDate.subtract(1, 'day'))
                     return {start: nowDate.subtract(1, 'day')} //to prevent anterior dates
                     },*/

                    defaultView: "agendaWeek",
                    header: {
                        left: 'today,prev,next',
                        center: 'title',
                        right: 'month, agendaWeek'
                    },
                    businessHours: {
                        start: '08:00',
                        end: '24:00',
                        dow: [1, 2, 3, 4, 5]

                    },
                    dayClick: function (date, jsEvent, view) {
                        if (moment().diff(date, 'days') > 0) {
                            alertify.error("Este dia no esta habilitado para reservas");
                        } else {
                            asignarValorestexto(false, "#btnagregar");
                            asignarValorestexto(true, "#btnfactura");
                            asignarValorestexto(true, "#btneliminar");
                            asignarValorestexto(false, "#chkcondiciones");
                            asignarValorestexto(true, "#txtfechainicial");
                            limpiarFrm();
                            $("#txtfechainicial").val(date.format("YYYY-MM-DD"));
                            $("#txtfechafinal").val(date.format("YYYY-MM-DD"));
                            $("#Modalevento").modal();
                        }
                    },
                    showNonCurrentDates: false,
                    hiddenDays: [0],
                    events: {
                        url: 'http://localhost/SalaEstudio/reservasala1.php',
                        type: 'POST',
                        data: function () { // a function that returns an object
                            return {
                                ID_SALA: $("#selectSala").val(),
                            };

                        },
                        error: function () {
                            alert('there was an error while fetching events!');
                        },
                        color: 'yellow', // a non-ajax option
                        textColor: 'black' // a non-ajax option
                    },
                    eventClick: function (calEvent, jsEvent, view) {
                        if (calEvent.editable == "1") {
                            asignarValorestexto(true, "#btnagregar");
                            asignarValorestexto(false, "#btnfactura");
                            asignarValorestexto(false, "#btneliminar");
                            asignarValorestexto(false, "#chkcondiciones");
                            asignarValorestexto(true, "#txtfechainicial");
                            limpiarFrm();
                            setearCampos(calEvent, jsEvent, view);
                        } else {
                            alertify.error("Usted no puede editar este evento, pertenece a un usuario distinto.");
                        }
                    },
                    editable: true,
                    eventDrop: function (calEvent) {
                        if (calEvent.editable == "1") {
                            $('#txtid').val(calEvent.id);
                            $('#txtdocumento').val(calEvent.documento);
                            $('#txtsala').val(calEvent.sala);
                            $('#txtdescripcion').val(calEvent.descripcion);
                            FechaHoraini = calEvent.start.format().split("T");
                            $('#txtfechainicial').val(FechaHoraini[0]);
                            $('#txthoraini').val(FechaHoraini[1]);
                            FechaHorafin = calEvent.end.format().split("T");
                            $('#txtfechafinal').val(FechaHorafin[0]);
                            $('#txthorafin').val(FechaHorafin[1]);
                            RecolectarDatosGUI();
                            EnviarInformacion('modificar', NuevoEvento, true);
                        } else {
                            alertify.error("Usted no puede editar este evento, pertenece a un usuario distinto..");
                        }


                    }

                });

                $('#txthoraini, #txthorafin').clockpicker({
                    donetext: "Seleccionar"

                });

                crearSelect2Documento();
                crearSelect2Banda();
                crearMultiselect2Instrumentos();

            });

            function adicionarDataSelect2Instrumentos(data) {
                $.each(data, function (i, instrumento) {
                    $("#instrumentos").select2("trigger", "select", {
                        data: {id: instrumento.ID_INSTRUMENTO, text: instrumento.NOMBRE, modelo: instrumento}
                    });
                });
            }

            function crearSelect2Banda(data) {
                $("#id_banda").select2({
                    allowClear: true,
                    language: "es",
                    placeholder: "Seleccione la banda",
                    data: processData(data).results,
                    ajax: {
                        url: 'ajax/autocomplete/bandas_usuario.php',
                        dataType: 'json',
                        data: function (params) {
                            var query = {
                                id_usuario: $("#txtdocumento").val(),
                                search: params.term,
                                page: params.page || 1
                            }

                            // Query parameters will be ?search=[term]&page=[page]
                            return query;
                        },
                        results: function (data, page) {
                            return {results: data.results};
                        }
                    }
                });
            }

            function crearMultiselect2Instrumentos() {
                $('#instrumentos').select2({
                    allowClear: false,
                    language: "es",
                    placeholder: "Instrumentos",
                    multiple: true,
                    default: false,
                    ajax: {
                        url: 'ajax/autocomplete/instrumentos.php',
                        cache: "true",
                        type: 'POST',
                        dataType: 'json',
                        data: function (data, page) {
                            return data;
                        },
                        results: function (data, page) {
                            return {results: data.results};
                        }
                    },
                    escapeMarkup: function (markup) {
                        return markup;
                    },
                    templateResult: function (item) {
                        if (item.id != undefined) {
                            return "<b>Instrumento: </b>" + item.text + "<br/><b>Tipo: " + item.modelo.TIPO + "</b>";
                        } else {
                            return null;
                        }
                    },
                });
            }

            function crearSelect2Documento(data) {
                $("#txtdocumento").select2({
                    allowClear: true,
                    language: "es",
                    placeholder: "Seleccione al usuario",
                    data: processData(data).results,
                    ajax: {
                        url: 'consulta.php',
                        dataType: 'json',
                        data: function (params) {
                            var query = {
                                search: params.term,
                                page: params.page || 1
                            }

                            // Query parameters will be ?search=[term]&page=[page]
                            return query;
                        },
                        results: function (data, page) {
                            return {results: data.results};
                        }
                    }
                });
            }

            function processData(data) {
                var mapdata = $.map([data], function (obj) {
                    return obj;
                });
                return {results: mapdata};
            }
    
            $('#btnagregar').click(function () {
                sw1 = validarcampos();
                if (sw1 == true) {
                    RecolectarDatosGUI();
                    EnviarInformacion('guardar', NuevoEvento);
                }
            });

            $("#txtdocumento").change(function (e) {
                $("#id_banda").empty().trigger('change');
            });

            $('#btneliminar').click(function () {

                RecolectarDatosGUI();
                EnviarInformacion('eliminar', NuevoEvento);


            });
            $('#btnfactura').click(function () {
                RecolectarDatosGUI();
                EnviarInformacion('factura', NuevoEvento);

            });
            $('#btnmulta').click(function () {
                RecolectarDatosGUI();
                EnviarInformacion('multa', NuevoEvento);

            });
            function RecolectarDatosGUI() {
                NuevoEvento = {
                    id: $('#txtid').val(),
                    title: $('#txtdocumento').select2("data")[0].text + " - " + $('#txtdescripcion').val(),
                    start: $('#txtfechainicial').val() + " " + $('#txthoraini').val(),
                    end: $('#txtfechafinal').val() + " " + $('#txthorafin').val(),
                    documento: $('#txtdocumento').val(),
                    id_banda: $("#id_banda").val(),
                    id_sala: $("#selectSala").val(),
                    color: $('#txtcolor').val(),
                    descripcion: $('#txtdescripcion').val(),
                    instrumentos: $('#instrumentos').val()
                };
            }


            function EnviarInformacion(accion, objEvento, modal) {
                $("#loading").show();
                $.ajax({
                    type: 'POST',
                    url: 'reservasala1.php?accion=' + accion,
                    dataType: "JSON",
                    data: objEvento,
                    success: function (msg) {
                        if (accion == 'guardar')
                        {
                            if (msg.respuesta == "hora") {
                                alertify.error("La hora inicio seleccionada es menor a la hora actual");
                            } else {
                                if (msg.respuesta == "exitoso") {
                                    $('#CalendarioWeb').fullCalendar('refetchEvents');
                                    if (!modal) {
                                        $("#Modalevento").modal('toggle');
                                        alertify.success("Guardada con éxito");
                                    }
                                } else {
                                    alertify.error("Ya existe una reserva en ese horarios");
                                }
                            }

                        }
                        if (accion == 'eliminar')
                        {
                            if (msg.respuesta == "exitoso") {
                                $('#CalendarioWeb').fullCalendar('refetchEvents');
                                if (!modal) {
                                    $("#Modalevento").modal('toggle');
                                    alertify.success("Reserva cancelada con exito");
                                }
                            } else {
                                alertify.error("Las reservas se cancelan con 8 horas de anticipación");
                            }
                        }
                        if (accion == 'factura')
                        {

                            if (msg.respuesta == "exitoso") {
                                $('#CalendarioWeb').fullCalendar('refetchEvents');
                                if (!modal) {
                                    $("#Modalevento").modal('toggle');
                                    alertify.success("Factura creada con éxito");
                                    setTimeout(function () {
                                        imprimir_factura(msg.id_factura);
                                    }, 1500);
                                }
                            } else {
                                alertify.error("La reserva seleccionada ya tiene una factura asociada");
                            }
                        }
                        if (accion == 'multa')
                        {

                            if (msg.respuesta == "exitoso") {
                                $('#CalendarioWeb').fullCalendar('refetchEvents');
                                if (!modal) {
                                    $("#Modalevento").modal('toggle');
                                    alertify.success("Multa creada con éxito");
                                    setTimeout(function () {
                                        imprimir_factura(msg.id_factura);
                                    }, 1500);
                                }
                            } else {
                                alertify.error("La reserva seleccionada ya tiene una multa asociada");
                            }
                        }
                        $("#loading").hide();
                    }
                });
            }
            $('.clockpicker').clockpicker();

            function asignarValorestexto(sw, boton) {
                $(boton).prop("disabled", sw);
            }
            function setearCampos(calEvent, jsEvent, view) {
                // Mostrar informacion  del evento en los inputs
                $.get("reservasala1.php?accion=obtenerUsuario&ID_RESERVA=" + calEvent.id + "&NM_DOCUMENTO=" + calEvent.documento + "&ID_BANDA=" + calEvent.id_banda, {}, function (data) {
                    crearSelect2Documento(data.usuario);
                    if (data.banda)
                        crearSelect2Banda(data.banda);
                    if (data.instrumentos)
                        adicionarDataSelect2Instrumentos(data.instrumentos);
                    $('#txtid').val(calEvent.id);
                    //$('#txtdocumento').val(calEvent.documento);
                    $('#txtdescripcion').val(calEvent.descripcion);
                    FechaHoraini = calEvent.start._i.split(" ");
                    $('#txtfechainicial').val(FechaHoraini[0]);
                    $('#txthoraini').val(FechaHoraini[1]);
                    FechaHorafin = calEvent.end._i.split(" ");
                    $('#txtfechafinal').val(FechaHorafin[0]);
                    $('#txthorafin').val(FechaHorafin[1]);
                    $("#Modalevento").modal();
                    //docu = calEvent.sala;
                    //alert(docu);
                }, "JSON");

            }
            function validarcampos()
            {
                var documento, sala, fecha, horaini, horafinal, descripción;
                documento = $('#txtdocumento').val();
                fecha = $('#txtfechainicial').val();
                horaini = $('#txthoraini').val();
                horafinal = $('#txthorafin').val();
                descripción = $('#txtdescripcion').val();
                check = $('#chkcondiciones').val();
                banda = $("#id_banda").val();
                var string1 = CompararHoras(horaini, horafinal);
                var sw = horadentro(horaini);
                if (documento == "" || documento == null) {
                    alertify.error("Campo Documento vacio");
                    return false;
                }
                if (banda == "" || banda == null) {
                    alertify.error("Campo banda vacio");
                    return false;
                }
                if (fecha == "") {
                    alertify.error("Campo Fecha vacio");
                    return false;
                }
                if (horaini == "") {
                    alertify.error("Campo Hora Inicial vacio")
                    return false;
                }
                if (string1 == "sHora1 MAYOR sHora2") {
                    alertify.error("Hora inicial es mayor a la final");
                    return false;
                }
                if (string1 == "sHora1 IGUAL sHora2") {
                    alertify.error("Hora inicial y hora final son iguales");
                    return false;
                }
                if (sw == 1) {
                    alertify.error("Las horas de atención son desde las 8 am a 11 pm");
                    return false;
                }
                if (horafinal == "") {
                    alertify.error("Campo Hora final vacio");
                    return false;
                }
                /*if (descripción == "") {
                 alertify.error("Campo Descripción vacio");
                 return false;
                 }*/
                if ($('#chkcondiciones').prop('checked') == false) {
                    alertify.error("Debe aceptar los terminos y condiciones de la sala");
                    return false;
                } else {
                    return true;
                }
            }
            function valida(e) {
                tecla = (document.all) ? e.keyCode : e.which;

                //Tecla de retroceso para borrar, siempre la permite
                if (tecla == 8) {
                    return true;
                }

                // Patron de entrada, en este caso solo acepta numeros
                patron = /[0-9]/;
                tecla_final = String.fromCharCode(tecla);
                return patron.test(tecla_final);
            }
            function limpiarFrm() {
                $("#txtdescripcion").val("");
                $("#txthoraini").val("");
                $("#txthorafin").val("");
                $("#chkcondiciones").prop("checked", false)
                $("#txtdocumento").empty().trigger('change');
                $("#id_banda").empty().trigger('change');
                $('#instrumentos').empty().trigger('change');
                $('#txtsala').val($("#selectSala > option:selected").html());

            }

            function soloLetras(e) {
                key = e.keyCode || e.which;
                tecla = String.fromCharCode(key).toLowerCase();
                letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
                especiales = "8-37-39-46";

                tecla_especial = false
                for (var i in especiales) {
                    if (key == especiales[i]) {
                        tecla_especial = true;
                        break;
                    }
                }

                if (letras.indexOf(tecla) == -1 && !tecla_especial) {
                    return false;
                }
            }
            function CompararHoras(sHora1, sHora2) {

                var arHora1 = moment(sHora1, "h:mm:ss A").format("HH:mm:ss").split(":");
                var arHora2 = moment(sHora2, "h:mm:ss A").format("HH:mm:ss").split(":");

                // Obtener horas y minutos (hora 1)
                var hh1 = parseInt(arHora1[0], 10);
                var mm1 = parseInt(arHora1[1], 10);

                // Obtener horas y minutos (hora 2)
                var hh2 = parseInt(arHora2[0], 10);
                var mm2 = parseInt(arHora2[1], 10);

                // Comparar
                if (hh1 < hh2 || (hh1 == hh2 && mm1 < mm2))
                    return "sHora1 MENOR sHora2";
                else if (hh1 > hh2 || (hh1 == hh2 && mm1 > mm2))
                    return "sHora1 MAYOR sHora2";
                else
                    return "sHora1 IGUAL sHora2";
            }
            function horadentro(sHora1) {
                var sw = 0;
                var horas = ['00', '01', '02', '03', '04', '05', '06', '07'];
                var arHora1 = moment(sHora1, "h:mm:ss A").format("HH:mm:ss").split(":");
                var hh1 = parseInt(arHora1[0], 10);
                for (var i in horas) {
                    if (hh1 == horas[i]) {
                        sw = 1;
                        break;
                    }
                }
                return sw;
            }

        </script>
        <script type="text/javascript" src="js/VentanaCentrada.js"></script>
        <script type="text/javascript" src="js/facturas.js"></script>


    </body>
</html>