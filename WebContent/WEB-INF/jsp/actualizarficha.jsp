<!DOCTYPE HTML>
<html>
<head>
   <meta charset="UTF-8">
   <title>Biblicon Fichas</title>
   <link rel="stylesheet" href="css/normalize.css">
   <link rel="stylesheet" href="css/estilos.css">
   <link rel="stylesheet" href="css/ficha.css">
   <link rel="stylesheet" href="css/jquery-ui-1.10.4.custom.min.css">
   <script src="js/jquery-2.0.3.min.js"></script>
   <script src="js/jquery-ui-1.10.4.custom.min.js"></script>
   <script src="js/ficha.js"></script>
   <script src="js/mustache.js"></script>
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
					<strong>Tipo de ficha</strong>
					<br>
					<select id="tipos"  disabled="disabled"></select>
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
				var requerido = false;
				$('.requerido').each(function (i, e){
					if($.trim($(e).val()) == "" ){
						$('#error').html('Falto ingresar algun campo requerido').addClass('error').removeClass('correcto');
						requerido =  true;
						return;
					}	
				});
				
				if(requerido) return false;
				
				var guardarcampos = {};
				$('.lineaCampo').each(function(indice, elemento){
					var c = $(elemento);
					var nomCampo = "";
					c.children().each(function(i, e){
						if(i == 0)
							nomCampo = $($(e).children()[0]).html();
						else if(i == 1){
							var valor = "";
							if($($(e).children()[0]).val() == "chk"){
								valor = $($(e).children()[0]).is(':checked');
							}else{
								valor = $($(e).children()[0]).val();
							}
							guardarcampos[nomCampo] = valor;
						}
					});
					
				});
				
				guardarcampos['tipo_ficha'] = $('#tipos').val();
				
				$.post('editarFicha.htm',{ 'campos' : JSON.stringify(guardarcampos)}, function(respuesta){
					var resp = JSON.parse(respuesta);
					if(resp.respuesta == '1'){
						$('#error').html('Se modifico la ficha').addClass('correcto').removeClass('error');
					}else{
						$('#error').html(resp.error).addClass('error').removeClass('correcto');
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
			
			tipoCampos(campos);
		
			$("#tipos").html(output);
			$("body").on("click", function (){$('#error').html('');});

		});
		
		function tipoCampos(campos){
			var output2 = "";
			var seccionAnterior = "";

			for(var i = 0; i < campos.length; i++){

				var campo = campos[i]; requerido = "";
				var seccion = campo.seccion;
				if(seccion != seccionAnterior){
					output2 += "<div class='seccion'>" + campo.seccion + "</div><hr/>";
				}

				if(campo.requerido == 1) requerido = "requerido";

				var tipoInput = "";
				var valor = 'value = "' + campo.valor + '"';
				var idCampo = 'id="' + campo.nombre_campo + '" ';
				if(campo.nombre_campo == "id_tipo")
					$('#tipos').val(campo.valor);
				else if(campo.tipo_entrada == "varchar")
					tipoInput = '<input '+valor+' class=" ' + requerido + '" '+ idCampo +' />';
				else if(campo.tipo_entrada == "text")
					tipoInput = '<textarea class=" ' + requerido + '" '+ idCampo +' >'+campo.valor+'</textarea>';
				else if(campo.tipo_entrada == "boolean")
					tipoInput = '<input value="chk" class=" ' + requerido + '" type="checkbox" '+ idCampo + (campo.valor ? "checked" : "") +' />';
				else if(campo.tipo_entrada == "date")
					tipoInput = '<input '+valor+' type="text" '+ idCampo +' class="datepicker  ' + requerido + '" />';
				else if(campo.tipo_entrada == "int")
					tipoInput = '<input '+valor+' type="number" class="numero  ' + requerido + '" '+ idCampo +' />';

				var template = '<div class="lineaCampo"><strong><div class="nomCampo">' + biblicon.ficha.constantes[campo.nombre_campo] + '</div></strong><span class="valorCampo">' + tipoInput + '</span></div>';
				output2 += template;

				if(seccion != seccionAnterior){
					seccionAnterior = seccion;
				}

			}
			$("#fichas article").html(output2);
			
			$( "#fichas .datepicker" ).each(function (i, e){
				$(e).datepicker({ 
					dayNames: [ "Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado" ],
					dayNamesMin: [ "D", "L", "M", "M", "J", "V", "S" ],
					monthNames: [ "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" ],
					dateFormat: "dd/mm/yy"
					 });
			});
		}

	</script>
</body>
</html>   
       