<%@page import="com.biblicon.util.Constantes"%> 
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
		<div class="contenidoNotabla">
			<div class="datostipoficha">
				<div class="error" id="error"></div>
				<label for="nombreficha" >Tipo ficha: </label><input placeholder="Ingresa el nombre" id="nombreficha" />
				<input type="hidden" id="idTipo" value="0">
				<input type="submit" value="Agregar" id="agregar"/>
				<input type="submit" value="Eliminar" id="eliminar"/>
			</div>
			<div class="cdisponible" id="cdisponible">
				<h3>Arrastra los campos que deseas agregar</h3>
				<div id="a" class="campo"  draggable="true"><%= Constantes.a %></div>
				<div id="ano" class="campo"  draggable="true"><%= Constantes.ano %></div>
				<div id="apellido" class="campo"  draggable="true"><%= Constantes.apellido %></div>
				<div id="apellido_editor" class="campo"  draggable="true"><%= Constantes.apellido_editor %></div>
				<div id="apellido_editor_otro" class="campo"  draggable="true"><%= Constantes.apellido_editor_otro %></div>
				<div id="apellido_otro" class="campo"  draggable="true"><%= Constantes.apellido_otro %></div>
				<div id="b" class="campo"  draggable="true"><%= Constantes.b %></div>
				<div id="biblioteca" class="campo"  draggable="true"><%= Constantes.biblioteca %></div>
				<div id="c" class="campo"  draggable="true"><%= Constantes.c %></div>
				<div id="categoria" class="campo"  draggable="true"><%= Constantes.categoria %></div>
				<div id="ciudad" class="campo"  draggable="true"><%= Constantes.ciudad %></div>
				<div id="coleccion" class="campo"  draggable="true"><%= Constantes.coleccion %></div>
				<div id="contenido_cont" class="campo"  draggable="true"><%= Constantes.contenido_cont %></div>
				<div id="d" class="campo"  draggable="true"><%= Constantes.d %></div>
				<div id="dia" class="campo"  draggable="true"><%= Constantes.dia %></div>
				<div id="edicion" class="campo"  draggable="true"><%= Constantes.edicion %></div>
				<div id="edicion_de" class="campo"  draggable="true"><%= Constantes.edicion_de %></div>
				<div id="editor" class="campo"  draggable="true"><%= Constantes.editor %></div>
				<div id="editorial" class="campo"  draggable="true"><%= Constantes.editorial %></div>
				<div id="et_al" class="campo"  draggable="true"><%= Constantes.et_al %></div>
				<div id="et_al_editor" class="campo"  draggable="true"><%= Constantes.et_al_editor %></div>
				<div id="fecha_acceso" class="campo"  draggable="true"><%= Constantes.fecha_acceso %></div>
				<div id="fecha_publicacion" class="campo"  draggable="true"><%= Constantes.fecha_publicacion %></div>
				<div id="institucion" class="campo"  draggable="true"><%= Constantes.institucion %></div>
				<div id="localizacion" class="campo"  draggable="true"><%= Constantes.localizacion %></div>
				<div id="mes" class="campo"  draggable="true"><%= Constantes.mes %></div>
				<div id="nombre" class="campo"  draggable="true"><%= Constantes.nombre %></div>
				<div id="nombre_editor" class="campo"  draggable="true"><%= Constantes.nombre_editor %></div>
				<div id="nombre_editor_otro" class="campo"  draggable="true"><%= Constantes.nombre_editor_otro %></div>
				<div id="nombre_otro" class="campo"  draggable="true"><%= Constantes.nombre_otro %></div>
				<div id="notas" class="campo"  draggable="true"><%= Constantes.notas %></div>
				<div id="notas_cont" class="campo"  draggable="true"><%= Constantes.notas_cont %></div>
				<div id="numero" class="campo"  draggable="true"><%= Constantes.numero %></div>
				<div id="otros_datos" class="campo"  draggable="true"><%= Constantes.otros_datos %></div>
				<div id="pagina_fin" class="campo"  draggable="true"><%= Constantes.pagina_fin %></div>
				<div id="pagina_ini" class="campo"  draggable="true"><%= Constantes.pagina_ini %></div>
				<div id="paginas" class="campo"  draggable="true"><%= Constantes.paginas %></div>
				<div id="paginas_cont" class="campo"  draggable="true"><%= Constantes.paginas_cont %></div>
				<div id="palabra_clave_cont" class="campo"  draggable="true"><%= Constantes.palabra_clave_cont %></div>
				<div id="periodico" class="campo"  draggable="true"><%= Constantes.periodico %></div>
				<div id="portal" class="campo"  draggable="true"><%= Constantes.portal %></div>
				<div id="prologo" class="campo"  draggable="true"><%= Constantes.prologo %></div>
				<div id="referencia_cont" class="campo"  draggable="true"><%= Constantes.referencia_cont %></div>
				<div id="revista" class="campo"  draggable="true"><%= Constantes.revista %></div>
				<div id="seccion" class="campo"  draggable="true"><%= Constantes.seccion %></div>
				<div id="semana" class="campo"  draggable="true"><%= Constantes.semana %></div>
				<div id="tipo" class="campo"  draggable="true"><%= Constantes.tipo %></div>
				<div id="tipo_cont" class="campo"  draggable="true"><%= Constantes.tipo_cont %></div>
				<div id="tipo_ficha" class="campo"  draggable="true"><%= Constantes.tipo_ficha %></div>
				<div id="titulo" class="campo"  draggable="true"><%= Constantes.titulo %></div>
				<div id="titulo_libro" class="campo"  draggable="true"><%= Constantes.titulo_libro %></div>
				<div id="tomo" class="campo"  draggable="true"><%= Constantes.tomo %></div>
				<div id="traduccion" class="campo"  draggable="true"><%= Constantes.traduccion %></div>
				<div id="url" class="campo"  draggable="true"><%= Constantes.url %></div>
			
			</div>
			<div class="cseleccionado" id="cseleccionado" draggable="true">
				<h3>Arrastra aquì y presiona para quitar </h3>
			</div>
		</div>
	</section>
	<footer>
		-- Derechos Reservados --
	</footer>
	
	<script type="text/javascript">
	
	$(function() {
		
	$('.cseleccionado').on('click', 'div', function() {
		$(".cdisponible #" + this.id).css("display", "inline-block");
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
				$('#bloqueo').fadeOut();
			}else{
				$('#error').html(respuesta);
			}
		});
	});
	


		
	function handleDragStart(e) {
		  this.style.opacity = '0.5';
		  e.dataTransfer.effectAllowed = 'move';
		  var datos = this.id + ',' + $(this).html();
		  e.dataTransfer.setData('text', datos);
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
			var datos = datoregresado.split(",")
			if(datos[0]){
				$("#" + datos[0]).css("display", "none");
				var divagregar = '<div id="' + datos[0] +'" class="campo"  draggable="false">' + datos[1] + '</div>';
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
