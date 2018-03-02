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
	
	
	CREATE TABLE EQUIPAJE (
	CodMaleta char(20)
	dimensiones float (4) 
	peso float (4)
	ubicacion ENUM ('bodega', 'cabina') NOT NULL,
	PRIMARY KEY (CodMaleta), 
	CONSTRAINT FK_MALETA FOREIGN KEY(CodMaleta) 
	REFERENCES PASAJERO (DNI)	

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




