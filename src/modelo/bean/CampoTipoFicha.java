package modelo.bean;

public class CampoTipoFicha {
	private int id_campo;
	private TipoFicha tipo_ficha;
	private String nombre_campo;
	
	public int getId_campo() {
		return id_campo;
	}
	public void setId_campo(int id_campo) {
		this.id_campo = id_campo;
	}
	public TipoFicha getTipo_ficha() {
		return tipo_ficha;
	}
	public void setTipo_ficha(TipoFicha tipo_ficha) {
		this.tipo_ficha = tipo_ficha;
	}
	public String getNombre_campo() {
		return nombre_campo;
	}
	public void setNombre_campo(String nombre_campo) {
		this.nombre_campo = nombre_campo;
	}
}
