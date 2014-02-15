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
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Apellido(s)','1','varchar','autor');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Nombre(s)','1','varchar','autor');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Tipo','0','int','tipo');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Apellido(s)','0','varchar','otros');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Nombre(s)','0','varchar','otros');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'et al.','0','boolean','otros');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Título','1','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Edición de','0','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Traducción de','0','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Prólogo de','0','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Edición','0','varchar','numedicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Otros datos','0','varchar','numedicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Editorial','1','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Ciudad','1','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Año','1','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Colección','0','varchar','coleccion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Págs.','0','varchar','paginas');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Biblioteca','0','varchar','ubicacion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Localización','0','varchar','ubicacion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'Notas','0','text','notas');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'A','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'B','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'C','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (1,'D','0','varchar','personales');

--TESIS
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'Apellido(s)','1','varchar','autor');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'Nombre(s)','1','varchar','autor');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'Apellido(s)','0','varchar','otros');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'Nombre(s)','0','varchar','otros');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'et al.','0','boolean','otros');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'Título','1','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'Ciudad','1','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'Año','1','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'Págs.','1','','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'Biblioteca','0','varchar','ubicacion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'Localización','0','varchar','ubicacion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'Notas','0','text','notas');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'A','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'B','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'C','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'D','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (2,'Institución','1','varchar','edicion');

-- ARTICULO REVISTA
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Apellido(s)','1','varchar','autor');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Nombre(s)','1','varchar','autor');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Apellido(s)','0','varchar','otros');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Nombre(s)','0','varchar','otros');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'et al.','0','boolean','otros');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Título','1','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Edición de','0','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Traducción de','0','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Ciudad','1','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Año','1','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Biblioteca','0','varchar','ubicacion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Localización','0','varchar','ubicacion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Notas','0','text','notas');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'A','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'B','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'C','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'D','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Páginas de la','1','varchar','revista');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'a la','1','varchar','revista');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Revista','1','varchar','revista');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Tomo','1','varchar','revista');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Núm.','1','varchar','revista');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Mes','0','varchar','messemana');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (3,'Semana','0','varchar','messemana');

--ARTICULO LIBRO
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Apellido(s)','1','varchar','autor');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Nombre(s)','1','varchar','autor');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Apellido(s)','0','varchar','otros');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Nombre(s)','0','varchar','otros');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'et al.','0','boolean','otros');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Título','1','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Traducción de','0','varchar','traduccion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Editorial','1','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Ciudad','1','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Año','1','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Biblioteca','0','varchar','ubicacion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Localización','0','varchar','ubicacion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Notas','0','text','notas');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'A','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'B','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'C','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'D','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Páginas de la','1','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'a la','1','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Apellido(s)','1','varchar','editor');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Nombre(s)','1','varchar','editor');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Apellido(s)','0','varchar','editor');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Nombre(s)','0','varchar','editor');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'et al.','0','boolean','editor');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (4,'Título del libro','1','varchar','libro');

-- PERIODICO
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Apellido(s)','1','varchar','autor');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Nombre(s)','1','varchar','autor');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Apellido(s)','0','varchar','otros');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Nombre(s)','0','varchar','otros');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'et al.','0','boolean','otros');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Título','1','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Traducción de','0','varchar','traduccion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Ciudad','1','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Año','1','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Biblioteca','0','varchar','ubicacion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Localización','0','varchar','ubicacion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Notas','0','text','notas');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'A','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'B','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'C','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'D','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Páginas de la','1','varchar','periodico');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'a la','1','varchar','periodico');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Tomo','1','varchar','periodico');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Núm.','1','varchar','periodico');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Mes','1','varchar','periodico');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Periódico','1','varchar','periodico');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Sección','1','varchar','periodico');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (5,'Día','1','varchar','periodico');

--ARTICULO INTERNET
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Apellido(s)','1','varchar','autor');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Nombre(s)','1','varchar','autor');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Apellido(s)','0','varchar','otros');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Nombre(s)','0','varchar','otros');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'et al.','0','boolean','otros');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Título','1','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Traducción de','0','varchar','traduccion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Notas','0','text','notas');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'A','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'B','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'C','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'D','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Tomo','0','varchar','tomo');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Número','0','varchar','tomo');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Dirección WWW','1','varchar','articulo');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Portal','1','varchar','articulo');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Fecha de acceso','1','date','articulo');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (6,'Fecha de publicación','0','date','fecha');

--LIBRO EN INTERNET
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Apellido(s)','1','varchar','autor');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Nombre(s)','1','varchar','autor');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Apellido(s)','0','varchar','otros');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Nombre(s)','0','varchar','otros');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'et al.','0','boolean','otros');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Título','1','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Edición de','0','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Traducción de','0','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Prólogo de','0','varchar','edicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Edición','0','varchar','numedicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Otros datos','0','varchar','numedicion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Editorial','0','varchar','editorial');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Ciudad','0','varchar','editorial');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Año','0','varchar','editorial');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Colección','0','varchar','coleccion');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Págs.','0','varchar','paginas');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Fecha de acceso','1','date','internet');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Notas','0','text','notas');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'A','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'B','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'C','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'D','0','varchar','personales');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Dirección WWW','1','varchar','internet');
INSERT INTO biblicon.campotipoficha (ID_TIPO_FICHA,NOMBRE_CAMPO,REQUERIDO,TIPO_ENTRADA,SECCION) VALUES (7,'Editor u otro','0','varchar','editor');

