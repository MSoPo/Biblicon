package com.biblicon.control.springmvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;





//import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biblicon.modelo.bean.Ficha;
import com.biblicon.modelo.bean.Plantilla;
import com.biblicon.modelo.bean.TipoFicha;
import com.biblicon.modelo.bean.Usuario;
import com.biblicon.modelo.dao.ContenidoFichaDAO;
import com.biblicon.modelo.dao.FichaDAO;
import com.biblicon.modelo.dao.PlantillaDAO;
import com.biblicon.modelo.dao.TipoFichaDAO;
import com.biblicon.modelo.dao.UsuarioCompartidoDAO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class PrincipalController {

	// final Logger logger = Logger.getLogger(PrincipalController.class);
	
 @Autowired
 private TipoFichaDAO tipofichaDAO;
 @Autowired
 private FichaDAO fichaDAO; 
 @Autowired
 private PlantillaDAO plantillaDAO; 
 @Autowired
 private UsuarioCompartidoDAO usuarioCompartidoDAO;
 @Autowired
 private ContenidoFichaDAO contenidoFichaAO;
 
 @RequestMapping("principal.htm")
 public String principal(HttpServletRequest request, HttpServletResponse response) throws IOException {
	 if (request.getSession().getAttribute("usuario") == null) return "login";
	 Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
	 
	 Gson gson = new Gson();
	 ArrayList<TipoFicha> listaTipos = tipofichaDAO.consultarPorUsuario(usuario.getId_usuario());
	 ArrayList<Ficha> listafichas = fichaDAO.consultaFichasUsuario(usuario.getId_usuario());
	 for (Ficha ficha : listafichas) {
		 
		 ficha.setCantidadCompartida(usuarioCompartidoDAO.cantidadFichaCompartida(ficha.getId_ficha()));
		 ficha.setCantidadContenido(contenidoFichaAO.cantidadContenidoFicha(ficha.getId_ficha()));
		 ficha.setCampos(fichaDAO.llenarCampos(ficha));
		 
	}
	 
	 ArrayList<String> listaCategorias = fichaDAO.consultarCategoriasUsuario(usuario.getId_usuario());
	 
	 String categorias = gson.toJson(listaCategorias);
	 String tipos = gson.toJson(listaTipos);
	 String fichas = gson.toJson(listafichas);
	 request.setAttribute("tipos", tipos);
	 request.setAttribute("fichas", fichas);
	 request.setAttribute("categorias", categorias);
	 
	 if(listafichas.size() < 1){
		 return "redirect:ficha.htm";
	 }
	 
	 return "principal";
 }
 
 @RequestMapping(value={"/exportarFicha.htm"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
@ResponseBody
 public String exportarFicha(HttpServletRequest request, HttpServletResponse response){
	 System.out.println(request.getParameter("idFichas"));
	 System.out.println(request.getParameter("id_platilla"));
	 String respuesta = "{ \"respuesta\" : \"1\"}";
	 return respuesta;
 }
 
 @RequestMapping("exportar.htm")
 public String exportar(HttpServletRequest request, HttpServletResponse response) throws IOException {
	 if (request.getSession().getAttribute("usuario") == null) return "login";
	 Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
	 
	 Gson gson = new Gson();
	 ArrayList<TipoFicha> listaTipos = tipofichaDAO.consultarPorUsuario(usuario.getId_usuario());
	 ArrayList<Ficha> listafichas = fichaDAO.consultaFichasUsuario(usuario.getId_usuario());
	 for (Ficha ficha : listafichas) {
		 
		 ficha.setCantidadCompartida(usuarioCompartidoDAO.cantidadFichaCompartida(ficha.getId_ficha()));
		 ficha.setCantidadContenido(contenidoFichaAO.cantidadContenidoFicha(ficha.getId_ficha()));
		 ficha.setCampos(fichaDAO.llenarCampos(ficha));
		 
	}
	 
	 ArrayList<String> listaCategorias = fichaDAO.consultarCategoriasUsuario(usuario.getId_usuario());
	 
	 String categorias = gson.toJson(listaCategorias);
	 String tipos = gson.toJson(listaTipos);
	 String fichas = gson.toJson(listafichas);
	 request.setAttribute("tipos", tipos);
	 request.setAttribute("fichas", fichas);
	 request.setAttribute("categorias", categorias);
	 
	 ArrayList<Plantilla> listaPlantillas = plantillaDAO.consultarPorUsuario(usuario.getId_usuario());
	 gson = new GsonBuilder().disableHtmlEscaping().create();
	 String plantillas = gson.toJson(listaPlantillas);
	 request.setAttribute("plantillas", plantillas);
	 
	 if(listafichas.size() < 1){
		 return "redirect:ficha.htm";
	 }
	 
	 return "exportar";
 }
 
  	@RequestMapping(value={"/principalBusqueda.htm"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	@ResponseBody
	 public String busqueda(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
		 Gson gson = new Gson();
		 
		 String categoria = request.getParameter("categoria");
		 String tipo_ficha = request.getParameter("tipo_ficha");
		 String busqueda = request.getParameter("busqueda");
		 
		 categoria = categoria.replace("[", " ");
		 categoria = categoria.replace("]", " ");
		 categoria = categoria.replace("\"", "'");
		 
		 tipo_ficha = tipo_ficha.replace("[", " ");
		 tipo_ficha = tipo_ficha.replace("]", " ");
		 tipo_ficha = tipo_ficha.replace("\"", "'");
		 
		 ArrayList<Ficha> listafichas = fichaDAO.consultarFichasUsuarioCategoriaTipoFicha(usuario.getId_usuario(), categoria, tipo_ficha, busqueda);
		 
		 for (Ficha ficha : listafichas) {
			 
			 ficha.setCantidadCompartida(usuarioCompartidoDAO.cantidadFichaCompartida(ficha.getId_ficha()));
			 ficha.setCantidadContenido(contenidoFichaAO.cantidadContenidoFicha(ficha.getId_ficha()));
			 ficha.setCampos(fichaDAO.llenarCampos(ficha));
			 
		}
		 
		 String fichas = gson.toJson(listafichas);
		 
		 String respuesta = "{ \"respuesta\" : \"1\", \"fichas\" : " + fichas + "}";
		 return respuesta;
	 }
}