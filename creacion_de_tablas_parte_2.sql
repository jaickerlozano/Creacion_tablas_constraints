/* TABLAS YCONSTRAINTS
 1. Dentro de la base de datos ‘academia’ crea la siguiente tabla:
 CAMPO                TIPO
 COD_SERVIDOR         INT
 NOMBRE               VARCHAR(50)
 MARCA                VARCHAR(50)
 MEMORIA              INT
 DISCO                INT
 PRECIO               DECIMAL(5,2)
 CPUs                 INT
 FECHA_COMPRA         DATE
 13.Insertar fila para ver el resultado
Módulo: SQL
 Profesor: Yolanda López
 14.Crear otra columna generada que devuelve el nombre y la marca
 concatenada y en mayúsculas. Debe llamarse DATOS_SERVIDOR.
 15.Insertar una fila para ver el resultado
 16.Renombra la tabla creada
 17.Mueve la tabla a otra base de datos y comprueba que ha funcionado
 18.Borra la tabla que acabas de crear*/

-- 1. Dentro de la base de datos ‘academia’ crea la siguiente tabla:
use academia;
create table SERVIDOR (
COD_SERVIDOR INT,
NOMBRE VARCHAR (50),
MARCA VARCHAR (50),
MEMORIA INT,
DISCO INT,
PRECIO DECIMAL(5.2),
CPUs INT,
FECHA_COMPRA DATE);

select * from servidor;

-- 2. Añadir una columna nueva llamada ‘DESCUENTO’ de tipo INT
alter table SERVIDOR add DESCUENTO INT;

-- 3. Insertar un par de filas en la tabla
insert into SERVIDOR (COD_SERVIDOR, NOMBRE, MARCA, MEMORIA, DISCO, PRECIO, CPUs, FECHA_COMPRA, DESCUENTO) values 
(1, 'Zanahoria', 'IBM', 16, 512, 600, 7, now(), 10),
(2, 'Locotron', 'Acer', 16, 512, 550, 5, now(), 15),
(3, 'CallOfDuty', 'HP', 16, 512, 700, 9, now(), 12);

-- 4. Modificar DESCUENTO a varchar(2)
alter table SERVIDOR MODIFY DESCUENTO VARCHAR(2);

-- 5. Modificar de nuevo a INT
alter table SERVIDOR MODIFY DESCUENTO INT;

-- 6. Modificar MARCA para convertirla a INT
alter table SERVIDOR MODIFY MARCA INT;
-- No se pudo modificar porque ya hay datos ingresados como cadena de caracteres

-- 7. Modificar longitud de una columna a un valor menor
alter table SERVIDOR MODIFY MARCA VARCHAR(45);

-- 8. Cambiar posición de la columna DESCUENTO para que aparezca después de PRECIO 
alter table SERVIDOR MODIFY DESCUENTO INT AFTER PRECIO;
select * from servidor;

-- 9. Modificar al mismo tiempo MARCA y MODELO a VARCHAR(75) y poner MARCA antes que COD_SERVIDOR
alter table SERVIDOR ADD MODELO VARCHAR(50) AFTER MARCA;
alter table SERVIDOR MODIFY MARCA VARCHAR(75) FIRST, MODIFY MODELO VARCHAR (75);

-- 10.Modificar el nombre de la columna DISCO a ALMACENAMIENTO
alter table SERVIDOR CHANGE COLUMN DISCO ALMACENAMIENTO INT;

-- 11.Borrar columna FECHA_COMPRA
alter table SERVIDOR DROP FECHA_COMPRA;

DESC SERVIDOR;

-- 12.Crear una columna generada llamada “PRECIO_SERVIDOR” que
-- contenga el precio del servidor menos el descuento
alter table SERVIDOR ADD PRECIO_SERVIDOR INT generated always as (PRECIO-(PRECIO*DESCUENTO/100));



