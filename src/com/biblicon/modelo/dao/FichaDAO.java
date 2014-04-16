package com.biblicon.modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.biblicon.util.Conexion;
import com.biblicon.util.Constantes;
import com.biblicon.modelo.bean.CampoTipoFicha;
import com.biblicon.modelo.bean.Ficha;

@Repository
public class FichaDAO {
	
	@Autowired
	 private CampoTipoFichaDAO camposDAO;
	
	
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
			
			consulta.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally{
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
		return true;
	}
	
	public boolean delete(Ficha ficha){
		String sql = "delete from ficha where id_ficha = ?";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setInt(1, ficha.getId_ficha());
			consulta.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally{
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
		
		return true;
	}
	
	


	public Ficha consultaFicha(Integer idFicha){
		
		String sql = "select f.id_ficha, f.id_tipo_ficha, f.id_usuario, f.categoria, f.apellido, f.nombre, f.tipo, f.apellido_otro, f.nombre_otro, f.et_al, f.titulo, f.edicion_de, f.traduccion, f.prologo, " +
				"f.edicion, f.otros_datos, f.editorial, f.ciudad, f.ano, f.coleccion, f.paginas, f.biblioteca, f.localizacion, f.notas, f.a, f.b, f.c, f.d, f.institucion, f.pagina_ini, f.pagina_fin, f.revista, " + 
				"f.tomo, f.numero, f.mes, f.semana, f.apellido_editor, f.nombre_editor, f.apellido_editor_otro, f.nombre_editor_otro, f.et_al_editor, f.periodico, f.seccion, f.dia, f.url, f.portal, " +  
				"f.fecha_acceso, f.fecha_publicacion, f.editor, f.titulo_libro, tf.nombre_tipo " +
				"from biblicon.ficha f, biblicon.tipoficha tf " +
				"where f.id_ficha = ? and tf.id_tipo_ficha = f.id_tipo_ficha";
				
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		ResultSet rs = null;

		Ficha ficha = null;
		
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setInt(1, idFicha);
			rs = consulta.executeQuery();
			if(rs.next())
				ficha = mapeoRsFicha(rs);
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally{
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
		return ficha;
	
	}

	public ArrayList<Ficha> consultaFichasUsuario(String usuario){
	
		String sql = "select f.id_ficha, f.id_tipo_ficha, f.id_usuario, f.categoria, f.apellido, f.nombre, f.tipo, f.apellido_otro, f.nombre_otro, f.et_al, f.titulo, f.edicion_de, f.traduccion, f.prologo, " +
				"f.edicion, f.otros_datos, f.editorial, f.ciudad, f.ano, f.coleccion, f.paginas, f.biblioteca, f.localizacion, f.notas, f.a, f.b, f.c, f.d, f.institucion, f.pagina_ini, f.pagina_fin, f.revista, " + 
				"f.tomo, f.numero, f.mes, f.semana, f.apellido_editor, f.nombre_editor, f.apellido_editor_otro, f.nombre_editor_otro, f.et_al_editor, f.periodico, f.seccion, f.dia, f.url, f.portal, " +  
				"f.fecha_acceso, f.fecha_publicacion, f.editor, f.titulo_libro, tf.nombre_tipo " +
				"from biblicon.ficha f, biblicon.tipoficha tf " +
				"where f.id_usuario in ('"+Constantes.USUARIODEFAULT+"', ?) " +
				"and tf.id_usuario in ('"+Constantes.USUARIODEFAULT+"', f.id_usuario) " +
				"and tf.id_tipo_ficha = f.id_tipo_ficha";
				
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
				"where id_usuario in ('"+Constantes.USUARIODEFAULT+"', ?) and categoria is not null order by categoria";
				
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
	
	public ArrayList<Ficha> consultarFichasUsuarioCategoriaTipoFicha(String usuario, String categoria, String tipo_ficha, String busqueda){
	
		String sql = "select f.id_ficha, f.id_tipo_ficha, f.id_usuario, f.categoria, f.apellido, f.nombre, f.tipo, f.apellido_otro, f.nombre_otro, f.et_al, f.titulo, f.edicion_de, f.traduccion, f.prologo, " +
				"f.edicion, f.otros_datos, f.editorial, f.ciudad, f.ano, f.coleccion, f.paginas, f.biblioteca, f.localizacion, f.notas, f.a, f.b, f.c, f.d, f.institucion, f.pagina_ini, f.pagina_fin, f.revista, " + 
				"f.tomo, f.numero, f.mes, f.semana, f.apellido_editor, f.nombre_editor, f.apellido_editor_otro, f.nombre_editor_otro, f.et_al_editor, f.periodico, f.seccion, f.dia, f.url, f.portal, " +  
				"f.fecha_acceso, f.fecha_publicacion, f.editor, f.titulo_libro, tf.nombre_tipo " +
				"from biblicon.ficha f, biblicon.tipoficha tf " +
				"where f.id_usuario in ('"+Constantes.USUARIODEFAULT+"', ?) " +
				"and tf.id_usuario in ('"+Constantes.USUARIODEFAULT+"', f.id_usuario)"+
				"and (UPPER(f.nombre) like UPPER('%"+busqueda+"%') or UPPER(f.apellido) like UPPER('%"+busqueda+"%') or UPPER(f.nombre_otro) like UPPER('%"+busqueda+"%') or UPPER(f.apellido_otro) like UPPER('%"+busqueda+"%') or UPPER(f.titulo) like UPPER('%"+busqueda+"%')) " +
				"and tf.id_tipo_ficha = f.id_tipo_ficha ";
		
		if(categoria != "")
			sql += "and f.categoria in ("+categoria+")";
		if(tipo_ficha != "")
			sql += "and f.id_tipo_ficha in ("+tipo_ficha+") ";
		
		System.out.println(sql);
				
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
	
	public ArrayList<Ficha> consultaFichasCompartidasUsuario(String usuario){
		
		String sql = "select f.id_ficha, f.id_tipo_ficha, f.id_usuario, f.categoria, f.apellido, f.nombre, f.tipo, f.apellido_otro, f.nombre_otro, f.et_al, f.titulo, f.edicion_de, f.traduccion, f.prologo, " +
				"f.edicion, f.otros_datos, f.editorial, f.ciudad, f.ano, f.coleccion, f.paginas, f.biblioteca, f.localizacion, f.notas, f.a, f.b, f.c, f.d, f.institucion, f.pagina_ini, f.pagina_fin, f.revista, " + 
				"f.tomo, f.numero, f.mes, f.semana, f.apellido_editor, f.nombre_editor, f.apellido_editor_otro, f.nombre_editor_otro, f.et_al_editor, f.periodico, f.seccion, f.dia, f.url, f.portal, " +  
				"f.fecha_acceso, f.fecha_publicacion, f.editor, f.titulo_libro, tf.nombre_tipo " +
				"from biblicon.ficha f, biblicon.tipoficha tf  " +
				"where f.id_ficha in (SELECT id_ficha FROM biblicon.usuariocompartido where id_usuario = ? )" +
				"and f.id_tipo_ficha = tf.id_tipo_ficha ";
				
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
	
	public ArrayList<CampoTipoFicha> llenarCampos(Ficha ficha){
		ArrayList<CampoTipoFicha> campos = camposDAO.consultarPorTipo(ficha.getTipo_ficha().getId_tipo_ficha());
		for(CampoTipoFicha c : campos){
			SimpleDateFormat dateFormat = new SimpleDateFormat(Constantes.formato_fecha);
			if(c.getNombre_campo().equals(Constantes.apellido_otro)) c.setValor(ficha.getApellido_otro());
			else if(c.getNombre_campo().equals(Constantes.b)) c.setValor(ficha.getB());
			else if(c.getNombre_campo().equals(Constantes.biblioteca)) c.setValor(ficha.getBiblioteca());
			else if(c.getNombre_campo().equals(Constantes.c)) c.setValor(ficha.getC());
			else if(c.getNombre_campo().equals(Constantes.ciudad)) c.setValor(ficha.getCiudad());
			else if(c.getNombre_campo().equals(Constantes.coleccion)) c.setValor(ficha.getColeccion());
			else if(c.getNombre_campo().equals(Constantes.d)) c.setValor(ficha.getD());
			else if(c.getNombre_campo().equals(Constantes.dia)) c.setValor(ficha.getDia());
			else if(c.getNombre_campo().equals(Constantes.edicion)) c.setValor(ficha.getEdicion());
			else if(c.getNombre_campo().equals(Constantes.edicion_de)) c.setValor(ficha.getEdicion_de());
			else if(c.getNombre_campo().equals(Constantes.editor)) c.setValor(ficha.getEditor());
			else if(c.getNombre_campo().equals(Constantes.editorial)) c.setValor(ficha.getEditorial());
			else if(c.getNombre_campo().equals(Constantes.et_al)) c.setValor(ficha.isEt_al() ? "Si" : "No");
			else if(c.getNombre_campo().equals(Constantes.et_al_editor)) c.setValor(ficha.isEt_al_editor() ? "Si" : "No");
			else if(c.getNombre_campo().equals(Constantes.fecha_acceso)) c.setValor(dateFormat.format(ficha.getFecha_acceso()));
			else if(c.getNombre_campo().equals(Constantes.fecha_publicacion)) c.setValor(dateFormat.format(ficha.getFecha_publicacion()));
			else if(c.getNombre_campo().equals(Constantes.institucion)) c.setValor(ficha.getInstitucion());
			else if(c.getNombre_campo().equals(Constantes.localizacion)) c.setValor(ficha.getLocalizacion());
			else if(c.getNombre_campo().equals(Constantes.mes)) c.setValor(ficha.getMes());
			else if(c.getNombre_campo().equals(Constantes.nombre)) c.setValor(ficha.getNombre());
			else if(c.getNombre_campo().equals(Constantes.nombre_editor)) c.setValor(ficha.getNombre_editor());
			else if(c.getNombre_campo().equals(Constantes.nombre_editor_otro)) c.setValor(ficha.getNombre_editor_otro());
			else if(c.getNombre_campo().equals(Constantes.nombre_otro)) c.setValor(ficha.getNombre_otro());
			else if(c.getNombre_campo().equals(Constantes.notas)) c.setValor(ficha.getNotas());
			else if(c.getNombre_campo().equals(Constantes.numero)) c.setValor(ficha.getNumero());
			else if(c.getNombre_campo().equals(Constantes.otros_datos)) c.setValor(ficha.getOtros_datos());
			else if(c.getNombre_campo().equals(Constantes.pagina_fin)) c.setValor(ficha.getPagina_fin());
			else if(c.getNombre_campo().equals(Constantes.pagina_ini)) c.setValor(ficha.getPagina_ini());
			else if(c.getNombre_campo().equals(Constantes.paginas)) c.setValor(ficha.getPaginas());
			else if(c.getNombre_campo().equals(Constantes.periodico)) c.setValor(ficha.getPeriodico());
			else if(c.getNombre_campo().equals(Constantes.portal)) c.setValor(ficha.getPortal());
			else if(c.getNombre_campo().equals(Constantes.prologo)) c.setValor(ficha.getPrologo());
			else if(c.getNombre_campo().equals(Constantes.revista)) c.setValor(ficha.getRevista());
			else if(c.getNombre_campo().equals(Constantes.seccion)) c.setValor(ficha.getSeccion());
			else if(c.getNombre_campo().equals(Constantes.semana)) c.setValor(ficha.getSemana());
			else if(c.getNombre_campo().equals(Constantes.titulo)) c.setValor(ficha.getTitulo());
			else if(c.getNombre_campo().equals(Constantes.titulo_libro)) c.setValor(ficha.getTitulo_libro());
			else if(c.getNombre_campo().equals(Constantes.tomo)) c.setValor(ficha.getTomo());
			else if(c.getNombre_campo().equals(Constantes.traduccion)) c.setValor(ficha.getTraduccion());
			else if(c.getNombre_campo().equals(Constantes.url)) c.setValor(ficha.getUrl());
			else if(c.getNombre_campo().equals(Constantes.a)) c.setValor(ficha.getA());
			else if(c.getNombre_campo().equals(Constantes.ano)) c.setValor(ficha.getAno());
			else if(c.getNombre_campo().equals(Constantes.apellido)) c.setValor(ficha.getApellido());
			else if(c.getNombre_campo().equals(Constantes.apellido_editor)) c.setValor(ficha.getApellido_editor());
			else if(c.getNombre_campo().equals(Constantes.apellido_editor_otro)) c.setValor(ficha.getApellido_editor_otro());
			else if(c.getNombre_campo().equals(Constantes.tipo)) c.setValor(ficha.getTipo() == 1 ? "(ed.)" : ficha.getTipo() == 2 ? "(coord.)" : ficha.getTipo() == 3 ? "(comp.)" : ficha.getTipo() == 4 ? "(dir.)" : "(.)");
			
		}
		
		return campos;
	}
	
	
	public Ficha llenarFicha(HashMap<String,String> camposMap)throws ParseException{
		
		Ficha ficha = new Ficha();
				
		SimpleDateFormat sdf = new SimpleDateFormat(Constantes.formato_fecha); 
		
		ficha.setA(camposMap.get(Constantes.a));
		ficha.setAno(camposMap.get(Constantes.ano));
		ficha.setApellido(camposMap.get(Constantes.apellido));
		ficha.setApellido_editor(camposMap.get(Constantes.apellido_editor));
		ficha.setApellido_editor_otro(camposMap.get(Constantes.apellido_editor_otro));
		ficha.setApellido_otro(camposMap.get(Constantes.apellido_otro));		
		ficha.setB(camposMap.get(Constantes.b));
		ficha.setBiblioteca(camposMap.get(Constantes.biblioteca));		
		ficha.setC(camposMap.get(Constantes.c));
		ficha.setCategoria(camposMap.get(Constantes.categoria));
		ficha.setCiudad(camposMap.get(Constantes.ciudad));
		ficha.setColeccion(camposMap.get(Constantes.coleccion));
		ficha.setD(camposMap.get(Constantes.d));
		ficha.setDia(camposMap.get(Constantes.dia));
		ficha.setEdicion(camposMap.get(Constantes.edicion));
		ficha.setEdicion_de(camposMap.get(Constantes.edicion_de));
		ficha.setEditor(camposMap.get(Constantes.editor));
		ficha.setEditorial(camposMap.get(Constantes.editorial));
		
		if(camposMap.get(Constantes.et_al) != null)		
			ficha.setEt_al(camposMap.get(Constantes.et_al).equals("1")?true:false);
		else		
			ficha.setEt_al(false);
				
		if(camposMap.get(Constantes.et_al_editor) != null)
			ficha.setEt_al_editor(camposMap.get(Constantes.et_al_editor).equals("1")?true:false);
		else
			ficha.setEt_al_editor(false);
		
		
		if(camposMap.get(Constantes.fecha_acceso)!=null)
		{
			java.util.Date date1 = sdf.parse(camposMap.get(Constantes.fecha_acceso));
			ficha.setFecha_acceso(new java.sql.Date(date1.getTime()));
		}
		
		if(camposMap.get(Constantes.fecha_publicacion)!=null){
			java.util.Date date2 = sdf.parse(camposMap.get(Constantes.fecha_publicacion));
			ficha.setFecha_publicacion(new java.sql.Date(date2.getTime()));
		}
		
		ficha.setInstitucion(camposMap.get(Constantes.institucion));		
		ficha.setLocalizacion(camposMap.get(Constantes.localizacion));
		ficha.setMes(camposMap.get(Constantes.mes));
		ficha.setNombre(camposMap.get(Constantes.nombre));
		ficha.setNombre_editor(camposMap.get(Constantes.nombre_editor));
		ficha.setNombre_editor_otro(camposMap.get(Constantes.nombre_editor_otro));
		ficha.setNombre_otro(camposMap.get(Constantes.nombre_otro));
		ficha.setNotas(camposMap.get(Constantes.notas));		
		ficha.setNumero(camposMap.get(Constantes.numero));		
		ficha.setOtros_datos(camposMap.get(Constantes.otros_datos));		
		ficha.setPagina_fin(camposMap.get(Constantes.pagina_fin));
		ficha.setPagina_ini(camposMap.get(Constantes.pagina_ini));
		ficha.setPaginas(camposMap.get(Constantes.paginas));
		ficha.setPeriodico(camposMap.get(Constantes.periodico));
		ficha.setPortal(camposMap.get(Constantes.portal));
		ficha.setPrologo(camposMap.get(Constantes.prologo));
		ficha.setRevista(camposMap.get(Constantes.revista));		
		ficha.setSeccion(camposMap.get(Constantes.seccion));
		ficha.setSemana(camposMap.get(Constantes.semana));		
		
		if(camposMap.get(Constantes.tipo) != null)
			ficha.setTipo(Integer.parseInt(camposMap.get(Constantes.tipo)));
		else
			ficha.setTipo(0);
		
		if(camposMap.get(Constantes.tipo_ficha)!=null)		
			ficha.getTipo_ficha().setId_tipo_ficha(Integer.parseInt(camposMap.get(Constantes.tipo_ficha)));
		else
			ficha.getTipo_ficha().setId_tipo_ficha(1);
			
		ficha.setTitulo(camposMap.get(Constantes.titulo));
		ficha.setTitulo_libro(camposMap.get(Constantes.titulo_libro));
		ficha.setTomo(camposMap.get(Constantes.tomo));
		ficha.setTraduccion(camposMap.get(Constantes.traduccion));		
		ficha.setUrl(camposMap.get(Constantes.url));
		ficha.getUsuario().setId_usuario(camposMap.get(Constantes.usuario));
		
		return ficha;
		
	}
}