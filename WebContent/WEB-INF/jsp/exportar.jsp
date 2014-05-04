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
   <link rel="stylesheet" href="css/style.css">
   <script src="js/jquery-2.0.3.min.js"></script>
   <script src="js/mustache.js"></script>
   <script src="js/jquery.redirect.min.js"></script>
   <script src="js/ficha.js"></script>
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
			<li><a href="exportar.htm">Exportar</a></li>
			<li class="salir"><a href="cerrarSesion.htm" class="icon-exit"></a></li>
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
				<div id="error" class="error"></div>
				<div class="seleccion">
					<label for="plantillas">Selecciona la plantilla</label>
					<select name="plantillas" id="listaPlantillas">
					</select>
					<label for="formato" class="labelFormato">Selecciona el formato</label>
					<select name="formato" id="formato">
						<option value="doc">Documento Word</option>
						<option value="pdf">Documento pdf</option>
					</select>
					<br>
					<input type="submit" class="button" value="Exportar" id="exportar">
					<input type="submit" class="button" value="Marcar todas" id="marcar">
					<input type="submit" class="button" value="Desmarcar todas" id="desmarcar">
				</div>
				<table class="tablaExportar">
					<thead>
						<tr>
							<td>Exportar</td>
							<td>Titulo</td>
							<td>Apellido(s)</td>
							<td>Nombre(s)</td>
							<td>Categoria</td>
							<td>Tipo</td>
						</tr>
					</thead>
					<tbody id="ficha">
					</tbody>
				</table>
			</div>
		</div>
	</section>
	<footer>
		-- Derechos Reservados --
	</footer>
	
	<script type="text/javascript">
	
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
			
			});;

			$('.fichas').on('click', '.checkExportar', function(ev){
				$('#error').html('');
				if($(this).hasClass('icon-checkbox-checked')){
					$(this).removeClass('icon-checkbox-checked');
					$(this).addClass('icon-checkbox-unchecked');
				} else {
					$(this).removeClass('icon-checkbox-unchecked');
					$(this).addClass('icon-checkbox-checked');
				} 
				return false;
			});

			var plantillas = <%= request.getAttribute("plantillas") %>;
			var opciones = "";

			for(var i = 0; i < plantillas.length; i++){ 	
				var plantilla = plantillas[i];
			 	opciones+= '<option value="' + plantilla.id_platilla + '">'+ plantilla.nombrePlantilla +'</option>';
			}
			$('#listaPlantillas').html(opciones);

			$('#marcar').on('click', function(){
				$('#error').html('');
				$( ".icon-checkbox-unchecked").addClass('icon-checkbox-checked');
				$( ".icon-checkbox-checked").removeClass('icon-checkbox-unchecked');

			});

			$('#desmarcar').on('click', function(){
				$('#error').html('');
				$( ".icon-checkbox-checked").addClass('icon-checkbox-unchecked');
				$( ".icon-checkbox-unchecked").removeClass('icon-checkbox-checked');
			});

			$('#exportar').on('click', function(){
				var listaExportar = [];
				$(".icon-checkbox-checked").each(function(i,e){
					listaExportar.push($(e).attr('id'));
				});

				if(listaExportar.length < 1){
					$('#error').removeClass('correcto');
					$('#error').addClass('error');
					$('#error').html('Selecciona por lo menos una ficha');
					return false;
				}
				
				var plantilla = $('#listaPlantillas').val();
				var formato = $('#formato').val();
				
				$.post('exportarFicha.htm', { 'idFichas' : JSON.stringify(listaExportar), 'id_platilla' : plantilla, 'formato' : formato }, function(respuesta){
					var resp = JSON.parse(respuesta);
					if(resp.respuesta == "1"){
						$('#error').addClass('correcto');
						$('#error').removeClass('error');
						$('#error').html('Se realizo la exportacion');
						
					}else{
						$('#error').removeClass('correcto');
						$('#error').addClass('error');
						$('#error').html(respuesta);
					}
				});

				console.log(listaExportar);
			});

		});
		
		function cargarFichasArticle(fichas){
			var outputFichas = "";
			for(var j = 0; j < fichas.length; j++){
				var ficha = fichas[j];
				var template = '<tr><td><a id="' + ficha.id_ficha + '" href="#" class="checkExportar icon-checkbox-checked"></td>';
				template += '<td>' + ficha.titulo + '</td>';
				template += '<td>' + ficha.apellido + '</td>';
				template += '<td>' + ficha.nombre + '</td>';
				template += '<td>' + ficha.categoria + '</td>';
				template += '<td>' + ficha.tipo_ficha.nombre_tipo + '</td>';
				
				template += '</tr>';
				outputFichas += template;
			}
			

			$("#ficha").html(outputFichas);
		}
		
		
	</script>
</body>
</html>
