DELIMITER //
DROP PROCEDURE IF EXISTS CancelBookings;
CREATE PROCEDURE CancelBookings (
IN booking_id INT
)
BEGIN
	DECLARE BookingExists INT;
-- Check if the booking exists
SELECT COUNT(*) INTO BookingExists
FROM Bookings 
WHERE BookingID = booking_id;

IF BookingExists > 0 THEN
-- Booking exists. Delete booking.
	DELETE FROM Bookings
	WHERE BookingID = booking_id;
	SELECT CONCAT('Booking ', booking_id, ' has been deleted.') AS Confirmation;
ELSE
	-- Booking does not exist
    SELECT CONCAT('Booking ', booking_id, ' does not exist.') AS Confirmation;
    END IF;
END //

DELIMITER ;

SELECT * FROM Bookings;
CALL CancelBookings(2);
