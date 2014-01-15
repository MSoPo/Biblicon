package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import modelo.bean.CampoTipoFicha;
import util.Conexion;

public class CompoTipoFichaDAO {
	
	public int insertar(CampoTipoFicha campo){
		String sql = "insert into campotipoficha (nombre_campo, id_tipo_ficha) values (?, ?)";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		ResultSet rs = null;
		int id = 0;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setString(0, campo.getNombre_campo());
			consulta.setInt(1, campo.getTipo_ficha().getId_tipo_ficha());
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
	
	public boolean  editar(CampoTipoFicha campo){
		String sql = "update campotipoficha set (nombre_campo = ?, id_tipo_ficha = ?) where id_campo = ?";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setString(0, campo.getNombre_campo());
			consulta.setInt(1, campo.getTipo_ficha().getId_tipo_ficha());
			consulta.setInt(2, campo.getId_campo());
			return consulta.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally{
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
	}
	
	public boolean delete(CampoTipoFicha campo){
		String sql = "delete campotipoficha where id_campo = ?";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setInt(0, campo.getId_campo());
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
