package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import modelo.bean.Plantilla;
import util.Conexion;

public class PlantillaDAO {
	
	public int insertar(Plantilla plantilla){
		String sql = "insert into plantilla (plantilla, id_usuario) values (?, ?)";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		ResultSet rs = null;
		int id = 0;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setString(0, plantilla.getPlantilla());
			consulta.setString(1, plantilla.getUsuario().getId_usuario());
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
	
	public boolean  editar(Plantilla plantilla){
		String sql = "update plantilla set (id_usuario = ?, plantilla = ?) where id_plantilla = ?";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setString(0, plantilla.getUsuario().getId_usuario());
			consulta.setString(1, plantilla.getPlantilla());
			consulta.setInt(2, plantilla.getId_platilla());
			return consulta.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally{
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
	}
	
	public boolean delete(Plantilla plantilla){
		String sql = "delete plantilla where id_plantilla = ?";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setInt(0, plantilla.getId_platilla());
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
