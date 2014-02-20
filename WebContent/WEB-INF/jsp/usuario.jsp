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
							<th colspan="6">Usuario</th>
						</tr>
					</tfoot>
				</table>
			</div>
	</section>
	<footer>
		-- Derechos Reservados --
	</footer>
	
	<script type="text/javascript">
	
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
		
		function filaUsuario(usuario){
			var cadena = "";
			cadena += "<td>" + usuario.id_usuario + "</td>";
			cadena += "<td>" + usuario.correo + "</td>";
			cadena += "<td>" + usuario.contrasena + "</td>";
			cadena += "<td>" + usuario.nombre + usuario.apellido_paterno + usuario.apellido_materno + "</td>";
			cadena += "<td class='center'><a href='#'>Estatus</a></td>";
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
					
					/////////////Metodo para registrar////////AJAX
					
					var usuario = {
						id_usuario : $('#id_usuariotxt').val(),
						correo : $('#correotxt').val(),
						contrasena : $('#contrasenatxt').val(),
						nombre : $('#nombretxt').val(),
						apellido_paterno : $('#ape_pattxt').val(),
						apellido_materno : $('#ape_mattxt').val()
						
					};
					
					$('#error').html('Se agrego el usuario: <strong>' + usuario.id_usuario + '</strong>').addClass('correcto').removeClass('error');
					
					$('#example').dataTable().fnAddData( [
				        usuario.id_usuario,
				        usuario.correo,
				        usuario.contrasena,
				        usuario.nombre + usuario.apellido_paterno + usuario.apellido_materno,
				        "<a href='#'>Estatus</a>",
				        "<a href='javascript:actualizar(&quot " + usuario.id_usuario + "&quot)'>Editar</a>"
				         ] );
				         
				     
				     var lst = $('tr[class="odd"]');
				     if(lst.length < 0){
				     	lst = $('tr[class="even"]');
				     }
				     	lst.addClass("gradeA");
				     	lst[0].attr("id", usuario.id_usuario);
				     
				     
				     
				     
				     $('#'+ usuario.id_usuario).addClass("gradeA");
				     $($('#'+ usuario.id_usuario + ' td')[4]).addClass("center");
				     $($('#'+ usuario.id_usuario + ' td')[5]).addClass("center");
				     
				     //
				
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
					
					/////////////Metodo para actualizar/////////AJAX
					$('#bloqueo').fadeOut();
					
					var usuario = {
						id_usuario : $('#id_usuariotxt').val(),
						correo : $('#correotxt').val(),
						contrasena : $('#contrasenatxt').val(),
						nombre : $('#nombretxt').val(),
						apellido_paterno : $('#ape_pattxt').val(),
						apellido_materno : $('#ape_mattxt').val()
						
					};
					
					var cadena = "";
					cadena += filaUsuario(usuario);
					$('#' + usuario.id_usuario).html(cadena);
					
					/////////////////////////////////////////////
					
				});
				
			} );
	</script>
</body>
</html>
