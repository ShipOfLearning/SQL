/* =====================================================
SHIP OF LEARNING — Zomato SQL Interview Question
Topic  : Average Time Between 2 Orders
Author : Ship of Learning
======================================================*/

-- Drop table if exists
DROP TABLE IF EXISTS Orders;

-- Create table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    CustomerName VARCHAR(50) NOT NULL,
    OrderDate DATETIME NOT NULL
);

-- Insert sample data
INSERT INTO Orders (OrderID, CustomerID, CustomerName, OrderDate) VALUES
(1, 101, 'Amit',   '2026-01-01 12:00:00'),
(2, 101, 'Amit',   '2026-01-03 19:30:00'),
(3, 101, 'Amit',   '2026-01-07 13:15:00'),
(4, 101, 'Amit',   '2026-01-15 20:00:00'),
(5, 102, 'Priya',  '2026-01-02 09:00:00'),
(6, 102, 'Priya',  '2026-01-04 09:00:00'),
(7, 102, 'Priya',  '2026-01-06 09:00:00'),
(8, 103, 'Rahul',  '2026-01-01 18:00:00'),
(9, 103, 'Rahul',  '2026-01-20 18:00:00'),
(10, 104, 'Sneha', '2026-01-05 14:00:00');