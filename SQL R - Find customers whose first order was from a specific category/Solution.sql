--============================================================
--CHANNEL : Ship of Learning
--TOPIC   : Find Customers Whose First Order Was From a
--          Specific Category in Microsoft SQL Server
--CATEGORY: Electronics
--============================================================
SELECT TOP (2) * FROM dbo.Customers;
SELECT TOP (2) * FROM dbo.Orders;
SELECT TOP (2) * FROM dbo.OrderItems;
SELECT TOP (2) * FROM dbo.Products;
;WITH CTE AS
(
	SELECT
		C.CustomerID,C.CustomerName,
		O.OrderID,P.ProductName,P.Category,
		DENSE_RANK() OVER
		(
			PARTITION BY C.CUSTOMERID
			ORDER BY O.ORDERDATE, O.ORDERID
		) AS RN
	FROM Customers C
	JOIN Orders O
	ON C.CustomerID = O.CustomerID
	JOIN OrderItems OI
	ON O.OrderID = OI.OrderID
	JOIN Products P
	ON OI.ProductID = P.ProductID
)
SELECT * FROM CTE WHERE RN = 1 AND Category = 'Electronics'