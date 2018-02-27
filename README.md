## Práctica 2: Bases de datos relacionales en MySQL

# Descripción

AEROPUERTO(CodIATA, Nombre, Ciudad, País)

TERMINALES(Número, CodIATA)

VUELO(CodVuelo, CodCompañia, AeropuertoOrigen, AeropuertoDestino, Estado)

ASIENTOS(CodAsiento, TipoClase)  

PASAJEROS(DNI, Nombre, Apellido1, Apellido2)

RESERVA(Localizador, DNI,‎Precio)

RESERVA_VUELOS(Localizador, CodVuelo)

COMPAÑIA(CodCompañia, Nombre, Logo)

  ##

Partiendo del siguiente modelo relacional (incompleto, quizás) se requiere realizar la base de datos de un buscador de vuelos como www.edreams.es o www.skyscanner.es. Tiene que tener las siguientes funcionalidades en diferentes archivos:

-   \[buscador-vuelos.sql\] Creación de toda la estructura en MySQL
-   \[buscador-vuelos-mod.sql\] Modificación de la estructura con varias instrucciones para insertar y quitar una columna, añadir y quitar una propiedad (UNIQUE, AUTO_INCREMENT, etc.) y añadir y quitar una PRIMARY O FOREIGN KEY.
-   \[buscador-vuelos-datos.sql\] Inserción de datos al menos 5 filas por cada tabla. Se requiere actualizar y borrar al menos 3 datos.
-   \[buscador-vuelos-usuarios.sql\] Creación de usuarios posibles (anónimo que consulta, admin o por ejemplo un usuario que realiza una reserva) junto con sus permisos.

En algunas funcionalidades como reservar un vuelo puede conllevar varias instrucciones para realizarlo (por ejemplo la reserva de ida y vuelta) pero en esos casos marcarlo como una transacción.

## CÓDIGO IATA
https://es.wikipedia.org/wiki/Anexo:Aeropuertos_seg%C3%BAn_el_c%C3%B3digo_IATA
https://es.wikipedia.org/wiki/C%C3%B3digo_de_aeropuertos_de_IATA

## GENERADOR DE NOMBRES, APELLIDOS, DNI, ETC
https://www.proinf.net/clases/MS-Excel/avanzado2011/generador_nombres/javascript/generador.html
