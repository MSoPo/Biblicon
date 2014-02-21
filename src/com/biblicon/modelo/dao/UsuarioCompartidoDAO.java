package com.biblicon.modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.biblicon.modelo.bean.UsuarioCompartido;
import com.biblicon.util.Conexion;

@Repository
public class UsuarioCompartidoDAO {
	
	public boolean insertar(UsuarioCompartido usuariocompartido){
		String sql = "insert into usuariocompartido (id_usuario, id_ficha) values (?, ?)";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		ResultSet rs = null;		
		try {
			consulta = conexion.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			consulta.setString(1, usuariocompartido.getUsuario().getId_usuario());
			consulta.setInt(2, usuariocompartido.getFicha().getId_ficha());
			consulta.execute();
									
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally{
			Conexion.cerrarResultSet(rs);
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
		
		return true;
		
	}
	
	public boolean delete(UsuarioCompartido usuariocompartido){
		String sql = "delete from usuariocompartido where id_usuario = ? and id_ficha = ?";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setString(1, usuariocompartido.getUsuario().getId_usuario());
			consulta.setInt(2, usuariocompartido.getFicha().getId_ficha());
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
	
	
	public Integer cantidadFichaCompartida(Integer id_ficha){
		
		String sql = "select count(id_usuario) from usuariocompartido where id_ficha = ?";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		Integer cantidad = 0;
		ResultSet rs = null;
		
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
	
	public ArrayList<UsuarioCompartido> consultarUsuariosFicha(Integer id_ficha){
		
		String sql = "select a.id_ficha, b.id_usuario, b.nombre, b.apellido_paterno, b.apellido_materno " +
				"from biblicon.usuariocompartido a, biblicon.usuario b " +
				"where id_ficha = ? and a.id_usuario=b.id_usuario ";
		
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;		
		ResultSet rs = null;
		
		ArrayList<UsuarioCompartido> usuariosCompartido = new ArrayList<UsuarioCompartido>();
		
		try {
			consulta = conexion.prepareStatement(sql);			
			consulta.setInt(1, id_ficha);
			rs = consulta.executeQuery();
			UsuarioCompartido usuarioCompartido = null;
			while(rs.next()){
				usuarioCompartido = new UsuarioCompartido();
				usuarioCompartido.getFicha().setId_ficha(rs.getInt("id_ficha"));
				usuarioCompartido.getUsuario().setId_usuario(rs.getString("id_usuario"));
				usuarioCompartido.getUsuario().setNombre(rs.getString("nombre"));
				usuarioCompartido.getUsuario().setApellido_paterno(rs.getString("apellido_paterno"));
				usuarioCompartido.getUsuario().setApellido_materno(rs.getString("apellido_materno"));
				
				usuariosCompartido.add(usuarioCompartido);
			}
				
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally{
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
		return usuariosCompartido;
	}

}
