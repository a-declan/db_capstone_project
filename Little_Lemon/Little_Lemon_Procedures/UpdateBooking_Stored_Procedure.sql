DELIMITER //

DROP PROCEDURE IF EXISTS UpdateBooking;
CREATE PROCEDURE UpdateBooking (
IN booking_id INT, 
IN booking_date DATE)

BEGIN 
	DECLARE BookingExists INT;
-- Check if the booking_id exists in the table
	SELECT COUNT(*) INTO BookingExists
	FROM Bookings 
	WHERE BookingID = booking_id;

IF BookingExists > 0 THEN
-- Booking exists. Proceed to update
	UPDATE Bookings
	SET Date = booking_date
	WHERE BookingID = booking_id;
	SELECT CONCAT('Booking ', booking_id, ' is updated.') AS Confirmation;

ELSE
	-- Booking does not exist.
    SELECT CONCAT('Booking does not exist, cannot be updated.') AS Confirmation;
    
END IF;
END //

DELIMITER ;

SELECT * FROM Bookings;
CALL UpdateBooking(30, '2022-11-30');
