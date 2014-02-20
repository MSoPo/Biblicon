package com.biblicon.control.springmvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.biblicon.modelo.bean.Usuario;
import com.google.gson.Gson;

@Controller
public class UsuarioController {

	
	@RequestMapping("usuario.htm")
	 public String listaUsuarios(HttpServletRequest request, HttpServletResponse response)
	{
		ArrayList<Usuario> lstUsuario = new ArrayList<Usuario>();
		for(int i  = 0; i < 100; i++){
			Usuario us = new Usuario();
			us.setApellido_materno("ApeMat" + i);
			us.setApellido_paterno("ApePat" + 1);
			us.setContrasena("Contra"+i);
			us.setCorreo("correo"+i);
			us.setId_usuario("Usuario"+i);
			us.setNombre("Nombre"+i);
			lstUsuario.add(us);
		}	
		
		Gson gson = new Gson();
		
		request.setAttribute("usuarios",  gson.toJson(lstUsuario));
		
		return "usuario";
	}
}	

