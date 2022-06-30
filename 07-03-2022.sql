unidad 1: construir modelos conceptuales simples:
unidad 2: modelo conceptual complejo modelos conceptuales avanzados y normalizados
unidad 3: modelo relacional y esta normalizado e implementar en una DB.

pruebas: 
lunes 4 de abril 25%
lunes 16 de mayo 40%
lunes 27 de junio 35%

-- CREAR SEQUENCIA A LA TABLA MARCA
CREATE SEQUENCE SQ_MARCA
START WITH 1000
INCREMENT BY 100 ;
-- CREAR TABLA MARCA 
CREATE TABLE MARCA (
   id_marca number,
   nom_marca varchar2(30) NOT NULL,
   CONSTRAINT PK_MARCA PRIMARY KEY (id_marca)

);
-- INSERTAR DATOS A LA TABLA MARCA
INSERT INTO MARCA VALUES(
    SQ_MARCA.NEXTVAL,
    'ADIDAS'
    );
    INSERT INTO MARCA VALUES(
    SQ_MARCA.NEXTVAL,
    'NIKE'
    );
-- CONSULTAR A LA TABLA MARCA 
SELECT id_marca,nom_marca FROM MARCA ;


-----------------------------------------------------------
-- CREAR SEQUENCIA A LA TABLA ARTICULO
CREATE SEQUENCE SQ_ARTICULO
START WITH 1
INCREMENT BY 1 ;

-- CREAR TABLA ARTICULO
CREATE TABLE ARTICULO (
   id_articulo number,
   nom_articulo varchar2(25) NOT NULL,
   precio number NOT NULL,
   stock_actual number(4) NOT NULL,
   stock_minimo number(4) NOT NULL,
   id_marca number NOT NULL,
   CONSTRAINT PK_ARTICULO PRIMARY KEY (id_articulo)
);
-- INSERTAR DATOS A LA TABLA MARCA
INSERT INTO ARTICULO VALUES(
    SQ_ARTICULO.NEXTVAL,
    'ZAPATILLA',
    35000,
    100,
    10,
    1
    );
    INSERT INTO ARTICULO VALUES(
    SQ_ARTICULO.NEXTVAL,
    'ZAPATILLA',
    30000,
    150,
    20,
    2
    );
-- CONSULTAR A LA TABLA ARTICULO 
SELECT id_articulo,nom_articulo,precio,stock_actual,stock_minimo,id_marca FROM ARTICULO ;
-----------------------------------------------------------
-- CREAR SEQUENCIA A LA TABLA COMUNA
CREATE SEQUENCE SQ_COMUNA
START WITH 100
INCREMENT BY 5 ;

CREATE TABLE COMUNA (
    id_comuna number(3),
    nom_comuna varchar2(60) NOT NULL,
    CONSTRAINT PK_COMUNA PRIMARY KEY(id_comuna)
    
    );

INSERT INTO COMUNA VALUES(
    SQ_COMUNA.NEXTVAL,
    'BUIN');
INSERT INTO COMUNA VALUES(
    SQ_COMUNA.NEXTVAL,
    'PAINE');
    
SELECT id_comuna,nom_comuna FROM COMUNA;


-----------------------------------------------------------
-- CREAR SEQUENCIA A LA TABLA CLIENTE
CREATE SEQUENCE SQ_CLIENTE
START WITH 1
INCREMENT BY 1 ;

CREATE TABLE CLIENTE (
    id_cliente number,
    nombre_cliente varchar2(35) NOT NULL,
    direccion varchar2(50)NOT NULL,
    telefono varchar2(15)NOT NULL,
    id_comuna number(3) NOT NULL ,
    CONSTRAINT PK_CLIENTE PRIMARY KEY (id_cliente),
    CONSTRAINT FK_CLIENTE_COMUNA FOREIGN KEY(id_comuna) REFERENCES COMUNA(id_comuna)
    
);

INSERT INTO CLIENTE VALUES (SQ_CLIENTE.NEXTVAL,'OSCAR BASTIAS','PADRE TADEO 5161','+56962186741',100);
INSERT INTO CLIENTE VALUES (SQ_CLIENTE.NEXTVAL,'OSCAR PALMA','PADRE TADEO 5162','+56962186742',105);

SELECT id_cliente,nombre_cliente,direccion,telefono,CLIENTE.id_comuna,COMUNA.nom_comuna
FROM CLIENTE
LEFT JOIN COMUNA ON COMUNA.id_comuna = CLIENTE.id_comuna;

-----------------------------------------------------------
-- CREAR SEQUENCIA A LA TABLA ZONA
CREATE SEQUENCE SQ_ZONA
START WITH 1
INCREMENT BY 1 ;

CREATE TABLE ZONA (
    id_zona number,
    nom_zona varchar(10),
    porc number
    );
    
INSERT INTO ZONA VALUES (SQ_ZONA.NEXTVAL,'ZONA 1',100);

SELECT id_zona,nom_zona,porc FROM ZONA;
-----------------------------------------------------------
-- CREAR SEQUENCIA A LA TABLA FACTURA
CREATE SEQUENCE SQ_FACTURA
START WITH 10000
INCREMENT BY 10 ;

CREATE TABLE FACTURA (
    id_factura number,
    id_articulo number NOT NULL,
    id_vendedor number NOT NULL,
    fecha_factura timestamp NOT NULL,
    CONSTRAINT PK_FACTURA PRIMARY KEY(id_factura)
    );

INSERT INTO FACTURA VALUES (SQ_FACTURA.NEXTVAL,1,12,CURRENT_TIMESTAMP);
INSERT INTO FACTURA VALUES (SQ_FACTURA.NEXTVAL,21,13,CURRENT_TIMESTAMP);

SELECT id_factura,id_articulo,id_vendedor,fecha_factura FROM FACTURA;
-----------------------------------------------------------
-- CREAR SEQUENCIA A LA TABLA DETALLE FACTURA
CREATE SEQUENCE SQ_DETALLE_FACTURA
START WITH 1
INCREMENT BY 1 ;
