package com.biblicon.control.springmvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.biblicon.modelo.bean.TipoFicha;
import com.biblicon.modelo.bean.Usuario;
import com.biblicon.modelo.dao.CampoTipoFichaDAO;
import com.biblicon.modelo.dao.TipoFichaDAO;
import com.google.gson.Gson;

@Controller
public class FichaController {

	 final Logger logger = Logger.getLogger(FichaController.class);
	
 @Autowired
 private TipoFichaDAO tipofichaDAO;
 @Autowired
 private CampoTipoFichaDAO camposDAO;
 
 @RequestMapping("ficha.htm")
 public String principal(HttpServletRequest request, HttpServletResponse response) throws IOException {
	 Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
	 ArrayList<TipoFicha> listaTipos = tipofichaDAO.consultarPorUsuario(usuario.getId_usuario());
	 Gson gson = new Gson();
	 String tipos = gson.toJson(listaTipos);
	 request.setAttribute("tipos", tipos);
	 String campos = gson.toJson(camposDAO.consultarPorTipo(listaTipos.get(0).getId_tipo_ficha()));
	 request.setAttribute("campos", campos);
	 return "ficha";
 }
}