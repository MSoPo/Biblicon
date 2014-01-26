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
	<header>
		<h1>Biblicon</h1>
	</header>
	<nav>
		<ul>
			<li><a href="#">Fichas</a></li>
			<li><a href='#'>Tipo de fichas</a></li>
			<li><a href="#">Plantilla</a></li>
			<li><a href="#">Ayuda</a></li>
			<li><a href="#">Acerca de</a></li>
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
			$('#textplatilla').append('<div>'+ $(this).html() +'</div><br/>');
		});

		$('#textplatilla').on('click', 'div', function(){
			if($(this).hasClass('campoMarcado')){
				$(this).removeClass('campoMarcado');
			}else{
				$(this).addClass('campoMarcado');
			}
		});
		
		$('#agregar').on('click', function() {

			var nombreTipo = $.trim($("#nombrePlatilla").val());
			$("#error").html('');
			$('#error').addClass('error').removeClass('correcto');
			
			if($('#textplatilla div').length == 0){
				$("#error").html("Selecciona algun campo");
				return false;
			}
			
			if(nombreTipo.length == 0){
				$("#error").html("Ingresa el nombre de la ficha");
				return false;
			}
			
			
			/*$.post("agregarTipo.htm", {"nombreTipo" : nombreTipo, "camposTipo" : JSON.stringify(camposAgregar)}	, function(respuesta){
				var resp = JSON.parse(respuesta);
				if(resp.respuesta == "1"){
					$('#listaTipo').append('<option value="'+ resp.id +'">' +nombreTipo+ '</option>');
					$('#nombreficha').val('');
					$('#cdisponible div').css("display", "inline-block");
					$('#cseleccionado div').remove();
					$('#error').removeClass('error').addClass('correcto').html('Se agrego el tipo de ficha <strong>' + nombreTipo + '</strong>');
				}else{
					$('#error').html(respuesta);
				}
			});*/
		});

	});
	</script>
</body>
</html>
