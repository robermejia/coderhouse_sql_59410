-- ######################################## USERS ##############################################
SELECT Host, User FROM mysql.user; -- Muestra todos los usuarios;
SELECT USER(); -- Ver el usuario actual
-- ========= USER 1 ===============
CREATE USER 'coderhouse'@'%'
IDENTIFIED BY 'coderhouse';
-- ========= USER 2 ===============
CREATE USER 'coderhouse_alumno'@'%'
IDENTIFIED BY 'coderhouse'
COMMENT 'ESTE USUARIO SOLO VA ACCEDER POR MEDIO DE WORKBENCH'