<!DOCTYPE HTML>
<html>
<head>
   <meta charset="UTF-8">
   <title>Biblicon Fichas</title>
   <link rel="stylesheet" href="css/normalize.css">
   <link rel="stylesheet" href="css/estilos.css">
   <link rel="stylesheet" href="css/tipoficha.css">
   <link rel="stylesheet" href="css/ficha.css">
   <link rel="stylesheet" href="css/demo_table.css">
   <script src="js/jquery-2.0.3.min.js"></script>
   <script src="js/mustache.js"></script>
   <script src="js/jquery.redirect.min.js"></script>
   <script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
</head>
<body>

	<div class="bloqueo" id="bloqueo">
			<div class="divEliminar" id="divEliminar">
				<h4 id="titulo"></h4>
				<div class="usuario" id="usuario">
					<div class="lineaCampo"><strong><div class="nomCampo">Usuario</div></strong><span class="valorCampo"><input id="id_usuariotxt" class="requerido" /></span></div>
					<div class="lineaCampo"><strong><div class="nomCampo">Contraseña</div></strong><span class="valorCampo"><input id="contrasenatxt" class="requerido" /></span></div>
					<div class="lineaCampo"><strong><div class="nomCampo">Correo</div></strong><span class="valorCampo"><input id="correotxt" /></span></div>
					<div class="lineaCampo"><strong><div class="nomCampo">Nombre</div></strong><span class="valorCampo"><input id="nombretxt" /></span></div>
					<div class="lineaCampo"><strong><div class="nomCampo">Apellido Paterno</div></strong><span class="valorCampo"><input id="ape_pattxt" /></span></div>
					<div class="lineaCampo"><strong><div class="nomCampo">Apellidos Materno</div></strong><span class="valorCampo"><input id="ape_mattxt" /></span></div>
				</div>
				<input type="hidden" value="" id="id_ususario"/>
				<input type="submit" value="Actualizar" id="actualizar"/>
				<input type="submit" value="Agregar" id="agrear"/>
				<input type="submit" value="Regresar" id="regresar"/>
				<div id="error"></div>
			</div>
	</div>

	<header>
		<h1>Biblicon</h1>
	</header>
	<nav>
		<ul>
			<li><a href="principal.htm">Fichas</a></li>
			<li><a href="ficha.htm">Agregar Ficha</a></li>
			<li><a href="tipos.htm">Tipo de Fichas</a></li>
			<li><a href="plantillas.htm">Plantillas</a></li>
		</ul>
	</nav>
	<section>
		<div class="contenido">
			<div class = "botonUsuario"><input type="submit" id="agregarUsuario" value="Agregar Usuario" /></div>
				<table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
					<thead>
						<tr>
							<th>Usuario</th>
							<th>Correo</th>
							<th>Contraseña</th>
							<th>Nombre Completo</th>
							<th>Estatus</th>
							<th>Editar</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					<tfoot>
						<tr>
							<th colspan="6">Lista de Usuarios en el sistema.</th>
						</tr>
					</tfoot>
				</table>
			</div>
	</section>
	<footer>
		-- Derechos Reservados --
	</footer>
	
	<script type="text/javascript">
	
		function estatus(usu){
			var usuario = {};
			for(var i = 0; i < usuarios.length; i++){
				if(usuarios[i].id_usuario == $.trim(usu)){
					usuario = usuarios[i];
					break;
				}
			}
			
			var status = (usuario.status == "1" ||usuario.status == true) ? "0" : "1";
			
			$.post("cambiarStatusUsuario.htm", {"id_usuario" : usuario.id_usuario, "status" : status}, function(respuesta){
			 var resp = JSON.parse(respuesta);
			 if(resp.respuesta == "1"){
			 	usuario.status = usuario.status == "1" ? "0" : "1";
			 	
			 	var orden = "";
				$('#' + usuario.id_usuario + " td").each(function(i,e){
					if($(e).hasClass("sorting_1")){
						orden = i;
					}
				});
			 	
				$('#' + usuario.id_usuario).html(filaUsuario(usuario, orden));
			 }else{
			 	
			 }
			});
		}
	
		function actualizar(usu){
			$('#bloqueo').fadeIn();
			$('#error').html('');
			$('#agrear').hide();
			$('#actualizar').show();
			$('#titulo').html("Modifica los datos del usuario");
			$("#id_usuariotxt").prop('disabled', true);
			
			
			var usuario = {};
			for(var i = 0; i < usuarios.length; i++){
				if(usuarios[i].id_usuario == $.trim(usu)){
					usuario = usuarios[i];
					break;
				}
			}
			
			$('#id_usuariotxt').val(usuario.id_usuario);
			$('#contrasenatxt').val(usuario.contrasena);
			$('#correotxt').val(usuario.correo);
			$('#nombretxt').val(usuario.nombre);
			$('#ape_pattxt').val(usuario.apellido_paterno);
			$('#ape_mattxt').val(usuario.apellido_materno);
			
		};
		
		function agregar(){
			$('#bloqueo').fadeIn();
			$('#error').html('');
			$('#actualizar').hide();
			$('#agrear').show();
			$('#titulo').html("Ingresa los datos del usuario");
			$("#id_usuariotxt").prop('disabled', false);
			$('#id_usuariotxt').val("");
			$('#contrasenatxt').val("");
			$('#correotxt').val("");
			$('#nombretxt').val("");
			$('#ape_pattxt').val("");
			$('#ape_mattxt').val("");
			
		};
		
		function filaUsuario(usuario, orden){
			var nomberCompleto = (usuario.nombre ? (usuario.nombre + " ") : "") + (usuario.apellido_paterno ? (usuario.apellido_paterno + " ") : "") + (usuario.apellido_materno ? usuario.apellido_materno : "");
			var cadena = "";
			var classSorting = " class = sorting_1 ";
			cadena += "<td" + (orden == 0 ? classSorting : "") + ">" + usuario.id_usuario + "</td>";
			cadena += "<td" + (orden == 1 ? classSorting : "") + ">" + (usuario.correo ? usuario.correo : "--") + "</td>";
			cadena += "<td>" + usuario.contrasena + "</td>";
			cadena += "<td" + (orden == 3 ? classSorting : "") + ">" + (nomberCompleto ? nomberCompleto : "--")  + "</td>";
			cadena += "<td class='center'><a href='javascript:estatus(&quot " + usuario.id_usuario + "&quot)'>" + (usuario.status == "1" ? "+" : "-") +"</a></td>";
			cadena += "<td class='center'><a href='javascript:actualizar(&quot " + usuario.id_usuario + "&quot)'>Editar</a></td>";
			return cadena;
		}
		
	
			var usuarios = JSON.parse('<%= request.getAttribute("usuarios") %>');
			$(document).ready(function() {
				
				var cadena = "";
				for(var  i = 0; i < usuarios.length; i++){
					var usuario = usuarios[i];
					cadena += "<tr class = 'gradeA' id='" + usuario.id_usuario  + "'>";
					cadena += filaUsuario(usuario);
					cadena += "</tr>";
				}
				
				$('tbody').html(cadena);
				
				$('#example').dataTable();
				$('th').each(function(i,e){
					if(i == 2 || i == 4 || i == 5){
						$(this).removeClass("sorting");
					}
				})
				$('#agregarUsuario').on('click', agregar);
				
				$("#regresar").on('click', function(){
					$('#bloqueo').fadeOut();
				});
				
				$("#bloqueo").on('click', function(){
					$('#bloqueo').fadeOut();
				});
				
				$("#divEliminar").on('click', function(){
					return false;
				});
				
				$("#agrear").on('click', function(){
				
				var requerido = false;
					$('.requerido').each(function (i, e){
						if($.trim($(e).val()) == "" ){
							$('#error').html('Falto ingresar algun campo requerido').addClass('error').removeClass('correcto');
							requerido =  true;
							return;
						}	
					});
					
					if(requerido) return false;
					
					var usuario = {
						id_usuario : $('#id_usuariotxt').val(),
						correo : $('#correotxt').val(),
						contrasena : $('#contrasenatxt').val(),
						nombre : $('#nombretxt').val(),
						apellido_paterno : $('#ape_pattxt').val(),
						apellido_materno : $('#ape_mattxt').val(),
						status : true
						
					};
					
					
					$.post("agregarUsuario.htm", { 'usuario' : JSON.stringify(usuario) }, function(respuesta){
						
						var resp = JSON.parse(respuesta);
						
						if(resp.respuesta == "1"){
							
							$('#error').html('Se agrego el usuario: <strong>' + usuario.id_usuario + '</strong>').addClass('correcto').removeClass('error');
						
							var nomberCompleto = (usuario.nombre ? (usuario.nombre + " ") : "") + (usuario.apellido_paterno ? (usuario.apellido_paterno + " ") : "") + (usuario.apellido_materno ? usuario.apellido_materno : "");
						
							$('#example').dataTable().fnAddData( [
						        usuario.id_usuario,
						        usuario.correo ? usuario.correo : "--",
						        usuario.contrasena,
						        nomberCompleto ? nomberCompleto : "--",
						        "<a href='#'>" + (usuario.status == "1" ? "+" : "-") + "</a>",
						        "<a href='javascript:actualizar(&quot " + usuario.id_usuario + "&quot)'>Editar</a>"
						         ] );
						     var lst = $('tr[class="odd"]');
						     if(lst.length < 1){
						     	lst = $('tr[class="even"]');
						     }
						     lst.addClass("gradeA");
						     lst.attr("id", usuario.id_usuario);
						     $('#'+ usuario.id_usuario).addClass("gradeA");
						     $($('#'+ usuario.id_usuario + ' td')[4]).addClass("center");
						     $($('#'+ usuario.id_usuario + ' td')[5]).addClass("center");
						     
						     usuarios.push(usuario);
						     
						   }else{
						   		$('#error').html(resp.error).addClass('error').removeClass('correcto');
						   }
						
					});
					
				});
				
				$("#actualizar").on('click', function(){
					
					var requerido = false;
					$('.requerido').each(function (i, e){
						if($.trim($(e).val()) == "" ){
							$('#error').html('Falto ingresar algun campo requerido').addClass('error').removeClass('correcto');
							requerido =  true;
							return;
						}						
					});
					
					if(requerido) return false;
					
					var usuario = {
						id_usuario : $('#id_usuariotxt').val(),
						correo : $('#correotxt').val(),
						contrasena : $('#contrasenatxt').val(),
						nombre : $('#nombretxt').val(),
						apellido_paterno : $('#ape_pattxt').val(),
						apellido_materno : $('#ape_mattxt').val()
						
					};
					
					$.post("actualizarUsuario.htm", { 'usuario' : JSON.stringify(usuario) }, function(respuesta){
					
						var resp = JSON.parse(respuesta);
						
						if(resp.respuesta == "1"){														
							
							
							$('#bloqueo').fadeOut();
							var orden = "";
							$('#' + usuario.id_usuario + " td").each(function(i,e){
								if($(e).hasClass("sorting_1")){
									orden = i;
								}
							});
							var cadena = "";
							
							cadena += filaUsuario(usuario, orden);
							$('#' + usuario.id_usuario).html(cadena);
							
							for(var i = 0; i < usuarios.length; i++){
								if(usuarios[i].id_usuario == $.trim(usuario.id_usuario)){
									usuarios[i].correo = usuario.correo;
									usuarios[i].contrasena = usuario.contrasena;
									usuarios[i].nombre = usuario.nombre;
									usuarios[i].apellido_paterno = usuario.apellido_paterno;
									usuarios[i].apellido_materno = usuario.apellido_materno;
									break;
								}
							}
							
						}else{
							$('#error').html(resp.error).addClass('error').removeClass('correcto');
						}
					});
				});
				
			} );
	</script>
</body>
</html>
