package com.biblicon.control.springmvc;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biblicon.modelo.bean.ContenidoFicha;
import com.biblicon.modelo.bean.Ficha;
import com.biblicon.modelo.bean.TipoFicha;
import com.biblicon.modelo.dao.ContenidoFichaDAO;
import com.biblicon.modelo.dao.FichaDAO;
import com.biblicon.modelo.dao.TipoFichaDAO;
import com.biblicon.util.Constantes;
import com.google.gson.Gson;

@Controller
public class ContenidoController {

  	
	 @Autowired
	 private ContenidoFichaDAO contenidoFichaDAO;
	 @Autowired
	 private FichaDAO fichaDAO;
	 @Autowired
	 private TipoFichaDAO tipoFichaDAO;
 
 	 @RequestMapping("contenido.htm")
	 public String principal(HttpServletRequest request, HttpServletResponse response) throws IOException {
 		if (request.getSession().getAttribute("usuario") == null) return "login";
		 Gson gson = new Gson();		 
		 Integer id_ficha = new Integer (request.getParameter("idFicha"));
		 
		 Ficha ficha = fichaDAO.consultaFicha(id_ficha);
		 
		 TipoFicha tipoficha = tipoFichaDAO.consultarPorId(ficha.getTipo_ficha().getId_tipo_ficha());
		 
		 String referencia = "";
		 
		 if(tipoficha.equals(Constantes.tipoArticuloInternet) || tipoficha.equals(Constantes.tipoLibroInternet))
		 {
			 
			 String anio = "";
			 SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			 anio = sdf.format(ficha.getFecha_acceso());
			 referencia = ficha.getApellido()==null?"":ficha.getApellido() + ", " + anio; 
		 }
		 else{
		 
			 referencia = ficha.getApellido()==null?"":ficha.getApellido() + ", " + ficha.getAno()==null?"":ficha.getAno();
		 }
		 ArrayList<ContenidoFicha> listaContenidos = contenidoFichaDAO.consultarContenidoFicha(id_ficha);
		 
		 
		 for (ContenidoFicha contenido : listaContenidos) {
			 contenido.setCampos(contenidoFichaDAO.llenarCampos(contenido,referencia));			 
		 }
		 
		 String contenidos = gson.toJson(listaContenidos);	 
		 request.setAttribute("contenidos", contenidos);
		 request.setAttribute("id_ficha", id_ficha);
		 request.setAttribute("entrada", request.getParameter("entrada"));
		 	 
		 System.out.println("Saliendo de principal Contenido");
		 
		 return "contenido";
	 }
 	 
 	@RequestMapping(value={"/contenidoBusqueda.htm"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	@ResponseBody
	 public String busqueda(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 
		 Gson gson = new Gson();
		
		 Ficha ficha = null;
		 
		 String referencia = "";
		 String busqueda = request.getParameter("busqueda");
		 String tipo = request.getParameter("tipo_contenido");
		 Integer idFicha = new Integer(request.getParameter("idFicha"));
		 
		 tipo = tipo.replace("[", " ");
		 tipo = tipo.replace("]", " ");
		 tipo = tipo.replace("\"", "'");
		 
		 ArrayList<ContenidoFicha> listaContenidos = contenidoFichaDAO.consultarContenidoTipoBusqueda(busqueda, tipo, idFicha);
		 for (ContenidoFicha contenido : listaContenidos) {
			 ficha = fichaDAO.consultaFicha(contenido.getFicha().getId_ficha());
			 referencia = ficha.getApellido() + ", " + ficha.getAno();
			 contenido.setCampos(contenidoFichaDAO.llenarCampos(contenido,referencia));
			 
		 }
		 String contenidos = gson.toJson(listaContenidos);	 
		 	 		 
		 String respuesta = "{ \"respuesta\" : \"1\", \"contenidos\" : " + contenidos + "}";
		 return respuesta;
	 }
	 
	@RequestMapping(value={"/editarFichaContenido.htm"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	@ResponseBody
	public String editarFichaContenido(HttpServletRequest request)
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
	 
	 
	@RequestMapping(value={"/eliminarFichaContenido.htm"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	@ResponseBody
	public String eliminarFichaContenido(HttpServletRequest request)
	{				
		String respuesta = "";
		try{
			
			ContenidoFicha contenidoFicha = new ContenidoFicha();			
			contenidoFicha.setId_contenido(Integer.parseInt(request.getParameter("id_contenido")));					
			
			if(contenidoFichaDAO.delete(contenidoFicha))				
				respuesta = "{ \"respuesta\" : \"1\" }";
			else
				respuesta = "{ \"respuesta\" : \"0\" , \"error\" : \"Error al agregarContenidoFicha\"}";
			
		}catch(Exception e){
			respuesta = "{ \"respuesta\" : \"0\" , \"error\" : \"Error al agregarContenidoFicha catch\"}";
		}
		
		return respuesta;
			
	}
	
	@RequestMapping(value={"/cargarFichaContenido.htm"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	public String cargarFichaContenido(HttpServletRequest request)
	 		{
	 		 String id_contenido = request.getParameter("id_contenido");
	 		 //Consulta x id_cotenido
	 		 ContenidoFicha contenido = contenidoFichaDAO.consultarContenidoFichaXId(new Integer(id_contenido));
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
	
 
}