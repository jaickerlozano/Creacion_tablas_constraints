/*Ejercicios de Transacciones
 Utilizando la base de datos academia:
*/

use academia;
-- 1. Quitar el autocommit. Comprobar que ha funcionado
show variables like 'autocommit';
set autocommit = 0;
show variables like 'autocommit';

-- 2. Vemos las filas existentes
select * from alumnos;

-- 3. Insertamos un par de filas usando las columnas completas
insert into alumnos (cod_alumno, nombre, apellidos, correo, edad, cod_curso) values 
(101, 'Jaicker', 'Lozano', 'jlozano.devcode@gmail.com', 36, 4),
(102, 'Elyna', 'Sierra', 'elynasierra@gmail.com', 26, 3),
(103, 'Francisco', 'Lozano', 'franciscolozano@gmailcom', 34, 2);

-- 4. Comprobamos que están
select * from alumnos;

-- 5. Hacemos un ROLLBACK y comprobamos de nuevo
rollback;
select * from alumnos;
-- No están las filas insertadas porque se aplicó el rollback

-- 6. Volvemos a insertarlas y hacemos un COMMIT
insert into alumnos (cod_alumno, nombre, apellidos, correo, edad, cod_curso) values 
(101, 'Jaicker', 'Lozano', 'jlozano.devcode@gmail.com', 36, 4),
(102, 'Elyna', 'Sierra', 'elynasierra@gmail.com', 26, 3),
(103, 'Francisco', 'Lozano', 'franciscolozano@gmailcom', 34, 2);

commit;

-- 7. Intentar hacer un ROLLBACK. ¿funciona?
rollback;
select * from alumnos;
-- no funcionó el rollback porque se hizo un commit y las filas quedaron insertadas

-- 8. Ahora vamos a hacer una transacción con START TRANSACTION.
start transaction;
-- a. Insertamos una fila
insert into alumnos (cod_alumno, nombre, apellidos, correo, edad, cod_curso) values 
(104, 'Fernando', 'Rozas', 'fernandorozas@gmail.com', 30, 1);
-- b. Borramos otra
delete from alumnos where cod_alumno = 103;
-- c. Modificamos otra
update alumnos
	set nombre = 'Rafael' where cod_alumno = 101;
-- 9. Hacemos un Rollback y comprobamos que se ha deshecho la transacción
rollback;
select * from alumnos;

-- 10. Volvemos a lanzar la transacción pero con COMMIT y comprobamos que ha funcionado
insert into alumnos (cod_alumno, nombre, apellidos, correo, edad, cod_curso) values 
(104, 'Fernando', 'Rozas', 'fernandorozas@gmail.com', 30, 1);
delete from alumnos where cod_alumno = 103;
update alumnos
	set nombre = 'Rafael' where cod_alumno = 101;
commit;
rollback;
select * from alumnos;

-- 11. Vamos a hacer ahora un Rollback parcial
-- a. Insertamos una fila
insert into alumnos (cod_alumno, nombre, apellidos, correo, edad, cod_curso) values 
(105, 'José', 'Carreño', 'josecarreno@gmail.com', 37, 2);
-- b. Ponemos un SAVEPOINT
savepoint PASO2;
-- c. Borramos otra
delete from alumnos where cod_alumno = 101;
delete from alumnos where cod_alumno = 102;
-- d. Modificamos otra
update alumnos
	set nombre = 'Pepe' where cod_alumno = 105;
select * from alumnos;

-- 12. Truncamos la tabla coches para que quede vacía
use dml;
select * from coches;
truncate coches;
select * from coches;

-- 13. Volvemos a poner el autocommit
set autocommit = 1;
show variables like 'autocommit';
