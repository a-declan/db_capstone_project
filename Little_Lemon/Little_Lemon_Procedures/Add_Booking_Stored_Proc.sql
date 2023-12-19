DELIMITER //
DROP PROCEDURE IF EXISTS AddBooking;
CREATE PROCEDURE AddBooking(
    IN customer_id INT,
    IN booking_date DATE,
    IN table_number INT
)
BEGIN
    DECLARE TableExists INT;

    -- Check if the table is already booked on the given date
    SELECT COUNT(*) INTO TableExists
    FROM Bookings
    WHERE TableNo = table_number
    AND Date = booking_date;

    IF TableExists > 0 THEN
        -- Table is already booked - Output a message
        SELECT 'Table is already booked on the given date. New booking not added.' AS Confirmation;
    ELSE
        -- Table is available - Add a new booking record
        INSERT INTO Bookings (CustomerID, Date, TableNo, TimeSlot, EmployeeID)
        VALUES (customer_id, booking_date, table_number, '19:30:00', 4);

        -- Output a success message
        SELECT 'New booking added.' AS Confirmation;
    END IF;
END //

DELIMITER ;

CALL AddBooking(1, '2022-11-30', 5);
SELECT * FROM bookings;