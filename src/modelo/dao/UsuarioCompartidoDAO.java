package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import modelo.bean.UsuarioCompartido;
import util.Conexion;

public class UsuarioCompartidoDAO {
	
	public int insertar(UsuarioCompartido usuariocompartido){
		String sql = "insert into usuariocompartido (id_usuario, id_ficha) values (?, ?)";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		ResultSet rs = null;
		int id = 0;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setString(0, usuariocompartido.getUsuario().getId_usuario());
			consulta.setInt(1, usuariocompartido.getFicha().getId_ficha());
			consulta.execute();
			rs = consulta.getGeneratedKeys();
			
			while(rs.next())
				id = rs.getInt(0);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
		
		return id;
		
	}
	
	public boolean delete(UsuarioCompartido usuariocompartido){
		String sql = "delete usuariocompartido where id_usuario = ? and id_ficha = ?";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setString(0, usuariocompartido.getUsuario().getId_usuario());
			consulta.setInt(1, usuariocompartido.getFicha().getId_ficha());
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
