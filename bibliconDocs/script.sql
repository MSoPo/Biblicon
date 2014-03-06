-- USUARIO
INSERT INTO biblicon.usuario (ID_USUARIO,NOMBRE,APELLIDO_PATERNO,APELLIDO_MATERNO,CONTRASENA,CORREO) VALUES('biblicon','biblicon','biblicon','biblicon',null,null);

-- TIPO FICHA
INSERT INTO biblicon.tipoficha (ID_USUARIO,NOMBRE_TIPO) VALUES('biblicon','Libro');
INSERT INTO biblicon.tipoficha (ID_USUARIO,NOMBRE_TIPO) VALUES('biblicon','Tesis');
INSERT INTO biblicon.tipoficha (ID_USUARIO,NOMBRE_TIPO) VALUES('biblicon','Artículo Revista');
INSERT INTO biblicon.tipoficha (ID_USUARIO,NOMBRE_TIPO) VALUES('biblicon','Artículo Libro');
INSERT INTO biblicon.tipoficha (ID_USUARIO,NOMBRE_TIPO) VALUES('biblicon','Periódico');
INSERT INTO biblicon.tipoficha (ID_USUARIO,NOMBRE_TIPO) VALUES('biblicon','Artículo en Internet');
INSERT INTO biblicon.tipoficha (ID_USUARIO,NOMBRE_TIPO) VALUES('biblicon','Libro en Internet');

-- CAMPO TIPO FICHA

-- LIBRO
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (1,'apellido','1','varchar','Autor',1);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (1,'nombre','1','varchar','Autor',2);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (1,'tipo','0','int','Tipo',3);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (1,'apellido_otro','0','varchar','Otros',4);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (1,'nombre_otro','0','varchar','Otros',5);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (1,'et_al','0','boolean','Otros',6);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (1,'titulo','1','varchar','Edición',7);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (1,'edicion_de','0','varchar','Edición',8);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (1,'traduccion','0','varchar','Edición',9);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (1,'prologo','0','varchar','Edición',10);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (1,'editorial','1','varchar','Edición',11);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (1,'ciudad','1','varchar','Edición',11);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (1,'ano','1','varchar','Edición',12);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (1,'edicion','0','varchar','Edición',13);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (1,'otros_datos','0','varchar','Edición',14);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (1,'coleccion','0','varchar','Colección',15);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (1,'paginas','0','varchar','Páginas',16);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (1,'biblioteca','0','varchar','Ubicación',17);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (1,'localizacion','0','varchar','Ubicación',18);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (1,'notas','0','text','Notas',19);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (1,'a','0','varchar','Personales',20);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (1,'b','0','varchar','Personales',21);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (1,'c','0','varchar','Personales',22);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (1,'d','0','varchar','Personales',23);

-- TESIS
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (2,'apellido','1','varchar','Autor',1);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (2,'nombre','1','varchar','Autor',2);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (2,'apellido_otro','0','varchar','Otros',3);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (2,'nombre_otro','0','varchar','Otros',4);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (2,'et_al','0','boolean','Otros',5);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (2,'titulo','1','varchar','Edición',6);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (2,'ciudad','1','varchar','Edición',7);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (2,'ano','1','varchar','Edición',8);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (2,'paginas','1','','Edición',9);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (2,'institucion','1','varchar','Ubicación',10);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (2,'biblioteca','0','varchar','Ubicación',11);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (2,'localizacion','0','varchar','Ubicación',12);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (2,'notas','0','text','Notas',13);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (2,'a','0','varchar','Personales',14);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (2,'b','0','varchar','Personales',15);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (2,'c','0','varchar','Personales',16);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (2,'d','0','varchar','Personales',17);


-- ARTICULO REVISTA
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (3,'apellido','1','varchar','Autor',1);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (3,'nombre','1','varchar','Autor',2);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (3,'apellido_otro','0','varchar','Otros',3);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (3,'nombre_otro','0','varchar','Otros',4);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (3,'et_al','0','boolean','Otros',5);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (3,'titulo','1','varchar','Edición',6);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (3,'edicion_de','0','varchar','Edición',7);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (3,'traduccion','0','varchar','Edición',8);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (3,'ciudad','1','varchar','Edición',9);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (3,'ano','1','varchar','Edición',10);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (3,'pagina_ini','1','varchar','Revista',11);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (3,'pagina_fin','1','varchar','Revista',12);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (3,'revista','1','varchar','Revista',13);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (3,'tomo','1','varchar','Revista',14);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (3,'numero','1','varchar','Revista',15);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (3,'mes','0','varchar','Mes, semana',16);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (3,'semana','0','varchar','Mes, semana',17);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (3,'biblioteca','0','varchar','Ubicación',18);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (3,'localizacion','0','varchar','Ubicación',19);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (3,'notas','0','text','Notas',20);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (3,'a','0','varchar','Personales',21);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (3,'b','0','varchar','Personales',22);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (3,'c','0','varchar','Personales',23);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (3,'d','0','varchar','Personales',24);


-- ARTICULO LIBRO
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (4,'apellido','1','varchar','Autor',1);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (4,'nombre','1','varchar','Autor',2);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (4,'apellido_otro','0','varchar','Otros',3);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (4,'nombre_otro','0','varchar','Otros',4);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (4,'et_al','0','boolean','Otros',5);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (4,'titulo','1','varchar','Edición',6);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (4,'editorial','1','varchar','Edición',7);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (4,'ciudad','1','varchar','Edición',8);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (4,'ano','1','varchar','Edición',9);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (4,'pagina_ini','1','varchar','Edición',10);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (4,'pagina_fin','1','varchar','Edición',11);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (4,'traduccion','0','varchar','Traducción',12);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (4,'biblioteca','0','varchar','Ubicación',13);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (4,'localizacion','0','varchar','Ubicación',14);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (4,'apellido_editor','1','varchar','Editor',15);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (4,'nombre_editor','1','varchar','Editor',16);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (4,'apellido_editor_otro','0','varchar','Editor',17);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (4,'nombre_editor_otro','0','varchar','Editor',18);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (4,'et_al_editor','0','boolean','Editor',19);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (4,'titulo_libro','1','varchar','Libro',20);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (4,'notas','0','text','Notas',21);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (4,'a','0','varchar','Personales',22);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (4,'b','0','varchar','Personales',23);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (4,'c','0','varchar','Personales',24);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (4,'d','0','varchar','Personales',25);

-- PERIODICO
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (5,'apellido','1','varchar','Autor',1);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (5,'nombre','1','varchar','Autor',2);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (5,'apellido_otro','0','varchar','Otros',3);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (5,'nombre_otro','0','varchar','Otros',4);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (5,'et_al','0','boolean','Otros',5);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (5,'titulo','1','varchar','Edición',6);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (5,'ciudad','1','varchar','Edición',7);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (5,'ano','1','varchar','Edición',8);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (5,'traduccion','0','varchar','Traducción',9);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (5,'biblioteca','0','varchar','Ubicación',10);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (5,'localizacion','0','varchar','Ubicación',11);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (5,'pagina_ini','1','varchar','Periódico',12);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (5,'pagina_fin','1','varchar','Periódico',13);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (5,'tomo','1','varchar','Periódico',14);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (5,'numero','1','varchar','Periódico',15);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (5,'mes','1','varchar','Periódico',16);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (5,'periodico','1','varchar','Periódico',17);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (5,'seccion, ORDEN','1','varchar','Periódico',18);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (5,'dia','1','varchar','Periódico',19);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (5,'notas','0','text','Notas',20);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (5,'a','0','varchar','Personales',21);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (5,'b','0','varchar','Personales',22);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (5,'c','0','varchar','Personales',23);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (5,'d','0','varchar','Personales',24);


-- ARTICULO INTERNET
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (6,'apellido','1','varchar','Autor',1);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (6,'nombre','1','varchar','Autor',2);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (6,'apellido_otro','0','varchar','Otros',3);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (6,'nombre_otro','0','varchar','Otros',4);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (6,'et_al','0','boolean','Otros',5);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (6,'titulo','1','varchar','Edición',6);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (6,'traduccion','0','varchar','Traducción',7);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (6,'tomo','0','varchar','Tomo',8);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (6,'numero','0','varchar','Tomo',9);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (6,'url','1','varchar','Artículo',10);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (6,'portal','1','varchar','Artículo',11);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (6,'fecha_acceso','1','date','Artículo',12);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (6,'fecha_publicacion','0','date','Fecha Publicación',13);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (6,'notas','0','text','Notas',14);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (6,'a','0','varchar','Personales',15);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (6,'b','0','varchar','Personales',16);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (6,'c','0','varchar','Personales',17);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (6,'d','0','varchar','Personales',18);


-- LIBRO EN INTERNET
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (7,'apellido','1','varchar','Autor',1);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (7,'nombre','1','varchar','Autor',2);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (7,'apellido_otro','0','varchar','Otros',3);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (7,'nombre_otro','0','varchar','Otros',4);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (7,'et_al','0','boolean','Otros',5);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (7,'titulo','1','varchar','Edición',6);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (7,'edicion_de','0','varchar','Edición',7);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (7,'traduccion','0','varchar','Edición',8);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (7,'prologo','0','varchar','Edición',9);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (7,'edicion','0','varchar','Edición',10);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (7,'otros_datos','0','varchar','Edición',11);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (7,'editorial','0','varchar','Editorial',12);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (7,'ciudad','0','varchar','Editorial',13);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (7,'ano','0','varchar','Editorial',14);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (7,'coleccion','0','varchar','Colección',15);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (7,'paginas','0','varchar','Páginas',16);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (7,'fecha_acceso','1','date','Internet',17);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (7,'url','1','varchar','Internet',18);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (7,'editor','0','varchar','Editor',19);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (7,'notas','0','text','Notas',20);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (7,'a','0','varchar','Personales',21);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (7,'b','0','varchar','Personales',22);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (7,'c','0','varchar','Personales',23);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION, ORDEN) VALUES (7,'d','0','varchar','Personales',24);



