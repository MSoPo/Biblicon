package com.biblicon.control.springmvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biblicon.modelo.bean.Usuario;
import com.biblicon.modelo.dao.UsuarioDAO;
import com.google.gson.Gson;

@Controller
public class UsuarioController {

	@Autowired
	 private UsuarioDAO usuarioDAO;
	
	@RequestMapping("usuario.htm")
	 public String listaUsuarios(HttpServletRequest request, HttpServletResponse response)
	{
		ArrayList<Usuario> lstUsuario = null; 
		Gson json = new Gson();	
		
		try{
			lstUsuario = usuarioDAO.obtenerUsuarios();			
			request.setAttribute("usuarios",  json.toJson(lstUsuario));
			
		}catch(Exception e){
			e.printStackTrace();
		}		
		
		return "usuario";
	}
	
	
	@RequestMapping(value={"/cambiarStatusUsuario.htm"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	@ResponseBody
	public String cambiarStatusUsuario(HttpServletRequest request)
	{	
		String respuesta = "";
		try{
			
			String id_usuario = request.getParameter("id_usuario");
			String status = request.getParameter("status");
						
			if(usuarioDAO.cambiarStatus(id_usuario, status)){
				respuesta = "{ \"respuesta\" : \"1\"}";
			}else {
				respuesta = "{ \"respuesta\" : \"0\" , \"error\" : \"Error al cambiarStatusUsuario \"}";
			}
			
		}catch(Exception e){
			respuesta = "{ \"respuesta\" : \"0\" , \"error\" : \"Error al cambiarStatusUsuario catch\"}";
		}
		
		return respuesta;
			
	}
	
	
	@RequestMapping(value={"/agregarUsuario.htm"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	@ResponseBody
	public String agregarUsuario(HttpServletRequest request)
	{	
		String respuesta = "";
		try{
			
			Gson json= new Gson();
			Usuario usuario = (Usuario)json.fromJson(request.getParameter("usuario"),Usuario.class);
						
			
			if(usuarioDAO.insertar(usuario)){
				respuesta = "{ \"respuesta\" : \"1\"}";
			}else {
				respuesta = "{ \"respuesta\" : \"0\" , \"error\" : \"Error al cambiarStatusUsuario \"}";
			}
			
		}catch(Exception e){
			respuesta = "{ \"respuesta\" : \"0\" , \"error\" : \"Error al cambiarStatusUsuario catch\"}";
		}
		
		return respuesta;
			
	}
	
	
	@RequestMapping(value={"/actualizarUsuario.htm"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	@ResponseBody
	public String actualizarUsuario(HttpServletRequest request)
	{	
		String respuesta = "";
		try{
			
			Gson json= new Gson();
			Usuario usuario = (Usuario)json.fromJson(request.getParameter("usuario"),Usuario.class);
						
			
			if(usuarioDAO.editar(usuario)){
				respuesta = "{ \"respuesta\" : \"1\"}";
			}else {
				respuesta = "{ \"respuesta\" : \"0\" , \"error\" : \"Error al actualizarUsuario \"}";
			}
			
		}catch(Exception e){
			respuesta = "{ \"respuesta\" : \"0\" , \"error\" : \"Error al actualizarUsuario catch\"}";
		}
		
		return respuesta;
			
	}
}	

