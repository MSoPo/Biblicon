package pruebas;

import com.biblicon.modelo.bean.CampoTipoFicha;
import com.biblicon.modelo.bean.Ficha;
import com.biblicon.modelo.bean.Plantilla;
import com.biblicon.modelo.bean.TipoFicha;
import com.biblicon.modelo.bean.Usuario;
import com.biblicon.modelo.bean.UsuarioCompartido;
import com.biblicon.modelo.dao.CampoTipoFichaDAO;
import com.biblicon.modelo.dao.PlantillaDAO;
import com.biblicon.modelo.dao.TipoFichaDAO;
import com.biblicon.modelo.dao.UsuarioCompartidoDAO;
import com.biblicon.modelo.dao.UsuarioDAO;

public class DAOS {
	
	public static void main(String[] args) {
		//USUARIO
		Usuario usuario = new Usuario();
		usuario.setApellido_materno("prueba materno");
		usuario.setApellido_paterno("prueba Paterno");
		usuario.setContrasena("constrase–a");
		usuario.setCorreo("email");
		usuario.setId_usuario("Usuario");
		usuario.setNombre("Prueba nombre");
		
		UsuarioDAO usdao = new UsuarioDAO();
		usdao.insertar(usuario);
		usuario.setNombre("Nuevo nombre");
		usdao.editar(usuario);
		//usdao.delete(usuario);
		
		//TIPO_FICHA
		TipoFicha tipoFicha = new TipoFicha();
		tipoFicha.setId_tipo_ficha(1);
		tipoFicha.setNombre_tipo("Prueba");
		tipoFicha.setUsuario(usuario);
		TipoFichaDAO tfdao = new TipoFichaDAO();
		System.out.println(tfdao.insertar(tipoFicha));
		
		tipoFicha.setId_tipo_ficha(1);
		tipoFicha.setNombre_tipo("Libro Nvo");
		//System.out.println(tfdao.editar(tipoFicha));
		
		//System.out.println(tfdao.delete(tipoFicha));
		
		//CAMPO_TIPO_FICHA
		CampoTipoFicha campo = new CampoTipoFicha();
		campo.setNombre_campo("Campo Prueba");
		tipoFicha.setId_tipo_ficha(1);
		campo.setTipo_ficha(tipoFicha);
		CampoTipoFichaDAO campodao = new CampoTipoFichaDAO();
		System.out.println(campodao.insertar(campo));
		campo.setId_campo(1);
		campo.setNombre_campo("Nvo Campo");
		//System.out.println(campodao.editar(campo));
		//campodao.delete(campo);
		
		//USUARIO_CAMPARTIDO
		Ficha ficha = new Ficha();
		ficha.setId_ficha(1);
		UsuarioCompartido usucomp = new UsuarioCompartido();
		usucomp.setFicha(ficha);
		usucomp.setUsuario(usuario);
		UsuarioCompartidoDAO ucdao = new UsuarioCompartidoDAO();
		System.out.print(ucdao.insertar(usucomp));
		
		//ucdao.delete(usucomp);
		
		//PLANTILLA
		Plantilla platilla = new Plantilla();
		platilla.setPlantilla("Nueva plantilla");
		platilla.setUsuario(usuario);
		PlantillaDAO pdao = new PlantillaDAO();
		System.out.println(pdao.insertar(platilla));
		
		platilla.setId_platilla(1);
		platilla.setPlantilla("Platilla");
		pdao.editar(platilla);
		
		pdao.delete(platilla);
		
	}

}
