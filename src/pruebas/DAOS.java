package pruebas;

import modelo.bean.Usuario;
import modelo.dao.UsuarioDAO;

public class DAOS {
	
	public static void main(String[] args) {
		Usuario usuario = new Usuario();
		usuario.setApellido_materno("prueba materno");
		usuario.setApellido_paterno("prueba Paterno");
		usuario.setContrasena("constrase–a");
		usuario.setCorreo("email");
		usuario.setId_usuario("Usuario");
		usuario.setNombre("Prueba nombre");
		
		UsuarioDAO usdao = new UsuarioDAO();
		usdao.insertar(usuario);
	}

}
