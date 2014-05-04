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

import com.biblicon.modelo.bean.CampoTipoFicha;
import com.biblicon.modelo.bean.TipoFicha;
import com.biblicon.modelo.bean.Usuario;
import com.biblicon.modelo.dao.CampoTipoFichaDAO;
import com.biblicon.modelo.dao.TipoFichaDAO;
import com.google.gson.Gson;

@Controller
public class TipoController {
	
	@Autowired
	private TipoFichaDAO tipoFichaDAO;
	@Autowired
	private CampoTipoFichaDAO campoFichaDAO;


	
	 final Logger logger = Logger.getLogger(PrincipalController.class);

	@RequestMapping("tipos.htm")
	public String principal(HttpServletRequest request, HttpServletResponse response) throws IOException {
		if (request.getSession().getAttribute("usuario") == null) return "login";
		Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
		ArrayList<TipoFicha> listaTipos = tipoFichaDAO.consultarPorUsuarioLogeado(usuario.getId_usuario());
		Gson gson = new Gson();
		String tipos = gson.toJson(listaTipos);
		request.setAttribute("tipos", tipos);
		 return "tipodefichas";
	}
	
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
		int i = 0;
		if(tipo.getId_tipo_ficha() != 0){
			for(String campo : camposTipo)
			{
				CampoTipoFicha campoficha = new CampoTipoFicha();
				campoficha.setNombre_campo(campo);
				campoficha.setTipo_ficha(tipo);
				campoficha.setOrden(i++);
				campoficha.setTipo_entrada("varchar");
				campoficha.setRequerido("0");
				campoficha.setSeccion("Personalizada");
				/*
				 * TODO ver de donde se obtendrá los valores
				  campoficha.setRequerido(requerido);
				  campoficha.setTipo_entrada(tipo_entrada);
				  campoficha.setSeccion(seccion);
				*/
				
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
		
		if(tipoFichaDAO.delete(tipo))
			return "1";
		else 
			return "";
	}
	
	
	@RequestMapping(value={"/obtenerTiposUsuario.htm"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	@ResponseBody
	public String obtenerTiposUsuario(HttpServletRequest request){
		
		Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
		ArrayList<TipoFicha> listaTipos = tipoFichaDAO.consultarPorUsuarioLogeado(usuario.getId_usuario());
		Gson gson = new Gson();
		String tipos = gson.toJson(listaTipos);
		request.setAttribute("tipos", tipos);
		
		
		if(listaTipos!=null && !listaTipos.isEmpty())
			return "{ \"respuesta\" : \"1\", \"cantidad\" : \"" +listaTipos.size() + "\"}";
		else 
			return "{ \"respuesta\" : \"0\", \"error\" : \"Error al obtener los Tipos\"}";
	}
	

}
