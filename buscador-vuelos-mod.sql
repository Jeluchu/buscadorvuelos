DROP DATABASE IF EXISTS buscadorVuelos;
CREATE DATABASE buscadorVuelos;
USE buscadorVuelos;

	CREATE TABLE AEROPUERTO (
	CodIATA VARCHAR(30),
	Nombre VARCHAR (30),
	Ciudad VARCHAR (30), 
	Pais VARCHAR(20),
 	CONSTRAINT PK_AEROPUERTO PRIMARY KEY(CodIATA,Nombre)

	);

	CREATE TABLE TERMINAL (
	Numero char(20) NOT NULL,
	CodIATA VARCHAR(30) NOT NULL,
	CONSTRAINT PK_TERMINAL PRIMARY KEY (Numero,CodIATA)

	);	

	CREATE TABLE VUELO (
	CodVuelo CHAR(10),
	CodCompañia VARCHAR(30),
	NombreAeropuertoOrigen VARCHAR (30),
	CodIATAOrigen VARCHAR(30),
	CodIATADestino VARCHAR(30),
	NombreAeropuertoDestino VARCHAR (30),
	TerminalAeropuertoOrigen VARCHAR(30),
	TerminalAeropuertoDestino VARCHAR(30),
	Estado ENUM ('OnTime', 'Delayed', 'Advance'),
	PRIMARY KEY (CodVuelo),
	CONSTRAINT FK_ORIGEN FOREIGN KEY(CodIATAOrigen,NombreAeropuertoOrigen) 
	REFERENCES AEROPUERTO (CodIATA,Nombre),
	CONSTRAINT FK_DESTINO FOREIGN KEY(CodIATADestino,NombreAeropuertoDestino) 
	REFERENCES AEROPUERTO (CodIATA,Nombre)

	);


	CREATE TABLE ASIENTO (
	CodAsiento char(20) NOT NULL,
	TipoClase VARCHAR(30),
	PRIMARY KEY (CodAsiento,TipoClase) 

	);
	
	CREATE TABLE PASAJERO (
	DNI CHAR(20),
	Nombre VARCHAR(20),
	Apellido1 VARCHAR(20),
	Apellido2 VARCHAR(20),
	Libertad ENUM ('si', 'no') NOT null,
	PRIMARY KEY (Nombre,DNI,Libertad) 

	);

	CREATE TABLE RESERVA (
	Localizador VARCHAR(20) NOT NULL,
	DNI CHAR(30),
	Precio float(4),
	PRIMARY KEY (Localizador,DNI) 

	);

	CREATE TABLE PENAL (
	Nombre VARCHAR(30),
	DNI CHAR(9),
	libre ENUM ('SI','NO')
	);

ALTER TABLE AEROPUERTO DROP Pais;
ALTER TABLE AEROPUERTO ADD Continente VARCHAR(20);
ALTER TABLE VUELO MODIFY CodVuelo INT AUTO_INCREMENT;
ALTER TABLE PASAJERO MODIFY Libertad VARCHAR(1);
ALTER TABLE VUELO DROP FOREIGN KEY FK_DESTINO;

/*ALTER TABLE ANIMAL DROP FOREIGN KEY FK_ZOO;
ALTER TABLE ANIMAL ADD CONSTRAINT FK_ZOO FOREIGN KEY (nomzoo)
REFERENCES ZOO(nombre) ON DELETE SET NULL ON UPDATE CASCADE; *(

INSERT INTO ZOO VALUES ('Zoo Madrid', 'Madrid', 'España', 'A', 608.42);
INSERT INTO ZOO VALUES ('Zoo Londres', 'Londres', 'UK', 'B', 0);
INSERT INTO ESPECIE VALUES ('Panthera Tigris', 'Tigre', 'Felinos', 5);
INSERT INTO ANIMAL(nomzoo,nomespecie,sexo,añonacim,país,continente) VALUES ('Zoo Madrid', 'Panthera Tigris', 'Masculino', 2013, 'India', 'Asia');

/* PARTE D 
UPDATE ZOO SET nombre='Zoo Madrid - Vodafone' WHERE nombre='Zoo Madrid';
*/

/* MUESTRA LAS TABLAS */
SHOW TABLES;
DESC AEROPUERTO;
DESC TERMINAL;
DESC VUELO;
DESC ASIENTO;
DESC PASAJERO;
DESC RESERVA;
DESC PENAL;



