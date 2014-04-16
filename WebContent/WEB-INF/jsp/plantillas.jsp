<!DOCTYPE HTML>
<%@page import="com.biblicon.util.Constantes"%>
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
   <script src="js/ficha.js"></script>
</head>
<body>
	<div class="bloqueo" id="bloqueo">
			<div class="divEliminar" id="divEliminar">
				<h4>Selecciona la plantilla</h4>
				<div class="error" id="error2"></div>
				<select id="listaPlantillas">
					
				</select>
				<br/>
				<br/>
				<div id="ejmplantilla"></div>
				<input type="submit" value="Eliminar" id="borrado"/>
				<input type="submit" value="Regresar" id="regresar"/>
			</div>
		</div>
	<header>
		<h1>Biblicon</h1>
	</header>
	<nav>
		<ul>
			<li><a href="principal.htm">Fichas</a></li>
			<li><a href="fichasCompartidas.htm">Fichas Compartidas</a></li>
			<li><a href="ficha.htm">Agregar Ficha</a></li>
			<li><a href="tipos.htm">Tipo de Fichas</a></li>
			<li><a href="plantillas.htm">Plantillas</a></li>
		</ul>
	</nav>
	<section>
		<div class="contenidoNotabla">
			<div class="datostipoficha">
				<div class="error" id="error"></div>
				<label for="nombreficha" >Nombre de la plantilla: </label><input placeholder="Ingresa el nombre" id="nombrePlatilla" value="" />
				<input type="submit" value="Agregar" id="agregar"/>
				<input type="submit" value="Consultar" id="eliminar"/>
			</div>
			<div class="cdisponible" id="cAgregar">
				<button>,</button>
				<button>.</button>
				<button>;</button>
				<div id="general">
					<span>Autor</span><hr/>
					<button id="<%=Constantes.titulo  %>"> </button>
					<button id="<%=Constantes.apellido  %>"> </button>
					<button id="<%=Constantes.nombre  %>"> </button>
					<button id="<%=Constantes.categoria %>"> </button>
				</div>
				<div id="otro">
					<span>Otro</span><hr/>
					<button id="<%=Constantes.apellido_otro %>"> </button>
					<button id="<%=Constantes.nombre_otro %>"> </button>
					<button id="<%=Constantes.et_al %>"> </button>
				</div>
				<div id="edicion">
					<span>Edición</span><hr/>
					<button id="<%=Constantes.tipo  %>"> </button>
					<button id="<%=Constantes.edicion_de  %>"> </button>
					<button id="<%=Constantes.traduccion  %>"> </button>
					<button id="<%=Constantes.prologo %>"> </button>					
					<button id="<%=Constantes.editorial %>"> </button>					
					<button id="<%=Constantes.ciudad  %>"> </button>
					<button id="<%=Constantes.ano %>"> </button>
					<button id="<%=Constantes.edicion %>"> </button>
					<button id="<%=Constantes.otros_datos %>"> </button>				
					<button id="<%=Constantes.paginas %>"> </button>
					<button id="<%=Constantes.revista %>"> </button>
					<button id="<%=Constantes.tomo  %>"> </button>					
					<button id="<%=Constantes.numero  %>"> </button>
					<button id="<%=Constantes.pagina_ini  %>"> </button>
					<button id="<%=Constantes.pagina_fin  %>"> </button>					
					<button id="<%=Constantes.titulo_libro  %>"> </button>
					<button id="<%=Constantes.periodico %>"> </button>
					<button id="<%=Constantes.seccion %>"> </button>
					<button id="<%=Constantes.dia %>"> </button>
					<button id="<%=Constantes.mes %>"> </button>
					<button id="<%=Constantes.semana  %>"> </button>
				</div>
				
				<div id="ubicacion">
					<span>Ubicación</span><hr/>					
					<button id="<%=Constantes.institucion %>"> </button>
					<button id="<%=Constantes.coleccion %>"> </button>
					<button id="<%=Constantes.biblioteca  %>"> </button>
					<button id="<%=Constantes.localizacion  %>"> </button>
				</div>
				
				<div id="editor">
					<span>Editor</span><hr/>
					<button id="<%=Constantes.apellido_editor %>"> </button>
					<button id="<%=Constantes.nombre_editor %>"> </button>
					<button id="<%=Constantes.editor %>"> </button>
				</div>
					
				<div id="editor_otro">
					<span>Editor Otro</span><hr/>
					<button id="<%=Constantes.apellido_editor_otro  %>"> </button>
					<button id="<%=Constantes.nombre_editor_otro  %>"> </button>
					<button id="<%=Constantes.et_al_editor  %>"> </button>
				</div>	
				<div id="internet">
					<span>Internet</span><hr/>
					<button id="<%=Constantes.url %>"> </button>
					<button id="<%=Constantes.portal  %>"> </button>
					<button id="<%=Constantes.fecha_acceso  %>"> </button>
					<button id="<%=Constantes.fecha_publicacion %>"> </button>
				</div>
				
				<div id="notas">
					<span>Notas</span><hr/>
					<button id="<%=Constantes.notas %>"> </button>
				</div>
				
				<div id="personales">
					<span>Personales</span><hr/>
					<button id="<%=Constantes.a %>"> </button>
					<button id="<%=Constantes.b %>"> </button>
					<button id="<%=Constantes.c %>"> </button>
					<button id="<%=Constantes.d %>"> </button>
				</div>
			</div>
			<div class="panel" id="cplantilla" >
				<div class="controles">
					<a href="#" class="negritas" id="negritas">B</a><a href="#" class="italica" id="italica">I</a><a href="#" class="subrayado" id="subrayado">S</a><a href="#" class="comillas" id="comillas"></a><a style="float: right;" id="quitar" href="#">Borrar</a>
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
			var encontrada = false;
			for(var i = 0; i < plantillas.length; i++){
				if(plantillas[i].id_platilla == $(this).val()){
					$('#ejmplantilla').html(plantillas[i] ? plantillas[i].plantilla : "");
					encontrada = true;
					break;
				}
			}
			
			if(!encontrada)
				$('#ejmplantilla').html("No se encontro la plantilla");
			
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
			$('#textplatilla').append('<div>'+ (this.id ? ('{{' + this.id + '}}') : $(this).html()) +'</div>');
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
			
			
			$.post("guardarPlantilla.htm", {"nombrePlantilla" : nombre, "plantilla" : plantilla}	, function(respuesta){
				var resp = JSON.parse(respuesta);
				if(resp.respuesta == "1"){
					$('#listaPlantillas').append('<option value="'+ resp.id +'">' +nombre+ '</option>');
					if($('#ejmplantilla').html() == "")
						$('#ejmplantilla').html(plantilla);
					plantillas.push({
						id_platilla : resp.id,
						nombrePlantilla : nombre,
						plantilla : plantilla
					});
					$('#nombrePlatilla').val('');
					$('#textplatilla').html('');
					$('#error').removeClass('error').addClass('correcto').html('Se agrego el tipo de plantilla <strong>' + nombre + '</strong>');
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
					var idp = $('#listaPlantillas').val();
					$('#ejmplantilla').html('');
					for(var i = 0; i < plantillas.length; i++){ 	
						var plantilla = plantillas[i];
						if(plantilla.id_platilla == idp){
							$('#ejmplantilla').html(plantilla.plantilla);
						}
					}
					
					$('#bloqueo').fadeOut();
				}else{
					$('#error').html(respuesta);
				}
			});
		});
		
		
		$("#divEliminar").on('click', function(){
			return false;
		});
		
		var plantillas = <%= request.getAttribute("plantillas") %>;
		var opciones = "";
		for(var i = 0; i < plantillas.length; i++){ 	
			var plantilla = plantillas[i];
			 opciones+= '<option value="' + plantilla.id_platilla + '">'+ plantilla.nombrePlantilla +'</option>';
		}
		$('#listaPlantillas').html(opciones);
		$('#ejmplantilla').html(plantillas[0] ? plantillas[0].plantilla : "");
		
		$('.cdisponible div button').each(function(i, e){
			$(e).html(biblicon.ficha.constantes[e.id]);
		});
		

	});
	</script>
</body>
</html>
