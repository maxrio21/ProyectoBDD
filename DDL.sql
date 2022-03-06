--En caso de fallo utilza este drop para borrar todas las tablas.

DROP TABLE IF EXISTS 
cliente,caja_fuerte,alquilar,trabajador,
entidad_bancaria,sucursal,tarjeta,credito,
debito,cuenta_bancaria,realizar_operacion,factura,
cuenta_ahorro,cuenta_corriente,crear_tarjeta,crear_cuenta,
cajero,oficina,director,supervisar,
administrativo,contable,gestor,entrevistar,contrato;


CREATE TABLE cliente(--
	id_cliente SERIAL,
	dni varchar(9) CHECK (LENGTH(dni) = 9),
	nombre varchar(50),
	apellidos varchar(100),
	telefono varchar(15),
	domicilio varchar(200),
	correo varchar(320),
	
	CONSTRAINT pk_cliente PRIMARY KEY(id_cliente)
);

CREATE TABLE caja_fuerte(--
	id_caja SERIAL,
	m2 decimal(4,2),
	contraseña varchar(6) CHECK (LENGTH(contraseña) = 6),
	contenido varchar(1000),
	
	CONSTRAINT pk_caja_fuerte PRIMARY KEY(id_caja)
);

CREATE TABLE alquilar(--
	id_caja int,
	id_cliente int,
	fecha_inicio date,
	fecha_fin date,
	
	CONSTRAINT pk_alquilar PRIMARY KEY(id_caja,id_cliente),
	CONSTRAINT fk_id_caja FOREIGN KEY(id_caja) REFERENCES caja_fuerte(id_caja)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT fk_id_cliente FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE entidad_bancaria(--
	codigo varchar(4),
	nombre varchar(50),
	
	CONSTRAINT pk_entidad_bancaria PRIMARY KEY (codigo)
);

CREATE TABLE sucursal(--
	id_sucursal varchar(4),
	dirección varchar(200),
	ciudad varchar(50),
	codigo_postal varchar(5),
	provincia varchar(50),
	cod_entidad varchar(4) NOT NULL,
	
	CONSTRAINT pk_sucursal PRIMARY KEY (id_sucursal),
	CONSTRAINT fk_sucursal FOREIGN KEY (cod_entidad) REFERENCES entidad_bancaria(codigo)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE oficina(--
	id_oficina varchar(12),
	seccion varchar(50),
	m2 numeric,
	id_sucursal varchar(4) NOT NULL,
	id_entidad_bancaria varchar(4) NOT NULL,

	CONSTRAINT pk_oficina PRIMARY KEY (id_oficina),
	CONSTRAINT fk_id_sucursal FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT fk_entidad_bancaria FOREIGN KEY (id_entidad_bancaria) REFERENCES entidad_bancaria(codigo)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE trabajador(
	id_trabajador SERIAL,
	dni varchar(9) CHECK (LENGTH(dni) = 9),
	nombre varchar(50),
	apellidos varchar(100),
	telefono varchar(15) CHECK (LENGTH(telefono) >= 9),
	domicilio varchar(200),
	correo varchar(320),
	id_oficina varchar(12) NOT NULL,
	
	CONSTRAINT pk_trabajador PRIMARY KEY (id_trabajador),
	CONSTRAINT fk_id_oficina FOREIGN KEY (id_oficina) REFERENCES oficina(id_oficina)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE entrevistar(
	id_trabajador int,
	id_sucursal varchar(4),
	fecha date,
	
	CONSTRAINT pk_entrevistar PRIMARY KEY (id_trabajador,id_sucursal),
	CONSTRAINT fk_id_trabajador FOREIGN KEY (id_trabajador) REFERENCES trabajador(id_trabajador)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT fk_sucursal FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE tarjeta(
	id_tarjeta SERIAL,
	titular varchar(50),
	cvv numeric(3) CHECK (LENGTH(CAST(cvv AS VARCHAR)) = 3),
	id_cliente int,
	
	CONSTRAINT pk_tarjeta PRIMARY KEY (id_tarjeta),
	CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE credito(
	id_tarjeta int,
	
	CONSTRAINT pk_credito PRIMARY KEY (id_tarjeta),
	CONSTRAINT fk_id_tarjeta FOREIGN KEY (id_tarjeta) REFERENCES tarjeta(id_tarjeta)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE debito(
	id_tarjeta int,
	
	CONSTRAINT pk_debito PRIMARY KEY (id_tarjeta),
	CONSTRAINT fk_id_tarjeta FOREIGN KEY (id_tarjeta) REFERENCES tarjeta(id_tarjeta)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE cuenta_bancaria(--
	id_cuenta SERIAL,
	iban varchar(26),
	deposito decimal(15,2),
	tipo varchar(100),
	contraseña numeric(6) CHECK (LENGTH(CAST(contraseña AS VARCHAR)) = 6),
	id_cliente int NOT NULL,
	id_sucursal varchar(4) NOT NULL,
	id_entidad_bancaria varchar(4) NOT NULL,

	CONSTRAINT pk_cuenta_bancaria PRIMARY KEY (id_cuenta),
	CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT fk_sucursal FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT fk_entidad_bancaria FOREIGN KEY (id_entidad_bancaria) REFERENCES entidad_bancaria(codigo)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE realizar_operacion(
	id_cliente int,
	id_cuenta int,
	cantidad decimal(15,2) CHECK (cantidad > 0),
	fecha date,
	tipo varchar(50),
	
	CONSTRAINT pk_realizar_operacion PRIMARY KEY (id_cliente,id_cuenta),
	CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT fk_cuenta FOREIGN KEY (id_cuenta) REFERENCES cuenta_bancaria(id_cuenta)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE factura(
	id_factura numeric(10),
	fecha date,
	id_cliente int,
	id_cuenta int,
	
	CONSTRAINT pk_factura PRIMARY KEY (id_factura),
	CONSTRAINT fk_realizar_operacion FOREIGN KEY (id_cliente,id_cuenta) REFERENCES realizar_operacion(id_cliente,id_cuenta)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE cuenta_ahorro(
	id_cuenta int,
	
	CONSTRAINT pk_cuenta_ahorro PRIMARY KEY (id_cuenta),
	CONSTRAINT fk_id_cuenta FOREIGN KEY (id_cuenta) REFERENCES cuenta_bancaria(id_cuenta)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE cuenta_corriente(
	id_cuenta int,
	
	CONSTRAINT pk_cuenta_corriente PRIMARY KEY (id_cuenta),
	CONSTRAINT fk_id_cuenta FOREIGN KEY (id_cuenta) REFERENCES cuenta_bancaria(id_cuenta)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE crear_tarjeta(
	id_cliente int,
	id_cc int,
	id_tarjeta int,
	fecha_creacion date,
	
	CONSTRAINT pk_crear_tarjeta PRIMARY KEY(id_cc,id_cliente),
	CONSTRAINT uk_crear_tarjeta UNIQUE (id_cc,id_tarjeta),
	CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT fk_id_cc FOREIGN KEY (id_cc) REFERENCES cuenta_corriente(id_cuenta)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT fk_id_tarjeta FOREIGN KEY (id_tarjeta) REFERENCES tarjeta(id_tarjeta)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE crear_cuenta(
	id_cliente int,
	id_sucursal varchar(4),
	id_cc int,
	fecha_creacion date,

	CONSTRAINT pk_crear_cuenta PRIMARY KEY (id_cliente,id_sucursal),
	CONSTRAINT uk_crear_cùenta UNIQUE (id_cliente,id_cc),
	CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT fk_id_sucursal FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT fk_id_cc FOREIGN KEY (id_cc) REFERENCES cuenta_corriente(id_cuenta)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE cajero(
	id_cajero SERIAL,
	modelo varchar(100),
	localización varchar(200),
	deposito decimal(30,2),
	id_sucursal varchar(4) NOT NULL,
	
	CONSTRAINT pk_cajero PRIMARY KEY (id_cajero),
	CONSTRAINT fk_id_sucursal FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE director(
	id_trabajador int,
	
	CONSTRAINT pk_director PRIMARY KEY (id_trabajador),
	CONSTRAINT fk_id_trabajador FOREIGN KEY (id_trabajador) REFERENCES trabajador(id_trabajador)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE supervisar(
	supervisor1 int,
	supervisor2 int CHECK (supervisor2 != supervisor1),
	
	CONSTRAINT pk_supervisor PRIMARY KEY (supervisor1,supervisor2),
	CONSTRAINT fk_supervisor1 FOREIGN KEY (supervisor1) REFERENCES director(id_trabajador)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT fk_supervisor2 FOREIGN KEY (supervisor2) REFERENCES director(id_trabajador)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE administrativo(
	id_trabajador int,
	
	CONSTRAINT pk_administrativo PRIMARY KEY (id_trabajador),
	CONSTRAINT fk_id_trabajador FOREIGN KEY (id_trabajador) REFERENCES trabajador(id_trabajador)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE contable(
	id_trabajador int,
	
	CONSTRAINT pk_contable PRIMARY KEY (id_trabajador),
	CONSTRAINT fk_id_trabajador FOREIGN KEY (id_trabajador) REFERENCES trabajador(id_trabajador)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE gestor(
	id_trabajador int,
	especialidad varchar(100),
	
	CONSTRAINT pk_gestor PRIMARY KEY (id_trabajador),
	CONSTRAINT fk_id_trabajador FOREIGN KEY (id_trabajador) REFERENCES trabajador(id_trabajador)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE contrato(
	id_contrato SERIAL,
	id_trabajador int,
	id_sucursal varchar(4),
	fecha_contratación date,
	
	CONSTRAINT pk_contrato PRIMARY KEY (id_contrato),
	CONSTRAINT fk_entrevistar FOREIGN KEY (id_trabajador,id_sucursal) REFERENCES entrevistar(id_trabajador,id_sucursal)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);
