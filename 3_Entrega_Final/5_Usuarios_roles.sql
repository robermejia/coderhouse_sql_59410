-- ######################################## USERS ##############################################
SELECT Host, User FROM mysql.user; -- Muestra todos los usuarios;
SELECT USER(); -- Ver el usuario actual
FLUSH PRIVILEGES;
DROP USER IF EXISTS 'coderhouse'@'%', 'coderhouse_alumno'@'%', 'coderhouse_docente'@'%', 'coderhouse_invitado'@'%';
-- ========= USER 1 (SIN PERMISOS) ===============
CREATE USER 'coderhouse'@'%'
IDENTIFIED BY 'coderhouse';
SHOW GRANTS FOR 'coderhouse_alumno'@'%'; -- Ver permisos
-- ========= USER 2 (CON DERECHOS RESTRINGIDOS) ===============
CREATE USER 'coderhouse_invitado'@'%'
IDENTIFIED BY 'coderhouse'
COMMENT 'ESTE USUARIO SOLO VA ACCEDER POR MEDIO DE WORKBENCH';
GRANT SELECT ON proyecto_biblioteca.libros* TO 'coderhouse_invitado'@'%'; -- Dar permisos a una sola tabla
SHOW GRANTS FOR 'coderhouse_invitado'@'%'; -- Ver permisos
-- ========= USER 3 (CON ACCESO A UNA BASE DE DATOS) ===============
CREATE USER 'coderhouse_alumno'@'%'
IDENTIFIED BY 'coderhouse'
COMMENT 'ESTE USUARIO SOLO VA ACCEDER POR MEDIO DE WORKBENCH';
GRANT ALL ON proyecto_biblioteca.* TO 'coderhouse_alumno' @'%'; -- Dar permisos de una sola bd
SHOW GRANTS FOR 'coderhouse_alumno'@'%'; -- Ver permisos
-- ========= USER 4 (CON TODOS LOS DERECHOS) ===============
CREATE USER 'coderhouse_docente'@'%'
IDENTIFIED BY 'coderhouse'
COMMENT 'ESTE USUARIO SOLO VA ACCEDER POR MEDIO DE WORKBENCH';
GRANT ALL ON *.* TO 'coderhouse_docente'@'%'; -- Dar permisos
SHOW GRANTS FOR 'coderhouse_docente'@'%'; -- Ver permisos a todas las bd

