SET @customerID = 1;
SET @sql = 'SELECT OrderID, Quantity, TotalCost 
            FROM Orders AS o
            INNER JOIN Bookings AS b
            ON o.BookingID = b.BookingID            
            WHERE CustomerID = ?';

-- Prepare the statement
PREPARE GetOrderDetail FROM @sql;

-- Execute the prepared statement with the input parameter
EXECUTE GetOrderDetail USING @customerID;

-- Verifying accuracy of prepared statement output
SELECT CustomerID, OrderID 
FROM Orders AS o
INNER JOIN Bookings AS b
USING (BookingID)
WHERE CustomerID = 1;





