SELECT * FROM Bookings;
INSERT INTO Bookings VALUES
(8, 1, 5, '2022-10-10', '19:00:00', 5),
(9, 3, 3, '2022-11-12', '13:30:30', 4),
(10, 2, 2, '2022-10-11', '15:00:00', 4),
(11, 1, 2,  '2022-10-13', '17:00:00', 3);

-- checkcing the distinct table_numbers in the restaurant
SELECT COUNT(DISTINCT(TableNo))
		FROM Bookings;


DELIMITER //

CREATE PROCEDURE Check_Booking(IN booking_date DATE, IN table_number INT)
BEGIN
    DECLARE TableExists INT;

    -- Check if the table_number exists
    SELECT COUNT(TableNo) INTO TableExists
    FROM Bookings AS b
    WHERE b.TableNo = table_number
    AND b.Date = booking_date;

    IF TableExists > 0 THEN
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

CALL Check_Booking ('2022-10-13', 4);

SELECT * FROM Bookings;