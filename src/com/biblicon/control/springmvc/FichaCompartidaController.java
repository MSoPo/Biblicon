package com.biblicon.control.springmvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.biblicon.modelo.bean.Ficha;
import com.biblicon.modelo.bean.TipoFicha;
import com.biblicon.modelo.bean.Usuario;
import com.biblicon.modelo.dao.ContenidoFichaDAO;
import com.biblicon.modelo.dao.FichaDAO;
import com.biblicon.modelo.dao.TipoFichaDAO;
import com.biblicon.util.Constantes;
import com.google.gson.Gson;

@Controller
public class FichaCompartidaController {
	
	 @Autowired
	 private TipoFichaDAO tipofichaDAO;
	 @Autowired
	 private FichaDAO fichaDAO; 
	 @Autowired
	 private ContenidoFichaDAO contenidoFichaAO;
	
	 @RequestMapping("fichasCompartidas.htm")
	 public String principal(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
		 Gson gson = new Gson();
		 
		 ArrayList<Ficha> listafichas = fichaDAO.consultaFichasUsuario(usuario.getId_usuario());
		 //Consultar las fichas con la tabla usuarioCompartido
		 
		 for (Ficha ficha : listafichas) {
			 
			 ficha.setCantidadContenido(contenidoFichaAO.cantidadContenidoFicha(ficha.getId_ficha()));
			 ficha.setCampos(fichaDAO.llenarCampos(ficha));
			 
		}
		 
		 ArrayList<String> listaCategorias = fichaDAO.consultarCategoriasUsuario(usuario.getId_usuario());
		 //Consultar las categorias de las fichas compartidas
		 
		 ArrayList<TipoFicha> listaTipos = tipofichaDAO.consultarPorUsuario(Constantes.USUARIODEFAULT); 
		 // Consultar los tipos fichas que estan en las fihas compartidas
		 
		 
		 String categorias = gson.toJson(listaCategorias);
		 String tipos = gson.toJson(listaTipos);
		 String fichas = gson.toJson(listafichas);
		 request.setAttribute("tipos", tipos);
		 request.setAttribute("fichas", fichas);
		 request.setAttribute("categorias", categorias);
		 
		 return "fichasCompartidas";
	 }

}
