<!DOCTYPE HTML>
<html>
<head>
   <meta charset="UTF-8">
   <title>Biblicon Fichas</title>
   <link rel="stylesheet" href="css/normalize.css">
   <link rel="stylesheet" href="css/estilos.css">
   <link rel="stylesheet" href="css/ficha.css">
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
					<strong>Selecciona el tipo</strong>
					<br>
					<select id="tipos">
						<option value="1">Cita</option>
						<option value="2">Resumen</option>
						<option value="3">Comentario</option>
						<option value="4">Descripciòn</option>
					</select>
				</div>
				<hr/>
				<div id="error"></div>
				<input class="btnGuardar" id="regresar" type="submit" value="Regresar"/>
				<input class="btnGuardar" id="guardarFicha" type="submit" value="Guardar"/>
				
				<div class="error" id="error"></div>
			</div>
			<div class="fichas" id="fichas">
				<article class="agregrarFicha">
					<div class="lineaCampo"><strong><div class="nomCampo">Palabra clave</div></strong><span class="valorCampo"><input id="palabraClave" class="requerido"></span></div>
					<div class="lineaCampo"><strong><div class="nomCampo">Contenido</div></strong><span class="valorCampo"><textarea id="contenido" class="requerido"></textarea></span></div>
					<div class="lineaCampo"><strong><div class="nomCampo">Pàginas</div></strong><span class="valorCampo"><input id="paginas" class="requerido"/></span></div>
					<div class="lineaCampo"><strong><div class="nomCampo">Notas</div></strong><span class="valorCampo"><textarea id="notas"></textarea></span></div>
				</article>
			</div>
		</div>
	</section>
	<footer>
		-- Derechos Reservados --
	</footer>
	
	<script type="text/javascript">
	
	var id_ficha = '<%= request.getAttribute("id_ficha") %>';
	
	function enviarContenidoFicha(idficha,apellido,ano) {
		
		$().redirect('contenido.htm', {'idFicha': idficha,'apellido':apellido,'ano':ano});
	}
	
		$(function() {
			
			$("#regresar").on('click', function(){
				enviarContenidoFicha(id_ficha , "" , "");
			});
			
			$("#guardarFicha").on("click", function(){
				var req = false;
				$(".requerido").each(function(i, e){
					if($.trim($(e).val()) == ""){
						req = true;
						$('#error').html('Falto ingresar algun campo requerido').addClass('error').removeClass('correcto');
						return;
					}
				});
				
				if(req) return false;
				
				var fichaContenido = {
						ficha : {
							id_ficha : id_ficha
						},
						palabra_clave : $("#palabraClave").val(),
						tipo_contenido : $("#tipos").val(),
						contenido : $("#contenido").val(),
						paginas : $("#paginas").val(),
						notas : $("#notas").val(),
				}
				
				$.post('agregarContenidoFicha.htm',{ 'contenidoFicha' : JSON.stringify(fichaContenido)}, function(respuesta){
					var resp = JSON.parse(respuesta);
					if(resp.respuesta == "1"){
						$('.lineaCampo input').each(function(indice, elemento){
							$(elemento).val('');
						});
						$('.lineaCampo textarea').each(function(indice, elemento){
							$(elemento).val('');
						});
						$('#error').html('Se agrego la ficha de contenido').addClass('correcto').removeClass('error');
					}else{
						$('#error').html(resp.error).addClass('error').removeClass('correcto');
					}
				});
			});
		});
			
	</script>
</body>
</html>
