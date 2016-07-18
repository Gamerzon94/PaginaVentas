/* Proyecto Final
   Integrantes: Matias Valdes / Adrian Gomez
   Taller de Programacion II Seccion I
*/
drop table replica;
drop table post;
drop table venta;
drop table usuario;
drop table cargo;
drop table preguntaSecreta;
drop table tipoCliente;
drop table pais;
drop table producto;
drop table marca;
drop table categoria;
drop table mensaje;


create table tipoCliente(
	idTCliente bigint constraint PK_tipoCliente primary key 
	   generated always as identity,
	tipoClie varchar(50),
	fechaRegistro timestamp default CURRENT_TIMESTAMP
);

create table cargo (
	idCargo bigint constraint PK_Cargo primary key 
	   generated always as identity,
	nomCargo varchar(50),
	redireccion varchar(50),
	fechaRegistro timestamp default CURRENT_TIMESTAMP
);

create table pais(
	idPais bigint constraint PK_Pais primary key 
	   generated always as identity,
	nomPais varchar(50),
	fechaRegistro timestamp default CURRENT_TIMESTAMP
);

create table preguntaSecreta (
	idPSecreta bigint constraint PK_PreguntaSecreta primary key 
	   generated always as identity,
	pregunta varchar(50),
	fechaRegistro timestamp default CURRENT_TIMESTAMP
);

create table usuario (
	idUsuario bigint constraint PK_Usuario primary key 
	   generated always as identity,
	nombre varchar(50),
	apellido varchar(50),
	contrasena varchar(50),
	email varchar(50),
	RUN varchar(10),
	fono bigint,
	fechaNacimiento date,
	direccion varchar(50),
	idPais bigint,
	comuna varchar(50),
	ciudad varchar(50),
	idCargo bigint,
	idTipoCliente bigint,
	idPreguntaSecreta bigint,
	respuestaSecreta varchar(50),
	estaActivo char(1),
	fechaRegistro timestamp default CURRENT_TIMESTAMP
);

create table post (
	idPost bigint constraint PK_Post primary key 
	   generated always as identity,
	titulo varchar(50),
	idAutor bigint,
	fechaRegistro timestamp default CURRENT_TIMESTAMP
);

create table replica (
	idReplica bigint constraint PK_Replica primary key 
	   generated always as identity,  
	contenido varchar(1500),
	idPost bigint,
	idUReplica bigint,
	fechaRegistro timestamp default CURRENT_TIMESTAMP
);

create table producto (
	idProducto bigint constraint PK_producto primary key
		generated always as identity,
	idMarca bigint,
	idCategoria bigint,	
	Nombre_producto varchar(100),
	Stock bigint,
	precio bigint,
	Descripcion varchar(10000),
	imagen varchar(10000),
	fechaRegistro timestamp default CURRENT_TIMESTAMP
);

create table Marca(
	idMarca bigint constraint PK_Marca primary key
		generated always as identity,
	Nombre_marca varchar (100),
        fechaRegistro timestamp default CURRENT_TIMESTAMP
);

create table Categoria(
	idCategoria bigint constraint PK_Categoria primary key
		generated always as identity,
	Nombre_Categoria varchar (100),
        fechaRegistro timestamp default CURRENT_TIMESTAMP
);

create table Venta(
	idVenta bigint constraint PK_Venta primary key generated always as identity,
	idUsuario bigint,
	productos varchar(10000),
	cantidad varchar(10000),
	precioPro varchar(10000),
	totalVenta bigint,
	estado char(1),
	idVendedor bigint,
	fechaRegistro timestamp default CURRENT_TIMESTAMP
);

create table Mensaje(
	idMensaje bigint constraint PK_Mensaje primary key generated always as identity,
	titulo varchar(1000),
	mensaje varchar(10000),
	nombre varchar(100),
	telefono bigint,
	email varchar(50),
	fechaRegistro timestamp default CURRENT_TIMESTAMP
);

alter table inacap.usuario add foreign key (idCargo) references inacap.cargo(idCargo);
alter table inacap.usuario add foreign key (idPais) references inacap.pais(idPais);
alter table inacap.usuario add foreign key (idPreguntaSecreta) references inacap.preguntaSecreta(idPSecreta);
alter table inacap.usuario add foreign key (idTipoCliente) references inacap.tipoCliente(idTCliente);
alter table inacap.post    add foreign key (idAutor) references inacap.usuario(idUsuario);
alter table inacap.replica add foreign key (idPost) references inacap.post(idPost);
alter table inacap.replica add foreign key (idUReplica) references inacap.usuario(idUsuario);
alter table inacap.producto add foreign key (idMarca) references inacap.MARCA(idMarca);
alter table inacap.producto add foreign key (idCategoria) references inacap.Categoria(idCategoria);
alter table inacap.venta add foreign key (idUsuario) references inacap.usuario(idUsuario);
alter table inacap.venta add foreign key (idVendedor) references inacap.usuario(idUsuario);

insert into inacap.tipoCliente (tipoClie) values ('Persona');
insert into inacap.tipoCliente (tipoClie) values ('Empresa');
insert into inacap.cargo (nomCargo, redireccion) values ('Administrador','../index.jsp');
insert into inacap.cargo (nomCargo, redireccion) values ('Editor','../index.jsp');
insert into inacap.cargo (nomCargo, redireccion) values ('Vendedor','../index.jsp');
insert into inacap.cargo (nomCargo, redireccion) values ('Cliente','../index.jsp');
insert into inacap.pais (nomPais) values ('Chile');
insert into inacap.pais (nomPais) values ('Peru');
insert into inacap.pais (nomPais) values ('Argentina');
insert into inacap.preguntaSecreta (pregunta) values ('Lugar de nacimiento de la madre.');
insert into inacap.preguntaSecreta (pregunta) values ('Primera mascota.');
insert into inacap.preguntaSecreta (pregunta) values ('Nombre abuela/o.');
insert into inacap.preguntaSecreta (pregunta) values ('Canción preferida');
insert into inacap.usuario (nombre, apellido, contrasena, email, run, fono, fechaNacimiento, direccion, idPais, comuna, ciudad, idCargo, idTipoCliente, idPreguntaSecreta, estaActivo,respuestaSecreta) values ('nomAdmin','apeAdmin','123456','admin@admin.com','12345678-9', 12345678,'01/01/2000','Santa Ana 654',1,'Comuna1','Ciudad1',1,1,2,'s','Perro');
insert into inacap.usuario (nombre, apellido, contrasena, email, run, fono, fechaNacimiento, direccion, idPais, comuna, ciudad, idCargo, idTipoCliente, idPreguntaSecreta, estaActivo,respuestaSecreta) values ('nomEditor1','apeEditor1','123456','editor@editor.com','98765432-1',12345678,'01/01/2000','San Felipe 456',2,'Comuna2','Ciudad2',2,1,2,'s','Perro');
insert into inacap.usuario (nombre, apellido, contrasena, email, run, fono, fechaNacimiento, direccion, idPais, comuna, ciudad, idCargo, idTipoCliente, idPreguntaSecreta, estaActivo,respuestaSecreta) values ('nomVendedor1','apeVendedor1','123456','vendedor@vendedor.com','1111111-1',12345678,'01/01/2000','San Clemente 321',3,'Comuna3','Ciudad3',3,1,2,'s','Perro');
insert into inacap.usuario (nombre, apellido, contrasena, email, run, fono, fechaNacimiento, direccion, idPais, comuna, ciudad, idCargo, idTipoCliente, idPreguntaSecreta, estaActivo,respuestaSecreta) values ('nomCliente1','apeCliente1','123456','cliente@cliente.com','2222222-2',12345678,'01/01/2000','San Guchito 123',1,'Comuna4','Ciudad4',4,2,2,'s','Perro');
insert into inacap.usuario (nombre, apellido, contrasena, email, run, fono, fechaNacimiento, direccion, idPais, comuna, ciudad, idCargo, idTipoCliente, idPreguntaSecreta, estaActivo,respuestaSecreta) values ('SIN DETERMINAR','VENDEDOR','123456','v@v.com','00-0',12345678,'01/01/2000','San Guchito 123',1,'Comuna4','Ciudad4',4,2,2,'s','Perro');
INSERT INTO POST (TITULO, IDAUTOR) VALUES ('Primer Post',1);
INSERT INTO POST (TITULO, IDAUTOR) VALUES ('Segundo Post',3);
INSERT INTO replica (contenido, idPost, idUReplica) VALUES ('Este es mi primer post',1,1);
INSERT INTO replica (contenido, idPost, idUReplica) VALUES ('Este es mi primer comentario',1,1);
INSERT INTO replica (contenido, idPost, idUReplica) VALUES ('Este es mi primer post',2,2);
INSERT INTO replica (contenido, idPost, idUReplica) VALUES ('Este es mi segundo comentario',2,1);
INSERT INTO replica (contenido, idPost, idUReplica) VALUES ('Este es mi primer comentario',2,2);
insert into Marca (Nombre_marca) values ('Intel');
insert into Marca (Nombre_marca) values ('AMD');
insert into Marca (Nombre_marca) values ('Corsair');
insert into Marca (Nombre_marca) values ('Kingston');
insert into Marca (Nombre_marca) values ('Crusial');
insert into Marca (Nombre_marca) values ('Asus');
insert into Marca (Nombre_marca) values ('Sapphire');
insert into Marca (Nombre_marca) values ('Gigabyte');
insert into Marca (Nombre_marca) values ('MSI');
insert into Marca (Nombre_marca) values ('EVGA');
insert into Marca (Nombre_marca) values ('Zotac');
insert into Marca (Nombre_marca) values ('Toshiba');
insert into Marca (Nombre_marca) values ('WD');
insert into Marca (Nombre_marca) values ('Seagate');
insert into Marca (nombre_marca) values ('CoolerMaster');
insert into Categoria (Nombre_Categoria) values ('Procesador');
insert into Categoria (Nombre_Categoria) values ('Targeta de Video');
insert into Categoria (Nombre_Categoria) values ('Discos Duros');
insert into Categoria (Nombre_Categoria) values ('Memorias Ram');
insert into Categoria (Nombre_Categoria) values ('Placas Madres');
insert into Categoria (Nombre_Categoria) values ('Fuentes de Poder');
insert into producto (idMarca,idCategoria, Nombre_producto, Stock, precio, Descripcion, imagen ) values (1,1,'Intel® CPU Core i7-4790 3.6 GHz (1150)',40,98900,'Ya está aqui la sucesora de Ivy Bridge, los nuevos Haswell traen manofactura de 22 nm, transistores Try-Gate, Pipeline de 14 fases, y soporte nativo Dual Channel DDR3. La nueva Línea Haswell está diseñada para mejorar la eficiencia energética y obtener un mejor rendimiento que la generación anterior. ','../img/catalogo/intel.jpg');
insert into producto (idMarca,idCategoria, Nombre_producto, Stock, precio, Descripcion, imagen ) values (2,1,'AMD® APU A6 7400K 3.5 GHz / Radeon R5 (FM2+)',30,70990,'Elije AMD para obtener la unidad de procesamiento acelerado (APU) en tu próximo proyecto de PC. Los procesadores de la serie A de AMD combinan CPU de dual-core o quad-core y gráficas AMD Radeon ™ en un solo chip de bajo consumo de energía.','../img/catalogo/amd.jpg');
insert into producto (idMarca,idCategoria, Nombre_producto, Stock, precio, Descripcion, imagen ) values (2,2,'AMD Radeon R9 380 4GB GDDR5 STRIX GAMING',40,98900,'La AMD Radeon R9 380 4GB tiene ahora la última memoria GDDR5 y funciona con una velocidad de reloj de núcleo de 1010 MHz. La serie R9 380 se basa en una excelente arquitectura, que está diseñada para proporcionar un rendimiento de gráficos de nivel entusiasta para entregar una gran experiencia de juego. ','../img/catalogo/AMDRadeonR93804GBGDDR5STRIXGAMING.jpg');
insert into producto (idMarca,idCategoria, Nombre_producto, Stock, precio, Descripcion, imagen ) values (3,3,'Seagate® Disco Duro 2TB Sata3 7200 rpm 64MB',40, 69990,'Disco Duro Seagate Sata3 2TB 7200rpm Una misma unidad para todas las necesidades de sobremesa, con el respaldo de 30 años de rendimiento, fiabilidad y simplicidad garantizados. ','../img/catalogo/DiscoDuro.jpg');
insert into producto (idMarca,idCategoria, Nombre_producto, Stock, precio, Descripcion, imagen ) values (4,4,'Kingston® DDR3 16GB 1866MHz (2x 8GB) PC3-14900 Fury Black',15, 129990,'DDR3 16GB (2x 8GB) 1866Mhz PC3-14900 Fury BlackHyperX Black es un kit de 2 x 8G.La capacidad total es de 16 GB kit. Cada kit del módulo tiene sido probado para funcionar a DDR3-1866 a un bajo momento de latencia de 10-11-10 a 1,5 V.  ','../img/catalogo/Rams_Kignstone.jpg');
insert into producto (idMarca,idCategoria, Nombre_producto, Stock, precio, Descripcion, imagen ) values (15,6,'CoolerMaster® Fuente Poder 850W 13cm 80Plus Gold V850',25, 130490,'Fuente Poder 850w / 13cm 80Plus Gold V850Cooler Master ha desarrollado la serie V para determinar su posición como la principal marca de fuentes de poder de alto rendimiento. Basada en una plataforma completamente nueva, cuenta con una eficiencia sobresaliente, especialmente en cargas de gran consumo. Gracias a los ventiladores de alta calidad y bajo ruido, esta fuente de poder entrega un funcionamiento es muy fresco y silencioso. ','../img/catalogo/4_250.jpg');
insert into producto (idMarca,idCategoria, Nombre_producto, Stock, precio, Descripcion, imagen ) values (6,5,'Asus® M/B AMD Crosshair V Formula-Z (AM3+)',70, 204190,'M/B AMD Crosshair V Formula-Z A/L (AM3+)Con soporte para los próximos procesadores FX 2 de 8 núcleos!!!El juego ha comenzado con la serie ROG de ASUS. La nueva Crosshair V Formula-Z para plataformas AMD está equipada con el socket AM3+ y el chipset 990FX que dan soporte para las últimas tecnologías de AMD incluyendo los nuevos procesadores AMD FX 2 de 8 núcleos. La calidad y diseño de la Crosshair V Formula-Z le permitirán a los usuarios entusiastas y Gamers obtener el máximo rendimiento en aplicaciones 3D, así como el máximo desempeño en aplicaciones de alta demanda. La completa capacidad de la Crosshair V Formula-Z te dará soporte para todo lo que necesites. Siente parte de la republica... La republica de los gamers!!!','../img/catalogo/1.jpg');
  