package com.biblicon.control.springmvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biblicon.modelo.bean.CampoTipoFicha;
import com.biblicon.modelo.bean.Plantilla;
import com.biblicon.modelo.bean.TipoFicha;
import com.biblicon.modelo.bean.Usuario;
import com.biblicon.modelo.dao.CampoTipoFichaDAO;
import com.biblicon.modelo.dao.PlantillaDAO;
import com.biblicon.modelo.dao.TipoFichaDAO;
import com.biblicon.util.Constantes;
import com.google.gson.Gson;

@Controller
public class AjaxController {
	
	@Autowired
	private TipoFichaDAO tipoFichaDAO;
	@Autowired
	private CampoTipoFichaDAO campoFichaDAO;
	@Autowired
	private PlantillaDAO plantillaDAO;

	
	@RequestMapping(value={"/agregarTipo.htm"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	 @ResponseBody
	 public String agregarTipoFicha(HttpServletRequest request)
	{
		/*TODO tenemos que prepara los metodos para que realicen commit hasta que se 
		 * inserten todos los campos en caso contrario no insertar nada
		 * tambien se necesita meter a la BD un constraint para que no se permitan nombre
		 * repetidos en los tipo ficha agregar las constantes 
		 */
		Gson gson = new Gson();
		Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
		String nombreTipo = request.getParameter("nombreTipo");
		ArrayList<String> camposTipo = gson.fromJson(request.getParameter("camposTipo"), ArrayList.class);
		
		TipoFicha tipo = new TipoFicha();
		tipo.setNombre_tipo(nombreTipo);
		tipo.setUsuario(usuario);
		
		tipo.setId_tipo_ficha(tipoFichaDAO.insertar(tipo));
		if(tipo.getId_tipo_ficha() != 0){
			for(String campo : camposTipo){
				CampoTipoFicha campoficha = new CampoTipoFicha();
				campoficha.setNombre_campo(campo);
				campoficha.setTipo_ficha(tipo);
				campoficha.setId_campo(campoFichaDAO.insertar(campoficha));
			}
			return "{ \"respuesta\" : \"1\", \"id\" : \"" + tipo.getId_tipo_ficha() + "\"}";
		}else {
			return "Error";
		}
	}
	
	@RequestMapping(value={"/eliminarTipo.htm"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	 @ResponseBody
	public String eliminarTipoFicha(HttpServletRequest request){
		String idTipo = request.getParameter("idTipo");
		TipoFicha tipo = new TipoFicha();
		tipo.setId_tipo_ficha(Integer.parseInt(idTipo));
		if(true)
			return "1";
		if(tipoFichaDAO.delete(tipo))
			return "1";
		else 
			return "";
	}
	
	@RequestMapping(value={"/eliminarPlantilla.htm"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	 @ResponseBody
	public String eliminarPlantilla(HttpServletRequest request){
		String idPlantilla = request.getParameter("idPlantilla");
		Plantilla plantilla = new Plantilla();
		plantilla.setId_platilla(Integer.parseInt(idPlantilla));
		plantillaDAO.delete(plantilla);
		return "1";
	}
	
	
	@RequestMapping(value={"/agregarPlantilla.htm"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
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
	
	@RequestMapping(value={"/cambiarCampos.htm"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	 @ResponseBody
	 public String cambiarCampos(HttpServletRequest request)
	{
		String idtipo = request.getParameter("idtipo");
		Gson gson = new Gson();
		ArrayList<CampoTipoFicha> lista = campoFichaDAO.consultarPorTipo(new Integer(idtipo));
		String campos = gson.toJson(lista);
		
		if(lista.size() != 0){
			return "{ \"respuesta\" : \"1\", \"campos\" : " + campos + "}";
		}else {
			return "Error";
		}
	}
	
}	
