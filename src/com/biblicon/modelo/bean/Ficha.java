package com.biblicon.modelo.bean;

import java.sql.Date;
import java.util.HashMap;

public class Ficha {
	
	private int id_ficha;
	private Usuario usuario;
	private TipoFicha tipo_ficha;
	private String categoria;
	private String apellido;
	private String nombre;
	private Integer tipo;
	private String apellido_otro;
	private String nombre_otro;
	private boolean et_al;
	private String titulo;
	private String edicion_de;
	private String traduccion;
	private String prologo;
	private String edicion;
	private String otros_datos;
	private String editorial;
	private String ciudad;
	private String ano;
	private String coleccion;
	private String paginas;
	private String biblioteca;
	private String localizacion;
	private String notas;
	private String a;
	private String b;
	private String c;
	private String d;
	private String institucion;
	private String pagina_ini;
	private String pagina_fin;
	private String revista;
	private String tomo;
	private String numero;
	private String mes;
	private String semana;
	private String apellido_editor;
	private String nombre_editor;
	private String apellido_editor_otro;
	private String nombre_editor_otro;
	private boolean et_al_editor;
	private String periodico;
	private String seccion;
	private String dia;
	private String url;
	private String portal;
	private Date fecha_acceso;
	private Date fecha_publicacion;
	private String editor;
	private String titulo_libro;
	private HashMap<String, String> campos;
	private Integer cantidadCompartida;
	private Integer cantidadContenido;
	
	
	public Ficha(){
		usuario = new Usuario();
		tipo_ficha = new TipoFicha();
	
	}
	
	
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
	
	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Integer getTipo() {
		return tipo;
	}

	public void setTipo(Integer tipo) {
		this.tipo = tipo;
	}

	public String getApellido_otro() {
		return apellido_otro;
	}

	public void setApellido_otro(String apellido_otro) {
		this.apellido_otro = apellido_otro;
	}

	public String getNombre_otro() {
		return nombre_otro;
	}

	public void setNombre_otro(String nombre_otro) {
		this.nombre_otro = nombre_otro;
	}

	public boolean isEt_al() {
		return et_al;
	}

	public void setEt_al(boolean et_al) {
		this.et_al = et_al;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getEdicion_de() {
		return edicion_de;
	}

	public void setEdicion_de(String edicion_de) {
		this.edicion_de = edicion_de;
	}

	public String getTraduccion() {
		return traduccion;
	}

	public void setTraduccion(String traduccion) {
		this.traduccion = traduccion;
	}

	public String getPrologo() {
		return prologo;
	}

	public void setPrologo(String prologo) {
		this.prologo = prologo;
	}

	public String getEdicion() {
		return edicion;
	}

	public void setEdicion(String edicion) {
		this.edicion = edicion;
	}

	public String getOtros_datos() {
		return otros_datos;
	}

	public void setOtros_datos(String otros_datos) {
		this.otros_datos = otros_datos;
	}

	public String getEditorial() {
		return editorial;
	}

	public void setEditorial(String editorial) {
		this.editorial = editorial;
	}

	public String getCiudad() {
		return ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}

	public String getAno() {
		return ano;
	}

	public void setAno(String ano) {
		this.ano = ano;
	}

	public String getColeccion() {
		return coleccion;
	}

	public void setColeccion(String coleccion) {
		this.coleccion = coleccion;
	}

	public String getPaginas() {
		return paginas;
	}

	public void setPaginas(String paginas) {
		this.paginas = paginas;
	}

	public String getBiblioteca() {
		return biblioteca;
	}

	public void setBiblioteca(String biblioteca) {
		this.biblioteca = biblioteca;
	}

	public String getLocalizacion() {
		return localizacion;
	}

	public void setLocalizacion(String localizacion) {
		this.localizacion = localizacion;
	}

	public String getNotas() {
		return notas;
	}

	public void setNotas(String notas) {
		this.notas = notas;
	}

	public String getA() {
		return a;
	}

	public void setA(String a) {
		this.a = a;
	}

	public String getB() {
		return b;
	}

	public void setB(String b) {
		this.b = b;
	}

	public String getC() {
		return c;
	}

	public void setC(String c) {
		this.c = c;
	}

	public String getD() {
		return d;
	}

	public void setD(String d) {
		this.d = d;
	}

	public String getInstitucion() {
		return institucion;
	}

	public void setInstitucion(String institucion) {
		this.institucion = institucion;
	}

	public String getPagina_ini() {
		return pagina_ini;
	}

	public void setPagina_ini(String pagina_ini) {
		this.pagina_ini = pagina_ini;
	}

	public String getPagina_fin() {
		return pagina_fin;
	}

	public void setPagina_fin(String pagina_fin) {
		this.pagina_fin = pagina_fin;
	}

	public String getRevista() {
		return revista;
	}

	public void setRevista(String revista) {
		this.revista = revista;
	}

	public String getTomo() {
		return tomo;
	}

	public void setTomo(String tomo) {
		this.tomo = tomo;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getMes() {
		return mes;
	}

	public void setMes(String mes) {
		this.mes = mes;
	}

	public String getSemana() {
		return semana;
	}

	public void setSemana(String semana) {
		this.semana = semana;
	}

	public String getApellido_editor() {
		return apellido_editor;
	}

	public void setApellido_editor(String apellido_editor) {
		this.apellido_editor = apellido_editor;
	}

	public String getNombre_editor() {
		return nombre_editor;
	}

	public void setNombre_editor(String nombre_editor) {
		this.nombre_editor = nombre_editor;
	}

	public String getApellido_editor_otro() {
		return apellido_editor_otro;
	}

	public void setApellido_editor_otro(String apellido_editor_otro) {
		this.apellido_editor_otro = apellido_editor_otro;
	}

	public String getNombre_editor_otro() {
		return nombre_editor_otro;
	}

	public void setNombre_editor_otro(String nombre_editor_otro) {
		this.nombre_editor_otro = nombre_editor_otro;
	}

	public boolean isEt_al_editor() {
		return et_al_editor;
	}

	public void setEt_al_editor(boolean et_al_editor) {
		this.et_al_editor = et_al_editor;
	}

	public String getPeriodico() {
		return periodico;
	}

	public void setPeriodico(String periodico) {
		this.periodico = periodico;
	}

	public String getSeccion() {
		return seccion;
	}

	public void setSeccion(String seccion) {
		this.seccion = seccion;
	}

	public String getDia() {
		return dia;
	}

	public void setDia(String dia) {
		this.dia = dia;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPortal() {
		return portal;
	}

	public void setPortal(String portal) {
		this.portal = portal;
	}

	public Date getFecha_acceso() {
		return fecha_acceso;
	}

	public void setFecha_acceso(Date fecha_acceso) {
		this.fecha_acceso = fecha_acceso;
	}

	public Date getFecha_publicacion() {
		return fecha_publicacion;
	}

	public void setFecha_publicacion(Date fecha_publicacion) {
		this.fecha_publicacion = fecha_publicacion;
	}

	public String getEditor() {
		return editor;
	}

	public void setEditor(String editor) {
		this.editor = editor;
	}

	public String getTitulo_libro() {
		return titulo_libro;
	}

	public void setTitulo_libro(String titulo_libro) {
		this.titulo_libro = titulo_libro;
	}

	public Integer getCantidadCompartida() {
		return cantidadCompartida;
	}


	public void setCantidadCompartida(Integer cantidadCompartida) {
		this.cantidadCompartida = cantidadCompartida;
	}


	public Integer getCantidadContenido() {
		return cantidadContenido;
	}


	public void setCantidadContenido(Integer cantidadContenido) {
		this.cantidadContenido = cantidadContenido;
	}


	public HashMap<String, String> getCampos() {
		return campos;
	}


	public void setCampos(HashMap<String, String> campos) {
		this.campos = campos;
	}
	
	

}
