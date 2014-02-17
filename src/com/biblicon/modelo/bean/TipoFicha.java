package com.biblicon.modelo.bean;

public class TipoFicha {
	private int id_tipo_ficha;
	private String nombre_tipo;
	private Usuario usuario;
	
	public int getId_tipo_ficha() {
		return id_tipo_ficha;
	}
	public void setId_tipo_ficha(int id_tipo_ficha) {
		this.id_tipo_ficha = id_tipo_ficha;
	}
	public String getNombre_tipo() {
		return nombre_tipo;
	}
	public void setNombre_tipo(String nombre_tipo) {
		this.nombre_tipo = nombre_tipo;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
}
