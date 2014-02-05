package com.biblicon.modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import java.sql.Statement;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;
import com.biblicon.modelo.bean.CampoTipoFicha;
import com.biblicon.modelo.bean.TipoFicha;
import com.biblicon.util.Conexion;


@Repository
public class CampoTipoFichaDAO {
	
	public int insertar(CampoTipoFicha campo){
		String sql = "insert into campotipoficha (nombre_campo, id_tipo_ficha) values (?, ?)";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		ResultSet rs = null;
		int id = 0;
		try {
			consulta = conexion.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			consulta.setString(1, campo.getNombre_campo());
			consulta.setInt(2, campo.getTipo_ficha().getId_tipo_ficha());
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
	
	public boolean  editar(CampoTipoFicha campo){
		String sql = "update campotipoficha set nombre_campo = ?, id_tipo_ficha = ? where id_campo = ?";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setString(1, campo.getNombre_campo());
			consulta.setInt(2, campo.getTipo_ficha().getId_tipo_ficha());
			consulta.setInt(3, campo.getId_campo());
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
	
	public boolean delete(CampoTipoFicha campo){
		String sql = "delete from campotipoficha where id_campo = ?";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setInt(1, campo.getId_campo());
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

	public ArrayList<CampoTipoFicha> consultarPorTipo(int i){
		ArrayList<CampoTipoFicha> lista = new ArrayList<CampoTipoFicha>();
		String sql = "select * from campotipoficha where id_tipo_ficha = ?";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		ResultSet rs = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setInt(1, i);
			rs = consulta.executeQuery();
			while(rs.next()){
				CampoTipoFicha campo = new CampoTipoFicha();
				campo.setId_campo(rs.getInt("id_campo"));
				campo.setNombre_campo(rs.getString("nombre_campo"));
				campo.setTipo_ficha(new TipoFicha());
				campo.getTipo_ficha().setId_tipo_ficha(i);;
				lista.add(campo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			Conexion.cerrarResultSet(rs);
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
		
		return lista;
	}

}
