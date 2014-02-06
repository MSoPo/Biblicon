package com.biblicon.control.springmvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biblicon.modelo.bean.UsuarioCompartido;
import com.biblicon.modelo.dao.UsuarioCompartidoDAO;


import com.google.gson.Gson;

@Controller
public class UsuarioCompartidoController {
	
	@Autowired
	private UsuarioCompartidoDAO usuarioCompartidoDAO;
	
	@RequestMapping(value={"/consultarUsuariosFicha.htm"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	@ResponseBody
	public String consultarUsuariosFicha(HttpServletRequest request)
	{		
		 Gson gson = new Gson();		 
		 String idFicha = request.getParameter("id"); 	//TODO poner valor correcto	 
		 
		 ArrayList<UsuarioCompartido> listaCompartidos = usuarioCompartidoDAO.consultarUsuariosFicha(Integer.parseInt(idFicha));
		 
		 String compartidos = gson.toJson(listaCompartidos);	 
		 request.setAttribute("compartidos", compartidos);
		 	 
		 System.out.println("Saliendo de consultarUsuariosFicha");
		 
		 return ""; //TODO poner salida correcta
	}
	
	@RequestMapping(value={"/borrarUsuarioCompartido.htm"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	@ResponseBody
	public String borrarUsuarioCompartido(HttpServletRequest request)
	{	
		String respuesta = "";
		try{		 
			 String idFicha = request.getParameter("id");			//TODO poner valor correcto	 
			 String idUsuario = request.getParameter("idUsuario");	//TODO poner valor correcto	
			 
			 UsuarioCompartido usuariocompartido = new UsuarioCompartido();
			 usuariocompartido.getFicha().setId_ficha(Integer.parseInt(idFicha));
			 usuariocompartido.getUsuario().setId_usuario(idUsuario);

			 if(usuarioCompartidoDAO.delete(usuariocompartido)){
				respuesta = "{ \"respuesta\" : \"1\" }";
			}else {
				respuesta = "{ \"respuesta\" : \"0\" , \"error\" : \"Error al borrarUsuarioCompartido\"}";
			}
		}catch(Exception e){
			respuesta = "{ \"respuesta\" : \"0\" , \"error\" : \"Error al borrarUsuarioCompartido catch\"}";
		}
		
		return respuesta;
		 
		 
		 
	}
	
}	

