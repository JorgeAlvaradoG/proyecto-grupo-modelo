CREATE database grupomodelo;
use grupomodelo;

CREATE TABLE Rol (
	ID INTEGER UNSIGNED AUTO_INCREMENT,
	Rol varchar(20),
	PRIMARY KEY (ID)
);

INSERT INTO Rol (Rol) VALUES
('Administrador'),
('Supervisor'),
('Vendedor');

CREATE TABLE Pregunta (
	ID INTEGER UNSIGNED AUTO_INCREMENT,
	Pregunta varchar(50),
	PRIMARY KEY (ID)
);

INSERT INTO Pregunta (Pregunta) VALUES
('¿Cual es el nombre de tu mascota?'),
('¿Cual es tu pelicula favorita?'),
('¿Cual es tu deporte favorito?');

CREATE TABLE Usuario (
	ID INTEGER UNSIGNED AUTO_INCREMENT,
	Nombre varchar(50),
    ApellidoP varchar(50),
    ApellidoM varchar(50),
    Nickname varchar(50) UNIQUE,
	Telefono	VARCHAR(15),
	Correo varchar(255) DEFAULT NULL,
	Contraseña BLOB,
	Rol INTEGER UNSIGNED,
	Antiguedad DATETIME,
	Estatus INT NOT NULL DEFAULT '1',
    Pregunta INTEGER UNSIGNED,
    Respuesta varchar(50),
	PRIMARY KEY (ID),
	FOREIGN KEY (Pregunta) REFERENCES Pregunta (ID),
    FOREIGN KEY (Rol) REFERENCES Rol (ID)
);

INSERT INTO Usuario (Nombre, ApellidoP, ApellidoM, Nickname, Telefono, Correo, Contraseña, Rol, Antiguedad, Estatus, Pregunta, Respuesta)
VALUES ('Jorge', 'Alvarado', 'García', 'Johncroft', '5554589656', 'johncrotf2@hotmail.com', 'UbhS6e/pxVGcacrUMfXiTw==', 2, now(), 1, 2, 'El Hobbit');
INSERT INTO Usuario (Nombre, ApellidoP, ApellidoM, Nickname, Contraseña, Rol, Antiguedad, Estatus, Pregunta, Respuesta)
VALUES ('Jair', 'Martinez', 'Lopez', 'Mart', 'HvENkplSO2Brp2sNbRhCSA==', 2, now(), 1, 2, 'El Hobbit');
INSERT INTO Usuario (Nombre, ApellidoP, ApellidoM, Nickname, Contraseña, Rol, Antiguedad, Estatus, Pregunta, Respuesta)
VALUES ('Flor', 'Castillo', 'Ilto', 'Lol', 'W0TyX/vjlRklb60mglc2Yw==', 3, now(), 1, 3, 'Futbol');

SELECT * FROM Usuario;

CREATE TABLE Acceso (
	ID INTEGER UNSIGNED AUTO_INCREMENT,
    Usuario INTEGER UNSIGNED,
    FechaAcceso DATETIME,
	Rol varchar(50) DEFAULT NULL,
    PRIMARY KEY (ID),
	FOREIGN KEY (Usuario) REFERENCES Usuario (ID)
);

DELIMITER //
CREATE PROCEDURE InsertBitcora(usu int)

BEGIN
	
    DECLARE nombre varchar(25);
    
    SELECT r.Rol 
    INTO nombre
	FROM Rol r, Usuario u
	WHERE (r.ID = u.Rol) AND u.ID = usu;
    
	INSERT INTO Acceso (Usuario, FechaAcceso, Rol) VALUES (usu, now(), nombre);
END //
DELIMITER ;

CALL InsertBitcora(3);

INSERT INTO Acceso (Usuario, FechaAcceso, Rol) VALUES (1, now(), 'Administrador');

SELECT r.Rol 
FROM Rol r, Usuario u
WHERE (r.ID = u.Rol) AND u.ID = 1;

SELECT * FROM Acceso;

/**/
CREATE TABLE TipoProducto (
	ID	INTEGER UNSIGNED AUTO_INCREMENT,
    Nombre	VARCHAR(50),
	PRIMARY KEY (ID)
);

CREATE TABLE Envasado (
	ID	INTEGER UNSIGNED AUTO_INCREMENT,
    Nombre	VARCHAR(50),
	PRIMARY KEY (ID)
);

CREATE TABLE Presentacion (
	ID	INTEGER UNSIGNED AUTO_INCREMENT,
    Tamano	INT,
	PRIMARY KEY (ID)
);

CREATE TABLE Empaquetado (
	ID	INTEGER UNSIGNED AUTO_INCREMENT,
    Nombre	VARCHAR(50),
    Cantidad INT,
	PRIMARY KEY (ID)
);

CREATE TABLE Marca (
	ID	INTEGER UNSIGNED AUTO_INCREMENT,
    Nombre	VARCHAR(50),
	PRIMARY KEY (ID)
);

CREATE TABLE Precio (
	ID	INTEGER UNSIGNED AUTO_INCREMENT,
    Precio DECIMAL(10,2),
	PRIMARY KEY (ID)
);

CREATE TABLE TipoVenta (
	ID	INTEGER UNSIGNED AUTO_INCREMENT,
    Nombre	VARCHAR(50),
	PRIMARY KEY (ID)
);

CREATE TABLE TipoCliente (
	ID	INTEGER UNSIGNED AUTO_INCREMENT,
    Nombre	VARCHAR(50),
	PRIMARY KEY (ID)
);

CREATE TABLE Cliente (
	ID	INTEGER UNSIGNED AUTO_INCREMENT,
    Nombre	VARCHAR(50),
    ApellidoP varchar(50),
    ApellidoM varchar(50),
    Telefono	VARCHAR(15),
    Correo	VARCHAR(255),
    Direccion VARCHAR(255),
	TipoCliente INTEGER UNSIGNED,
	Antiguedad DATETIME,
	Estatus INT NOT NULL DEFAULT '1',
	PRIMARY KEY (ID),
    FOREIGN KEY (TipoCliente) REFERENCES TipoCliente (ID)
);

CREATE TABLE Tonalidad (
    ID INTEGER UNSIGNED AUTO_INCREMENT,
    Nombre VARCHAR(50),
	PRIMARY KEY (ID)
);

create TABLE Producto (
	ID INTEGER UNSIGNED AUTO_INCREMENT, 
    TipoProducto INTEGER UNSIGNED,
    Envasado INTEGER UNSIGNED, 
    Presentacion INTEGER UNSIGNED, 
    Marca INTEGER UNSIGNED,
    Tonalidad INTEGER UNSIGNED,
    PRIMARY KEY (ID),
    FOREIGN KEY (TipoProducto) REFERENCES TipoProducto (ID),
    FOREIGN KEY (Envasado) REFERENCES Envasado (ID),
    FOREIGN KEY (Presentacion) REFERENCES Presentacion (ID),
    FOREIGN KEY (Marca) REFERENCES Marca (ID),
    FOREIGN KEY (Tonalidad) REFERENCES Tonalidad (ID)
);

CREATE TABLE Distribucion (
	ID INTEGER UNSIGNED AUTO_INCREMENT,
    Producto INTEGER UNSIGNED,
    Empaquetado INTEGER UNSIGNED,
    Precio INTEGER UNSIGNED,
    TipoVenta INTEGER UNSIGNED,
    Cliente INTEGER UNSIGNED,
	Cantidad INTEGER UNSIGNED,
	PRIMARY KEY (ID),
	FOREIGN KEY (Producto) REFERENCES Producto (ID),
    FOREIGN KEY (Empaquetado) REFERENCES Empaquetado (ID),
    FOREIGN KEY (Precio) REFERENCES Precio (ID),
    FOREIGN KEY (TipoVenta) REFERENCES TipoVenta (ID),
    FOREIGN KEY (Cliente) REFERENCES Cliente (ID)
);

CREATE TABLE Disponibilidad (
	ID INTEGER UNSIGNED AUTO_INCREMENT,
    Producto INTEGER UNSIGNED,
	EnVenta INTEGER UNSIGNED,
	EnReserva INTEGER UNSIGNED,
	Total INTEGER UNSIGNED,
	Estatus INT NOT NULL DEFAULT '1',
	PRIMARY KEY (ID),
    FOREIGN KEY (Producto) REFERENCES Producto (ID) 
);

CREATE TABLE Venta (
	ID INTEGER UNSIGNED AUTO_INCREMENT,
    Distribucion INTEGER UNSIGNED,
    Fecha DATETIME,
	PRIMARY KEY (ID),
    FOREIGN KEY (Distribucion) REFERENCES Distribucion (ID)     
);