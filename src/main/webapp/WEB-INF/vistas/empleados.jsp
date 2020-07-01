<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Registro de Empleados </title>
</head>
<body> 

 <div class="container">
 <h1>Crud de Empleados</h1>
		 <div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaEmpleados">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="listaEmpleados" class="simple_form" id="defaultForm2"  method="get">
		       		<div class="row">
						<div class="col-md-3">	
							<div class="form-group">
							  	<label class="control-label" for="id_nonbre_filtro">Nombre Empleado</label>
							  	<input class="form-control" id="id_nonbre_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
							</div>
						</div>
					</div>			
					<div class="row">
						<div class="col-md-3">
							<button type="submit" class="btn btn-primary" id="validateBtnw1" >FILTRA</button><br>&nbsp;<br>
						</div>
						<div class="col-md-3">
							<button type="button" data-toggle='modal' onclick="registrar();"  class='btn btn-success' id="validateBtnw2" >REGISTRA</button><br>&nbsp;<br>
						</div>
					</div>
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="tableEmpleado" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>Nombre</th>
												<th>Apellido</th>
												<th>DNI</th>
												<th>Codigo</th>
												<th>Telefono</th>
												<th>Edad</th>
												<th>Correo</th>
												<th>idTipoEmpleado</th>
												<th>Actualiza</th>
												<th>Elimina</th>
											</tr>
										</thead>
										<tbody>
												     
												<c:forEach items="${EMPLEADOS}" var="x">
													<tr>
														<td>${x.idEmpleado}</td>
														<td>${x.nombre_empleado}</td>
														<td>${x.apellidos_empleado}</td>
														<td>${x.dni}</td>
														<td>${x.codigo}</td>
														<td>${x.telefono}</td>
														<td>${x.edad}</td>
														<td>${x.correo}</td>
														<td>${x.idTipoEmpleado}</td>
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idEmpleado}','${x.nombre_empleado}','${x.apellidos_empleado}','${x.dni}','${x.codigo}','${x.telefono}','${x.edad}','${x.correo}','${x.idTipoEmpleado}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idEmpleado}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/delete.gif' width='auto' height='auto' />
															</button>
														</td>
														
													</tr>
												</c:forEach>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div>
		 		</form>
		  </div>
  
  	 <div class="modal fade" id="idModalRegistra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro del Empleado</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraEmpleados" class="form-horizontal"     method="post">
				            <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Empleado</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre_empleado">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_nombre_empleado" name="nombre_empleado" placeholder="Ingrese el Nombre" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apellidos_empleado">Apellido</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apellidos_empleado" name="apellidos_empleado" placeholder="Ingrese el Apellido" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_dni">DNI</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_dni" name="dni" placeholder="Ingrese el DNI" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_codigo">Codigo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_codigo" name="codigo" placeholder="Ingrese el Codigo" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_telefono">Telefono</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_telefono" name="telefono" placeholder="Ingrese el Telefono" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_edad">Edad</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_edad" name="edad" placeholder="Ingrese la Edad" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_correo">Correo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_correo" name="correo" placeholder="Ingrese la Correo" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_idTipoEmpleado">ID Tipo EMpleado</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_idTipoEmpleado" name="idTipoEmpleado" placeholder="Ingrese el ID" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">REGISTRA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
  
		 <div class="modal fade" id="idModalActualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Datos del Empleado</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="actualizaEmpleados" class="form-horizontal"     method="post">
							<div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Empleado</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idEmpleado" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_nombre_empleado">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_nombre_empleado" name="nombre_empleado" placeholder="Ingrese el nombre" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_apellidos_empleado">Apellido</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_apellidos_empleado" name="apellidos_empleado" placeholder="Ingrese el Apellido" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_dni">DNI</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_dni" name="dni" placeholder="Ingrese DNI" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_codigo">Codigo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_codigo" name="codigo" placeholder="Ingrese Codigo" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_telefono">Telefono</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_telefono" name="telefono" placeholder="Ingrese Telefono" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>  
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_edad">Edad</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_edad" name="edad" placeholder="Ingrese edad" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_correo">Correo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_correo" name="correo" placeholder="Ingrese Correo" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_idTipoEmpleado">ID Tipo Empleado</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_idTipoEmpleado" name="idTipoEmpleado" placeholder="Ingrese ID" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">ACTUALIZA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>

</div>

<script type="text/javascript">
function eliminar(id){	
	$('input[id=id_elimina]').val(id);
	$('#idFormElimina').submit();
}

function registrar(){
	$('#idModalRegistra').modal("show");
}

function editar(idEmpleado,nombre_empleado,apellidos_empleado,dni,codigo,telefono,edad,correo,idTipoEmpleado){	
	$('input[id=id_ID]').val(idEmpleado);
	$('input[id=id_act_nombre_empleado]').val(nombre_empleado);
	$('input[id=id_act_apellidos_empleado]').val(apellidos_empleado);
	$('input[id=id_act_dni]').val(dni);
	$('input[id=id_act_codigo]').val(codigo);
	$('input[id=id_act_telefono]').val(telefono);
	$('input[id=id_act_edad]').val(edad);
	$('input[id=id_act_correo]').val(correo);
	$('input[id=id_act_idTipoEmpleado]').val(idTipoEmpleado);
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tableEmpleado').DataTable();
} );
</script>

<script type="text/javascript">
	$('#id_form_registra').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	nombre_empleado: {
        		selector : '#id_reg_nombre_empleado',
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },
                }
            },
            apellidos_empleado: {
        		selector : '#id_reg_apellidos_empleado',
                validators: {
                    notEmpty: {
                        message: 'El apellido es un campo obligatorio'
                    },
                }
            },
           dni: {
        		selector : '#id_reg_dni',
                validators: {
                    notEmpty: {
                        message: 'El DNI es un campo obligatorio'
                    },
                    regexp: {
                        regexp: /^[0-9]{7}$/,
                        message: 'El dni debe tener 7 digitos'
                    }
                }
            },
            codigo: {
        		selector : '#id_reg_codigo',
                validators: {
                    notEmpty: {
                        message: 'El Codigo es un campo obligatorio'
                    },
                    regexp: {
                        regexp: /^[0-9]{8}$/,
                        message: 'El Codigo debe tener 8 digitos'
                    }
                    
                }
            }, 
            telefono: {
        		selector : '#id_reg_telefono',
                validators: {
                    notEmpty: {
                        message: 'El telefono es un campo obligatorio'
                    },
                    regexp: {
                        regexp: /^[0-9]{9}$/,
                        message: 'El telefono debe tener 9 digitos'
                    }
                }
            },
            edad: {
        		selector : '#id_reg_edad',
                validators: {
                    notEmpty: {
                        message: 'La Edad es un campo obligatorio'
                    },
                    regexp: {
                        regexp: /^[0-9]{2}$/,
                        message: 'La Edad debe tener 2 digitos'
                    }
                }
            },
            correo: {
        		selector : '#id_reg_correo',
                validators: {
                    notEmpty: {
                        message: 'El correo es un campo obligatorio'
                    },                   
                }
            },
            idTipoEmpleado: {
        		selector : '#id_reg_idTipoEmpleado',
                validators: {
                    notEmpty: {
                        message: 'El ID es un campo obligatorio'
                    },                   
                }
            },              
        }   
    });
</script>
 
<script type="text/javascript">
	$('#id_form_actualiza').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	nombre_empleado: {
        		selector : '#id_act_nombre_empleado',
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },
                }
            },
            apellidos_empleado: {
        		selector : '#id_act_apellidos_empleado',
                validators: {
                    notEmpty: {
                        message: 'El apellido es un campo obligatorio'
                    },
                }
            },
           dni: {
        		selector : '#id_act_dni',
                validators: {
                    notEmpty: {
                        message: 'El DNI es un campo obligatorio'
                    },
                    regexp: {
                        regexp: /^[0-9]{7}$/,
                        message: 'El dni debe tener 7 digitos'
                    }
                }
            },
            codigo: {
        		selector : '#id_act_codigo',
                validators: {
                    notEmpty: {
                        message: 'El Codigo es un campo obligatorio'
                    },
                    regexp: {
                        regexp: /^[0-9]{8}$/,
                        message: 'El Codigo debe tener 8 digitos'
                    }
                    
                }
            }, 
            telefono: {
        		selector : '#id_act_telefono',
                validators: {
                    notEmpty: {
                        message: 'El telefono es un campo obligatorio'
                    },
                    regexp: {
                        regexp: /^[0-9]{9}$/,
                        message: 'El telefono debe tener 9 digitos'
                    }
                }
            },
            edad: {
        		selector : '#id_act_edad',
                validators: {
                    notEmpty: {
                        message: 'La Edad es un campo obligatorio'
                    },
                    regexp: {
                        regexp: /^[0-9]{2}$/,
                        message: 'La Edad debe tener 2 digitos'
                    }
                }
            },
            correo: {
        		selector : '#id_act_correo',
                validators: {
                    notEmpty: {
                        message: 'El correo es un campo obligatorio'
                    },                   
                }
            },
            idTipoEmpleado: {
        		selector : '#id_act_idTipoEmpleado',
                validators: {
                    notEmpty: {
                        message: 'El ID es un campo obligatorio'
                    },                   
                }
            },                            
        }   
    });
</script>   
</body>
</html> 