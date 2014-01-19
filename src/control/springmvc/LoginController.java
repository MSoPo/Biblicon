package control.springmvc;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import util.Constantes;

import modelo.bean.Usuario;
import modelo.dao.UsuarioDAO;

@Controller
public class LoginController {

	 final Logger logger = Logger.getLogger(LoginController.class);
	
 @Autowired
 private UsuarioDAO usuarioDao;
 
 @RequestMapping("login.htm")
 public String calcula(HttpServletRequest request, HttpServletResponse response) throws IOException {
	 String usuario = request.getParameter("usuario");
	 String contrasena = request.getParameter("contrasena");
	 int respuesta;
	 String view = "login";
	 
	 Usuario us = null;
	 if(usuario != "" && contrasena != ""){
		 us = usuarioDao.consultarPorId(usuario);
		 if(us == null)
			 respuesta = Constantes.ERRUSUARIO;
		 else if(!contrasena.equals(us.getContrasena())){
			 respuesta = Constantes.ERRCONTRASENA;
		 }else{
			 respuesta = Constantes.OK;
			 request.getSession().setAttribute("usuario", us);
			 view = "redirect:principal.htm";
		 }
	 }else{
		 respuesta = Constantes.ERRDATOS;
	 }
	 request.setAttribute("respuesta", respuesta);
	 request.setAttribute("usuario", usuario);
	 return view;
 }
}