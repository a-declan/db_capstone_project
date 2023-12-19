-- Creating the get_bookings stored procedure
DELIMITER //
DROP PROCEDURE IF EXISTS Get_Bookings;

CREATE PROCEDURE Get_Bookings(IN booking_date DATE, IN table_number INT)
BEGIN
    DECLARE TableExists INT;

    -- Check if the table_number exists
    SELECT TableNo INTO TableExists
    FROM Bookings AS b
    WHERE b.TableNo = table_number
    AND b.Date = booking_date;

    IF table_number IN (TableExists) THEN
        -- Table has been booked, send confirmation
        SELECT TableNo, CONCAT("Table ", table_number, " has been booked!") AS Confirmation
        FROM Bookings as b
        WHERE b.TableNo = table_number 
        AND b.Date = booking_date;
    ELSE
        -- Table has not been booked.
        SELECT CONCAT("Table ", table_number, " is available.") AS Confirmation;
    END IF;
END //

DELIMITER ;

-- Executing the check_bookings procedure

CALL Get_Bookings ('2022-10-13', 2);

SELECT * FROM Bookings;