--USUARIO
INSERT INTO biblicon.usuario (ID_USUARIO,NOMBRE,APELLIDO_PATERNO,APELLIDO_MATERNO,CONTRASENA,CORREO) VALUES('biblicon','biblicon','biblicon','biblicon',null,null);

--TIPO FICHA
INSERT INTO biblicon.tipoficha (ID_USUARIO,NOMBRE_TIPO) VALUES('biblicon','Libro');
INSERT INTO biblicon.tipoficha (ID_USUARIO,NOMBRE_TIPO) VALUES('biblicon','Tesis');
INSERT INTO biblicon.tipoficha (ID_USUARIO,NOMBRE_TIPO) VALUES('biblicon','Artículo Revista');
INSERT INTO biblicon.tipoficha (ID_USUARIO,NOMBRE_TIPO) VALUES('biblicon','Artículo Libro');
INSERT INTO biblicon.tipoficha (ID_USUARIO,NOMBRE_TIPO) VALUES('biblicon','Periódico');
INSERT INTO biblicon.tipoficha (ID_USUARIO,NOMBRE_TIPO) VALUES('biblicon','Artículo en Internet');
INSERT INTO biblicon.tipoficha (ID_USUARIO,NOMBRE_TIPO) VALUES('biblicon','Libro en Internet');

--CAMPO TIPO FICHA

--LIBRO
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Apellido(s)','1','varchar','autor',1);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Nombre(s)','1','varchar','autor',2);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Tipo','0','int','tipo',3);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Apellido(s)','0','varchar','otros',4);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Nombre(s)','0','varchar','otros',5);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'et al.','0','boolean','otros',6);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Título','1','varchar','edicion',7);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Edición de','0','varchar','edicion',8);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Traducción de','0','varchar','edicion',9);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Prólogo de','0','varchar','edicion',10);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Editorial','1','varchar','edicion',11);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Ciudad','1','varchar','edicion',11);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Año','1','varchar','edicion',12);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Edición','0','varchar','numedicion',13);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Otros datos','0','varchar','numedicion',14);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Colección','0','varchar','coleccion',15);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Págs.','0','varchar','paginas',16);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Biblioteca','0','varchar','ubicacion',17);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Localización','0','varchar','ubicacion',18);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Notas','0','text','notas',19);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'A','0','varchar','personales',20);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'B','0','varchar','personales',21);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'C','0','varchar','personales',22);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'D','0','varchar','personales',23);

--TESIS
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'Apellido(s)','1','varchar','autor',1);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'Nombre(s)','1','varchar','autor',2);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'Apellido(s)','0','varchar','otros',3);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'Nombre(s)','0','varchar','otros',4);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'et al.','0','boolean','otros',5);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'Título','1','varchar','edicion',6);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'Ciudad','1','varchar','edicion',7);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'Año','1','varchar','edicion',8);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'Págs.','1','','edicion',9);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'Institución','1','varchar','ubicacion',10);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'Biblioteca','0','varchar','ubicacion',11);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'Localización','0','varchar','ubicacion',12);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'Notas','0','text','notas',13);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'A','0','varchar','personales',14);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'B','0','varchar','personales',15);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'C','0','varchar','personales',16);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'D','0','varchar','personales',17);


-- ARTICULO REVISTA
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Apellido(s)','1','varchar','autor',1);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Nombre(s)','1','varchar','autor',2);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Apellido(s)','0','varchar','otros',3);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Nombre(s)','0','varchar','otros',4);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'et al.','0','boolean','otros',5);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Título','1','varchar','edicion',6);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Edición de','0','varchar','edicion',7);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Traducción de','0','varchar','edicion',8);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Ciudad','1','varchar','edicion',9);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Año','1','varchar','edicion',10);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Páginas de la','1','varchar','revista',11);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'a la','1','varchar','revista',12);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Revista','1','varchar','revista',13);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Tomo','1','varchar','revista',14);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Núm.','1','varchar','revista',15);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Mes','0','varchar','messemana',16);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Semana','0','varchar','messemana',17);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Biblioteca','0','varchar','ubicacion',18);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Localización','0','varchar','ubicacion',19);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Notas','0','text','notas',20);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'A','0','varchar','personales',21);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'B','0','varchar','personales',22);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'C','0','varchar','personales',23);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'D','0','varchar','personales',24);


--ARTICULO LIBRO
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Apellido(s)','1','varchar','autor',1);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Nombre(s)','1','varchar','autor',2);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Apellido(s)','0','varchar','otros',3);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Nombre(s)','0','varchar','otros',4);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'et al.','0','boolean','otros',5);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Título','1','varchar','edicion',6);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Editorial','1','varchar','edicion',7);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Ciudad','1','varchar','edicion',8);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Año','1','varchar','edicion',9);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Páginas de la','1','varchar','edicion',10);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'a la','1','varchar','edicion',11);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Traducción de','0','varchar','traduccion',12);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Biblioteca','0','varchar','ubicacion',13);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Localización','0','varchar','ubicacion',14);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Apellido(s)','1','varchar','editor',15);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Nombre(s)','1','varchar','editor',16);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Apellido(s)','0','varchar','editor',17);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Nombre(s)','0','varchar','editor',18);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'et al.','0','boolean','editor',19);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Título del libro','1','varchar','libro',20);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Notas','0','text','notas',21);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'A','0','varchar','personales',22);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'B','0','varchar','personales',23);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'C','0','varchar','personales',24);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'D','0','varchar','personales',25);

-- PERIODICO
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Apellido(s)','1','varchar','autor',1);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Nombre(s)','1','varchar','autor',2);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Apellido(s)','0','varchar','otros',3);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Nombre(s)','0','varchar','otros',4);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'et al.','0','boolean','otros',5);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Título','1','varchar','edicion',6);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Ciudad','1','varchar','edicion',7);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Año','1','varchar','edicion',8);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Traducción de','0','varchar','traduccion',9);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Biblioteca','0','varchar','ubicacion',10);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Localización','0','varchar','ubicacion',11);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Páginas de la','1','varchar','periodico',12);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'a la','1','varchar','periodico',13);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Tomo','1','varchar','periodico',14);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Núm.','1','varchar','periodico',15);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Mes','1','varchar','periodico',16);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Periódico','1','varchar','periodico',17);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Sección','1','varchar','periodico',18);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Día','1','varchar','periodico',19);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Notas','0','text','notas',20);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'A','0','varchar','personales',21);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'B','0','varchar','personales',22);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'C','0','varchar','personales',23);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'D','0','varchar','personales',24);


--ARTICULO INTERNET
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Apellido(s)','1','varchar','autor',1);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Nombre(s)','1','varchar','autor',2);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Apellido(s)','0','varchar','otros',3);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Nombre(s)','0','varchar','otros',4);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'et al.','0','boolean','otros',5);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Título','1','varchar','edicion',6);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Traducción de','0','varchar','traduccion',7);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Tomo','0','varchar','tomo',8);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Número','0','varchar','tomo',9);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Dirección WWW','1','varchar','articulo',10);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Portal','1','varchar','articulo',11);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Fecha de acceso','1','date','articulo',12);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Fecha de publicación','0','date','fecha',13);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Notas','0','text','notas',14);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'A','0','varchar','personales',15);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'B','0','varchar','personales',16);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'C','0','varchar','personales',17);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'D','0','varchar','personales',18);


--LIBRO EN INTERNET
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Apellido(s)','1','varchar','autor',1);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Nombre(s)','1','varchar','autor',2);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Apellido(s)','0','varchar','otros',3);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Nombre(s)','0','varchar','otros',4);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'et al.','0','boolean','otros',5);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Título','1','varchar','edicion',6);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Edición de','0','varchar','edicion',7);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Traducción de','0','varchar','edicion',8);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Prólogo de','0','varchar','edicion',9);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Edición','0','varchar','numedicion',10);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Otros datos','0','varchar','numedicion',11);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Editorial','0','varchar','editorial',12);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Ciudad','0','varchar','editorial',13);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Año','0','varchar','editorial',14);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Colección','0','varchar','coleccion',15);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Págs.','0','varchar','paginas',16);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Fecha de acceso','1','date','internet',17);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Dirección WWW','1','varchar','internet',18);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Editor u otro','0','varchar','editor',19);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Notas','0','text','notas',20);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'A','0','varchar','personales',21);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'B','0','varchar','personales',22);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'C','0','varchar','personales',23);
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'D','0','varchar','personales',24);



