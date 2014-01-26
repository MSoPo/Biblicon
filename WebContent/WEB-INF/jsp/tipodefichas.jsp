<!DOCTYPE HTML>
<html>
<head>
   <meta charset="UTF-8">
   <title>Biblicon Tipo de Fichas</title>
   <link rel="stylesheet" href="css/normalize.css">
   <link rel="stylesheet" href="css/estilos.css">
   <!-- Quitar despues de compilar stylus -->
   <link rel="stylesheet" href="css/tipoficha.css">
   <script src="js/jquery-2.0.3.min.js"></script>
</head>
<body>
	<header>
		<h1>Biblicon</h1>
	</header>
	<nav>
		<ul>
			<li><a href="#">Fichas</a></li>
			<li><a href='#'>Tipo de fichas</a></li>
			<li><a href="#">Plantilla</a></li>
			<li><a href="#">Ayuda</a></li>
			<li><a href="#">Acerca de</a></li>
		</ul>
	</nav>
	<section>
		<div class="bloqueo" id="bloqueo">
			<div class="divEliminar" id="divEliminar">
				<h4>Selecciona el tipo a eliminar</h4>
				<div class="error" id="error2"></div>
				<select id="listaTipo">
					
				</select>
				<br/>
				<input type="submit" value="Aceptar" id="borrado"/>
				<input type="submit" value="Regresar" id="regresar"/>
				<h5>Al eliminar un tipo de fichas todas las fichas asociadas a este tipo tambien seran eliminadas y ya no se podran recuperar</h5>
			</div>
		</div>

		<div class="contenidoNotabla">
			<div class="datostipoficha">
				<div class="error" id="error"></div>
				<label for="nombreficha" >Tipo ficha: </label><input placeholder="Ingresa el nombre" id="nombreficha" value="TipoFicha1" />
				<input type="hidden" id="idTipo" value="0">
				<input type="submit" value="Agregar" id="agregar"/>
				<input type="submit" value="Eliminar" id="eliminar"/>
			</div>
			<div class="cdisponible" id="cdisponible">
				<h3>Arrastra los campos que deseas agregar</h3>
			<div id="Nombre" class="campo"  draggable="true">Nombre</div>
			<div id="Titulo" class="campo"  draggable="true">Titulo</div>
			<div id="Autor" class="campo"  draggable="true">Autor</div>
			<div id="Ano" class="campo"  draggable="true">Ano</div>
			<div id="Biblioteca" class="campo"  draggable="true">Biblioteca</div>
			<div id="url" class="campo"  draggable="true">url</div>
			<div id="a" class="campo"  draggable="true">a</div>
			<div id="b" class="campo"  draggable="true">b</div>
			<div id="c" class="campo"  draggable="true">c</div>
			<div id="d" class="campo"  draggable="true">d</div>
			<div id="apellido" class="campo"  draggable="true">apellido</div>
			<div id="otro_apellid" class="campo"  draggable="true">otro_apellid</div>
			<div id="otro_nombre" class="campo"  draggable="true">otro_nombre</div>
			
			</div>
			<div class="cseleccionado" id="cseleccionado" draggable="true">
				<h3>Suelta aca los campos</h3>
			</div>
		</div>
	</section>
	<footer>
		-- Derechos Reservados --
	</footer>
	
	<script type="text/javascript">
	
	$(function() {
		
	$('.cseleccionado').on('click', 'div', function() {
		$("#" + $(this).html()).css("display", "inline-block");
		$(this).remove();
	});
	
	$('#nombreficha').on('keypress', function(){
		$("#error").html('');
	});
	
	$('#agregar').on('click', function() {

		var nombreTipo = $.trim($("#nombreficha").val());
		$("#error").html('');
		$('#error').addClass('error').removeClass('correcto');
		var camposAgregar = [];
		$('.cseleccionado div').each(function(indice, elemento){
			camposAgregar[indice] = $(elemento).html();
			
		});
		
		if(camposAgregar.length == 0){
			$("#error").html("Selecciona algun campo");
			return false;
		}
		
		if(nombreTipo.length == 0){
			$("#error").html("Ingresa el nombre de la ficha");
			return false;
		}
		
		
		$.post("agregarTipo.htm", {"nombreTipo" : nombreTipo, "camposTipo" : JSON.stringify(camposAgregar)}	, function(respuesta){
			var resp = JSON.parse(respuesta);
			if(resp.respuesta == "1"){
				$('#listaTipo').append('<option value="'+ resp.id +'">' +nombreTipo+ '</option>');
				$('#nombreficha').val('');
				$('#cdisponible div').css("display", "inline-block");
				$('#cseleccionado div').remove();
				$('#error').removeClass('error').addClass('correcto').html('Se agrego el tipo de ficha <strong>' + nombreTipo + '</strong>');
			}else{
				$('#error').html(respuesta);
			}
		});
	});
	
	$("#eliminar").on('click', function(){
		$('#bloqueo').fadeIn();
		$('#error2').html('');
	});

	$("#regresar").on('click', function(){
		$('#bloqueo').fadeOut();
	});

	$("#bloqueo").on('click', function(){
		$('#bloqueo').fadeOut();
	});
	
	$("#listaTipo").on('change', function(){
		$('#error2').html('');
	});

	$("#divEliminar").on('click', function(){
		return false;
	});
	
	$("#borrado").on('click', function(){
		$("#error").removeClass('correcto').addClass('error').html('');
		$('#error2').html('');
		if($('#listaTipo').val() == 0){
			$('#error2').html("Selecciona un tipo");
			return false;
		}
		
		$.post("eliminarTipo.htm", {"idTipo" : $('#listaTipo').val()}	, function(respuesta){
			if(respuesta == "1"){
				$('#error').removeClass('error').addClass('correcto');
				$('#error').html('Se elimino el tipo de ficha <strong>' + $('#listaTipo option[value=' + $('#listaTipo').val() + ']').html() + '</strong> y todas sus fichas');
				$('#listaTipo option[value=' + $('#listaTipo').val() + ']').remove();
				$('#bloqueo').hide();
			}else{
				$('#error').html(respuesta);
			}
		});
	});
	


		
	function handleDragStart(e) {
		  this.style.opacity = '0.5';
		  e.dataTransfer.effectAllowed = 'move';
		  e.dataTransfer.setData('text', this.innerHTML);
		}

		
		function handleDragOver(e) {
			  if (e.preventDefault) {
			    e.preventDefault();
			  }

			  e.dataTransfer.dropEffect = 'move';

			  return false;
			}

		function handleDragEnter(e) {
			   $('#cseleccionado').addClass('over');
			}
		
		function handleDragLeave(e) {
			}

		function handleDragEnd(e) {
			  this.style.opacity = '1';
				$('#cseleccionado').removeClass('over');
			  
			}
		
		function handleDrop(e) {
			  if (e.stopPropagation) {
			    e.stopPropagation(); 
			  }
			  $('#cseleccionado').removeClass('over');
			$("#error").html('');	
			e.preventDefault();
			var datoregresado = e.dataTransfer.getData('text');
			if(datoregresado){
				$("#" + datoregresado).css("display", "none");
				var divagregar = '<div id="' + datoregresado +'" class="campo"  draggable="false">' + datoregresado + '</div>'
				this.innerHTML +=  divagregar;
			}	
		}
		
		var cols = document.querySelectorAll('.campo');
		
		[].forEach.call(cols, function(col) {
		  col.addEventListener('dragstart', handleDragStart, false);
		  col.addEventListener('dragend', handleDragEnd, false);
		});

		var otra = document.querySelectorAll('.cseleccionado')[0];
		otra.addEventListener('drop', handleDrop, false);
		otra.addEventListener('dragenter', handleDragEnter, false)
		otra.addEventListener('dragover', handleDragOver, false);
		otra.addEventListener('dragleave', handleDragLeave, false);

		var tipos = JSON.parse('<%= request.getAttribute("tipos") %>');
		var opciones = '<option value="0">Selecciona el tipo</option>';
		for(var i = 0; i < tipos.length; i++){
			var tipo = tipos[i];
			 opciones+= '<option value="' + tipo.id_tipo_ficha + '">'+ tipo.nombre_tipo +'</option>';
		}
		$('#listaTipo').html(opciones);
		
	});

	</script>
</body>
</html>
