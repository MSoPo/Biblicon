package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import util.Conexion;
import modelo.bean.ContenidoFicha;

public class ContenidoFichaDAO {
	
	
	public int insertar(ContenidoFicha contenidoFicha){
		String sql = "insert into contenidoFicha (id_ficha,palabra_clave,tipo_contenido,contenido,paginas,notas) " +
				"values (?, ?, ?, ?, ?, ?)";
		
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		ResultSet rs = null;
		int id = 0;
		
		try {
			
			consulta = conexion.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			
			consulta.setInt(1, contenidoFicha.getFicha().getId_ficha());  // No puede venir nulo, sino no se inserta
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
			consulta.setInt(1, contenidoFicha.getFicha().getId_ficha());  // No puede venir nulo, sino no se inserta
			consulta.setString(2, contenidoFicha.getPalabra_clave()); 
			consulta.setInt(3, contenidoFicha.getTipo_contenido());
			consulta.setString(4, contenidoFicha.getContenido());
			consulta.setString(5, contenidoFicha.getPaginas());
			consulta.setString(6, contenidoFicha.getNotas());
			consulta.setInt(7, contenidoFicha.getId_contenido());
			
			return consulta.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally{
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
	}
	
	public boolean delete(ContenidoFicha contenidoFicha){
		String sql = "delete contenidoFicha where id_contenido = ?";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setInt(1, contenidoFicha.getId_contenido());
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
