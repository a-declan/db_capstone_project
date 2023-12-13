DELIMITER //

DROP PROCEDURE CancelOrders;
CREATE PROCEDURE CancelOrders (IN order_id INT)
BEGIN 
	DECLARE OrderExists INT;
    -- Check if the order exists
		SELECT COUNT(*) INTO OrderExists
		FROM orders
		WHERE OrderID = order_id;

    IF OrderExists > 0 THEN
    -- Order exists, proceed with cancellation
		DELETE FROM Orders 
		WHERE OrderID = order_id;
        SELECT CONCAT("Order ", order_id, " has been cancelled!") AS Confirmation;
	ELSE
    -- Order does not exist.
		SELECT CONCAT("Order not found. No cancellations performed.") AS Confirmation;
	END IF;
END //

DELIMITER ;    
    
CALL CancelOrders(2);
    
SELECT * FROM Orders;

CALL CancelOrders(5);
SELECT * FROM Orders;
