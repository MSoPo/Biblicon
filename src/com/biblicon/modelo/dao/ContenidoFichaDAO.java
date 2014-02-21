package com.biblicon.modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

import org.springframework.stereotype.Repository;

import com.biblicon.modelo.bean.ContenidoFicha;

import com.biblicon.util.Conexion;
import com.biblicon.util.Constantes;

@Repository
public class ContenidoFichaDAO {
	
	
	public int insertar(ContenidoFicha contenidoFicha){
		String sql = "insert into contenidoficha (id_ficha,palabra_clave,tipo_contenido,contenido,paginas,notas) " +
				"values (?, ?, ?, ?, ?, ?)";
		
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		ResultSet rs = null;
		int id = 0;
		
		try {
			
			consulta = conexion.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			consulta.setInt(1, contenidoFicha.getFicha().getId_ficha()); 			
			consulta.setString(2, contenidoFicha.getPalabra_clave()); 	
			consulta.setInt(3, contenidoFicha.getTipo_contenido());
			consulta.setString(4, contenidoFicha.getContenido());
			consulta.setString(5, contenidoFicha.getPaginas());
			consulta.setString(6, contenidoFicha.getNotas());			
						
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
	
	public boolean  editar(ContenidoFicha contenidoFicha){
		String sql = "update contenidoFicha set id_ficha = ?, palabra_clave = ?, tipo_contenido = ?, contenido = ?, paginas = ?, notas = ? " +
				"where id_contenido = ?";
		
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setInt(1, contenidoFicha.getFicha().getId_ficha());  
			consulta.setString(2, contenidoFicha.getPalabra_clave()); 
			consulta.setInt(3, contenidoFicha.getTipo_contenido());
			consulta.setString(4, contenidoFicha.getContenido());
			consulta.setString(5, contenidoFicha.getPaginas());
			consulta.setString(6, contenidoFicha.getNotas());
			consulta.setInt(7, contenidoFicha.getId_contenido());
			
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
	
	public boolean delete(ContenidoFicha contenidoFicha){
		String sql = "delete from contenidoFicha where id_contenido = ?";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setInt(1, contenidoFicha.getId_contenido());
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
	
	
	public Integer cantidadContenidoFicha(Integer id_ficha){
		String sql = "select count(id_contenido) from contenidoFicha where id_ficha = ?";
		
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		ResultSet rs = null;
		Integer cantidad = 0;
		
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setInt(1, id_ficha);  					
			 rs = consulta.executeQuery();
			 if(rs.next())
				 cantidad = rs.getInt(1);
			 
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
			
		}finally{
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
		return cantidad; 
	}
	
	public ArrayList<ContenidoFicha> consultarContenidoFicha(Integer id_ficha){
		
		String sql = "select id_contenido, id_ficha, palabra_clave, tipo_contenido, contenido, paginas, notas " +
				"from biblicon.contenidoFicha where id_ficha = ?";
		
		
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		ResultSet rs = null;
		ArrayList<ContenidoFicha> contenido = new ArrayList<ContenidoFicha>();
		
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setInt(1, id_ficha);  					
			 rs = consulta.executeQuery();
			 while(rs.next())
				 contenido.add(mapeoRsContenido(rs));
			 
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally{
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
		return contenido; 
	}
	
	
	public ArrayList<ContenidoFicha> consultarContenidoTipoBusqueda(String busqueda, String tipo){
		
		String sql = "select id_contenido, id_ficha, palabra_clave, tipo_contenido, contenido, paginas, notas " +
				"from biblicon.contenidoFicha " +
				"where tipo_contenido in ("+tipo+") and UPPER(palabra_clave) like UPPER('%"+busqueda+"%') ";
				
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		ResultSet rs = null;
		ArrayList<ContenidoFicha> contenido = new ArrayList<ContenidoFicha>();
		
		try {

			consulta = conexion.prepareStatement(sql);			
			
			rs = consulta.executeQuery();
			
			while(rs.next())
				contenido.add(mapeoRsContenido(rs));
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally{
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
		return contenido;
	}
	
	private ContenidoFicha mapeoRsContenido(ResultSet rs){
		
		ContenidoFicha contenido = new ContenidoFicha();
		try {
			
			contenido.setContenido(rs.getString("contenido"));
			contenido.setId_contenido(rs.getInt("id_contenido"));
			contenido.getFicha().setId_ficha(rs.getInt("id_ficha"));
			contenido.setNotas(rs.getString("notas"));
			contenido.setPaginas(rs.getString("paginas"));
			contenido.setPalabra_clave(rs.getString("palabra_clave"));
			contenido.setTipo_contenido(rs.getInt("tipo_contenido"));
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally{
			
		}
		return contenido;
	}
	
	public LinkedHashMap<String, String> llenarCampos(ContenidoFicha contenido,String referencia){
		
		LinkedHashMap<String, String> campos = new LinkedHashMap<String, String>();
		campos.put(Constantes.palabra_clave_cont, contenido.getPalabra_clave());
		campos.put(Constantes.tipo_cont, contenido.getTipo_contenido()==1?"Cita": contenido.getTipo_contenido()==2?"Resumen":  contenido.getTipo_contenido()==3?"Comentario":  contenido.getTipo_contenido()==4?"Comentario":"ERROR"); // TODO PONER CORRECTO EL TIPO
		campos.put(Constantes.contenido_cont, contenido.getContenido());
		campos.put(Constantes.referencia_cont, referencia);
		campos.put(Constantes.paginas_cont, contenido.getPaginas());
		campos.put(Constantes.notas_cont, contenido.getNotas());
		return campos;
		
	}
	
	public ContenidoFicha llenarContenidoFicha(HashMap<String,String> camposMap)throws ParseException{
		
		ContenidoFicha contenidoFicha = new ContenidoFicha();
				
		
		contenidoFicha.setContenido(camposMap.get(Constantes.contenido_cont));
		
		
		
		return contenidoFicha;
		
	}

		
	
}
