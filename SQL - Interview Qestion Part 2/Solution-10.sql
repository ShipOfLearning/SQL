/*	@ShipOfLearning
	Series : Beginner to Expert SQL Interview Questions - Part 2
	10. You need to find the category that has the highest total sales. 
		How would you do it? */
SELECT * FROM Orders 
SELECT * FROM Products 
SELECT * FROM Categories 

SELECT TOP 1
	C.CategoryID,C.CategoryName,
	SUM(O.Quantity * O.Price) AS TS
FROM Orders O
JOIN Products P
ON O.ProductID = P.ProductID
JOIN Categories C
ON C.CategoryID = P.CategoryID
GROUP BY C.CategoryID,C.CategoryName
ORDER BY SUM(O.Quantity * O.Price) DESC