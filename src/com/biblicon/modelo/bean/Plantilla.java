package com.biblicon.modelo.bean;

public class Plantilla {
	
	private int id_platilla;
	private String plantilla;
	private Usuario usuario;
	private String nombrePlantilla;
	
	public int getId_platilla() {
		return id_platilla;
	}
	public void setId_platilla(int id_platilla) {
		this.id_platilla = id_platilla;
	}
	public String getPlantilla() {
		return plantilla;
	}
	public void setPlantilla(String plantilla) {
		this.plantilla = plantilla;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public String getNombrePlantilla() {
		return nombrePlantilla;
	}
	public void setNombrePlantilla(String nombrePlantilla) {
		this.nombrePlantilla = nombrePlantilla;
	}

}
