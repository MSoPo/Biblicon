package com.biblicon.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Conexion {
	
	@SuppressWarnings("finally")
	public static Connection ObtenerConexion(){
		 Connection conexion=null;
	      
	        try
	        {
	            Class.forName("com.mysql.jdbc.Driver");
	            String servidor = "jdbc:mysql://localhost:3306/biblicon";
	            String usuarioDB="root";
	            String passwordDB="admin";
	            conexion= DriverManager.getConnection(servidor,usuarioDB,passwordDB);
	        }
	        catch(ClassNotFoundException ex)
	        {
	        	conexion=null;
	            throw ex;
	        }
	        catch(SQLException ex)
	        {
	        	conexion=null;
	        	throw ex;
	        	
	        }
	        catch(Exception ex)
	        {
	        	conexion=null;
	        	throw ex;
	        	
	        }
	        finally
	        {
	            return conexion;
	        }
	}
	
	public static void cerrarConexion(Connection conexion){
		if(conexion != null){
			try{
				conexion.close();
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
	}
	
	public static void cerrarPreparedStatemen(PreparedStatement ps){
		if(ps != null){
			try{
				ps.close();
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
	}
	
	public static void cerrarResultSet(ResultSet rs){
		if(rs != null){
			try{
				rs.close();
			}catch(Exception ex){
				ex.printStackTrace();
			}
	}
	}

}
