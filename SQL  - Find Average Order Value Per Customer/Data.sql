
drop table orders
-- =========================================
-- STEP 1: Create Sample Table
-- =========================================
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    OrderAmount DECIMAL(10,2) NOT NULL
);

-- =========================================
-- STEP 2: Insert Sample Data
-- =========================================
INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderAmount) VALUES
(1, 101, '2024-01-05', 2500.00),
(2, 101, '2024-02-10', 3200.00),
(3, 101, '2024-03-15', 2800.00),
(4, 102, '2024-01-08', 1500.00),
(5, 102, '2024-02-20', 1800.00),
(6, 103, '2024-01-12', 5000.00),
(7, 103, '2024-02-25', 4700.00),
(8, 103, '2024-03-30', 5300.00),
(9, 104, '2024-01-18', 900.00),
(10, 104, '2024-02-22', 1100.00);
