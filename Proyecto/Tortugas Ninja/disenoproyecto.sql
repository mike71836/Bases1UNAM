CREATE DATABASE PAPELERIA;
\c PAPELERIA; 

CREATE TABLE PRODUCTO(
CODIGO_BARRAS NUMERIC(12,0) NOT NULL,
PRECIO_COMPRA NUMERIC(10,0) NOT NULL,
PRECIO_VENTA NUMERIC(10,0) NOT NULL,
FECHA_COMPRA DATE,
CANTIDAD_EJEM NUMERIC(10,0) NOT NULL,
NOMBRE VARCHAR(100),
MARCA VARCHAR(50),
DESCRIPCION VARCHAR(100),
ID_PROVEDOR NUMERIC(4,0),
CONSTRAINT PK_PRODUCTO PRIMARY KEY (CODIGO_BARRAS)
);
CREATE TABLE PROVEDOR(
ID_PROVEDOR NUMERIC(4,0)  NOT NULL,
NOMBRE VARCHAR(100) NOT NULL,
APELLIDO VARCHAR(100) NOT NULL,
ESTADO VARCHAR(32),
COD_POSTAL CHAR(5),
COLONIA VARCHAR(32),
CALLE VARCHAR(32),
NUM NUMERIC(4,0), 
RAZON_SOCIAL VARCHAR(100) NOT NULL,
CONSTRAINT PK_PROVEDOR PRIMARY KEY (ID_PROVEDOR)
);
CREATE TABLE TELEFONO(
ID_PROVEDOR NUMERIC(4,0)  NOT NULL,
TELEFONO NUMERIC(10,0)  NOT NULL,
CONSTRAINT PK_TELEFONO PRIMARY KEY (TELEFONO) 
);
CREATE TABLE VENTA(
NUM_VENTA CHAR(8)  NOT NULL,
ID_CLIENTE NUMERIC(4,0) NOT NULL,
CODIGO_BARRAS NUMERIC(12,0) NOT NULL,
FECHA_VENTA DATE NOT NULL,
CANTIDAD_PAGAR NUMERIC(10,0)  NOT NULL,
CONSTRAINT PK_VENTA PRIMARY KEY (NUM_VENTA)
);
CREATE TABLE CLIENTE(
ID_CLIENTE NUMERIC(4,0) NOT NULL,
NOMBRE VARCHAR(100) NOT NULL,
APELLIDO VARCHAR(100) NOT NULL,
ESTADO VARCHAR(32),
COD_POSTAL CHAR(5),
COLONIA VARCHAR(32),
CALLE VARCHAR(32),
NUM NUMERIC(4,0), 
RFC VARCHAR(13) NOT NULL,
CONSTRAINT PK_CLIENTE PRIMARY KEY (ID_CLIENTE)
);
CREATE TABLE EMAIL(
ID_CLIENTE NUMERIC(4,0)  NOT NULL, 
EMAIL VARCHAR(150)  NOT NULL,
CONSTRAINT PK_EMAIL PRIMARY KEY (EMAIL)
);

ALTER TABLE PRODUCTO
ADD CONSTRAINT FK_PROPROVEDOR
FOREIGN KEY (ID_PROVEDOR)
REFERENCES PROVEDOR (ID_PROVEDOR);

ALTER TABLE VENTA
ADD CONSTRAINT FK_VENCLIENTE
FOREIGN KEY (ID_CLIENTE)
REFERENCES CLIENTE (ID_CLIENTE);

ALTER TABLE VENTA
ADD CONSTRAINT FK_VENPRODCUTO
FOREIGN KEY (CODIGO_BARRAS)
REFERENCES PRODUCTO (CODIGO_BARRAS);

ALTER TABLE TELEFONO
ADD CONSTRAINT FK_TELPROVEDOR
FOREIGN KEY (ID_PROVEDOR)
REFERENCES PROVEDOR (ID_PROVEDOR);

ALTER TABLE EMAIL
ADD CONSTRAINT FK_EMAILCLIEN
FOREIGN KEY (ID_CLIENTE)
REFERENCES CLIENTE (ID_CLIENTE);



