-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto_biblioteca
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autores` (
  `ID_Autor` int NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Apellido` varchar(255) DEFAULT NULL,
  `Nacionalidad` varchar(100) DEFAULT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`ID_Autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (1,'Gabriel','García Márquez','Colombiana','1927-03-06'),(2,'Isaac','Asimov','Rusa-Americana','1920-01-02'),(3,'Mario','Vargas Llosa','Peruana','1936-03-28'),(4,'J.K.','Rowling','Británica','1965-07-31'),(5,'George','Orwell','Británica','1903-06-25'),(6,'Julio','Verne','Francesa','1828-02-08'),(7,'Jane','Austen','Británica','1775-12-16'),(8,'Ernest','Hemingway','Americana','1899-07-21'),(9,'Agatha','Christie','Británica','1890-09-15'),(10,'H.P.','Lovecraft','Americana','1890-08-20'),(11,'Miguel de','Cervantes','Española','1547-09-29'),(12,'Virginia','Woolf','Británica','1882-01-25');
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editoriales`
--

DROP TABLE IF EXISTS `editoriales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editoriales` (
  `ID_Editorial` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Editorial`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoriales`
--

LOCK TABLES `editoriales` WRITE;
/*!40000 ALTER TABLE `editoriales` DISABLE KEYS */;
INSERT INTO `editoriales` VALUES (1,'Editorial Planeta','Av. Javier Prado 123, Lima','01-2345678'),(2,'Penguin Random House','Calle de las Letras 45, Madrid','+34 910 123 456'),(3,'HarperCollins','195 Broadway, New York','+1 212-207-7000'),(4,'Simon & Schuster','1230 Avenue of the Americas, New York','+1 212-698-7000'),(5,'Alfaguara','Calle Alfonso XII, 62, Madrid','+34 917 595 300'),(6,'Anagrama','Calle Pedró Martell, 19, Barcelona','+34 933 687 850'),(7,'Random House Mondadori','Av. Diagonal, 662-664, Barcelona','+34 934 928 840'),(8,'Editorial SM','Calle de Impresores, 2, Boadilla del Monte','+34 917 596 400'),(9,'Santillana','Calle del Tambre, 50, Madrid','+34 913 984 500'),(10,'Edebé','Calle de Provença, 386, Barcelona','+34 934 535 500'),(11,'Minotauro','Calle de Espronceda, 32, Barcelona','+34 933 663 600'),(12,'Roca Editorial','Calle de Roger de Llúria, 118, Barcelona','+34 932 082 040');
/*!40000 ALTER TABLE `editoriales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generos`
--

DROP TABLE IF EXISTS `generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generos` (
  `ID_Genero` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_Genero`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generos`
--

LOCK TABLES `generos` WRITE;
/*!40000 ALTER TABLE `generos` DISABLE KEYS */;
INSERT INTO `generos` VALUES (1,'Novela'),(2,'Ciencia Ficción'),(3,'Historia'),(4,'Fantasía'),(5,'Biografía'),(6,'Romance'),(7,'Misterio'),(8,'Terror'),(9,'Aventura'),(10,'Poesía'),(11,'Ensayo'),(12,'Drama');
/*!40000 ALTER TABLE `generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro_autor`
--

DROP TABLE IF EXISTS `libro_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro_autor` (
  `ID_Libro` int NOT NULL,
  `ID_Autor` int NOT NULL,
  PRIMARY KEY (`ID_Libro`,`ID_Autor`),
  KEY `ID_Autor` (`ID_Autor`),
  CONSTRAINT `libro_autor_ibfk_1` FOREIGN KEY (`ID_Libro`) REFERENCES `libros` (`ID_Libro`),
  CONSTRAINT `libro_autor_ibfk_2` FOREIGN KEY (`ID_Autor`) REFERENCES `autores` (`ID_Autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro_autor`
--

LOCK TABLES `libro_autor` WRITE;
/*!40000 ALTER TABLE `libro_autor` DISABLE KEYS */;
INSERT INTO `libro_autor` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12);
/*!40000 ALTER TABLE `libro_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libros` (
  `ID_Libro` int NOT NULL,
  `Titulo` varchar(255) DEFAULT NULL,
  `Ano_Publicacion` int DEFAULT NULL,
  `ID_Genero` int DEFAULT NULL,
  `ID_Editorial` int DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  `Stock` int DEFAULT NULL,
  PRIMARY KEY (`ID_Libro`),
  KEY `ID_Genero` (`ID_Genero`),
  KEY `ID_Editorial` (`ID_Editorial`),
  CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`ID_Genero`) REFERENCES `generos` (`ID_Genero`),
  CONSTRAINT `libros_ibfk_2` FOREIGN KEY (`ID_Editorial`) REFERENCES `editoriales` (`ID_Editorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (1,'Cien Años de Soledad',1967,1,1,150.50,10),(2,'Fundación',1951,2,2,120.75,15),(3,'La Casa Verde',1966,1,3,95.25,8),(4,'Harry Potter y la Piedra Filosofal',1997,4,4,180.30,20),(5,'1984',1949,6,5,88.90,12),(6,'Viaje al Centro de la Tierra',1864,4,6,75.60,5),(7,'Orgullo y Prejuicio',1813,5,7,68.40,7),(8,'El Viejo y el Mar',1952,1,8,105.80,18),(9,'Asesinato en el Orient Express',1934,7,9,110.20,14),(10,'La Llamada de Cthulhu',1928,8,10,95.75,9),(11,'Don Quijote de la Mancha',1605,1,11,65.90,25),(12,'Al Faro',1927,12,12,82.45,6);
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_nuevo_libro_autor` AFTER INSERT ON `libros` FOR EACH ROW BEGIN
-- Verificar si el libro ya existe en la tabla Libro_Autor
    IF NOT EXISTS (SELECT 1 FROM Libro_Autor WHERE ID_Libro = NEW.ID_Libro) THEN
    -- Insertar un nuevo registro en la tabla Libro_Autor
    INSERT INTO Libro_Autor (ID_Libro, ID_Autor) VALUES (NEW.ID_Libro, 1); -- Aquí puedes cambiar el ID_Autor por el que consideres 
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamos` (
  `ID_Prestamo` int NOT NULL AUTO_INCREMENT,
  `ID_Libro` int DEFAULT NULL,
  `ID_Usuario` int DEFAULT NULL,
  `Fecha_Prestamo` date DEFAULT NULL,
  `Fecha_Devolucion` date DEFAULT NULL,
  `Cantidad_Pedidos` int DEFAULT NULL,
  PRIMARY KEY (`ID_Prestamo`),
  KEY `ID_Libro` (`ID_Libro`),
  KEY `ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`ID_Libro`) REFERENCES `libros` (`ID_Libro`),
  CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuarios` (`ID_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
INSERT INTO `prestamos` VALUES (1,1,1,'2024-08-10','2024-08-20',2),(2,2,2,'2024-08-15','2024-08-25',1),(3,3,3,'2024-07-01','2024-07-15',3),(4,4,4,'2024-07-20','2024-08-05',0),(5,5,5,'2024-06-25','2024-07-05',5),(6,6,6,'2024-05-15','2024-05-25',2),(7,7,7,'2024-04-10','2024-04-20',1),(8,8,8,'2024-03-18','2024-03-28',4),(9,9,9,'2024-02-20','2024-03-01',0),(10,10,10,'2024-01-12','2024-01-22',2),(11,11,11,'2024-12-05','2024-12-15',3),(12,12,12,'2024-11-01','2024-11-11',1);
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_actualizar_stock_prestamo` AFTER INSERT ON `prestamos` FOR EACH ROW BEGIN
-- Actualizar el stock del libro en la tabla Libros
    UPDATE Libros
    SET Stock = Stock - NEW.Cantidad_Pedidos
    WHERE ID_Libro = NEW.ID_Libro;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `ID_Usuario` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) DEFAULT NULL,
  `Apellido` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Fecha_Registro` date DEFAULT NULL,
  PRIMARY KEY (`ID_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Carlos','López','Calle Falsa 123, Lima','987654321','2024-01-15'),(2,'María','Pérez','Av. Universitaria 678, Lima','912345678','2024-02-20'),(3,'José','Martínez','Av. Pardo y Aliaga 120, Lima','987654322','2024-03-10'),(4,'Lucía','Gómez','Jirón Miraflores 567, Lima','987654323','2024-04-05'),(5,'Andrés','Ramírez','Calle Las Lomas 876, Lima','987654324','2024-05-12'),(6,'Ana','Torres','Av. Brasil 450, Lima','987654325','2024-06-18'),(7,'Jorge','Rodríguez','Calle Los Sauces 34, Lima','987654326','2024-07-25'),(8,'Elena','Gutiérrez','Av. Benavides 223, Lima','987654327','2024-08-01'),(9,'Ricardo','Méndez','Calle Los Olivos 789, Lima','987654328','2024-08-15'),(10,'Isabel','Fernández','Jirón Lampa 234, Lima','987654329','2024-09-20'),(11,'Rosa','García','Av. San Felipe 453, Lima','987654330','2024-10-05'),(12,'Diego','Herrera','Calle Las Flores 123, Lima','987654331','2024-11-10');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_autores_top_jovenes`
--

DROP TABLE IF EXISTS `vw_autores_top_jovenes`;
/*!50001 DROP VIEW IF EXISTS `vw_autores_top_jovenes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_autores_top_jovenes` AS SELECT 
 1 AS `ID_Autor`,
 1 AS `Nombre`,
 1 AS `Nacionalidad`,
 1 AS `Fecha_Nacimiento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_libros_caros`
--

DROP TABLE IF EXISTS `vw_libros_caros`;
/*!50001 DROP VIEW IF EXISTS `vw_libros_caros`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_libros_caros` AS SELECT 
 1 AS `ID_Libro`,
 1 AS `Titulo`,
 1 AS `Precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_prestamos_usuarios`
--

DROP TABLE IF EXISTS `vw_prestamos_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vw_prestamos_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_prestamos_usuarios` AS SELECT 
 1 AS `ID_Usuario`,
 1 AS `Nombre`,
 1 AS `Ultima_Fecha_Devolucion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_stock_libros`
--

DROP TABLE IF EXISTS `vw_stock_libros`;
/*!50001 DROP VIEW IF EXISTS `vw_stock_libros`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_stock_libros` AS SELECT 
 1 AS `STOCK_LIBROS`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'proyecto_biblioteca'
--

--
-- Dumping routines for database 'proyecto_biblioteca'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_agregar_dias_prestamo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_agregar_dias_prestamo`(prestamo_id INT, dias INT) RETURNS varchar(255) CHARSET utf8mb4
    READS SQL DATA
BEGIN
    DECLARE fecha_prestamo DATE;
    DECLARE fecha_limite DATE;

    SELECT Fecha_Devolucion INTO fecha_prestamo
    FROM prestamos
    WHERE ID_Prestamo = prestamo_id;

    SET fecha_limite = fecha_prestamo + INTERVAL dias DAY;
    RETURN CONCAT('Fecha de devolución: ', DATE_FORMAT(fecha_prestamo, '%Y-%m-%d'), 
                ' - Nueva fecha límite: ', DATE_FORMAT(fecha_limite, '%Y-%m-%d'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_fecha_nacimiento_autor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_fecha_nacimiento_autor`(autor_id INT) RETURNS date
    READS SQL DATA
BEGIN
    DECLARE fecha_autor DATE;
    SELECT Fecha_Nacimiento INTO fecha_autor
    FROM autores
    WHERE ID_Autor = autor_id;
    RETURN fecha_autor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_libro_azar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_libro_azar`()
BEGIN
    SET @iterador = 0;
    WHILE @iterador < 3 DO
        SELECT ID_Libro, Titulo FROM libros ORDER BY RAND() LIMIT 1;
        SET @iterador = @iterador + 1;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_prestamo_stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_prestamo_stock`(IN ID_Miembro INT, IN ID_Libro INT, OUT cantidad INT)
BEGIN
    DECLARE cantidad_libros INT;    
    SELECT Stock INTO cantidad_libros FROM libros WHERE libros.ID_Libro = ID_Libro; 
    IF cantidad_libros > 0 THEN
        -- Actualizar el stock en la tabla libros
        UPDATE libros SET Stock = Stock - 1 WHERE libros.ID_Libro = ID_Libro;
        
        SET cantidad = cantidad_libros - 1;
        SELECT "Se ha realizado el préstamo exitosamente." AS Mensaje;
    ELSE
        SELECT "No es posible realizar préstamos." AS Mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tipo_lector` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tipo_lector`(IN ID_Usuario INT)
BEGIN
    SET @cantidad = (SELECT Cantidad_Pedidos FROM prestamos
                    WHERE prestamos.ID_Usuario = ID_Usuario);
    CASE
        WHEN @cantidad = 5 THEN
            SELECT "Fanático" AS Mensaje;
        WHEN @cantidad = 4 THEN
            SELECT "Aficionado" AS Mensaje;
        WHEN @cantidad = 3 THEN
            SELECT "Promedio" AS Mensaje;
        ELSE
            SELECT "Nuevo" AS Mensaje;
    END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_autores_top_jovenes`
--

/*!50001 DROP VIEW IF EXISTS `vw_autores_top_jovenes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_autores_top_jovenes` AS select `autores`.`ID_Autor` AS `ID_Autor`,`autores`.`Nombre` AS `Nombre`,`autores`.`Nacionalidad` AS `Nacionalidad`,`autores`.`Fecha_Nacimiento` AS `Fecha_Nacimiento` from `autores` order by abs((to_days(`autores`.`Fecha_Nacimiento`) - to_days(now()))) limit 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_libros_caros`
--

/*!50001 DROP VIEW IF EXISTS `vw_libros_caros`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_libros_caros` AS select `libros`.`ID_Libro` AS `ID_Libro`,`libros`.`Titulo` AS `Titulo`,`libros`.`Precio` AS `Precio` from `libros` order by `libros`.`Precio` desc limit 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_prestamos_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `vw_prestamos_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_prestamos_usuarios` AS select `usuarios`.`ID_Usuario` AS `ID_Usuario`,`usuarios`.`Nombre` AS `Nombre`,max(`prestamos`.`Fecha_Devolucion`) AS `Ultima_Fecha_Devolucion` from (`usuarios` join `prestamos` on((`usuarios`.`ID_Usuario` = `prestamos`.`ID_Usuario`))) group by `usuarios`.`ID_Usuario` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_stock_libros`
--

/*!50001 DROP VIEW IF EXISTS `vw_stock_libros`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_stock_libros` AS select count(`libros`.`ID_Libro`) AS `STOCK_LIBROS` from `libros` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-16 15:25:34
