<!DOCTYPE HTML>
<html>
<head>
   <meta charset="UTF-8">
   <title>Biblicon Fichas</title>
   <link rel="stylesheet" href="css/normalize.css">
   <link rel="stylesheet" href="css/estilos.css">
   <link rel="stylesheet" href="css/tipoficha.css">
   <link rel="stylesheet" href="css/ficha.css">
   <script src="js/jquery-2.0.3.min.js"></script>
   <script src="js/mustache.js"></script>
   <script src="js/jquery.redirect.min.js"></script>
   <script src="js/ficha.js"></script>
</head>

<body>
	<div class="bloqueo" id="bloqueo">
			<div class="divEliminar" id="divEliminar">
				<div></div>
				<input type="hidden" value="" id="id_ficha"/>
				<input type="submit" value="Aceptar" id="borrado"/>
				<input type="submit" value="Aceptar" id="clonado" />
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
			<li><a href="fichasCompartidas.htm">Fichas Compartidas</a></li>
			<li><a href="ficha.htm">Agregar Ficha</a></li>
			<li><a href="tipos.htm">Tipo de Fichas</a></li>
			<li><a href="plantillas.htm">Plantillas</a></li>
		</ul>
	</nav>
	<section>
		<div class="contenido">
			<div class="filtros">
				<div class="filtro">
				Buscar:<input id="buscartxt" placeholder="Ingresa el concepto">
				
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
					<input type="submit" id="Buscarbtn" class="btnGuardar" value="Buscar" />
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
	
		function enviarContenidoFicha(idficha) {
					
			$().redirect('contenido.htm', {'idFicha': idficha, 'entrada' : 1});
		}
		
		function cargarFichaCompleta(agregar){
			$('#bloqueo').fadeIn();
			$($('#divEliminar div')[0]).html(agregar);
			$('#borrado').hide();
			$('#compartir').hide();
			
		}
		
		
	
		$(function() {
			var tipos = JSON.parse('<%= request.getAttribute("tipos") %>');
			var categorias = JSON.parse('<%= request.getAttribute("categorias") %>');
			var fichas = JSON.parse('<%= request.getAttribute("fichas") %>');
		
			cargarFichasArticle(fichas);
			
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
			
			$("#categorias").html(outputCate);
			$("#tipos").html(output);
			
			
			$('.fichas').on('click', '.borrarficha', function(ev){
				ev.preventDefault();
				$('#bloqueo').fadeIn();
				$($('#divEliminar div')[0]).html('<h4>¿Seguro que deseas eliminar la ficha?</h4>');
				$('#id_ficha').val($(this).parent().children('input').val());
				$('#clonado').hide();
				$('#borrado').show();
				
			});
			
			$('.fichas').on('click', '.clonar', function(ev){
				ev.preventDefault();
				$('#bloqueo').fadeIn();
				$($('#divEliminar div')[0]).html('<h4>¿Seguro que deseas clonar esta ficha?</h4>');
				$('#id_ficha').val($(this).parent().children('input').val());
				$('#borrado').hide();
				$('#clonado').show();
				
			});
			
			$('#clonado').on(function(){
				$.post("clonarFicha.htm", { 'id' : $('#id_ficha').val()}, function(respuesta){
					if(respuesta == "1"){
						$('#bloqueo').fadeOut();
					}else{
						$('#error').html(respuesta.error);
					}
				});
			});
			
			$("#borrado").on('click', function(){
				$.post("eliminarFichaComartida.htm", { 'id' : $('#id_ficha').val()}, function(respuesta){
					if(respuesta == "1"){
						$('#bloqueo').fadeOut();
					}else{
						$('#error').html(respuesta.error);
					}
				});
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
			
			$("#Buscarbtn").on('click', function(){
				
				var lsttipos = []; 
				var lstcategorias = [];
				var busqueda = "";  
				$("#tipos input[type=checkbox]:checked").each(function(i,e){
					lsttipos.push($(e).val());
				});
				
				$("#categorias input[type=checkbox]:checked").each(function(i,e){
					lstcategorias.push($(e).val());
				});
				
				if(lstcategorias.length == 0) lstcategorias = "";
				if(lsttipos.length == 0) lsttipos = "";
				
				busqueda = $('#buscartxt').val();
				
				$.post('busquedaCompartidas.htm', {categoria : (lstcategorias == "" ? lstcategorias : JSON.stringify(lstcategorias)), tipo_ficha : (lsttipos == "" ? lsttipos : JSON.stringify(lsttipos)), busqueda : busqueda}, function(respuesta){
					var resp = JSON.parse(respuesta);
					if(resp.respuesta == "1"){
						cargarFichasArticle(resp.fichas);
					}else{
					
					} 
				});
			
			});

		});
		
		function cargarFichasArticle(fichas){
			var outputFichas = "";
			for(var j = 0; j < fichas.length; j++){
				var ficha = fichas[j];
				var campos = ficha.campos;
				var template = '<article><div class="tipoficha acciones"><a href="Javascript:buscarPorTipoFicha('+ficha.tipo_ficha.id_tipo_ficha+' )">'+ ficha.tipo_ficha.nombre_tipo +'<a></div>';
				var titulo = "";
				var nombre = "";
				var apellido = "";
				var agregar = "";
				var seccionAnterior = "";

				for(var i = 0; i < campos.length; i++){
				
					var campo = campos[i]; 
					var seccion = campo.seccion;
					if(seccion != seccionAnterior && campo.valor){
						agregar += '<hr/>' + campo.seccion + '<hr/>';
					}
					
					if(campo.nombre_campo == "titulo"){
						titulo = campo.valor;
					}else if(campo.nombre_campo == "nombre"){
						nombre = campo.valor;
					}else if(campo.nombre_campo == "apellido"){
						apellido = campo.valor;
					}
					
					if(campo.valor){
						agregar += '<p>' + biblicon.ficha.constantes[campo.nombre_campo] + ': <span>'+ campo.valor +'</span></p>';
					
						if(seccion != seccionAnterior){
							seccionAnterior = seccion;
						}
					}
						
				}
				
				template += '<p>' + biblicon.ficha.constantes["titulo"] + ': <span>'+ titulo +'</span></p>';
				template += '<p>' + biblicon.ficha.constantes["apellido"] + ': <span>'+ apellido +'</span></p>';
				template += '<p>' + biblicon.ficha.constantes["nombre"] + ': <span>'+ nombre +'</span></p>';
				
				template += '<p><span> <a class="ver_todo" href="javascript:cargarFichaCompleta(&quot' + agregar + '&quot)"> ver todo... </a> </span></p>';
				template += '<div class="acciones">';
				template += (ficha.cantidadContenido ? '<a href="javascript:enviarContenidoFicha('+ficha.id_ficha+',\''+ ficha.apellido+'\',\''+ ficha.ano+'\' )">Fichas de Contenido('+ ficha.cantidadContenido+')</a>' : ''); 
				template += '<a href="#" class="clonar">Clonar</a><a href="#" class="borrarficha">Borrar</a>'+
				'<input type="hidden" value="'+ficha.id_ficha+'"/></div></article>';
			
				
				outputFichas += template;
			}
			

			$("#fichas").html(outputFichas);
		}
		
		function buscarPorTipoFicha(tipo_ficha){
			
				$.post('principalBusqueda.htm', {categoria : "", tipo_ficha : tipo_ficha, busqueda : ""}, function(respuesta){
					var resp = JSON.parse(respuesta);
					if(resp.respuesta == "1"){
						cargarFichasArticle(resp.fichas);
					}else{
					
					} 
				});
		}
	</script>
</body>
</html>
