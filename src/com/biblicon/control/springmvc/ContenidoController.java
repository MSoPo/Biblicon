package com.biblicon.control.springmvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.biblicon.modelo.bean.ContenidoFicha;
import com.biblicon.modelo.bean.Usuario;
import com.biblicon.modelo.dao.ContenidoFichaDAO;
import com.google.gson.Gson;

@Controller
public class ContenidoController {

  	
  @Autowired
 private ContenidoFichaDAO contenidoFichaAO;
 
 @RequestMapping("contenido.htm")
 public String principal(HttpServletRequest request, HttpServletResponse response) throws IOException {
	 
	 Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
	 Gson gson = new Gson();
	 
	 Integer id_ficha = new Integer (request.getParameter("idFicha"));
	 
	 String referencia = request.getParameter("apellido") + ", " + request.getParameter("ano");
	 
	 ArrayList<ContenidoFicha> listaContenidos = contenidoFichaAO.consultarContenidoFicha(id_ficha);
	 for (ContenidoFicha contenido : listaContenidos) {
		 contenido.setCampos(contenidoFichaAO.llenarCampos(contenido,referencia));
		 
		 
	 }
	 
	 String contenidos = gson.toJson(listaContenidos);	 
	 request.setAttribute("contenidos", contenidos);
	 
	 	 
	 System.out.println("Saliendo en el pincipal Contenido");
	 
	 return "contenido";
 	}
 
}