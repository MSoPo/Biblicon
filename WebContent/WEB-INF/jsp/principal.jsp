<!DOCTYPE HTML>
<html>
<head>
   <meta charset="UTF-8">
   <title>Biblicon</title>
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
			<li><a href="#">Tipo de fichas</a></li>
			<li><a href="#">Plantilla</a></li>
			<li><a href="#">Ayuda</a></li>
			<li><a href="#">Acerca de</a></li>
		</ul>
	</nav>
	<section>
		<div class="contenido">
			<div class="filtros">
				<div class="filtro">
				Buscar:<input>
				<button>Buscar</button>
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
				</div>
			</div>
			<div class="fichas">
				<article>
					<p>Titulo: <span>Titulo del libro</span></p>
					<p>Autor: <span>Anonimo</span></p>
					<p>Edicion: <span>2da</span></p>
					<p>Año de edicion: <span>2010</span></p>
					<p>Paginas: <span>120 pag</span></p>
					<div class="acciones"><a href="">Compartir(0)</a><a href="">Fichas de Contenido(1)</a><a href="#">Editar</a><a href="#">Borrar</a></div>
				</article>
				<article>
					<p>Titulo: <span>Titulo del libro</span></p>
					<p>Autor: <span>Anonimo</span></p>
					<p>Edicion: <span>2da</span></p>
					<p>Año de edicion: <span>2010</span></p>
					<p>Paginas: <span>120 pag</span></p>
					<div class="acciones"><a href="">Compartir(0)</a><a href="">Fichas de Contenido(1)</a><a href="#">Editar</a><a href="#">Borrar</a></div>
				</article>
			</div>
		</div>
	</section>
	<footer>
		-- Derechos Reservados --
	</footer>
	
	<script type="text/javascript">
		$(function() {
			var tipos = JSON.parse('<%= request.getAttribute("tipos") %>');
			var categorias = JSON.parse('<%= request.getAttribute("categoria") %>');
			var output = "";
			
			for(var i = 0; i < tipos.length; i++){
				var tipo = tipos[0];
				var view = {
						id_tipo: tipo.id_tipo_ficha,
						nombre: tipo.nombre_tipo
				};
				
				 var template = '<div><input type="checkbox" value="{{id_tipo}}" id="tipo_{{id_tipo}}"/><label for = "{{id_tipo}}">  {{nombre}}</label></div>';
				output += Mustache.render(template,view);
			}
			$("#tipos").html(output);

		});
	</script>
</body>
</html>
