package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import modelo.bean.TipoFicha;
import util.Conexion;

public class TipoFichaDAO {
	
	public int insertar(TipoFicha tipo){
		String sql = "insert into tipoficha (id_usuario, nomber_tipo) values (?, ?)";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		ResultSet rs = null;
		int id = 0;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setString(0, tipo.getUsuario().getId_usuario());
			consulta.setString(1, tipo.getNombre_tipo());
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
	
	public boolean  editar(TipoFicha tipo){
		String sql = "update tipoficha set (id_usuario = ?, nombre_tipo = ?) where id_tipo_ficha = ?";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setString(0, tipo.getUsuario().getId_usuario());
			consulta.setString(1, tipo.getNombre_tipo());
			consulta.setInt(2, tipo.getId_tipo_ficha());
			return consulta.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally{
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
	}
	
	public boolean delete(TipoFicha tipo){
		String sql = "delete tipoficha where id_tipo = ?";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setInt(0, tipo.getId_tipo_ficha());
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
