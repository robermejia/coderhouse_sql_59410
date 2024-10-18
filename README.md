<center>
<img src="https://objetivo.news/download/multimedia.normal.bcba10cea1861629.Y29kZXJob3VzZS1xdWUtZXMtcXVlLWhhY2VuX25vcm1hbC53ZWJw.webp" style="width: 100% ; aspect-ratio:16/9">
</center>


# <center>Curso de SQL en Coderhouse</center>

## SQL	Inicia el 20-07-2024 y finaliza el 19-10-2024

### Alumno: Roberto Agustín Mejía Collazos
### Comision: 59410
### Docente: Anderson Ocaña 
### [Notion Material Extendido](https://almondine-stealer-d91.notion.site/0fe6b4bc1c354ef99f0f88380a7e924a?v=ac85a3a9ef1c4616bcfff66e99ce10ea&pvs=4)

# Proyecto Biblioteca

Este proyecto implementa una base de datos para gestionar una biblioteca, incluyendo editoriales, géneros, usuarios, autores, libros, préstamos, y autores relacionados con libros. Además, se han creado vistas, funciones, procedimientos almacenados y triggers para una gestión avanzada de los datos. También se incluye la configuración de usuarios con permisos específicos.

## Estructura de la Base de Datos

### 1. Tablas

- **Editoriales:** Almacena información sobre las editoriales de los libros.
  - ID_Editorial (INT, PRIMARY KEY, AUTO_INCREMENT)
  - Nombre (VARCHAR)
  - Direccion (VARCHAR)
  - Telefono (VARCHAR)

- **Géneros:** Registra los géneros literarios.
  - ID_Genero (INT, PRIMARY KEY, AUTO_INCREMENT)
  - Nombre (VARCHAR)

- **Usuarios:** Registra la información de los usuarios de la biblioteca.
  - ID_Usuario (INT, PRIMARY KEY, AUTO_INCREMENT)
  - Nombre (VARCHAR)
  - Apellido (VARCHAR)
  - Direccion (VARCHAR)
  - Telefono (VARCHAR)
  - Fecha_Registro (DATE)

- **Autores:** Contiene la información de los autores de los libros.
  - ID_Autor (INT, PRIMARY KEY)
  - Nombre (VARCHAR)
  - Apellido (VARCHAR)
  - Nacionalidad (VARCHAR)
  - Fecha_Nacimiento (DATE)

- **Libros:** Registra la información de los libros disponibles.
  - ID_Libro (INT, PRIMARY KEY)
  - Titulo (VARCHAR)
  - Año_Publicacion (INT)
  - ID_Genero (INT, FOREIGN KEY)
  - ID_Editorial (INT, FOREIGN KEY)
  - Precio (DECIMAL)
  - Stock (INT)

- **Préstamos:** Registra los préstamos realizados por los usuarios.
  - ID_Prestamo (INT, PRIMARY KEY, AUTO_INCREMENT)
  - ID_Libro (INT, FOREIGN KEY)
  - ID_Usuario (INT, FOREIGN KEY)
  - Fecha_Prestamo (DATE)
  - Fecha_Devolucion (DATE)
  - Cantidad_Pedidos (INT)

- **Libro_Autor:** Relaciona los libros con los autores.
  - ID_Libro (INT, FOREIGN KEY)
  - ID_Autor (INT, FOREIGN KEY)

### 2. Vistas

- **vw_prestamos_usuarios:** Muestra la última fecha de devolución por cada usuario.
- **vw_libros_caros:** Muestra los cinco libros más caros.
- **vw_autores_top_jovenes:** Lista los autores más jóvenes.
- **vw_stock_libros:** Muestra el número total de libros en stock.

### 3. Funciones

- **fn_agregar_dias_prestamo:** Extiende la fecha de devolución de un préstamo.
  - Parámetros: `prestamo_id` (INT), `dias` (INT)
  - Devuelve: Nueva fecha de devolución con la extensión.
  
- **fn_fecha_nacimiento_autor:** Devuelve la fecha de nacimiento de un autor por su ID.
  - Parámetro: `autor_id` (INT)
  - Devuelve: Fecha de nacimiento (DATE)

### 4. Procedimientos Almacenados

- **sp_prestamo_stock:** Realiza un préstamo y actualiza el stock de libros.
  - Parámetros: `ID_Miembro` (INT), `ID_Libro` (INT), `cantidad` (OUT)

- **sp_tipo_lector:** Determina la categoría de un usuario según la cantidad de préstamos.
  - Parámetro: `ID_Usuario` (INT)

- **sp_libro_azar:** Selecciona al azar tres libros.

### 5. Triggers

- **tg_nuevo_libro_autor:** Inserta un registro en la tabla `Libro_Autor` cuando se agrega un nuevo libro.
- **tg_actualizar_stock_prestamo:** Actualiza el stock de libros tras realizar un préstamo.

## Inserciones de Datos

El script incluye datos de prueba para las siguientes tablas:

- **Editoriales:** 12 registros.
- **Géneros:** 12 géneros diferentes.
- **Usuarios:** 12 usuarios registrados.
- **Autores:** 12 autores destacados.
- **Libros:** 12 libros de distintos géneros y autores.
- **Préstamos:** 12 préstamos realizados por usuarios.
- **Libro_Autor:** Relaciones entre libros y autores.

## Usuarios y Permisos

Se han creado diferentes usuarios con permisos específicos para acceder y modificar la base de datos:

- **coderhouse:** Usuario sin permisos.
- **coderhouse_invitado:** Usuario con permisos de solo lectura en la tabla `libros`.
- **coderhouse_alumno:** Usuario con acceso completo a la base de datos `proyecto_biblioteca`.
- **coderhouse_docente:** Usuario con todos los permisos sobre todas las bases de datos.

## Ejecución del Proyecto

1. Ejecuta el script en tu gestor de base de datos MySQL.
2. Las tablas, vistas, funciones, procedimientos, triggers y usuarios serán creados.
3. Usa las vistas, funciones y procedimientos para obtener información avanzada sobre los préstamos y libros.




