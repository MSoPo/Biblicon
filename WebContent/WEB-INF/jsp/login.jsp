<!DOCTYPE HTML>
<html>
<head>
   <meta charset="UTF-8">
   <title>Biblicon</title>
   <link rel="stylesheet" href="css/normalize.css">
   <link rel="stylesheet" href="css/estilos.css">
   <script src="js/jquery-2.0.3.min.js"></script>
</head>
<body>
       <div class="login">
	   <h1>Biblicon</h1>
          <form action="login.htm" method="post">
              <label for="usuario">Usuario</label><input name="usuario" id="usuario" required autofocus/>
              <label for="contrasena">Constraseña</label><input type="password" name="contrasena" id="contrasena" required/>
              <div class="error" id="error"></div>
              <input type="submit" value="Entrar">
          </form>
       </div>

<script type="text/javascript">
	$(function() {
		var respuesta = <%= request.getAttribute("respuesta") %>;
		var usuario = '<%= request.getAttribute("usuario") %>';
		if(respuesta != null){
			var error;
			if(respuesta == -1){
				error = "Ocurrio un error valide los datos";
			}else if(respuesta == -2){
				error = "Usuario no valido";
			}else if(respuesta == -3){
				error = "Contraseña incorrecta";
				$("#contrasena").focus();
			}else{
				error = "Error";
			}
			$("#error").html(error);
			if(usuario != null && usuario != 'null')
				$("#usuario").val(usuario);
		}
	});
</script>
</body>
</html>
