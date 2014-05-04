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
   <script src="js/mustache.js"></script>
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
			
			$('#fichas').on('click', '.mostrardetalle', function(ev){
				ev.preventDefault();
				var idsec = $(this).parent().attr('id');
				$('.lineaCampo.oculto.' + idsec).addClass('mostrar');
				$('.lineaCampo.oculto.' + idsec).removeClass('oculto');
				
				$(this).parent().find('.mostrardetalle').addClass('oculto');
				$(this).parent().find('.ocultardetalle').removeClass('oculto');
				
				
			});
			
			$('#fichas').on('click', '.ocultardetalle', function(ev){
				ev.preventDefault();
				var idsec = $(this).parent().attr('id');
				$('.lineaCampo.mostrar.' + idsec).addClass('oculto');
				$('.lineaCampo.mostrar.' + idsec).removeClass('mostrar');
				
				$(this).parent().find('.mostrardetalle').removeClass('oculto');
				$(this).parent().find('.ocultardetalle').addClass('oculto');
				
				
			});
			
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
						if(i == 1){
							nomCampo = $($(e).children()[0])[0].id;
							var valor = "";
							if($($(e).children()[0]).val() == "chk"){
								valor = $($(e).children()[0]).is(':checked') ? "1" : "0";
							}else{
								valor = $($(e).children()[0]).val();
							}
							guardarcampos[nomCampo] = valor;
						}
					});
					
				});
				
				guardarcampos['tipo_ficha'] = $('#tipos').val();
				
				$.post('agregarFicha.htm',{ 'campos' : JSON.stringify(guardarcampos)}, function(respuesta){
					var resp = JSON.parse(respuesta);
					if(resp.respuesta == '1'){
						$('.lineaCampo input').each(function(indice, elemento){
							if($($(elemento).children()[0]).val() != "chk"){
								if($(elemento).hasClass('datepicker')){
									var today = new Date();
									$(elemento).val(ceros(today.getDate(), 2, "0") + "/" + ceros((today.getMonth() + 1), 2, "0") + "/" + ceros(today.getFullYear(), 2, "0"));
								}else
									$(elemento).val('');
							}else
								$(elemento).attr("checked",false);
						});
						$('.lineaCampo textarea').each(function(indice, elemento){
							$(elemento).val('');
						});
						$('#error').html('Se agrego la ficha').addClass('correcto').removeClass('error');
					}else{
						$('#error').html(resp.error).addClass('error').removeClass('correcto');
					}
				});
			});
			
			$('#tipos').on('change', function(){
				$.post("cambiarCampos.htm", {"idtipo" : $(this).val()}	, function(respuesta){
					var resp = JSON.parse(respuesta);
					if(resp.respuesta == "1"){
						var campos = resp.campos;
						tipoCampos(campos);
						
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
				var idSec;
				if(seccion != seccionAnterior){
					idSec = i + 'sec';
					output2 += "<div class='seccion' id = '" + idSec + "'>" + campo.seccion +  " <a href='#' class='mostrardetalle " + idSec + " '>+</a> <a href='#' class='ocultardetalle oculto'>-</a> </div><hr/>";
				}

				if(campo.requerido == 1) requerido = "requerido";
				

				var tipoInput = "";
				var today = new Date();
				var fecha = ceros(today.getDate(), 2, "0") + "/" + ceros((today.getMonth() + 1), 2, "0") + "/" + ceros(today.getFullYear(), 2, "0");
				var idCampo = 'id="' + campo.nombre_campo + '" ';
				if(campo.tipo_entrada == "varchar")
					tipoInput = '<input class=" ' + requerido + '" '+ idCampo +' />';
				else if(campo.tipo_entrada == "text")
					tipoInput = '<textarea class=" ' + requerido + '" '+ idCampo +' />';
				else if(campo.tipo_entrada == "boolean")
					tipoInput = '<input value="chk" class=" ' + requerido + '" type="checkbox" '+ idCampo +' />';
				else if(campo.tipo_entrada == "date")
					tipoInput = '<input type="text" '+ idCampo +' class="datepicker  ' + requerido + '" value="' + fecha + '" />';
				else if(campo.tipo_entrada == "comboTipo")
					tipoInput = '<select class=" ' + requerido + '" '+ idCampo +' ><option value="1">(ed.)</option><option value="2">(coord.)</option><option value="3">(comp.)</option><option value="4">(dir.)</option></select>';

				var template = '<div class="lineaCampo ' + ((campo.requerido != 1) ? 'oculto' : '') + ' ' + idSec +  '"><strong><div class="nomCampo">' + biblicon.ficha.constantes[campo.nombre_campo] + '</div></strong><span class="valorCampo">' + tipoInput + '</span></div>';
				output2 += template;
				
				if(biblicon.ficha.constantes[campo.nombre_campo] == undefined)
					console.log(campo.nombre_campo);
				
				if(seccion != seccionAnterior){
					seccionAnterior = seccion;
				}

			}
			$("#fichas article").html(output2);
			
			$('div.seccion').each(function(i,e){ 
				var seccion = $(e).attr('id') ;
				var cantOculto = $('.lineaCampo.oculto.'+seccion).length;
				if(cantOculto <  1){
					$('.mostrardetalle.'+seccion).addClass('oculto');
				}
				
				});
			
			$( "#fichas .datepicker" ).each(function (i, e){
				$(e).datepicker({ 
					dayNames: [ "Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado" ],
					dayNamesMin: [ "D", "L", "M", "M", "J", "V", "S" ],
					monthNames: [ "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" ],
					dateFormat: "dd/mm/yy"
					 });
			});
		}

		function ceros(valor, cantidad, signo){
			var val = String(valor);
			while(val.length < cantidad){
				val = signo + val;
			}
			return val;
		}
	</script>
</body>
</html>   
       