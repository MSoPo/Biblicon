package com.biblicon.control.springmvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biblicon.modelo.bean.ContenidoFicha;
import com.biblicon.modelo.bean.Ficha;
import com.biblicon.modelo.dao.ContenidoFichaDAO;
import com.biblicon.modelo.dao.FichaDAO;
import com.google.gson.Gson;

@Controller
public class ContenidoController {

  	
	 @Autowired
	 private ContenidoFichaDAO contenidoFichaDAO;
	 @Autowired
	 private FichaDAO fichaDAO;
 
 	 @RequestMapping("contenido.htm")
	 public String principal(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 
		 //Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
		 Gson gson = new Gson();		 
		 Integer id_ficha = new Integer (request.getParameter("idFicha"));
		 String referencia = request.getParameter("apellido") + ", " + request.getParameter("ano");		 
		 ArrayList<ContenidoFicha> listaContenidos = contenidoFichaDAO.consultarContenidoFicha(id_ficha);
		 
		 for (ContenidoFicha contenido : listaContenidos) {
			 contenido.setCampos(contenidoFichaDAO.llenarCampos(contenido,referencia));			 
		 }
		 
		 String contenidos = gson.toJson(listaContenidos);	 
		 request.setAttribute("contenidos", contenidos);
		 request.setAttribute("id_ficha", id_ficha);
		 	 
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
		 
		 ArrayList<ContenidoFicha> listaContenidos = contenidoFichaDAO.consultarContenidoTipoBusqueda(busqueda, tipo);
		 for (ContenidoFicha contenido : listaContenidos) {
			 ficha = fichaDAO.consultaFicha(contenido.getFicha().getId_ficha());
			 referencia = ficha.getApellido() + ", " + ficha.getAno();
			 contenido.setCampos(contenidoFichaDAO.llenarCampos(contenido,referencia));
			 
		 }
		 String contenidos = gson.toJson(listaContenidos);	 
		 request.setAttribute("contenidos", contenidos);
		 	 
		 System.out.println("Saliendo de busqueda Contenido");
		 
		 return "contenido";
	 }
	 
	 @RequestMapping(value={"/editarContenidoFicha.htm"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
		@ResponseBody
		public String editarContenidoFicha(HttpServletRequest request)
		{	
			
			String respuesta = "";
			try{
				
				Gson json= new Gson();
				
				ContenidoFicha contenidoFicha = (ContenidoFicha)json.fromJson(request.getParameter("contenidoFicha"),ContenidoFicha.class);
							
				if(contenidoFichaDAO.editar(contenidoFicha)){
					respuesta = "{ \"respuesta\" : \"1\", \"id\" : \"" + contenidoFicha.getId_contenido() + "\"}";
				}else {
					respuesta = "{ \"respuesta\" : \"0\" , \"error\" : \"Error al agregarContenidoFicha \"}";
				}
				
			}catch(Exception e){
				respuesta = "{ \"respuesta\" : \"0\" , \"error\" : \"Error al agregarContenidoFicha catch\"}";
			}
			
			return respuesta;
			
		}
	 
	 @RequestMapping(value={"/agregarContenidoFicha.htm"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
		@ResponseBody
		public String agregarContenidoFicha(HttpServletRequest request)
		{	
			
			String respuesta = "";
			try{
				
				Gson json= new Gson();
				
				ContenidoFicha contenidoFicha = (ContenidoFicha)json.fromJson(request.getParameter("contenidoFicha"),ContenidoFicha.class);
							
				contenidoFicha.setId_contenido(contenidoFichaDAO.insertar(contenidoFicha));
				
				if(contenidoFicha.getId_contenido() != 0){
					respuesta = "{ \"respuesta\" : \"1\", \"id\" : \"" + contenidoFicha.getId_contenido() + "\"}";
				}else {
					respuesta = "{ \"respuesta\" : \"0\" , \"error\" : \"Error al agregarContenidoFicha \"}";
				}
				
			}catch(Exception e){
				respuesta = "{ \"respuesta\" : \"0\" , \"error\" : \"Error al agregarContenidoFicha catch\"}";
			}
			
			return respuesta;
			
		}
	 
	 @RequestMapping(value={"/editarFichaContenido.htm"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
		public String editarFichaContenido(HttpServletRequest request)
		{
		 String id_contenido = request.getParameter("id_contenido");
		 //Consulta x id_cotenido
		 ContenidoFicha contenido = new ContenidoFicha();
		 contenido.setContenido("Contenido");
		 Ficha ficha = new Ficha();
		 ficha.setId_ficha(1);
		 ficha.setAno("2014");
		 ficha.setApellido("Sosa");
		 contenido.setFicha(ficha);
		 contenido.setId_contenido(Integer.parseInt(id_contenido));
		 contenido.setNotas("Notas");
		 contenido.setPaginas("Paginas");
		 contenido.setPalabra_clave("Palabras Clave");
		 contenido.setTipo_contenido(2);
		 Gson gson = new Gson();
		 request.setAttribute("ficha_contenido", gson.toJson(contenido));
		 
		 return "actualizarfichaContenido";
		}
	 
	 @RequestMapping(value={"/nuevaFichaContenido.htm"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
		public String nuevaFichaContenido(HttpServletRequest request)
		{
		 String id_ficha = request.getParameter("idFicha");
		 request.setAttribute("id_ficha", id_ficha);
		 return "fichaContenido";
		}
	 
	 @RequestMapping(value={"/eliminarFichaContenido.htm"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
		@ResponseBody
		public String eliminarFichaContenido(HttpServletRequest request)
		{	
			
			String respuesta = "";
			try{
				
				System.out.println(request.getParameter("id_contenido"));
				respuesta = "{ \"respuesta\" : \"1\" }";
				
			}catch(Exception e){
				respuesta = "{ \"respuesta\" : \"0\" , \"error\" : \"Error al agregarContenidoFicha catch\"}";
			}
			
			return respuesta;
			
		}
 
}