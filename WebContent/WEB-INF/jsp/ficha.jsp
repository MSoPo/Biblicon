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
		<div class="contenido">
			<div class="filtros">
				<div class="filtro">
					<strong>Selecciona el tipo</strong>
					<br>
					<select id="tipos"></select>
				</div>
				<hr/>
				<input class="btnGuardar" id="guardarFicha" type="submit" value="Guardar"/>
				
				<div class="error" id="error"></div>
			</div>
			<div class="fichas" id="fichas">
				<article class="agregrarFicha">
				</article>
			</div>
		</div>
	</section>
	<footer>
		-- Derechos Reservados --
	</footer>
	
	<script type="text/javascript">
		$(function() {
			
			$('#guardarFicha').on('click', function(){
				var ficha = [];
				$('.nomCampo').each(function(indice, elemento){
					var c = $(elemento).html();
					var campos = { c : $('#' + c.replace(' ', '_')).val() };
					ficha.push(campos);
				});
				
				$.post('agregarFicha.htm',{ 'campos' : JSON.stringify(ficha)}, function(respuesta){
					if(respuesta == '1'){
						$('.lineaCampo input').each(function(indice, elemento){
							$(elemento).val('');
						});
						$('#error').html('Se agrego la ficha').addClass('correcto').removeClass('error');
					}else{
						
					}
				});
			});
			
			$('#tipos').on('change', function(){
				$.post("cambiarCampos.htm", {"idtipo" : $(this).val()}	, function(respuesta){
					var resp = JSON.parse(respuesta);
					if(resp.respuesta == "1"){
						
						var campos = resp.campos;
						var output2 = "";
						for(var i = 0; i < campos.length; i++){
							var campo = campos[i];
							var template = '<div class="lineaCampo"><strong><div class="nomCampo">' + campo.nombre_campo + '</div></strong><input id="' + campo.nombre_campo.replace(' ', '_') + '" /></div>';
							output2 += template;
						}
						$("#fichas article").html(output2);
						
					}else{
						alert(respuesta);
					}
				});
			});
			
			var tipos = JSON.parse('<%= request.getAttribute("tipos") %>');
			var output = "";
			
			for(var i = 0; i < tipos.length; i++){
				var tipo = tipos[i];
				var view = {
						id_tipo: tipo.id_tipo_ficha,
						nombre: tipo.nombre_tipo
				};
				
				 var template = '<option value="{{id_tipo}}">{{nombre}}</option>';
				output += Mustache.render(template,view);
			}
			
			var campos = JSON.parse('<%= request.getAttribute("campos") %>');
			var output2 = "";
			for(var i = 0; i < campos.length; i++){
				var campo = campos[i];
				var view = {
						id_tipo: campo.nombre_campo,
						nombre: campo.nombre_tipo
				};
				var template = '<div class="lineaCampo"><strong><div class="nomCampo">' + campo.nombre_campo + '</div></strong><input id="' + campo.nombre_campo.replace(' ', '_') + '" /></div>';
				output2 += Mustache.render(template,view);
			}
			$("#fichas article").html(output2);
		
			$("#tipos").html(output);

		});
	</script>
</body>
</html>
