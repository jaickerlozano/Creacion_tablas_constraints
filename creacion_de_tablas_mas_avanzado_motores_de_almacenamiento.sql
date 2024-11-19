/*MOTORESDEALMACENAMIENTO
 Dentro de la base de datos ‘academia’...
 4. Ir al directorio y comprobar que tenemos un directorio “academia” para
 nuestra base de datos
 5. Comprobar que las tablas que existen. Deben tener la extensión “ibd”, ya que
 todas las que hemos creado son InnoDB
 6. Crear una tabla llamada “isam1” de tipo MYISAM con la siguiente estructura:
 COLUMNA
 Código
 Nombre
 TIPO
 INT
 VARCHAR(50)
 Apellido1
 Apellido2
 VARCHAR(50)
 VARCHAR(50)
 7. Comprobar cómo se ha creado en el directorio. Deben existir 3 ficheros
 8. Crear otra tabla denomina csv1 con la misma estructura que “isam1” con el
 motor CSV
 9. Vemoscomoaparece en el directorio.
 10. Insertamos un par de filas en la tabla.
 11. Abrimos el fichero csv1.csv con algún editor, por ejemplo el bloc de notas.
 12. Si intentamos añadir algo o modificar algún valor. ¿nos deja? o NO, a pesar de
 ser un CSV, está protegido, de lo contrario podríamos tener problemas de
 corrupción
 13. Cambiar el motor de la tabla a InnoDB. Comprobamos que se ha modificado
 14. Comprobamos que el resultado es el mismo. Comprobar si también ha
 cambiado en el directorio de datos.
Módulo: SQL
 Profesor: Yolanda López
 15. Convertirlo a un motor de tipo ARCHIVE y comprobar el resultado del
 directorio.
 16. Probar ahora el motor BLACKHOLE,que es para poder probar cosas. Permite
 comandos de tipo INSERT pero realmente no almacena nada. • Cambiamos el
 motor a BLACKHOLE.
 17. Comprobamos que en el directorio de datos no aparece nada.
 18. Si hacemos una SELECT vemos que no sale nada.
 19. Prueba con algún Insert y comprueba si en realidad los almacena*/
 
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
