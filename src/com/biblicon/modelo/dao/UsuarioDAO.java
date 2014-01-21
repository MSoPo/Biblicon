package com.biblicon.modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;






import org.springframework.stereotype.Repository;

import com.biblicon.modelo.bean.Usuario;
import com.biblicon.util.Conexion;

@Repository
public class UsuarioDAO {
	
	public boolean insertar(Usuario usuario){
		String sql = "insert into usuario (id_usuario, nombre, apellido_paterno, apellido_materno, contrasena, correo ) values (?, ?, ?, ?, ?, ?)";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setString(1, usuario.getId_usuario());
			consulta.setString(2, usuario.getNombre());
			consulta.setString(3, usuario.getApellido_paterno());
			consulta.setString(4, usuario.getApellido_materno());
			consulta.setString(5, usuario.getContrasena());
			consulta.setString(6, usuario.getCorreo());
			return consulta.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally{
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
		
	}
	
	public boolean  editar(Usuario usuario){
		String sql = "update usuario set nombre = ?, apellido_paterno = ?, apellido_materno = ?, contrasena = ?, correo = ? where id_usuario = ?";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setString(1, usuario.getNombre());
			consulta.setString(2, usuario.getApellido_paterno());
			consulta.setString(3, usuario.getApellido_materno());
			consulta.setString(4, usuario.getContrasena());
			consulta.setString(5, usuario.getCorreo());
			consulta.setString(6, usuario.getId_usuario());
			return consulta.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally{
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
	}
	
	public boolean delete(Usuario usuario){
		String sql = "delete from usuario where id_usuario = ?";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setString(1, usuario.getId_usuario());
			return consulta.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally{
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
	}

	public Usuario consultarPorId(String id){
		Usuario us = null;
		String sql = "select * from usuario "
				+ "where id_usuario = ?";
		PreparedStatement consulta = null;
		ResultSet rs = null;
		Connection conexion = Conexion.ObtenerConexion();
		try{
			consulta = conexion.prepareStatement(sql);
			consulta.setString(1, id);
			rs = consulta.executeQuery();
			if(rs.next()){
				us = new Usuario();
				us.setId_usuario(id);
				us.setContrasena(rs.getString("contrasena"));
				us.setNombre(rs.getString("nombre"));
				us.setApellido_paterno(rs.getString("apellido_paterno"));
				us.setApellido_materno(rs.getString("apellido_materno"));
				us.setCorreo(rs.getString("correo"));
			}
		} catch(SQLException e){
			e.printStackTrace();
		}finally{
			Conexion.cerrarResultSet(rs);
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
		
		return us;
	}
	

}
