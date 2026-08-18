-- ============================================================
-- Topic: Find customers whose most recent order amount
--        exceeds their average order amount (MS SQL Server)
-- ============================================================

-- STEP 1: Create table
CREATE TABLE Orders (
    OrderID      INT PRIMARY KEY,
    CustomerID   INT NOT NULL,
    OrderDate    DATE NOT NULL,
    OrderAmount  DECIMAL(10,2) NOT NULL
);

-- STEP 2: Insert sample data
INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderAmount) VALUES
(1, 101, '2024-01-01', 500.00),
(2, 101, '2024-02-01', 300.00),
(3, 101, '2024-03-01', 700.00),  -- 101's most recent order: 700 > avg(500) -> qualifies
(4, 102, '2024-01-05', 800.00),
(5, 102, '2024-02-05', 200.00),
(6, 102, '2024-03-05', 300.00),  -- 102's most recent order: 300 < avg(433.33) -> does NOT qualify
(7, 103, '2024-01-10', 400.00),  -- 103 has only one order: 400 = avg(400) -> NOT strictly greater, excluded
(8, 104, '2024-01-01', 100.00),
(9, 104, '2024-04-01', 500.00);  -- 104's most recent order: 500 > avg(300) -> qualifies
