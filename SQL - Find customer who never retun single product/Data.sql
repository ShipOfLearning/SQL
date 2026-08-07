CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);

CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_Orders_Customers
        FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
);

CREATE TABLE Returns
(
    ReturnID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    ReturnDate DATE NOT NULL,
    ReturnReason VARCHAR(200),

    CONSTRAINT FK_Returns_Orders
        FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID)
);

INSERT INTO Customers (CustomerID, CustomerName)
VALUES
(1, 'Amit'),
(2, 'Priya'),
(3, 'Rahul'),
(4, 'Neha'),
(5, 'Vikas'),
(6, 'Sneha');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, Amount)
VALUES
-- Amit: 3 purchases, NO returns
(101, 1, '2026-01-05', 1200.00),
(102, 1, '2026-02-10', 1800.00),
(103, 1, '2026-03-15', 2200.00),

-- Priya: 2 purchases, 1 returned
(104, 2, '2026-01-12', 1500.00),
(105, 2, '2026-02-20', 2500.00),

-- Rahul: only 1 purchase, NO return
(106, 3, '2026-01-25', 1000.00),

-- Neha: 3 purchases, NO returns
(107, 4, '2026-01-08', 900.00),
(108, 4, '2026-02-14', 1700.00),
(109, 4, '2026-03-22', 2100.00),

-- Vikas: 2 purchases, BOTH returned
(110, 5, '2026-01-18', 1300.00),
(111, 5, '2026-02-25', 1900.00),

-- Sneha: 2 purchases, NO returns
(112, 6, '2026-01-30', 1600.00),
(113, 6, '2026-03-05', 2800.00);

INSERT INTO Returns (ReturnID, OrderID, ReturnDate, ReturnReason)
VALUES
(1, 105, '2026-02-25', 'Wrong Size'),

(2, 110, '2026-01-25', 'Damaged Product'),

(3, 111, '2026-03-01', 'Changed Mind');