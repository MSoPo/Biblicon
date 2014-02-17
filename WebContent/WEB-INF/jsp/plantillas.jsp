<!DOCTYPE HTML>
<html>
<head>
   <meta charset="UTF-8">
   <title>Biblicon Plantillas</title>
   <link rel="stylesheet" href="css/normalize.css">
   <link rel="stylesheet" href="css/estilos.css">
   <!-- Quitar despues de compilar stylus -->
   <link rel="stylesheet" href="css/tipoficha.css">
   <link rel="stylesheet" href="css/plantila.css">
   <script src="js/jquery-2.0.3.min.js"></script>
</head>
<body>
	<div class="bloqueo" id="bloqueo">
			<div class="divEliminar" id="divEliminar">
				<h4>Selecciona la plantilla a eliminar</h4>
				<div class="error" id="error2"></div>
				<select id="listaPlantillas">
					
				</select>
				<br/>
				<input type="submit" value="Aceptar" id="borrado"/>
				<input type="submit" value="Regresar" id="regresar"/>
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
		<div class="contenidoNotabla">
			<div class="datostipoficha">
				<div class="error" id="error"></div>
				<label for="nombreficha" >Tipo ficha: </label><input placeholder="Ingresa el nombre" id="nombrePlatilla" value="Plantilla1" />
				<input type="submit" value="Agregar" id="agregar"/>
				<input type="submit" value="Eliminar" id="eliminar"/>
			</div>
			<div class="cdisponible" id="cAgregar">
				<button>,</button>
				<button>.</button>
				<button>;</button>
				<hr/>
				<button>Nombre</button>
				<button>Nombre_Otro</button>
				<button>Apellido</button>
				<button>Apellido_Otro</button>
				<button>A</button>
				<button>B</button>
				<button>C</button>
				<button>D</button>
				<button>Titulo</button>
				<button>Autor</button>
				<button>Editorial</button>
				<button>Año</button>
				<button>Fecha</button>
				<button>Pagina</button>
				<button>Biblioteca</button>
				<button>Revista</button>
				<button>url</button>
				<button>Nombre</button>
				<button>Nombre_Otro</button>
				<button>Apellido</button>
				<button>Apellido_Otro</button>
				<button>A</button>
				<button>B</button>
				<button>C</button>
				<button>D</button>
				<button>Titulo</button>
				<button>Autor</button>
				<button>Editorial</button>
				<button>Año</button>
				<button>Fecha</button>
				<button>Pagina</button>
				<button>Biblioteca</button>
				<button>Revista</button>
				<button>url</button>
			</div>
			<div class="panel" id="cplantilla" >
				<div class="controles">
					<a href="#" class="negritas" id="negritas">B</a><a href="#" class="italica" id="italica">I</a><a href="#" class="subrayado" id="subrayado">S</a><a href="#" class="comillas" id="comillas"></a><a id="quitar" href="#">X</a>
				</div>
				<div id="textplatilla"></div>
			</div>
		</div>
	</section>
	<footer>
		-- Derechos Reservados --
	</footer>
	
	<script type="text/javascript">
	
	$(function() {
		$("#nombrePlatilla").on('keypress', function(){
			$('#error').html('');
		});
		
		$("#eliminar").on('click', function(){
			$('#error').html('');
			$('#bloqueo').fadeIn();
			$('#error2').html('');
		});
		
		$("#listaPlantillas").on('change', function(){
			$('#error2').html('');
		});
		
		$("#regresar").on('click', function(){
			$('#bloqueo').fadeOut();
		});

		$("#bloqueo").on('click', function(){
			$('#bloqueo').fadeOut();
		});

		$("#negritas").on('click', 
			function(ev) {
				$('.campoMarcado').each(function (indice, elemento){
					$(elemento).removeClass('campoMarcado');
					if($(elemento).hasClass('negritas')){
						$(elemento).removeClass('negritas');
					}else{
						$(elemento).addClass('negritas');
					}
				});
				return false;
		});

		$("#italica").on('click', 
			function(ev) {
				$('.campoMarcado').each(function (indice, elemento){
					$(elemento).removeClass('campoMarcado');
					if($(elemento).hasClass('italica')){
						$(elemento).removeClass('italica');
					}else{
						$(elemento).addClass('italica');
					}
				});
				return false;
		});

		$("#subrayado").on('click', 
			function(ev) {
				$('.campoMarcado').each(function (indice, elemento){
					$(elemento).removeClass('campoMarcado');
					if($(elemento).hasClass('subrayado')){
						$(elemento).removeClass('subrayado');
					}else{
						$(elemento).addClass('subrayado');
					}
				});
				return false;
		});

		$("#comillas").on('click', 
			function(ev) {
				$('.campoMarcado').each(function (indice, elemento){
					$(elemento).removeClass('campoMarcado');
					if($(elemento).hasClass('comillas')){
						$(elemento).removeClass('comillas');
					}else{
						$(elemento).addClass('comillas');
					}
				});
				return false;
		});

		$("#quitar").on('click', 
			function(ev) {
				$('.campoMarcado').each(function (indice, elemento){
					$(elemento).removeClass('campoMarcado');
					$(elemento).remove();
					$('br + br').remove();
				});
				return false;
		});

		$('.cdisponible button').on('click', function(e){
			$('#error').html('');
			$('#textplatilla').append('<div>'+ $(this).html() +'</div>');
		});

		$('#textplatilla').on('click', 'div', function(){
			if($(this).hasClass('campoMarcado')){
				$(this).removeClass('campoMarcado');
			}else{
				$(this).addClass('campoMarcado');
			}
		});
		
		$('#agregar').on('click', function() {

			var nombre = $.trim($("#nombrePlatilla").val());
			$("#error").html('');
			$('#error').addClass('error').removeClass('correcto');
			var plantilla = $('#textplatilla').html();
			
			if($('#textplatilla div').length == 0){
				$("#error").html("Selecciona algun campo");
				return false;
			}
			
			if(nombre.length == 0){
				$("#error").html("Ingresa el nombre de la ficha");
				return false;
			}
			
			
			$.post("agregarPlantilla.htm", {"nombrePlantilla" : nombre, "plantilla" : plantilla}	, function(respuesta){
				var resp = JSON.parse(respuesta);
				if(resp.respuesta == "1"){
					$('#listaPlantillas').append('<option value="'+ resp.id +'">' +nombre+ '</option>');
					$('#nombrePlatilla').val('');
					$('#textplatilla').html('');
					$('#error').removeClass('error').addClass('correcto').html('Se agrego el tipo de plantolla <strong>' + nombre + '</strong>');
				}else{
					$('#error').html(respuesta);
				}
			});
		});
		
		$("#borrado").on('click', function(){
			$("#error").removeClass('correcto').addClass('error').html('');
			$('#error2').html('');
			if($('#listaPlantillas').val() == 0){
				$('#error2').html("Selecciona un tipo");
				return false;
			}
			
			$.post("eliminarPlantilla.htm", {"idPlantilla" : $('#listaPlantillas').val()}	, function(respuesta){
				if(respuesta == "1"){
					$('#error').removeClass('error').addClass('correcto');
					$('#error').html('Se elimino el tipo de ficha <strong>' + $('#listaPlantillas option[value=' + $('#listaPlantillas').val() + ']').html() + '</strong>');
					$('#listaPlantillas option[value=' + $('#listaPlantillas').val() + ']').remove();
					$('#bloqueo').fadeOut();
				}else{
					$('#error').html(respuesta);
				}
			});
		});
		
		
		$("#divEliminar").on('click', function(){
			return false;
		});
		
		var plantillas = JSON.parse('<%= request.getAttribute("plantillas") %>');
		var opciones = '<option value="0">Selecciona la plantilla</option>';
		for(var i = 0; i < plantillas.length; i++){
			var plantilla = plantillas[i];
			 opciones+= '<option value="' + plantilla.id_platilla + '">'+ plantilla.nombrePlantilla +'</option>';
		}
		$('#listaPlantillas').html(opciones);
		

	});
	</script>
</body>
</html>
