package com.biblicon.control.springmvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biblicon.modelo.bean.Plantilla;
import com.biblicon.modelo.bean.Usuario;
import com.biblicon.modelo.dao.PlantillaDAO;
import com.google.gson.Gson;

@Controller
public class PlantillaController {
	
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
	
	@RequestMapping(value={"/eliminarPlantilla.htm"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	@ResponseBody
	public String eliminarPlantilla(HttpServletRequest request){
		String idPlantilla = request.getParameter("idPlantilla");
		Plantilla plantilla = new Plantilla();
		plantilla.setId_platilla(Integer.parseInt(idPlantilla));
		if(plantillaDAO.delete(plantilla))
			return "1";
		else
			return "0";
	}
	
	
	@RequestMapping(value={"/guardarPlantilla.htm"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	@ResponseBody
	public String agregarPlantilla(HttpServletRequest request)
	{
		Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
		String nombrePlantilla = request.getParameter("nombrePlantilla");
		String plantilla = request.getParameter("plantilla");
		
		Plantilla p = new Plantilla();
		p.setPlantilla(plantilla);
		p.setUsuario(usuario);
		p.setNombrePlantilla(nombrePlantilla);
		p.setId_platilla(plantillaDAO.insertar(p));
		
		if(p.getId_platilla() != 0){
			return "{ \"respuesta\" : \"1\", \"id\" : \"" + p.getId_platilla() + "\"}";
		}else {
			return "Error";
		}
	}
	
	@RequestMapping(value={"/obtenerPlantillas.htm"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	@ResponseBody
	public String obtenerPlantillas(HttpServletRequest request)
	{
		Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
		Gson gson = new Gson();		
		ArrayList<Plantilla> listPlantillas = plantillaDAO.consultarPorUsuario(usuario.getId_usuario());
		
		String plantillas = gson.toJson(listPlantillas);
		request.setAttribute("plantillas", plantillas);
		
		if(listPlantillas != null && !listPlantillas.isEmpty()){
			return "{ \"respuesta\" : \"1\", \"cantidad\" : \"" +listPlantillas.size() + "\"}";
		}else {
			return "{ \"respuesta\" : \"0\", \"error\" : \"Error al obtener las plantillas\"}";
		}
	}

}
