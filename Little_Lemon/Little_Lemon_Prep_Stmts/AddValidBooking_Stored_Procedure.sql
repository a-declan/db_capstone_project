DELIMITER //

DROP PROCEDURE IF EXISTS AddValidBooking;
CREATE PROCEDURE AddValidBooking(IN booking_date DATE, IN table_number INT)
BEGIN
    DECLARE TableExists INT;

    -- Start a transaction
    START TRANSACTION;

    -- Insert a new booking record
    INSERT INTO Bookings (Date, TableNo, CustomerID, TimeSlot, EmployeeID)
    VALUES (booking_date, table_number, 5, '17:00:00', 5); 

    -- Check if the table is already booked on the given date
    SELECT COUNT(*) INTO TableExists
    FROM Bookings
    WHERE TableNo = table_number
    AND Date = booking_date;

    IF TableExists > 1 THEN
        -- Table is already booked - Rollback the transaction
        ROLLBACK;
        SELECT CONCAT("Table ", table_number, " is booked - booking cancelled!") AS Result;
    ELSE
        -- Table is available - Commit the transaction
        COMMIT;
        SELECT CONCAT("Table ", table_number, " booked successfully!") AS Result;
    END IF;
END //

DELIMITER ;

CALL AddValidBooking('2022-10-13',7);