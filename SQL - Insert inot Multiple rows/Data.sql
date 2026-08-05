-- @ShipOfLearning
-- Insert Into (Best Practice, Multiple Reocrds)

SELECT * FROM Customers
SELECT * FROM Orders

INSERT INTO Customers (FullName, City, Email)
VALUES ('Khiaan Mehta', 'Ahmedabad', 'rohan@email.com');

INSERT INTO Customers (FullName, City, Email)
VALUES 
('Vimal Verma', 'Delhi', 'Vimal@email.com'),
('Sneha Patel', 'Ahmedabad', 'sneha@email.com'),
('Karan Joshi', 'Pune', 'karan@email.com');

INSERT INTO Customers
VALUES ('Ajay Shah', 'Mumbai', 'priya@email.com', GETDATE());

INSERT INTO PremiumCustomers 
(CustomerID,FullName,City)
SELECT CustomerID,FullName,City
FROM Customers
WHERE CustomerID IN (SELECT CustomerID 
			FROM Orders WHERE Amount > 1000)

--SELECT * FROM PremiumCustomers