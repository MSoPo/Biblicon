package com.biblicon.modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import org.springframework.stereotype.Repository;

import com.biblicon.util.Conexion;
import com.biblicon.util.Constantes;
import com.biblicon.modelo.bean.Ficha;

@Repository
public class FichaDAO {
	
	
	public int insertar(Ficha ficha){
		String sql = "insert into ficha (id_tipo_ficha, id_usuario, categoria, apellido, nombre, tipo, apellido_otro, nombre_otro, et_al, titulo, edicion_de, traduccion, prologo, edicion, otros_datos, " +
				"editorial, ciudad, ano, coleccion, paginas, biblioteca, localizacion, notas, a, b, c, d, institucion, pagina_ini, pagina_fin, revista, tomo, numero, mes, semana, apellido_editor, " +
				"nombre_editor, apellido_editor_otro, nombre_editor_otro, et_al_editor, periodico, seccion, dia, url, portal, fecha_acceso, fecha_publicacion, editor, titulo_libro) " +
				"values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		ResultSet rs = null;
		int id = 0;
		
		try {
			
			consulta = conexion.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			
			consulta.setInt(1, ficha.getTipo_ficha().getId_tipo_ficha());  // No puede venir nulo, sino no se inserta
			consulta.setString(2, ficha.getUsuario().getId_usuario()); 		// No puede venir nulo, sino no se inserta
			consulta.setString(3, ficha.getCategoria());
			consulta.setString(4, ficha.getApellido());
			consulta.setString(5, ficha.getNombre());
			consulta.setInt(6, ficha.getTipo());
			consulta.setString(7, ficha.getApellido_otro());
			consulta.setString(8, ficha.getNombre_otro());
			consulta.setBoolean(9, ficha.isEt_al());
			consulta.setString(10, ficha.getTitulo());
			consulta.setString(11, ficha.getEdicion_de());
			consulta.setString(12, ficha.getTraduccion()); 		
			consulta.setString(13, ficha.getPrologo());
			consulta.setString(14, ficha.getEdicion());
			consulta.setString(15, ficha.getOtros_datos());
			consulta.setString(16, ficha.getEditorial());
			consulta.setString(17, ficha.getCiudad());
			consulta.setString(18, ficha.getAno());
			consulta.setString(19, ficha.getColeccion());
			consulta.setString(20, ficha.getPaginas());			
			consulta.setString(21, ficha.getBiblioteca());
			consulta.setString(22, ficha.getLocalizacion()); 		
			consulta.setString(23, ficha.getNotas());
			consulta.setString(24, ficha.getA());
			consulta.setString(25, ficha.getB());
			consulta.setString(26, ficha.getC());
			consulta.setString(27, ficha.getD());
			consulta.setString(28, ficha.getInstitucion());
			consulta.setString(29, ficha.getPagina_ini());
			consulta.setString(30, ficha.getPagina_fin());			
			consulta.setString(31, ficha.getRevista());
			consulta.setString(32, ficha.getTomo()); 		
			consulta.setString(33, ficha.getNumero());
			consulta.setString(34, ficha.getMes());
			consulta.setString(35, ficha.getSemana());
			consulta.setString(36, ficha.getApellido_editor());
			consulta.setString(37, ficha.getNombre_editor());
			consulta.setString(38, ficha.getApellido_editor_otro());
			consulta.setString(39, ficha.getNombre_editor_otro());
			consulta.setBoolean(40, ficha.isEt_al_editor());			
			consulta.setString(41, ficha.getPeriodico());
			consulta.setString(42, ficha.getSeccion()); 		
			consulta.setString(43, ficha.getDia());			
			consulta.setString(44, ficha.getUrl());
			consulta.setString(45, ficha.getPortal());
			consulta.setDate(46, ficha.getFecha_acceso());
			consulta.setDate(47, ficha.getFecha_publicacion());			
			consulta.setString(48, ficha.getEditor());
			consulta.setString(49, ficha.getTitulo_libro());
						
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
			consulta.setInt(1, ficha.getTipo_ficha().getId_tipo_ficha());  // No puede venir nulo, sino no se inserta
			consulta.setString(2, ficha.getUsuario().getId_usuario()); 		// No puede venir nulo, sino no se inserta
			consulta.setString(3, ficha.getCategoria());
			consulta.setString(4, ficha.getApellido());
			consulta.setString(5, ficha.getNombre());
			consulta.setInt(6, ficha.getTipo());
			consulta.setString(7, ficha.getApellido_otro());
			consulta.setString(8, ficha.getNombre_otro());
			consulta.setBoolean(9, ficha.isEt_al());
			consulta.setString(10, ficha.getTitulo());
			consulta.setString(11, ficha.getEdicion_de());
			consulta.setString(12, ficha.getTraduccion()); 		
			consulta.setString(13, ficha.getPrologo());
			consulta.setString(14, ficha.getEdicion());
			consulta.setString(15, ficha.getOtros_datos());
			consulta.setString(16, ficha.getEditorial());
			consulta.setString(17, ficha.getCiudad());
			consulta.setString(18, ficha.getAno());
			consulta.setString(19, ficha.getColeccion());
			consulta.setString(20, ficha.getPaginas());			
			consulta.setString(21, ficha.getBiblioteca());
			consulta.setString(22, ficha.getLocalizacion()); 		
			consulta.setString(23, ficha.getNotas());
			consulta.setString(24, ficha.getA());
			consulta.setString(25, ficha.getB());
			consulta.setString(26, ficha.getC());
			consulta.setString(27, ficha.getD());
			consulta.setString(28, ficha.getInstitucion());
			consulta.setString(29, ficha.getPagina_ini());
			consulta.setString(30, ficha.getPagina_fin());			
			consulta.setString(31, ficha.getRevista());
			consulta.setString(32, ficha.getTomo()); 		
			consulta.setString(33, ficha.getNumero());
			consulta.setString(34, ficha.getMes());
			consulta.setString(35, ficha.getSemana());
			consulta.setString(36, ficha.getApellido_editor());
			consulta.setString(37, ficha.getNombre_editor());
			consulta.setString(38, ficha.getApellido_editor_otro());
			consulta.setString(39, ficha.getNombre_editor_otro());
			consulta.setBoolean(40, ficha.isEt_al_editor());			
			consulta.setString(41, ficha.getPeriodico());
			consulta.setString(42, ficha.getSeccion()); 		
			consulta.setString(43, ficha.getDia());			
			consulta.setString(44, ficha.getUrl());
			consulta.setString(45, ficha.getPortal());
			consulta.setDate(46, ficha.getFecha_acceso());
			consulta.setDate(47, ficha.getFecha_publicacion());			
			consulta.setString(48, ficha.getEditor());
			consulta.setString(49, ficha.getTitulo_libro());
			consulta.setInt(50, ficha.getId_ficha());
			
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
			consulta.setInt(1, ficha.getId_ficha());
			return consulta.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally{
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
	}
	
	
	public ArrayList<Ficha> consultaFichasUsuario(String usuario){
	
		String sql = "Select f.id_ficha, f.id_tipo_ficha, f.id_usuario, f.categoria, f.apellido, f.nombre, f.tipo, f.apellido_otro, f.nombre_otro, f.et_al, f.titulo, f.edicion_de, f.traduccion, f.prologo, " +
				"f.edicion, f.otros_datos, f.editorial, f.ciudad, f.ano, f.coleccion, f.paginas, f.biblioteca, f.localizacion, f.notas, f.a, f.b, f.c, f.d, f.institucion, f.pagina_ini, f.pagina_fin, f.revista, " + 
				"f.tomo, f.numero, f.mes, f.semana, f.apellido_editor, f.nombre_editor, f.apellido_editor_otro, f.nombre_editor_otro, f.et_al_editor, f.periodico, f.seccion, f.dia, f.url, f.portal, " +  
				"f.fecha_acceso, f.fecha_publicacion, f.editor, f.titulo_libro, tf.nombre_tipo " +
				"from biblicon.ficha f, biblicon.tipoficha tf " +
				"where f.id_usuario in ('"+Constantes.USUARIODEFAULT+"', ?) and tf.id_usuario = f.id_usuario and tf.id_tipo_ficha = f.id_tipo_ficha";
				
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		ResultSet rs = null;
		ArrayList<Ficha> fichas = new ArrayList<Ficha>();
		
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setString(1, usuario);
			rs = consulta.executeQuery();
			while(rs.next())
				fichas.add(mapeoRsFicha(rs));
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally{
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
		return fichas;
	
	}
	
	public ArrayList<String> consultarCategoriasUsuario(String usuario){
	
		String sql = "select distinct(categoria) " +
				"from biblicon.ficha " +
				"where id_usuario in ('"+Constantes.USUARIODEFAULT+"', ?) order by categoria";
				
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		ResultSet rs = null;
		ArrayList<String> categorias = new ArrayList<String>();
		
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setString(1, usuario);
			 rs = consulta.executeQuery();
			while(rs.next())
				categorias.add(rs.getString(1));
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally{
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
		return categorias;
	
	}
	
	public ArrayList<Ficha> consultarFichasUsuarioCategoriaTipoFicha(String usuario, String categoria, Integer tipo_ficha, String busqueda){
	
		String sql = "Select f.id_ficha, f.id_tipo_ficha, f.id_usuario, f.categoria, f.apellido, f.nombre, f.tipo, f.apellido_otro, f.nombre_otro, f.et_al, f.titulo, f.edicion_de, f.traduccion, f.prologo, " +
				"f.edicion, f.otros_datos, f.editorial, f.ciudad, f.ano, f.coleccion, f.paginas, f.biblioteca, f.localizacion, f.notas, f.a, f.b, f.c, f.d, f.institucion, f.pagina_ini, f.pagina_fin, f.revista, " + 
				"f.tomo, f.numero, f.mes, f.semana, f.apellido_editor, f.nombre_editor, f.apellido_editor_otro, f.nombre_editor_otro, f.et_al_editor, f.periodico, f.seccion, f.dia, f.url, f.portal, " +  
				"f.fecha_acceso, f.fecha_publicacion, f.editor, f.titulo_libro, tf.nombre_tipo " +
				"from biblicon.ficha f, biblicon.tipoficha tf " +
				"where f.id_usuario in ('"+Constantes.USUARIODEFAULT+"', ?) " +
				"and (f.categoria = ? or f.id_tipo_ficha = ? or f.nombre like '%"+busqueda+"%' or f.apellido like '%"+busqueda+"%' or f.nombre_otro like '%"+busqueda+"%' or f.apellido_otro like '%"+busqueda+"%' or f.titulo like '%"+busqueda+"%') " +
				"and tf.id_usuario = f.id_usuario " +
				"and tf.id_tipo_ficha = f.id_tipo_ficha ";
				
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		ResultSet rs = null;
		ArrayList<Ficha> fichas = new ArrayList<Ficha>();
		
		try {
		
			consulta = conexion.prepareStatement(sql);
			consulta.setString(1, usuario);
			consulta.setString(2, categoria);
			consulta.setInt(3, tipo_ficha);
			
			rs = consulta.executeQuery();
			
			while(rs.next())
				fichas.add(mapeoRsFicha(rs));
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally{
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
		return fichas;
	}
	
	/*public ArrayList<Ficha> consultarFichasUsuarioBusqueda(String usuario, String busqueda){
	
		String sql = "Select f.id_ficha, f.id_tipo_ficha, f.id_usuario, f.categoria, f.apellido, f.nombre, f.tipo, f.apellido_otro, f.nombre_otro, f.et_al, f.titulo, f.edicion_de, f.traduccion, f.prologo, " +
				"f.edicion, f.otros_datos, f.editorial, f.ciudad, f.ano, f.coleccion, f.paginas, f.biblioteca, f.localizacion, f.notas, f.a, f.b, f.c, f.d, f.institucion, f.pagina_ini, f.pagina_fin, f.revista, " + 
				"f.tomo, f.numero, f.mes, f.semana, f.apellido_editor, f.nombre_editor, f.apellido_editor_otro, f.nombre_editor_otro, f.et_al_editor, f.periodico, f.seccion, f.dia, f.url, f.portal, " +  
				"f.fecha_acceso, f.fecha_publicacion, f.editor, f.titulo_libro, tf.nombre_tipo " +
				"from biblicon.ficha f, biblicon.tipoficha tf " +
				"where f.id_usuario in ('"+Constantes.USUARIODEFAULT+"', ?) " + 
				"and (f.nombre like '%"+busqueda+"%' or f.apellido like '%"+busqueda+"%' or f.nombre_otro like '%"+busqueda+"%' or f.apellido_otro like '%"+busqueda+"%' or f.titulo like '%"+busqueda+"%') " +
				"and tf.id_usuario = f.id_usuario " +
				"and tf.id_tipo_ficha = f.id_tipo_ficha ";
				
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		ResultSet rs = null;
		ArrayList<Ficha> fichas = new ArrayList<Ficha>();
		
		try {
		
			consulta = conexion.prepareStatement(sql);
			consulta.setString(1, usuario);
			
			rs = consulta.executeQuery();
			
			while(rs.next())
				fichas.add(mapeoRsFicha(rs));
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally{
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
		return fichas;
	}*/
	
	
	private Ficha mapeoRsFicha(ResultSet rs){
	
		Ficha ficha = new Ficha();
		try {
			
			ficha.setId_ficha(rs.getInt("id_ficha"));			
			ficha.getTipo_ficha().setId_tipo_ficha(rs.getInt("id_tipo_ficha")); 
			ficha.getTipo_ficha().setNombre_tipo(rs.getString("nombre_tipo"));			
			ficha.getUsuario().setId_usuario(rs.getString("id_usuario")); 		
			ficha.setCategoria(rs.getString("categoria"));
			ficha.setApellido(rs.getString("apellido"));
			ficha.setNombre(rs.getString("nombre"));
			ficha.setTipo(rs.getInt("tipo"));
			ficha.setApellido_otro(rs.getString("apellido_otro"));
			ficha.setNombre_otro(rs.getString("nombre_otro"));
			ficha.setEt_al(rs.getBoolean("et_al"));
			ficha.setTitulo(rs.getString("titulo"));
			ficha.setEdicion_de(rs.getString("edicion_de"));
			ficha.setTraduccion(rs.getString("traduccion")); 		
			ficha.setPrologo(rs.getString("prologo"));
			ficha.setEdicion(rs.getString("edicion"));
			ficha.setOtros_datos(rs.getString("otros_datos"));
			ficha.setEditorial(rs.getString("editorial"));
			ficha.setCiudad(rs.getString("ciudad"));
			ficha.setAno(rs.getString("ano"));
			ficha.setColeccion(rs.getString("coleccion"));
			ficha.setPaginas(rs.getString("paginas"));			
			ficha.setBiblioteca(rs.getString("biblioteca"));
			ficha.setLocalizacion(rs.getString("localizacion")); 		
			ficha.setNotas(rs.getString("notas"));
			ficha.setA(rs.getString("a"));
			ficha.setB(rs.getString("b"));
			ficha.setC(rs.getString("c"));
			ficha.setD(rs.getString("d"));
			ficha.setInstitucion(rs.getString("institucion"));
			ficha.setPagina_ini(rs.getString("pagina_ini"));
			ficha.setPagina_fin(rs.getString("pagina_fin"));			
			ficha.setRevista(rs.getString("revista"));
			ficha.setTomo(rs.getString("tomo")); 		
			ficha.setNumero(rs.getString("numero"));
			ficha.setMes(rs.getString("mes"));
			ficha.setSemana(rs.getString("semana"));
			ficha.setApellido_editor(rs.getString("apellido_editor"));
			ficha.setNombre_editor(rs.getString("nombre_editor"));
			ficha.setApellido_editor_otro(rs.getString("apellido_editor_otro"));
			ficha.setNombre_editor_otro(rs.getString("nombre_editor_otro"));
			ficha.setEt_al_editor(rs.getBoolean("et_al_editor"));			
			ficha.setPeriodico(rs.getString("periodico"));
			ficha.setSeccion(rs.getString("seccion")); 		
			ficha.setDia(rs.getString("dia"));			
			ficha.setUrl(rs.getString("url"));
			ficha.setPortal(rs.getString("portal"));
			ficha.setFecha_acceso(rs.getDate("fecha_acceso"));
			ficha.setFecha_publicacion(rs.getDate("fecha_publicacion"));			
			ficha.setEditor(rs.getString("editor"));
			ficha.setTitulo_libro(rs.getString("titulo_libro"));
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally{
			
		}
		return ficha;
		
	}
	
	public LinkedHashMap<String, String> llenarCampos(Ficha ficha){
		LinkedHashMap<String, String> campos = new LinkedHashMap<String, String>();
		campos.put(Constantes.a, ficha.getA());
		campos.put(Constantes.ano, ficha.getAno());
		campos.put(Constantes.apellido, ficha.getApellido());
		campos.put(Constantes.apellido_editor, ficha.getApellido_editor());
		campos.put(Constantes.apellido_editor_otro, ficha.getApellido_editor_otro());
		campos.put(Constantes.apellido_otro, ficha.getApellido_otro());
		campos.put(Constantes.b, ficha.getB());
		campos.put(Constantes.biblioteca, ficha.getBiblioteca());
		campos.put(Constantes.c, ficha.getC());
		campos.put(Constantes.ciudad, ficha.getCiudad());
		campos.put(Constantes.coleccion, ficha.getColeccion());
		campos.put(Constantes.d, ficha.getD());
		campos.put(Constantes.dia, ficha.getDia());
		campos.put(Constantes.edicion, ficha.getEdicion());
		campos.put(Constantes.edicion_de, ficha.getEdicion_de());
		campos.put(Constantes.editor, ficha.getEditor());
		campos.put(Constantes.editorial, ficha.getEditorial());
		campos.put(Constantes.et_al, ficha.isEt_al() ? "1" : "2" );
		campos.put(Constantes.et_al_editor, ficha.isEt_al_editor() ? "1" : "2");
		campos.put(Constantes.fecha_acceso, (ficha.getFecha_acceso() != null) ? ficha.getFecha_acceso().toString() : null);
		campos.put(Constantes.fecha_publicacion, (ficha.getFecha_publicacion() != null) ? ficha.getFecha_publicacion().toString() : null);
		campos.put(Constantes.institucion, ficha.getInstitucion());
		campos.put(Constantes.localizacion, ficha.getLocalizacion());
		campos.put(Constantes.mes, ficha.getMes());
		campos.put(Constantes.nombre, ficha.getNombre());
		campos.put(Constantes.nombre_editor, ficha.getNombre_editor());
		campos.put(Constantes.nombre_editor_otro, ficha.getNombre_editor_otro());
		campos.put(Constantes.nombre_otro, ficha.getNombre_otro());
		campos.put(Constantes.notas, ficha.getNotas());
		campos.put(Constantes.numero, ficha.getNumero());
		campos.put(Constantes.otros_datos, ficha.getOtros_datos());
		campos.put(Constantes.pagina_fin, ficha.getPagina_fin());
		campos.put(Constantes.pagina_ini, ficha.getPagina_ini());
		campos.put(Constantes.paginas, ficha.getPaginas());
		campos.put(Constantes.periodico, ficha.getPeriodico());
		campos.put(Constantes.portal, ficha.getPortal());
		campos.put(Constantes.prologo, ficha.getPrologo());
		campos.put(Constantes.revista, ficha.getRevista());
		campos.put(Constantes.seccion, ficha.getSeccion());
		campos.put(Constantes.semana, ficha.getSemana());
		campos.put(Constantes.titulo, ficha.getTitulo());
		campos.put(Constantes.titulo_libro, ficha.getTitulo_libro());
		campos.put(Constantes.tomo, ficha.getTomo());
		campos.put(Constantes.traduccion, ficha.getTraduccion());
		campos.put(Constantes.url, ficha.getUrl());		
		
		return campos;
	}
}