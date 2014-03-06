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
   <script src="js/ficha.js"></script>
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
			<li><a href="fichasCompartidas.htm">Fichas Compartidas</a></li>
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
				
				
				<hr/><span>Otro</span><hr/>				
				<div class="campo" draggable="true" id="<%=Constantes.apellido_otro %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.nombre_otro %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.et_al %>" > </div>
								
				<hr/><span>Edición</span><hr/>	
				<div class="campo" draggable="true" id="<%=Constantes.tipo %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.edicion_de %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.traduccion %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.prologo %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.editorial %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.ciudad %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.ano %>" > </div>				
				<div class="campo" draggable="true" id="<%=Constantes.edicion %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.otros_datos %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.paginas %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.revista %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.tomo %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.numero %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.pagina_ini %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.pagina_fin %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.titulo_libro %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.periodico %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.seccion %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.dia %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.mes %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.semana %>" > </div>
			
				<hr/><span>Ubicación</span><hr/>
				<div class="campo" draggable="true" id="<%=Constantes.coleccion %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.biblioteca %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.localizacion %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.institucion %>" > </div>
				
				<hr/><span>Editor</span><hr/>
				<div class="campo" draggable="true" id="<%=Constantes.apellido_editor %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.nombre_editor %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.editor %>" > </div>
				
				<hr/><span>Editor Otro</span><hr/>				
				<div class="campo" draggable="true" id="<%=Constantes.apellido_editor_otro %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.nombre_editor_otro %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.et_al_editor %>" > </div>
				
				<hr/><span>Internet</span><hr/>				
				<div class="campo" draggable="true" id="<%=Constantes.url %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.portal %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.fecha_acceso %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.fecha_publicacion %>" > </div>
										
				<hr/><span>Notas</span><hr/>
				<div class="campo" draggable="true" id="<%=Constantes.notas %>" > </div>
				
				<hr/><span>Personales</span><hr/>
				<div class="campo" draggable="true" id="<%=Constantes.a %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.b %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.c %>" > </div>
				<div class="campo" draggable="true" id="<%=Constantes.d %>" > </div>
												
						
			</div>
			<div class="cseleccionado" id="cseleccionado" draggable="true">
				<h3>Arrastra aquì y presiona para quitar </h3>
				<div class="campo forzoso" id="<%=Constantes.titulo %>" > </div>
				<div class="campo forzoso" id="<%=Constantes.apellido %>" > </div>
				<div class="campo forzoso" id="<%=Constantes.nombre %>" > </div>
				<div class="campo forzoso" id="<%=Constantes.categoria %>" > </div>
			</div>
		</div>
	</section>
	<footer>
		-- Derechos Reservados --
	</footer>
	
	<script type="text/javascript">
	
	$(function() {
	
	$('.campo').each(function(i, e){
		$(e).html(biblicon.ficha.constantes[$(e).attr('id')]);
	});
		
	$('.cseleccionado').on('click', 'div', function() {
		if($(this).hasClass("forzoso"))
			return false;
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
			camposAgregar[indice] = $(elemento).attr("id");
			
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
				$('#cseleccionado div').each(function(i,e){
					if(!$(e).hasClass('forzoso'))$(e).remove();
				});
				
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
