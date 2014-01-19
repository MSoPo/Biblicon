package modelo.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import util.Conexion;
import modelo.bean.Ficha;

public class FichaDAO {
	
	
	public int insertar(Ficha ficha){
		String sql = "insert into ficha (id_tipo_ficha, id_usuario, categoria, apellido, nombre, tipo, apellido_otro, nombre_otro, et_al, titulo, edicion_de, traduccion, prologo, edicion, otros_datos, " +
				"editorial, ciudad, ano, coleccion, paginas, biblioteca, localizacion, notas, a, b, c, d, institucion, pagina_ini, pagina_fin, revista, tomo, numero, mes, semana, apellido_editor, " +
				"nombre_editor, apellido_editor_otro, nombre_editor_otro, et_al_editor, periodico, seccion, dia, url, portal, fecha_acceso, fecha_publicacion, editor, titulo_libro) " +
				"values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		ResultSet rs = null;
		int id = 0;
		
		try {
			
			consulta = conexion.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			
			consulta.setInt(0, ficha.getTipo_ficha().getId_tipo_ficha());  // No puede venir nulo, sino no se inserta
			consulta.setString(1, ficha.getUsuario().getId_usuario()); 		// No puede venir nulo, sino no se inserta
			consulta.setString(2, ficha.getCategoria());
			consulta.setString(3, ficha.getApellido());
			consulta.setString(4, ficha.getNombre());
			consulta.setInt(5, ficha.getTipo());
			consulta.setString(6, ficha.getApellido_otro());
			consulta.setString(7, ficha.getNombre_otro());
			consulta.setBoolean(8, ficha.isEt_al());
			consulta.setString(9, ficha.getTitulo());
			consulta.setString(10, ficha.getEdicion_de());
			consulta.setString(11, ficha.getTraduccion()); 		
			consulta.setString(12, ficha.getPrologo());
			consulta.setString(13, ficha.getEdicion());
			consulta.setString(14, ficha.getOtros_datos());
			consulta.setString(15, ficha.getEditorial());
			consulta.setString(16, ficha.getCiudad());
			consulta.setString(17, ficha.getAno());
			consulta.setString(18, ficha.getColeccion());
			consulta.setString(19, ficha.getPaginas());			
			consulta.setString(20, ficha.getBiblioteca());
			consulta.setString(21, ficha.getLocalizacion()); 		
			consulta.setString(22, ficha.getNotas());
			consulta.setString(23, ficha.getA());
			consulta.setString(24, ficha.getB());
			consulta.setString(25, ficha.getC());
			consulta.setString(26, ficha.getD());
			consulta.setString(27, ficha.getInstitucion());
			consulta.setString(28, ficha.getPagina_ini());
			consulta.setString(29, ficha.getPagina_fin());			
			consulta.setString(30, ficha.getRevista());
			consulta.setString(31, ficha.getTomo()); 		
			consulta.setString(32, ficha.getNumero());
			consulta.setString(33, ficha.getMes());
			consulta.setString(34, ficha.getSemana());
			consulta.setString(35, ficha.getApellido_editor());
			consulta.setString(36, ficha.getNombre_editor());
			consulta.setString(37, ficha.getApellido_editor_otro());
			consulta.setString(38, ficha.getNombre_editor_otro());
			consulta.setBoolean(39, ficha.isEt_al_editor());			
			consulta.setString(40, ficha.getPeriodico());
			consulta.setString(41, ficha.getSeccion()); 		
			consulta.setString(42, ficha.getDia());			
			consulta.setString(43, ficha.getUrl());
			consulta.setString(44, ficha.getPortal());
			consulta.setDate(45, new Date(ficha.getFecha_acceso().getTime()));
			consulta.setDate(46, new Date(ficha.getFecha_publicacion().getTime()));			
			consulta.setString(47, ficha.getEditor());
			consulta.setString(48, ficha.getTitulo_libro());
						
			consulta.execute();			
			rs = consulta.getGeneratedKeys();
			if(rs.next())
				id = rs.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}finally{
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
		return id;
	}
	
	public boolean  editar(Ficha ficha){
		String sql = "update ficha set id_tipo_ficha = ?, id_usuario = ?, categoria = ?, apellido = ?, nombre = ?, tipo = ?, apellido_otro = ?, nombre_otro = ?, et_al = ?, titulo = ?, edicion_de = ?, " +
				"traduccion = ?, prologo = ?, edicion = ?, otros_datos = ?, editorial = ?, ciudad = ?, ano = ?, coleccion = ?, paginas = ?, biblioteca = ?, localizacion = ?, notas = ?, a = ?, b = ?, " +
				"c = ?, d = ?, institucion = ?, pagina_ini = ?, pagina_fin = ?, revista = ?, tomo = ?, numero = ?, mes = ?, semana = ?, apellido_editor = ?, nombre_editor = ?, apellido_editor_otro = ?, " +
				"nombre_editor_otro = ?, et_al_editor = ?, periodico = ?, seccion = ?, dia = ?, url = ?, portal = ?, fecha_acceso = ?, fecha_publicacion = ?, editor = ?, titulo_libro = ? " +
				"where id_ficha = ?";
		
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setInt(0, ficha.getTipo_ficha().getId_tipo_ficha());  // No puede venir nulo, sino no se inserta
			consulta.setString(1, ficha.getUsuario().getId_usuario()); 		// No puede venir nulo, sino no se inserta
			consulta.setString(2, ficha.getCategoria());
			consulta.setString(3, ficha.getApellido());
			consulta.setString(4, ficha.getNombre());
			consulta.setInt(5, ficha.getTipo());
			consulta.setString(6, ficha.getApellido_otro());
			consulta.setString(7, ficha.getNombre_otro());
			consulta.setBoolean(8, ficha.isEt_al());
			consulta.setString(9, ficha.getTitulo());
			consulta.setString(10, ficha.getEdicion_de());
			consulta.setString(11, ficha.getTraduccion()); 		
			consulta.setString(12, ficha.getPrologo());
			consulta.setString(13, ficha.getEdicion());
			consulta.setString(14, ficha.getOtros_datos());
			consulta.setString(15, ficha.getEditorial());
			consulta.setString(16, ficha.getCiudad());
			consulta.setString(17, ficha.getAno());
			consulta.setString(18, ficha.getColeccion());
			consulta.setString(19, ficha.getPaginas());			
			consulta.setString(20, ficha.getBiblioteca());
			consulta.setString(21, ficha.getLocalizacion()); 		
			consulta.setString(22, ficha.getNotas());
			consulta.setString(23, ficha.getA());
			consulta.setString(24, ficha.getB());
			consulta.setString(25, ficha.getC());
			consulta.setString(26, ficha.getD());
			consulta.setString(27, ficha.getInstitucion());
			consulta.setString(28, ficha.getPagina_ini());
			consulta.setString(29, ficha.getPagina_fin());			
			consulta.setString(30, ficha.getRevista());
			consulta.setString(31, ficha.getTomo()); 		
			consulta.setString(32, ficha.getNumero());
			consulta.setString(33, ficha.getMes());
			consulta.setString(34, ficha.getSemana());
			consulta.setString(35, ficha.getApellido_editor());
			consulta.setString(36, ficha.getNombre_editor());
			consulta.setString(37, ficha.getApellido_editor_otro());
			consulta.setString(38, ficha.getNombre_editor_otro());
			consulta.setBoolean(39, ficha.isEt_al_editor());			
			consulta.setString(40, ficha.getPeriodico());
			consulta.setString(41, ficha.getSeccion()); 		
			consulta.setString(42, ficha.getDia());			
			consulta.setString(43, ficha.getUrl());
			consulta.setString(44, ficha.getPortal());
			consulta.setDate(45, new Date(ficha.getFecha_acceso().getTime()));
			consulta.setDate(46, new Date(ficha.getFecha_publicacion().getTime()));			
			consulta.setString(47, ficha.getEditor());
			consulta.setString(48, ficha.getTitulo_libro());
			consulta.setInt(49, ficha.getId_ficha());
			
			return consulta.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally{
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
	}
	
	public boolean delete(Ficha ficha){
		String sql = "delete from ficha where id_ficha = ?";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setInt(0, ficha.getId_ficha());
			return consulta.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally{
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
	}
}
