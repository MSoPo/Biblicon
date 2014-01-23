package com.biblicon.modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.springframework.stereotype.Repository;

import com.biblicon.modelo.bean.UsuarioCompartido;
import com.biblicon.util.Conexion;

@Repository
public class UsuarioCompartidoDAO {
	
	public int insertar(UsuarioCompartido usuariocompartido){
		String sql = "insert into usuariocompartido (id_usuario, id_ficha) values (?, ?)";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		ResultSet rs = null;
		int id = 0;
		try {
			consulta = conexion.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			consulta.setString(1, usuariocompartido.getUsuario().getId_usuario());
			consulta.setInt(2, usuariocompartido.getFicha().getId_ficha());
			consulta.execute();
			rs = consulta.getGeneratedKeys();
			
			while(rs.next())
				id = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			Conexion.cerrarResultSet(rs);
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
		
		return id;
		
	}
	
	public boolean delete(UsuarioCompartido usuariocompartido){
		String sql = "delete from usuariocompartido where id_usuario = ? and id_ficha = ?";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setString(1, usuariocompartido.getUsuario().getId_usuario());
			consulta.setInt(2, usuariocompartido.getFicha().getId_ficha());
			return consulta.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally{
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
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


}
