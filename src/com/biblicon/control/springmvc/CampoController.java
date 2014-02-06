package com.biblicon.control.springmvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biblicon.modelo.bean.CampoTipoFicha;
import com.biblicon.modelo.dao.CampoTipoFichaDAO;


import com.google.gson.Gson;

@Controller
public class CampoController {
	
	@Autowired
	private CampoTipoFichaDAO campoFichaDAO;

	
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

