-- ######################################## ROLES ##############################################
-- Eliminar roles si existen
DROP ROLE IF EXISTS role_proyecto_biblioteca_admin;
DROP ROLE IF EXISTS role_proyecto_biblioteca_reader;
-- #### ROL 1 (ACCESO COMPLETO A BD "proyecto_biblioteca") #####################################
CREATE ROLE role_proyecto_biblioteca_admin;
GRANT ALL PRIVILEGES ON proyecto_biblioteca.* TO role_proyecto_biblioteca_admin;

-- #### ROL 2 (SOLO LECTURA EN LA TABLA "libros" DE BD "proyecto_biblioteca") ##################
CREATE ROLE role_proyecto_biblioteca_reader;
GRANT SELECT ON proyecto_biblioteca.libros TO role_proyecto_biblioteca_reader;
-- ######################################## USERS ##############################################
SELECT Host, User FROM mysql.user; -- Muestra todos los usuarios;
SELECT USER(); -- Ver el usuario actual
FLUSH PRIVILEGES; -- ACTUALIZAR PRIVILEGIOS
-- ######################################## USERS ##############################################
DROP USER IF EXISTS 'coderhouse'@'%', 'coderhouse_alumno'@'%', 'coderhouse_docente'@'%', 'coderhouse_invitado'@'%';
-- ========= USER 1 (SIN PERMISOS) ===============
CREATE USER 'coderhouse'@'%'
IDENTIFIED BY 'coderhouse';
SHOW GRANTS FOR 'coderhouse'@'%'; -- Ver permisos
-- ========= USER 2 (CON DERECHOS RESTRINGIDOS) ===============
CREATE USER 'coderhouse_invitado'@'%' IDENTIFIED BY 'coderhouse';
GRANT role_proyecto_biblioteca_reader TO 'coderhouse_invitado'@'%'; 
SHOW GRANTS FOR 'coderhouse_invitado'@'%'; -- Ver permisos
-- ========= USER 3 (CON ACCESO A UNA BASE DE DATOS) ===============
CREATE USER 'coderhouse_alumno'@'%' IDENTIFIED BY 'coderhouse';
GRANT role_proyecto_biblioteca_admin TO 'coderhouse_alumno'@'%';
SHOW GRANTS FOR 'coderhouse_alumno'@'%'; -- Ver permisos
-- ========= USER 4 (CON TODOS LOS DERECHOS) ===============
CREATE USER 'coderhouse_docente'@'%' IDENTIFIED BY 'coderhouse';
GRANT role_proyecto_biblioteca_admin TO 'coderhouse_docente'@'%';
SHOW GRANTS FOR 'coderhouse_docente'@'%'; -- Ver permisos a todas las bd

