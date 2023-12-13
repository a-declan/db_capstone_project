DELIMITER //
DROP PROCEDURE IF EXISTS GetMaxQuantity;

CREATE PROCEDURE GetMaxQuantity ()
BEGIN
	SELECT MAX(Quantity) AS Max_Qty_In_Order
	FROM orders;
END //

DELIMITER ;

CALL GetMaxQuantity();