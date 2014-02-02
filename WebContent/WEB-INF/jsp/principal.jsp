<!DOCTYPE HTML>
<html>
<head>
   <meta charset="UTF-8">
   <title>Biblicon Fichas</title>
   <link rel="stylesheet" href="css/normalize.css">
   <link rel="stylesheet" href="css/estilos.css">
   <link rel="stylesheet" href="css/tipoficha.css">
   <script src="js/jquery-2.0.3.min.js"></script>
   <script src="js/mustache.js"></script>
   <script src="js/jquery.redirect.min.js"></script>
</head>
<body>
	<header>
		<h1>Biblicon</h1>
	</header>
	<nav>
		<ul>
			<li><a href="#">Fichas</a></li>
			<li><a href="#">Agregar Ficha</a></li>
			<li><a href="tipos.htm">Tipo de Fichas</a></li>
			<li><a href="#">Plantillas</a></li>
			<li><a href="#">Ayuda</a></li>
			<li><a href="#">Acerca de</a></li>
		</ul>
	</nav>
	<section>
	<div class="bloqueo" id="bloqueo">
			<div class="divEliminar" id="divEliminar">
				<div></div>
				<input type="hidden" value="" id="id_ficha"/>
				<input type="submit" value="Aceptar" id="borrado"/>
				<input type="submit" value="Compartir" id="compartir" />
				<input type="submit" value="Regresar" id="regresar"/>
			</div>
		</div>
		<div class="contenido">
			<div class="filtros">
				<div class="filtro">
				Buscar:<input>
				
				</div>
				
				<div class="filtro">
				<hr/>
				<strong>Selecciona el tipo</strong>
					<div id="tipos"></div>
				</div>
				<div class="filtro">
				<hr/>
				<strong>Selecciona la categoria</strong>
					<div id="categorias"></div>
					<button>Buscar</button>
				</div>
			</div>
			<div class="fichas" id="fichas">
				
			</div>
		</div>
	</section>
	<footer>
		-- Derechos Reservados --
	</footer>
	
	<script type="text/javascript">
	
		function enviarContenidoFicha(idficha,apellido,ano) {
					
			$().redirect('contenido.htm', {'idFicha': idficha,'apellido':apellido,'ano':ano});
		}
		
	
		$(function() {
			var tipos = JSON.parse('<%= request.getAttribute("tipos") %>');
			var categorias = JSON.parse('<%= request.getAttribute("categorias") %>');
			var fichas = JSON.parse('<%= request.getAttribute("fichas") %>');
		
			var output = "";
			
			for(var i = 0; i < tipos.length; i++){
				var tipo = tipos[i];
				var view = {
						id_tipo: tipo.id_tipo_ficha,
						nombre: tipo.nombre_tipo
				};
				
				 var template = '<div><input type="checkbox" value="{{id_tipo}}" id="tipo_{{id_tipo}}"/><label for = "{{id_tipo}}">  {{nombre}}</label></div>';
				output += Mustache.render(template,view);
			}
			
			var outputCate = "";
			for(var i = 0; i < categorias.length; i++){
				var tipo = categorias[i];
				var view = {
						nombre: tipo
				};
				
				 var template = '<div><input type="checkbox" value="{{nombre}}" id="tipo_{{nombre}}"/><label for = "{{nombre}}">  {{nombre}}</label></div>';
				 outputCate += Mustache.render(template,view);
			}
			
			var outputFichas = "";
			for(var i = 0; i < fichas.length; i++){
				var ficha = fichas[i];
				var campos = ficha.campos;
				var template = '<article><div class="tipoficha acciones"><a href="#">'+ ficha.tipo_ficha.nombre_tipo +'<a></div>';
				for(var j in campos){
					template += '<p>' + j + ': <span>'+ campos[j] +'</span></p>';
				}
				template += '<div class="acciones"><a href="#" class="compartirficha">Compartir('+ ficha.cantidadCompartida+')</a>';
				template += (ficha.cantidadContenido ? '<a href="javascript:enviarContenidoFicha('+ficha.id_ficha+',\''+ ficha.apellido+'\',\''+ ficha.ano+'\' )">Fichas de Contenido('+ ficha.cantidadContenido+')</a>' :
					'<a href="">Agregar Fichas de Contenido</a>'); 
				template += '<a href="#">Editar</a><a href="#" class="borrarficha">Borrar</a>'+
				'<input type="hidden" value="'+ficha.id_ficha+'"/></div></article>';
				outputFichas += template;
			}
			$("#categorias").html(outputCate);
			$("#fichas").html(outputFichas);
			$("#tipos").html(output);
			
			$('.fichas').on('click', '.compartirficha', function(ev){
				ev.preventDefault();
				$('#bloqueo').fadeIn();
				$($('#divEliminar div')[0]).html('<ul><li>Usuario1 <a href="#">x</a></li><li>Usuario2 <a href="#">x</a></li><li>Usuario3 <a href="#">x</a></li><li>Usuario4 <a href="#">x</a></li><li>Usuairo5 <a href="#">x</a></li>' +
						'<li>Usuario1 <a href="#">x</a></li><li>Usuario2 <a href="#">x</a></li><li>Usuario3 <a href="#">x</a></li><li>Usuario4 <a href="#">x</a></li><li>Usuairo5 <a href="#">x</a></li></ul>'+
						'<h4>Ingresa el nombre del usuario para compartir</h4> <input value="" id="usuariocompartir" />');
				$('#id_ficha').val($(this).parent().children('input').val());
				$('#borrado').hide();
				$('#compartir').show();
				
			});
			
			$('.fichas').on('click', '.borrarficha', function(ev){
				ev.preventDefault();
				$('#bloqueo').fadeIn();
				$($('#divEliminar div')[0]).html('<h4>¿Seguro que deseas eliminar la ficha?</h4>');
				$('#id_ficha').val($(this).parent().children('input').val());
				$('#compartir').hide();
				$('#borrado').show();
				
			});
			
			$("#borrado").on('click', function(){
				$.post("eliminarFicha.htm", { 'id' : $('#id_ficha').val()}, function(respuesta){
					if(respuesta == "1"){
						$('#listaPlantillas option[value=' + $('#listaPlantillas').val() + ']').remove();
						$('#bloqueo').fadeOut();
					}else{
						$('#error').html(respuesta);
					}
				});
			});
			
			$('#compartir').on('click', function(){
				
			});
			
			$("#regresar").on('click', function(){
				$('#bloqueo').fadeOut();
			});
			
			$("#bloqueo").on('click', function(){
				$('#bloqueo').fadeOut();
			});
			
			$("#divEliminar").on('click', function(){
				return false;
			});

		});
	</script>
</body>
</html>
