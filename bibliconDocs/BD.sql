CREATE DATABASE biblicon CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE BIBLICON.USUARIO(
id_usuario varchar(20),
nombre varchar(30),
apellido_paterno varchar(30),
apellido_materno varchar(30),
contrasena varchar(50),
correo varchar(50),
status boolean,
PRIMARY KEY(id_usuario))ENGINE=INNODB;

CREATE TABLE BIBLICON.PLANTILLA(
id_plantilla INTEGER auto_increment,
nombre_plantilla varchar(50),
plantilla text,
id_usuario varchar(20),
PRIMARY KEY(id_plantilla),
INDEX  (id_usuario),
FOREIGN KEY (id_usuario)
    REFERENCES USUARIO(id_usuario)
	ON DELETE CASCADE)ENGINE=INNODB;

CREATE TABLE BIBLICON.TIPOFICHA(
id_tipo_ficha INTEGER auto_increment,
id_usuario varchar(20),
nombre_tipo varchar(30),
PRIMARY KEY(id_tipo_ficha),
INDEX  (id_usuario),
FOREIGN KEY (id_usuario)
    REFERENCES USUARIO(id_usuario)
	ON DELETE CASCADE)ENGINE=INNODB;

CREATE TABLE BIBLICON.FICHA(
id_ficha INTEGER auto_increment,
id_tipo_ficha INTEGER, 
id_usuario varchar(20),
categoria varchar(30),
apellido	varchar(50),
nombre	varchar(50),
tipo	int,
apellido_otro	varchar(50),
nombre_otro	varchar(50),
et_al	boolean,
titulo	varchar(50),
edicion_de	varchar(30),
traduccion	varchar(30),
prologo	varchar(30),
edicion	varchar(30),
otros_datos	varchar(50),
editorial	varchar(30),
ciudad	varchar(30),
ano	varchar(20),
coleccion	varchar(30),
paginas	varchar(20),
biblioteca	varchar(30),
localizacion	varchar(30),
notas	text,
a	varchar(50),
b	varchar(50),
c	varchar(50),
d	varchar(50),
institucion	varchar(30),
pagina_ini	varchar(20),
pagina_fin	varchar(20),
revista	varchar(30),
tomo	varchar(20),
numero	varchar(20),
mes	varchar(20),
semana	varchar(20),
apellido_editor	varchar(50),
nombre_editor	varchar(50),
apellido_editor_otro	varchar(50),
nombre_editor_otro	varchar(50),
et_al_editor	boolean,
periodico	varchar(30),
seccion	varchar(30),
dia	varchar(20),
url	varchar(50),
portal	varchar(50),
fecha_acceso	date,
fecha_publicacion	date,
editor	varchar(50),
titulo_libro	varchar(50),
PRIMARY KEY(id_ficha),
INDEX  (id_tipo_ficha),
FOREIGN KEY (id_tipo_ficha)
    REFERENCES TIPOFICHA(id_tipo_ficha)
	ON DELETE CASCADE,
INDEX  (id_usuario),
FOREIGN KEY (id_usuario)
    REFERENCES USUARIO(id_usuario)
	ON DELETE CASCADE)ENGINE=INNODB;

CREATE TABLE BIBLICON.USUARIOCOMPARTIDO(
id_ficha INTEGER,
id_usuario varchar(20),
PRIMARY KEY(id_ficha,id_usuario),
INDEX  (id_ficha),
FOREIGN KEY (id_ficha)
    REFERENCES FICHA(id_ficha)
	ON DELETE CASCADE,
INDEX  (id_usuario),
FOREIGN KEY (id_usuario)
    REFERENCES USUARIO(id_usuario)
	ON DELETE CASCADE);

CREATE TABLE BIBLICON.CAMPOTIPOFICHA(
id_campo INTEGER auto_increment,
id_tipo_ficha INTEGER,
nombre_campo varchar(50),
requerido varchar(1),
tipo_entrada varchar(40),
seccion varchar(40),
orden integer,
PRIMARY KEY(id_campo),
INDEX (id_tipo_ficha),
FOREIGN KEY (id_tipo_ficha)
	REFERENCES TIPOFICHA(id_tipo_ficha)
	ON DELETE CASCADE)ENGINE=INNODB;


CREATE TABLE BIBLICON.CONTENIDOFICHA(
id_contenido INTEGER auto_increment,
id_ficha INTEGER,
palabra_clave varchar(50),
tipo_contenido int,
contenido text,
paginas varchar(20),
notas text,
PRIMARY KEY(id_contenido),
INDEX (id_ficha),
FOREIGN KEY (id_ficha)	
    REFERENCES FICHA(id_ficha)
	ON DELETE CASCADE)ENGINE=INNODB;



