DROP DATABASE IF EXISTS usuarios;
CREATE DATABASE usuarios;
USE usuarios;


CREATE USER admin@localhost IDENTIFIED BY 'contraseña';
GRANT ALL PRIVILEGES ON buscadorVuelos.* TO emartin@localhost;

CREATE USER client@localhost;
GRANT INSERT ON buscadorVuelos.pasajeros TO jcalderon@localhost;

CREATE USER client@localhost;
GRANT SELECT ON buscadorVuelos.billetes TO visit@localhost;



