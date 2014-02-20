package com.biblicon.modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.biblicon.modelo.bean.Ficha;
import com.biblicon.modelo.bean.Plantilla;
import com.biblicon.modelo.bean.Usuario;
import com.biblicon.util.Conexion;
import com.biblicon.util.Constantes;

@Repository
public class PlantillaDAO {
	
	public int insertar(Plantilla plantilla){
		String sql = "insert into plantilla (plantilla, id_usuario, nombre_plantilla) values (?, ?, ?)";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		ResultSet rs = null;
		int id = 0;
		try {
			consulta = conexion.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			consulta.setString(1, plantilla.getPlantilla());
			consulta.setString(2, plantilla.getUsuario().getId_usuario());
			consulta.setString(3, plantilla.getNombrePlantilla());
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
	
	public boolean  editar(Plantilla plantilla){
		String sql = "update plantilla set id_usuario = ?, plantilla = ?, nombre_plantilla = ? where id_plantilla = ?";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setString(1, plantilla.getUsuario().getId_usuario());
			consulta.setString(2, plantilla.getPlantilla());
			consulta.setInt(3, plantilla.getId_platilla());
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
	
	public boolean delete(Plantilla plantilla){
		String sql = "delete from plantilla where id_plantilla = ?";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setInt(1, plantilla.getId_platilla());
			return consulta.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally{
			Conexion.cerrarPreparedStatemen(consulta);
			Conexion.cerrarConexion(conexion);
		}
	}
	
	public ArrayList<Plantilla> consultarPorUsuario(String id_usuario){
		ArrayList<Plantilla> lista = new ArrayList<Plantilla>();
		String sql = "select * from plantilla where id_usuario in ( ? , '" + Constantes.USUARIODEFAULT + "')";
		Connection conexion = Conexion.ObtenerConexion();
		PreparedStatement consulta = null;
		ResultSet rs = null;
		try {
			consulta = conexion.prepareStatement(sql);
			consulta.setString(1, id_usuario);
			rs = consulta.executeQuery();
			while(rs.next()){
				Plantilla plantilla = new Plantilla();
				plantilla.setId_platilla(rs.getInt("id_plantilla"));
				plantilla.setNombrePlantilla(rs.getString("nombre_plantilla"));
				plantilla.setPlantilla(rs.getString("plantilla"));
				System.out.println(rs.getString("plantilla"));
				System.out.println(rs.getString("id_plantilla"));
				Usuario us = new Usuario();
				us.setId_usuario(id_usuario);
				plantilla.setUsuario(us);
				lista.add(plantilla);
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
