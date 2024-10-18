<center>
<img src="https://objetivo.news/download/multimedia.normal.bcba10cea1861629.Y29kZXJob3VzZS1xdWUtZXMtcXVlLWhhY2VuX25vcm1hbC53ZWJw.webp" style="width: 100% ; aspect-ratio:16/9">
</center>


# <center>Curso de SQL en Coderhouse</center>

## SQL	Inicia el 20-07-2024 y finaliza el 19-10-2024

### Alumno: Roberto Agustín Mejía Collazos
### Comision: 59410
### Docente: Anderson Ocaña 
### [Notion Material Extendido](https://almondine-stealer-d91.notion.site/0fe6b4bc1c354ef99f0f88380a7e924a?v=ac85a3a9ef1c4616bcfff66e99ce10ea&pvs=4)


Aquí tienes la documentación para el archivo `README.md` basada en el código proporcionado, con el formato adecuado:

```md
# Proyecto Biblioteca

Este proyecto tiene como objetivo gestionar la información de una biblioteca, incluyendo el manejo de editoriales, géneros, usuarios, autores, libros, préstamos, y su relación mediante SQL. Además, se han creado vistas, funciones, procedimientos almacenados y triggers para optimizar el funcionamiento de la base de datos.

## Contenido

1. [Estructura de la Base de Datos](#estructura-de-la-base-de-datos)
2. [Vistas](#vistas)
3. [Funciones](#funciones)
4. [Procedimientos Almacenados](#procedimientos-almacenados)
5. [Triggers](#triggers)
6. [Manejo de Usuarios](#manejo-de-usuarios)

---

## Estructura de la Base de Datos

### Creación de Tablas

Se incluyen las siguientes tablas: `Editoriales`, `Generos`, `Usuarios`, `Autores`, `Libros`, `Prestamos`, y la tabla intermedia `Libro_Autor`.

```sql
CREATE TABLE IF NOT EXISTS Editoriales (
    ID_Editorial INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Direccion VARCHAR(255),
    Telefono VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Generos (
    ID_Genero INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Usuarios (
    ID_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    Fecha_Registro DATE
);

CREATE TABLE IF NOT EXISTS Autores (
    ID_Autor INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    Nacionalidad VARCHAR(100),
    Fecha_Nacimiento DATE
);

CREATE TABLE IF NOT EXISTS Libros (
    ID_Libro INT PRIMARY KEY,
    Titulo VARCHAR(255),
    Ano_Publicacion INT,
    ID_Genero INT,
    ID_Editorial INT,
    Precio DECIMAL(10, 2),
    Stock INT,
    FOREIGN KEY (ID_Genero) REFERENCES Generos(ID_Genero),
    FOREIGN KEY (ID_Editorial) REFERENCES Editoriales(ID_Editorial)
);

CREATE TABLE IF NOT EXISTS Prestamos (
    ID_Prestamo INT AUTO_INCREMENT PRIMARY KEY,
    ID_Libro INT,
    ID_Usuario INT,
    Fecha_Prestamo DATE,
    Fecha_Devolucion DATE,
    Cantidad_Pedidos INT,
    FOREIGN KEY (ID_Libro) REFERENCES Libros(ID_Libro),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario)
);

CREATE TABLE IF NOT EXISTS Libro_Autor (
    ID_Libro INT,
    ID_Autor INT,
    PRIMARY KEY (ID_Libro, ID_Autor),
    FOREIGN KEY (ID_Libro) REFERENCES Libros(ID_Libro),
    FOREIGN KEY (ID_Autor) REFERENCES Autores(ID_Autor)
);
```

### Inserción de Datos

La base de datos incluye datos de prueba para las tablas de `Editoriales`, `Generos`, `Usuarios`, `Autores`, `Libros`, `Prestamos`, y `Libro_Autor`.

```sql
INSERT INTO Editoriales (Nombre, Direccion, Telefono) VALUES
('Editorial Planeta', 'Av. Javier Prado 123, Lima', '01-2345678'),
('Penguin Random House', 'Calle de las Letras 45, Madrid', '+34 910 123 456'),
...
```

## Vistas

### Vista de Préstamos de Usuarios

Esta vista muestra los usuarios junto con la fecha de devolución más reciente de sus préstamos.

```sql
CREATE VIEW vw_prestamos_usuarios AS
SELECT usuarios.ID_Usuario, usuarios.Nombre, MAX(prestamos.Fecha_Devolucion) AS Ultima_Fecha_Devolucion
FROM usuarios
INNER JOIN prestamos ON usuarios.ID_Usuario = prestamos.ID_Usuario
GROUP BY usuarios.ID_Usuario;
```

### Vista de Libros Más Caros

Muestra los cinco libros más caros.

```sql
CREATE VIEW vw_libros_caros AS
SELECT ID_Libro, Titulo, Precio 
FROM libros 
ORDER BY Precio DESC LIMIT 5;
```

### Vista de Autor Más Joven

Muestra a los autores más jóvenes.

```sql
CREATE VIEW vw_autores_top_jovenes AS
SELECT ID_Autor, Nombre, Nacionalidad, Fecha_Nacimiento
FROM autores 
ORDER BY ABS(DATEDIFF(Fecha_Nacimiento, NOW())) LIMIT 5;
```

### Vista de Stock de Libros

Muestra el total de libros en stock.

```sql
CREATE VIEW vw_stock_libros AS
SELECT COUNT(ID_Libro) AS STOCK_LIBROS FROM Libros;
```

## Funciones

### Función: Ampliación de Fecha de Devolución

Esta función permite agregar días adicionales a la fecha de devolución de un préstamo.

```sql
DELIMITER //
CREATE FUNCTION fn_agregar_dias_prestamo (prestamo_id INT, dias INT)
RETURNS VARCHAR(255)
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
END;
//
DELIMITER ;
```

### Función: Ver Fecha de Nacimiento de Autores

Permite obtener la fecha de nacimiento de un autor a partir de su ID.

```sql
DELIMITER //
CREATE FUNCTION fn_fecha_nacimiento_autor (autor_id INT)
RETURNS DATE
READS SQL DATA
BEGIN
    DECLARE fecha_autor DATE;
    SELECT Fecha_Nacimiento INTO fecha_autor
    FROM autores
    WHERE ID_Autor = autor_id;
    RETURN fecha_autor;
END;
//
DELIMITER ;
```

## Procedimientos Almacenados

### Procedimiento: Préstamo de Stock

Actualiza el stock de un libro después de un préstamo.

```sql
DELIMITER //
CREATE PROCEDURE sp_prestamo_stock(IN ID_Miembro INT, IN ID_Libro INT, OUT cantidad INT)
BEGIN
    DECLARE cantidad_libros INT;    
    SELECT Stock INTO cantidad_libros FROM libros WHERE libros.ID_Libro = ID_Libro; 
    IF cantidad_libros > 0 THEN
        UPDATE libros SET Stock = Stock - 1 WHERE libros.ID_Libro = ID_Libro;
        SET cantidad = cantidad_libros - 1;
        SELECT "Se ha realizado el préstamo exitosamente." AS Mensaje;
    ELSE
        SELECT "No es posible realizar préstamos." AS Mensaje;
    END IF;
END //
DELIMITER ;
```

### Procedimiento: Categoría de Usuarios

Clasifica a los usuarios según la cantidad de libros prestados.

```sql
DELIMITER //
CREATE PROCEDURE sp_tipo_lector(IN ID_Usuario INT)
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
END //
DELIMITER ;
```

### Procedimiento: Libros al Azar

Selecciona tres libros de forma aleatoria.

```sql
DELIMITER //
CREATE PROCEDURE sp_libro_azar()
BEGIN
    SET @iterador = 0;
    WHILE @iterador < 3 DO
        SELECT ID_Libro, Titulo FROM libros ORDER BY RAND() LIMIT 1;
        SET @iterador = @iterador + 1;
    END WHILE;
END //
DELIMITER ;
```

## Triggers

### Trigger: Insertar Nuevo Libro-Autor

Inserta automáticamente un registro en la tabla `Libro_Autor` cuando se agrega un nuevo libro.

```sql
DELIMITER //
CREATE TRIGGER tg_nuevo_libro_autor
AFTER INSERT ON Libros
FOR EACH ROW
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Libro_Autor WHERE ID_Libro = NEW.ID_Libro) THEN
        INSERT INTO Libro_Autor (ID_Libro, ID_Autor) VALUES (NEW.ID_Libro, 1);
    END IF;
END //
DELIMITER ;
```

### Trigger: Actualizar Stock de Libros

Actualiza el stock de un libro tras realizar un préstamo.

```sql
DELIMITER //
CREATE TRIGGER tg_actualizar_stock_prestamo
AFTER INSERT ON Prestamos
FOR EACH ROW
BEGIN
    UPDATE Libros
    SET Stock = Stock - NEW.Cantidad_Pedidos
    WHERE ID_Libro = NEW.ID_Libro;
END //
DELIMITER ;
```

## Manejo de Usuarios

Se han creado varios usuarios con distintos niveles de permisos.

```sql
-- Usuario con permisos limitados
CREATE USER 'coderhouse_invitado'@'%' IDENTIFIED BY 'coderhouse';
GRANT SELECT ON proyecto_biblioteca.libros TO 'coderhouse_invitado'@'%';

-- Usuario con acceso total a la base de datos del proyecto
CREATE USER 'coderhouse_alumno'@'%' IDENT