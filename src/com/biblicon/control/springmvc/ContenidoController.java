package com.biblicon.control.springmvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.biblicon.modelo.bean.ContenidoFicha;
import com.biblicon.modelo.bean.Ficha;
import com.biblicon.modelo.dao.ContenidoFichaDAO;
import com.biblicon.modelo.dao.FichaDAO;
import com.google.gson.Gson;

@Controller
public class ContenidoController {

  	
  @Autowired
 private ContenidoFichaDAO contenidoFichaAO;
  @Autowired
 private FichaDAO fichaDAO;
 
 	 @RequestMapping("contenido.htm")
	 public String principal(HttpServletRequest request, HttpServletResponse response) throws IOException {

		 
		 //Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
		 Gson gson = new Gson();

		 
		 Integer id_ficha = new Integer (request.getParameter("idFicha"));

		 String referencia = request.getParameter("apellido") + ", " + request.getParameter("ano");




		 
		 ArrayList<ContenidoFicha> listaContenidos = contenidoFichaAO.consultarContenidoFicha(id_ficha);
		 for (ContenidoFicha contenido : listaContenidos) {
			 contenido.setCampos(contenidoFichaAO.llenarCampos(contenido,referencia));			 
		 }
		 
		 String contenidos = gson.toJson(listaContenidos);	 
		 request.setAttribute("contenidos", contenidos);
		 	 
		 System.out.println("Saliendo de principal Contenido");
		 
		 return "contenido";
	 }
	 




	 @RequestMapping("contenidoBusqueda.htm")
	 public String busqueda(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 
		 //Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
		 Gson gson = new Gson();
		
		 Ficha ficha = null;
		 
		 String referencia = "";
		 String busqueda = request.getParameter("busqueda");
		 String tipo = request.getParameter("tipo");
		 
		 ArrayList<ContenidoFicha> listaContenidos = contenidoFichaAO.consultarContenidoTipoBusqueda(busqueda, tipo);
		 for (ContenidoFicha contenido : listaContenidos) {
			 ficha = fichaDAO.consultaFicha(contenido.getFicha().getId_ficha());
			 referencia = ficha.getApellido() + ", " + ficha.getAno();
			 contenido.setCampos(contenidoFichaAO.llenarCampos(contenido,referencia));
			 
		 }
		 String contenidos = gson.toJson(listaContenidos);	 
		 request.setAttribute("contenidos", contenidos);
		 	 
		 System.out.println("Saliendo de busqueda Contenido");
		 
		 return "contenido";
	 }
 
}