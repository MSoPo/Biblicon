<!DOCTYPE HTML>
<html>
<head>
   <meta charset="UTF-8">
   <title>Biblicon Fichas</title>
   <link rel="stylesheet" href="css/normalize.css">
   <link rel="stylesheet" href="css/estilos.css">
   <link rel="stylesheet" href="css/tipoficha.css">
   <link rel="stylesheet" href="css/ficha.css">
   <link rel="stylesheet" href="css/plantila.css">
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
				<input type="submit" value="Compartir" id="compartir" />
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
					
			$().redirect('contenido.htm', {'idFicha': idficha});
		}
		
		function nuevoContenidoFicha(idficha) {
			
			$().redirect('nuevaFichaContenido.htm', {'idFicha': idficha});
		}
		
		function actualizarFicha(idficha) {
					
			$().redirect('actualizarFicha.htm', {'idFicha': idficha});
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
			
			cargarFichasArticle(fichas);
			
			$("#categorias").html(outputCate);
			$("#tipos").html(output);
			
			$('.fichas').on('click', '.compartirficha', function(ev){
				ev.preventDefault();
				$('#id_ficha').val($(this).parent().children('input').val());
				$.post("consultarUsuariosFicha.htm", { 'id' : $('#id_ficha').val()}, function(respuesta){
					var resp = JSON.parse(respuesta);
					var lstUsuario = "";
					if(resp.respuesta == "1"){
						$('#bloqueo').fadeIn();
						lstUsuario += "<ul>";
						for(var i = 0; i < resp.usuarios.length; i++){
							var usuario = resp.usuarios[i].usuario;
							lstUsuario += '<li>' + usuario.id_usuario + ' <a href="#" id="' + usuario.id_usuario + '">x</a></li>';
						}
						lstUsuario += '</ul>';
						
						$($('#divEliminar div')[0]).html(lstUsuario + '<h4>Ingresa el nombre del usuario para compartir</h4> <input value="" id="usuariocompartir" />');
						$('#borrado').hide();
						$('#compartir').show();
					}else{
						$('#error').html(resp.error);
					}
				});
				
			});
			
			$('#divEliminar div').on('click', 'a', function(ev){
				$.post("borrarUsuarioCompartido.htm", { 'id' : $('#id_ficha').val(), 'usuariocompartir' : ev.currentTarget.id}, function(respuesta){
					var resp = JSON.parse(respuesta);
					if(resp.respuesta == "1"){
						$(ev.currentTarget).parent().remove();
						var divCompartir = $('article input[value="'+ $('#id_ficha').val() +'"]').parent().children()[0];
						$($(divCompartir).children()[0]).html(parseInt($($(divCompartir).children()[0]).html()) - 1);
					}else{
						$('#error').html(resp.error);
					}
				});
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
					var resp = JSON.parse(respuesta);
					if(resp.respuesta == "1"){
						$('article input[value="'+ $('#id_ficha').val() +'"]').parent().parent().remove();
						$('#bloqueo').fadeOut();
					}else{
						$('#error').html(respuesta.error);
					}
				});
			});
			
			$('#compartir').on('click', function(){
				var existe = false;
				$('#divEliminar li a').each(function(indice, elemento){
					if(elemento.id.toUpperCase() == $('#usuariocompartir').val().toUpperCase()){
						$('#error').html("Ya se comparte con este usuario.");
						existe = true;
						return;
					}
				});
					
				if(!existe){
					$.post("compartirFicha.htm", { 'id' : $('#id_ficha').val(), 'usuariocompartir' : $('#usuariocompartir').val()}, function(respuesta){
						var resp = JSON.parse(respuesta);						
						if(resp.respuesta == "1"){
							$('#divEliminar ul').append('<li>' + $('#usuariocompartir').val() + ' <a href="#" id="' + $('#usuariocompartir').val() + '">x</a></li>');
							var divCompartir = $('article input[value="'+ $('#id_ficha').val() +'"]').parent().children()[0];
							$($(divCompartir).children()[0]).html(parseInt($($(divCompartir).children()[0]).html()) + 1);

						}else{
							$('#error').html(resp.error);
						}
					});
				}
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
				
				$.post('principalBusqueda.htm', {categoria : (lstcategorias == "" ? lstcategorias : JSON.stringify(lstcategorias)), tipo_ficha : (lsttipos == "" ? lsttipos : JSON.stringify(lsttipos)), busqueda : busqueda}, function(respuesta){
					var resp = JSON.parse(respuesta);
					if(resp.respuesta == "1"){
						cargarFichasArticle(resp.fichas);
					}else{
					
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
				template += '<div class="acciones"><a href="#" class="compartirficha">Compartir(<div class="cantidadCompartida" id="cantidadCompartida">'+ ficha.cantidadCompartida+'</div>)</a>';
				template += (ficha.cantidadContenido ? '<a class="negritas" href="javascript:enviarContenidoFicha('+ficha.id_ficha+' )">Fichas de Contenido('+ ficha.cantidadContenido+')</a>' :
					'<a class="negritas" id="agregarFichaContenido" href="javascript:nuevoContenidoFicha('+ficha.id_ficha+')">Agregar Fichas de Contenido</a>'); 
				template += '<a href="javascript:actualizarFicha('+ficha.id_ficha+')">Editar</a><a href="#" class="borrarficha">Borrar</a>'+
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
