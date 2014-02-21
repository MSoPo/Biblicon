package com.biblicon.modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.biblicon.modelo.bean.TipoFicha;
import com.biblicon.modelo.bean.Usuario;
import com.biblicon.util.Conexion;
import com.biblicon.util.Constantes;

@Repository
public class TipoFichaDAO {
	
	public int insertar(TipoFicha tipo){
		String sql = "insert into tipoficha (id_usuario, nombre_tipo) values (?, ?)";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		ResultSet rs = null;
		int id = 0;
		try {
			consulta = conexion.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			consulta.setString(1, tipo.getUsuario().getId_usuario());
			consulta.setString(2, tipo.getNombre_tipo());
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
	
	public boolean  editar(TipoFicha tipo){
		String sql = "update tipoficha set id_usuario = ?, nombre_tipo = ? where id_tipo_ficha = ?";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setString(1, tipo.getUsuario().getId_usuario());
			consulta.setString(2, tipo.getNombre_tipo());
			consulta.setInt(3, tipo.getId_tipo_ficha());
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
	
	public boolean delete(TipoFicha tipo){
		String sql = "delete from tipoficha where id_tipo_ficha = ?";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setInt(1, tipo.getId_tipo_ficha());
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
	
	public ArrayList<TipoFicha> consultarPorUsuario(String id_usuario){
		ArrayList<TipoFicha> lista = new ArrayList<TipoFicha>();
		String sql = "select * from tipoficha where id_usuario in ( ? , '" + Constantes.USUARIODEFAULT + "')";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		ResultSet rs = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setString(1, id_usuario);
			rs = consulta.executeQuery();
			TipoFicha tipo = null;
			Usuario us = null;
			while(rs.next()){
				tipo = new TipoFicha();
				tipo.setId_tipo_ficha(rs.getInt("id_tipo_ficha"));
				tipo.setNombre_tipo(rs.getString("nombre_tipo"));
				us = new Usuario();
				us.setId_usuario(id_usuario);
				tipo.setUsuario(us);
				lista.add(tipo);
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
	
	public ArrayList<TipoFicha> consultarPorUsuarioLogeado(String id_usuario){
		ArrayList<TipoFicha> lista = new ArrayList<TipoFicha>();
		String sql = "select * from tipoficha where id_usuario in ( ?)";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		ResultSet rs = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setString(1, id_usuario);
			rs = consulta.executeQuery();
			TipoFicha tipo = null;
			Usuario us = null;
			while(rs.next())
			{
				tipo = new TipoFicha();
				tipo.setId_tipo_ficha(rs.getInt("id_tipo_ficha"));
				tipo.setNombre_tipo(rs.getString("nombre_tipo"));
				us = new Usuario();
				us.setId_usuario(id_usuario);
				tipo.setUsuario(us);
				lista.add(tipo);
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
