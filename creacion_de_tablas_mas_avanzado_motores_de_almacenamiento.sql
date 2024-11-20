/*MOTORESDEALMACENAMIENTO
 Dentro de la base de datos ‘academia’...
 */
 
 -- 1. Comprobar los motores de almacenamiento que tenemos disponibles
use academia;
show engines;

-- 2. Comprobar el motor que está usando la tabla CURSOS. Debe ser InnoDB.
-- También podemos probar con SHOW status.
show table status where name = 'CURSOS'; 
show create table CURSOS;
/*'CURSOS', 'CREATE TABLE `cursos` (\n  `cod_curso` int NOT NULL,\n  `nombre` varchar(50) NOT NULL,
\n  `precio` int NOT NULL,\n  PRIMARY KEY (`cod_curso`)\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci'*/

-- 3. Averiguar en qué directorio tenemos los datos de las Bases de datos y nos
-- posicionamos en ese directorio.
 show variables like '%datadir%';
 /*Esta es la dirección'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Data\\', 
 pero al posicionarnos en ella nos indica que tenemos permisos denegados para ingresar*/
 
--  4. Ir al directorio y comprobar que tenemos un directorio “academia” para nuestra base de datos
/*Tuve que ir al directorio por medio del explorador de windows utilizando el sigueinte path C:\ProgramData\MySQL\MySQL Server 8.0\data
desde ahí hice click derecho en la carpeta data, seleccioné Propiedades → Seguridad → Editar permisos, 
y otorgué permisos de lectura/escritura para mi usuario de Windows.*/

-- 5. Comprobar que las tablas que existen. Deben tener la extensión “ibd”, ya que todas las que hemos creado son InnoDB
-- Todas las tablas que hemos creado son de extensión ibd, por lo tanto las tablas están utilizando un motor InnoDB.alter

/* 6. Crear una tabla llamada “isam1” de tipo MYISAM con la siguiente estructura:
COLUMNA            TIPO
 Código            INT
 Nombre            VARCHAR(50)
 Apellido1         VARCHAR(50)
 Apellido2         VARCHAR(50) */
 
create table isam1 (
codigo int, 
nombre varchar(50), 
apellido1 varchar(50), 
apellido2 varchar(50)) engine=myisam;
desc isam1;

-- 7. Comprobar cómo se ha creado en el directorio. Deben existir 3 ficheros
-- Sí, efectivamente se crearon tres ficheros.

-- 8. Crear otra tabla denomina csv1 con la misma estructura que “isam1” con el motor CSV
create table csv1 (
codigo int not null, 
nombre varchar(50) not null, 
apellido1 varchar(50) not null, 
apellido2 varchar(50) not null) engine=csv;
desc csv1;

-- 9. Vemos como aparece en el directorio.
-- Aparecen tres ficheros con extensiones .sdi, .csm, .csv

-- 10. Insertamos un par de filas en la tabla.
insert into csv1 values 
(1, 'Juan', 'López', 'Gutierrez'),
(2, 'María', 'Herrera', 'Nuñez');
select * from csv1;
show create table csv1;

-- 11. Abrimos el fichero csv1.csv con algún editor, por ejemplo el bloc de notas.
-- Al abrir el fichero me aparece la información de las columnas separadas por ","


/* 12. Si intentamos añadir algo o modificar algún valor. ¿nos deja? o NO, a pesar de
 ser un CSV, está protegido, de lo contrario podríamos tener problemas de
 corrupción*/
 
-- 13. Cambiar el motor de la tabla a InnoDB. Comprobamos que se ha modificado
alter table csv1 engine = InnoDB;
show create table csv1;
/*'csv1', 'CREATE TABLE `csv1` (\n  `codigo` int NOT NULL,\n  `nombre` varchar(50) NOT NULL,
\n  `apellido1` varchar(50) NOT NULL,
\n  `apellido2` varchar(50) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci'
*/

-- 14. Comprobamos que el resultado es el mismo. Comprobar si también ha cambiado en el directorio de datos.
show table status where name = 'csv1';
-- También ha cambiado en el directorio de extensión

-- 15. Convertirlo a un motor de tipo ARCHIVE y comprobar el resultado del directorio.
alter table csv1 engine = archive;
-- También ha cambiado en el directorio de extensión.
show create table csv1;
/*'csv1', 'CREATE TABLE `csv1` (\n  `codigo` int NOT NULL,\n  `nombre` varchar(50) NOT NULL,
\n  `apellido1` varchar(50) NOT NULL,
\n  `apellido2` varchar(50) NOT NULL\n) ENGINE=ARCHIVE DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci'
*/
-- Esta es otra forma de ver el motor
show table status where name = 'csv1';

/* 16. Probar ahora el motor BLACKHOLE,que es para poder probar cosas. Permite
 comandos de tipo INSERT pero realmente no almacena nada. • Cambiamos el
 motor a BLACKHOLE.*/
alter table csv1 engine = blackhole;
show table status where name = 'csv1';

-- 17. Comprobamos que en el directorio de datos no aparece nada.
-- Efectivamente en el directorio no aparece nada

-- 18. Si hacemos una SELECT vemos que no sale nada.
select * from csv1;
-- No sale nada al realizar un select

-- 19. Prueba con algún Insert y comprueba si en realidad los almacena
insert into csv1 values (3, 'Paco', 'Ruiz', 'Pineda');
select * from csv1;
-- Apesar de haber insertado una fila, aparece vacía la tabla.alter

