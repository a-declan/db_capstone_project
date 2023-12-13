UPDATE Menu
SET MenuName = 
CASE 
	WHEN MenuID = 1 THEN "Aperitivo"
	WHEN MenuID = 2 THEN "BreakfastDeli"
      WHEN MenuID = 3 THEN "Mousilinni"
      WHEN MenuID = 4 THEN "Sweetcrisps"
     WHEN MenuID = 5 THEN "Lofaves"
       WHEN MenuID = 6 THEN "Steaksrus"
      WHEN MenuID = 7 THEN "Chef's special Pasta"
      WHEN MenuID = 8 THEN "Dinnerdeli"
        ELSE "Drinks"
END;


SELECT c.CustomerID, CONCAT(c.First_name, " ", c.Last_name), o.OrderID, o.TotalCost,
		m.MenuName, mi.StarterName, mi.CourseName
FROM customers AS c
	INNER JOIN bookings AS b
		ON c.CustomerID = b.CustomerID
	INNER JOIN orders AS o
		ON b.BookingID = o.BookingID
	INNER JOIN menu AS m
		ON o.MenuID = m.MenuID
	INNER JOIN menuitems AS mi
		ON m.MenuItemsID = mi.MenuItemsID
WHERE o.TotalCost > 50
ORDER BY o.TotalCost;
	

SELECT MenuName FROM menu
WHERE MenuID = ANY (
 SELECT o.MenuID
 FROM Orders AS o
	GROUP BY o.MenuID
	HAVING COUNT(o.OrderID) > 1
        );
