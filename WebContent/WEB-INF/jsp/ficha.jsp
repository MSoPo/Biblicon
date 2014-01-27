<!DOCTYPE HTML>
<html>
<head>
   <meta charset="UTF-8">
   <title>Biblicon Fichas</title>
   <link rel="stylesheet" href="css/normalize.css">
   <link rel="stylesheet" href="css/estilos.css">
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
				<input type="submit" value="Guardar"/>
			</div>
			<div class="fichas" id="fichas">
				<article></article>
			</div>
		</div>
	</section>
	<footer>
		-- Derechos Reservados --
	</footer>
	
	<script type="text/javascript">
		$(function() {
			$('#tipos').on('change', function(){
				$.post("cambiarCampos.htm", {"idtipo" : $(this).val()}	, function(respuesta){
					var resp = JSON.parse(respuesta);
					if(resp.respuesta == "1"){
						
						var campos = resp.campos;
						var output2 = "";
						for(var i = 0; i < campos.length; i++){
							var campo = campos[i];
							var template = '<p><strong>' + campo.nombre_campo + ':<strong> <input/></p>';
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
				var template = '<p><strong>' + campo.nombre_campo + ':</strong> <input/></p>';
				output2 += Mustache.render(template,view);
			}
			$("#fichas article").html(output2);
		
			$("#tipos").html(output);

		});
	</script>
</body>
</html>
