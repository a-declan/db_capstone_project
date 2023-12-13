CREATE VIEW order_qty_above_1 AS
	SELECT OrderID, Quantity, TotalCost 
	FROM Orders
	WHERE Quantity > 1;
    
SELECT * FROM order_qty_above_1;

