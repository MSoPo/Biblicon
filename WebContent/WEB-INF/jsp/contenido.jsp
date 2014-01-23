<!DOCTYPE HTML>
<html>
<head>
   <meta charset="UTF-8">
   <title>Biblicon</title>
   <link rel="stylesheet" href="css/normalize.css">
   <link rel="stylesheet" href="css/estilos.css">
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
			<li><a href="#">Tipo de Fichas</a></li>
			<li><a href="#">Plantillas</a></li>
			<li><a href="#">Ayuda</a></li>
			<li><a href="#">Acerca de</a></li>
		</ul>
	</nav>
	<section>
		<div class="contenido">
			<div class="filtros">
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
			
	
		$(function() {			
			var contenidos = JSON.parse('<%= request.getAttribute("contenidos") %>');
					
			
			var outputContenido = "";
			for(var i = 0; i < contenidos.length; i++){
				var contenido = contenidos[i];
				var campos = contenido.campos;
				var template = '<article>';
				for(var j in campos){
					template += '<p>' + j + ': <span>'+ campos[j] +'</span></p>';
				}
				template += '<div class="acciones"><a href="#">Editar</a><a href="#">Borrar</a></div></article>';
				outputContenido += template;
			}			
			
			
			
			$("#contenidos").html(outputContenido);

		});
	</script>
</body>
</html>
