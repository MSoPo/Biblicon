package com.biblicon.control.springmvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.biblicon.modelo.bean.Plantilla;
import com.biblicon.modelo.bean.Usuario;
import com.biblicon.modelo.dao.PlantillaDAO;
import com.google.gson.Gson;

@Controller
public class PlantillaContraller {
	
@Autowired
private PlantillaDAO plantillaDAO;
	
	 final Logger logger = Logger.getLogger(PrincipalController.class);

@RequestMapping("plantillas.htm")
public String principal(HttpServletRequest request, HttpServletResponse response) throws IOException {
	Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
	ArrayList<Plantilla> listaPlantillas = plantillaDAO.consultarPorUsuario(usuario.getId_usuario());
	Gson gson = new Gson();
	String plantillas = gson.toJson(listaPlantillas);
	request.setAttribute("plantillas", plantillas);
	 return "plantillas";
}

}
