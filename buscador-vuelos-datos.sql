DROP DATABASE IF EXISTS buscadorVuelos;
CREATE DATABASE buscadorVuelos;
USE buscadorVuelos;

	CREATE TABLE AEROPUERTO (
	CodIATA VARCHAR(30),
	Nombre VARCHAR (50),
	Ciudad VARCHAR (30), 
	Pais VARCHAR(50),
 	CONSTRAINT PK_AEROPUERTO PRIMARY KEY(CodIATA,Nombre)

	);

	CREATE TABLE TERMINAL (
	Numero char(4) NOT NULL,
	CodIATA VARCHAR(30) NOT NULL,
	CONSTRAINT PK_TERMINAL PRIMARY KEY (Numero,CodIATA)

	);	

	CREATE TABLE VUELO (
	CodVuelo CHAR(10),
	CodOACICompañia VARCHAR(30),
	NombreAeropuertoOrigen VARCHAR (30),
	CodIATAOrigen VARCHAR(30),
	NombreAeropuertoDestino VARCHAR (30),
	CodIATADestino VARCHAR(30),
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
	TipoClase ENUM ('TURISTA', 'BUSSINESS', 'FIRST CLASS'),
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

INSERT INTO AEROPUERTO VALUES ('ARI','AEROPUERTO INTERNACIONAL CHACALLUTA','ARICA', 'CHILE');
INSERT INTO AEROPUERTO VALUES ('ALC','AEROPUERTO DE ALICANTE-ELCHE','ALICANTE', 'ESPAÑA');
INSERT INTO AEROPUERTO VALUES ('DAY','AEROPUERTO INTERNACIONAL JAMES M. COX-DAYTON','DAYTON', 'ESTADOS UNIDOS');
INSERT INTO AEROPUERTO VALUES ('DME','AEROPUERTO INTERNACIONAL DE MOSCÚ-DOMODÉDOVO','MOSCÚ', 'RUSIA');
INSERT INTO AEROPUERTO VALUES ('DXB','AEROPUERTO INTERNACIONAL DE DUBÁI','DUBÁI', 'EMIRATOS ÁRABES UNIDOS');
INSERT INTO AEROPUERTO VALUES ('EZE','AEROPUERTO INTERNACIONAL MINISTRO PISTARINI','EZEIZA', 'ARGENTINA');
INSERT INTO AEROPUERTO VALUES ('MAD','AEROPUERTO ADOLFO SUÁREZ MADRID-BARAJAS','MADRID', 'ESPAÑA');
INSERT INTO AEROPUERTO VALUES ('GIB','AEROPUERTO DE GIBRALTAR','GIBRALTAR', 'GIBRALTAR');
INSERT INTO AEROPUERTO VALUES ('HOU','AEROPUERTO WILLIAM P. HOBBYE','HOUSTON', 'ESTADOS UNIDOS');

INSERT INTO TERMINAL VALUES ('8763','ARI');
INSERT INTO TERMINAL VALUES ('6612','ALC');
INSERT INTO TERMINAL VALUES ('9593','DAY');
INSERT INTO TERMINAL VALUES ('5703','DME');
INSERT INTO TERMINAL VALUES ('8415','DXB');
INSERT INTO TERMINAL VALUES ('0328','EZE');
INSERT INTO TERMINAL VALUES ('7688','MAD');
INSERT INTO TERMINAL VALUES ('4218','GIB');
INSERT INTO TERMINAL VALUES ('7867','HOU');

INSERT INTO VUELO VALUES ('DQGYPVY','FST','AEROPUERTO ADOLFO SUÁREZ MADRID-BARAJAS', 'MAD', 'AEROPUERTO INTERNACIONAL CHACALLUTA', 'ARI', '', '', 'OnTime');
INSERT INTO VUELO VALUES ('FVGAUYB','MPD','AEROPUERTO DE SABADELL', 'QSA', 'AEROPUERTO DE ALICANTE-ELCHE', 'ALC', '', '', 'Delayed');
INSERT INTO VUELO VALUES ('VNAD2MO','MVL','AEROPUERTO INTERNACIONAL DE RESISTENCIA', 'RES', 'AEROPUERTO INTERNACIONAL JAMES M. COX-DAYTON', 'DAY', '', '', 'OnTime');
INSERT INTO VUELO VALUES ('W53PQIV','UAE','AEROPUERTO INTERNACIONAL DE HONOLULU', 'HML', 'AEROPUERTO INTERNACIONAL DE MOSCÚ-DOMODÉDOVO', 'DME', '', '', 'Advance');
INSERT INTO VUELO VALUES ('LDKYMHC','ARG','AEROPUERTO INTERNACIONAL GUALEGUAYCHÚ', 'GHU', 'AEROPUERTO INTERNACIONAL DE DUBÁI', 'DBX', '', '', 'Delayed');
INSERT INTO VUELO VALUES ('R09PLBY','LTE','AEROPUERTO INTERNACIONAL MINISTRO PISTARINI', 'EZE', 'AEROPUERTO DE GRANADA', 'GRX', '', '', 'OnTime');
INSERT INTO VUELO VALUES ('I0QSVTE','LTE','AEROPUERTO DE TENERIFE NORTE', 'TFN', 'AEROPUERTO ADOLFO SUÁREZ MADRID-BARAJAS', 'MAD', '', '', 'Delayed');
INSERT INTO VUELO VALUES ('NQULU77','NTX','AEROPUERTO WILLIAM P. HOBBYE','HOUSTON', 'HOU', 'AEROPUERTO DE GIBRALTAR','GIBRALTAR', 'GIB', '', '', 'Advance');

INSERT INTO ASIENTO VALUES ('01A','FIRST CLASS');
INSERT INTO ASIENTO VALUES ('25B','TURISTA');
INSERT INTO ASIENTO VALUES ('12B','TURISTA');
INSERT INTO ASIENTO VALUES ('20A','TURISTA');
INSERT INTO ASIENTO VALUES ('16B','TURISTA');
INSERT INTO ASIENTO VALUES ('08A','BUSSINESS');
INSERT INTO ASIENTO VALUES ('05A','FIRST CLASS');
INSERT INTO ASIENTO VALUES ('14B','TURISTA');
INSERT INTO ASIENTO VALUES ('18A','TURISTA');

INSERT INTO PASAJERO VALUES ('56720466M','MARÍA','QUINTERO', 'ALONSO', 'SI');
INSERT INTO PASAJERO VALUES ('13729494N','ENRIQUE','FERRERO', 'CABRERA', 'NO');
INSERT INTO PASAJERO VALUES ('39831977W','JOSÉ','NOGALES', 'MORALES', 'SI');
INSERT INTO PASAJERO VALUES ('73698918H','SILVIA','NIETO', 'PEIRO', 'SI');
INSERT INTO PASAJERO VALUES ('03842052V','JAVIER','RIVERO', 'ÁLVAREZ', 'SI');
INSERT INTO PASAJERO VALUES ('60985429D','SARA','GUTIÉRREZ', 'MORINA', 'NO');
INSERT INTO PASAJERO VALUES ('54358219L','MERCEDES','ORTIZ', 'DONAIRE', 'NO');
INSERT INTO PASAJERO VALUES ('73698918H',' JOSÉ LUIS','LÓPEZ', 'BRIONES', 'SI');
INSERT INTO PASAJERO VALUES ('79872060Y','ERIC','MARTÍN','LEÓN','NO');

INSERT INTO PENAL VALUES ('MARÍA', '56720466M', 'SI');
INSERT INTO PENAL VALUES ('ENRIQUE', '13729494N', 'NO');
INSERT INTO PENAL VALUES ('JOSÉ', '39831977W', 'SI');
INSERT INTO PENAL VALUES ('SILVIA', '73698918H', 'SI');
INSERT INTO PENAL VALUES ('JAVIER', '03842052V', 'SI');
INSERT INTO PENAL VALUES ('SARA', '60985429D', 'NO');
INSERT INTO PENAL VALUES ('MERCEDES', '54358219L', 'NO');
INSERT INTO PENAL VALUES ('JOSÉ LUIS', '73698918H', 'SI');
INSERT INTO PENAL VALUES ('ERIC', '79872060Y', 'NO');

/* MUESTRA LAS TABLAS */
SHOW TABLES;
SELECT * FROM AEROPUERTO;
SELECT * FROM TERMINAL;
SELECT * FROM VUELO;
SELECT * FROM ASIENTO;
SELECT * FROM PASAJERO;
SELECT * FROM RESERVA;
SELECT * FROM PENAL;