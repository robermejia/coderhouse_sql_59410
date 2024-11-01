-- Active: 1722556967735@@127.0.0.1@3306@proyecto_biblioteca
-- ################################################ TRANSACCIONES #################################################
-- ======= TRANSACCIÓN 1 - PRÉSTAMO LIBROS =======
DROP PROCEDURE IF EXISTS RealizarPrestamo;
DELIMITER //
CREATE PROCEDURE RealizarPrestamo(IN libro_id INT, IN usuario_id INT)
BEGIN
    -- Iniciar la transacción
    START TRANSACTION;

    -- Reducir el stock del libro al realizar el préstamo
    UPDATE Libros
    SET Stock = Stock - 1
    WHERE ID_Libro = libro_id AND Stock > 0;

    -- Verificar que el stock fue actualizado correctamente
    IF ROW_COUNT() = 0 THEN
        -- Si no se actualizó, deshacer la transacción y lanzar un error
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay stock disponible para el libro solicitado.';
    ELSE
        -- Registrar el préstamo del libro si hay stock disponible
        INSERT INTO Prestamos (ID_Libro, ID_Usuario, Fecha_Prestamo, Fecha_Devolucion)
        VALUES (libro_id, usuario_id, CURRENT_DATE, DATE_ADD(CURRENT_DATE, INTERVAL 15 DAY));

        -- Confirmar la transacción completa
        COMMIT;
    END IF;
END //

DELIMITER ;

CALL RealizarPrestamo(1, 2);
