package control.springmvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import modelo.bean.TipoFicha;
import modelo.bean.Usuario;
import modelo.dao.TipoFichaDAO;

@Controller
public class PrincipalController {

	 final Logger logger = Logger.getLogger(PrincipalController.class);
	
 @Autowired
 private TipoFichaDAO tipofichaDAO;
 
 @RequestMapping("principal.htm")
 public String calcula(HttpServletRequest request, HttpServletResponse response) throws IOException {
	 Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
	 Gson gson = new Gson();
	 ArrayList<TipoFicha> listaTipos = tipofichaDAO.consultarPorUsuario(usuario.getId_usuario());
	 String tipos = gson.toJson(listaTipos);
	 request.setAttribute("tipos", tipos);
	 System.out.println("Entrando en el pincipal");
	 
	 return "principal";
 }
}