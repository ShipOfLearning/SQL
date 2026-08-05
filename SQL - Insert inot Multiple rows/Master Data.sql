-- 1. Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FullName   VARCHAR(100) NOT NULL,
    City       VARCHAR(50),
    Email      VARCHAR(100),
    JoinDate   DATE DEFAULT GETDATE()
);
GO

-- 2. Create Orders Table
CREATE TABLE Orders (
    OrderID     INT PRIMARY KEY IDENTITY(1,1),
    CustomerID  INT FOREIGN KEY REFERENCES Customers(CustomerID),
    ProductName VARCHAR(100),
    Amount      DECIMAL(10,2),
    OrderDate   DATE DEFAULT GETDATE()
);
GO

-- 3. Basic INSERT INTO with column names (Best Practice)
INSERT INTO Customers (FullName, City, Email)
VALUES ('Rohan Mehta', 'Ahmedabad', 'rohan@email.com');

-- 4. INSERT without column names (Not Recommended - risky if schema changes)
INSERT INTO Customers
VALUES ('Priya Shah', 'Mumbai', 'priya@email.com', GETDATE());

-- 5. Insert Multiple Rows in One Statement (Efficient)
INSERT INTO Customers (FullName, City, Email)
VALUES 
('Aman Verma', 'Delhi', 'aman@email.com'),
('Sneha Patel', 'Ahmedabad', 'sneha@email.com'),
('Karan Joshi', 'Pune', 'karan@email.com');

-- 6. Insert Orders Data
INSERT INTO Orders (CustomerID, ProductName, Amount)
VALUES 
(1, 'Wireless Mouse', 499.00),
(2, 'Keyboard', 899.00),
(3, 'Laptop Bag', 1299.00),
(4, 'Headphones', 1599.00);