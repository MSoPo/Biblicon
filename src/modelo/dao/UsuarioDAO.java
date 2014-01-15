package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import modelo.bean.Usuario;
import util.Conexion;

public class UsuarioDAO {
	
	public boolean insertar(Usuario usuario){
		String sql = "insert into usuario (id_usuario, nombre, apellido_paterno, apellido_materno, contrasena, correo ) values (?, ?, ?, ?, ?, ?)";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setString(0, usuario.getId_usuario());
			consulta.setString(1, usuario.getNombre());
			consulta.setString(2, usuario.getApellido_paterno());
			consulta.setString(3, usuario.getContrasena());
			consulta.setString(4, usuario.getCorreo());
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
		String sql = "update usuario set (nombre = ?, apellido_paterno = ?, apellido_materno = ?, contrasena = ?, correo = ?) where id_usuario = ?";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setString(0, usuario.getNombre());
			consulta.setString(1, usuario.getApellido_paterno());
			consulta.setString(2, usuario.getContrasena());
			consulta.setString(3, usuario.getCorreo());
			consulta.setString(4, usuario.getId_usuario());
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
		String sql = "delete usuario where id_usuario = ?";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setString(0, usuario.getId_usuario());
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
