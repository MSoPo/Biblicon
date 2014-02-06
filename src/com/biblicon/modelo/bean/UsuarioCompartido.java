package com.biblicon.modelo.bean;

public class UsuarioCompartido {
	private Usuario usuario;
	private Ficha ficha;
	
	public UsuarioCompartido(){
		usuario = new Usuario();
		ficha = new Ficha();
	
	}
	
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public Ficha getFicha() {
		return ficha;
	}
	public void setFicha(Ficha ficha) {
		this.ficha = ficha;
	}

}
