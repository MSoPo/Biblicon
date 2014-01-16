package modelo.bean;

public class Ficha {
	
	private int id_ficha;
	private Usuario usuario;
	private TipoFicha tipo_ficha;
	private String categoria;
	
	public int getId_ficha() {
		return id_ficha;
	}
	public void setId_ficha(int id_ficha) {
		this.id_ficha = id_ficha;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public TipoFicha getTipo_ficha() {
		return tipo_ficha;
	}
	public void setTipo_ficha(TipoFicha tipo_ficha) {
		this.tipo_ficha = tipo_ficha;
	}
	public String getCategoria() {
		return categoria;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	

}
