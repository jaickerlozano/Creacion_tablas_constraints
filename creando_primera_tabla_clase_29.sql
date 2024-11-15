/*1. Lanzar el siguiente CREATE.
 CREATE TABLE `DML`.`coches` ( `matricula` VARCHAR(8) NOT NULL,
 `modelo` VARCHAR(45) NOT NULL, `marca` VARCHAR(45) NOT NULL,
 `precio` DECIMAL NULL, `fecha_compra` DATE NULL, PRIMARY KEY
 (`matricula`));*/

create table coches (matricula VARCHAR(8) NOT NULL, 
marca VARCHAR(45) NOT NULL, modelo VARCHAR(45) NOT NULL, 
precio DECIMAL NULL, fecha_compra DATE NULL, 
PRIMARY KEY (matricula));

select * from coches;

-- 2. Inserta un par de filas usando las columnas completas.
insert into coches (matricula, marca, modelo, precio, fecha_compra) values ('ABC-123', 'Toyota', 'Yaris', 15000, '2024-11-23');
insert into coches (matricula, marca, modelo, precio, fecha_compra) values ('DEF-456', 'Toyota', 'Raize', 12000, '2024-11-15');
insert into coches (matricula, marca, modelo, precio, fecha_compra) values ('DDD-444', 'Gran Cherokee', 'Jeep', 22000, '2024-11-15');
insert into coches (matricula, marca, modelo, precio, fecha_compra) values ('EEE-0906', 'Suzuki', 'Jimmy', 17000, '2024-04-29');

-- 3. Inserta una fila sin usar columnas, solo values.
insert into coches values ('GHI-789', 'Chevrolet', 'Sail', 13000, '2024-06-12');

-- 4. Inserta una fila sin poner los campos NULL
insert into coches (matricula, marca, modelo) values ('AAA-2929', 'Toyota', 'Rav4');

--  5. Intenta insertar una fila sin una columna NOT NULL. Debe generar un error.
-- Esta inserción crea error porque no se está ingresando un dato en el campo que corresponde a matricula 
insert into coches (matricula, marca, modelo, precio, fecha_compra) values ('Chevrolet', 'Cruze', 13000, '2024-11-06');

-- 6. Inserta 2 filas al mismo tiempo.
insert into coches (matricula, marca, modelo, precio, fecha_compra) values 
('BBB-222', 'Chevrolet', 'Cruze', 13000, '24-11-06'),
('CCC-333', 'Suzuki', 'Swift', 11000, '2024-06-7');

--  7. Crea una tabla llamada COCHES2 que sea una copia de COCHES.
create table coches2 (matricula VARCHAR(8) NOT NULL, 
marca VARCHAR(45) NOT NULL, modelo VARCHAR(45) NOT NULL, 
precio DECIMAL NULL, fecha_compra DATE NULL, 
PRIMARY KEY (matricula));

-- 8. Inserta todas las filas de coches en coches2;
insert into coches2 select * from coches;

-- 9. Modificar todos los coches que valgan más de un precio, por ejemplo 10.000.
-- (Adaptarlo a vuestros datos). Aumentamos el precio en 1000.
update coches2
	set precio = precio+1000 where precio > 12000;

-- Voy a actualizar la toyota rav4
update coches 
	set precio = 22000  where matricula = 'AAA-2929';
update coches
	set fecha_compra = '2024-11-29' where matricula = 'AAA-2929';
    
select * from coches;

--  10. Cambiar el nombre de la marca para que aparezca en mayúsculas.
-- no se como hacerlo aún, debo consultar a que se refieren.

-- 11. Borrar los coches de BMW. (En mi caso borraré los Chevrolet)
delete from coches2 where marca = 'Suzuki' and modelo = 'Jimmy';
select * from coches2;

-- 12. Vamos a hacer un REPLACE de la primera fila por otra cualquiera.
replace into coches2 (matricula, marca, modelo, precio, fecha_compra) values ('AAA-2929', 'Suzuki', 'Jimmy', 17000, '2024-04-29');
