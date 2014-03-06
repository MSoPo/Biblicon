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
	
	var contenido_ficha = JSON.parse('<%= request.getAttribute("ficha_contenido") %>');
	
	function enviarContenidoFicha(idficha,apellido,ano) {
		
		$().redirect('contenido.htm', {'idFicha': idficha,'apellido':apellido,'ano':ano});
	}
	
		$(function() {
			
			$('#palabraClave').val(contenido_ficha.palabra_clave);
			$('#contenido').val(contenido_ficha.contenido);
			$('#paginas').val(contenido_ficha.paginas);
			$('#notas').val(contenido_ficha.notas);
			$('#tipos').val(contenido_ficha.tipo_contenido);
			
			$("#regresar").on('click', function(){
				enviarContenidoFicha(contenido_ficha.ficha.id_ficha , contenido_ficha.ficha.apellido ,contenido_ficha.ficha.ano);
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
				
				contenido_ficha.palabra_clave = $("#palabraClave").val();
				contenido_ficha.tipo_contenido = $("#tipos").val();
				contenido_ficha.contenido = $("#contenido").val();
				contenido_ficha.paginas = $("#paginas").val();
				contenido_ficha.notas = $("#notas").val();
				
				$.post('editarFichaContenido.htm',{ 'contenidoFicha' : JSON.stringify(contenido_ficha)}, function(respuesta){
					var resp = JSON.parse(respuesta);
					if(resp.respuesta == "1"){
						$('#error').html('Se modifico la ficha de contenido').addClass('correcto').removeClass('error');
					}else{
						$('#error').html(resp.error).addClass('error').removeClass('correcto');
					}
				});
			});
		});
			
	</script>
</body>
</html>
