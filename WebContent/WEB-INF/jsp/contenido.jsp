<!DOCTYPE HTML>
<html>
<head>
   <meta charset="UTF-8">
   <title>Biblicon</title>
   <link rel="stylesheet" href="css/normalize.css">
   <link rel="stylesheet" href="css/estilos.css">
   <link rel="stylesheet" href="css/tipoficha.css">
   <script src="js/jquery-2.0.3.min.js"></script>
   <script src="js/mustache.js"></script>
   <script src="js/jquery.redirect.min.js"></script>
</head>
<body>
	<div class="bloqueo" id="bloqueo">
			<div class="divEliminar" id="divEliminar">
				<h4>¿Seguro que deseas eliminar esta ficha de contenido?</h4>
				<input type="hidden" value="" id="id_ficha_contenido"/>
				<input type="submit" value="Aceptar" id="borrado"/>
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
			<div class="filtros">
				<div class="filtro">
					<button id="agregar">Agregar Nueva</button>
					<button id="regresarPrincipal">Regresar</button>
				</div>
				<hr/>
				<div class="filtro">
				Buscar:<input>
				
				</div>
				
				<div class="filtro">
				<hr/>
				<strong>Selecciona el tipo</strong>
					<div><input type="checkbox" value="cita" id="tipo_cita"/><label for = "cita"> Cita</label></div>
					<div><input type="checkbox" value="resumen" id="tipo_resumen"/><label for = "resumen"> Resumén</label></div>
					<div><input type="checkbox" value="comentario " id="tipo_comentario"/><label for = "comentario"> Comentario </label></div>
					<div><input type="checkbox" value="descripcion" id="tipo_descripcion"/><label for = "descripcion"> Descripción</label></div>
				</div>	
				
				<button>Buscar</button>							
			</div>
			<div class="contenidos" id="contenidos">
				
			</div>
		</div>
	</section>
	<footer>
		-- Derechos Reservados --
	</footer>
	
	<script type="text/javascript">
	
		function editarFichaContenido(id_contenido) {
			
			$().redirect('editarFichaContenido.htm', {'id_contenido': id_contenido});
		}
		
		function nuevoContenidoFicha(idficha) {
			
			$().redirect('nuevaFichaContenido.htm', {'idFicha': idficha});
		}
			
	
		$(function() {			
			var contenidos = JSON.parse('<%= request.getAttribute("contenidos") %>');
			var ficha = '<%= request.getAttribute("id_ficha") %>';
			
			var outputContenido = "";
			for(var i = 0; i < contenidos.length; i++){
				var contenido = contenidos[i];
				var campos = contenido.campos;
				var template = '<article>';
				for(var j in campos){
					template += '<p>' + j + ': <span>'+ campos[j] +'</span></p>';
				}
				template += '<div class="acciones"><input type="hidden" class="contenidoFicha" value='+contenido.id_contenido+' /><a href="javascript:editarFichaContenido('+contenido.id_contenido+')">Editar</a><a href="#" class="borrarficha">Borrar</a></div></article>';
				outputContenido += template;
			}
			
			$('#agregar').on('click', function(){
				nuevoContenidoFicha(ficha);
			});
			
			$('#regresarPrincipal').on('click', function(){
				$(location).attr('href', 'principal.htm');
			});
			
			$('.contenidos').on('click', '.borrarficha', function(ev){
				ev.preventDefault();
				$('#bloqueo').fadeIn();
				$('#id_ficha_contenido').val($(this).parent().children('input').val());
			});
			
			$('#borrado').on('click', function(){
				$.post("eliminarFichaContenido.htm", {"id_contenido" : $('#id_ficha_contenido').val()}	, function(respuesta){
					var resp = JSON.parse(respuesta);
					if(resp.respuesta == "1"){
						$('.contenidoFicha').each(function(i, e){
							if($(e).val() == $('#id_ficha_contenido').val()){
								$($(e).parent().parent()[0]).remove();
								return false;
							}
						});
						$('#bloqueo').fadeOut();
					}else{
						$('#error').html(respuesta).removeClass('correcto').addClass('error');;
					}
				});
			});
			
			$('#regresar').on('click', function(){
				$('#bloqueo').fadeOut();
			});
			
			$('#divEliminar').on('click',function(ev){
				return false;
			});
			
			$('#bloqueo').on('click', function(){
				$('#bloqueo').fadeOut();
			});
			
			
			$("#contenidos").html(outputContenido);

		});
	</script>
</body>
</html>
