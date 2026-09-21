--========================================================
--Ship of Learning | Swiggy
--Topic: Find Daily Revenue from Orders
--========================================================
-- Drop table if it already exists
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
    DROP TABLE dbo.Orders;

-- Create Orders table
CREATE TABLE dbo.Orders (
    order_id     INT PRIMARY KEY,
    customer_id  INT,
    order_date   DATETIME,
    amount       DECIMAL(10,2)
);

INSERT INTO dbo.Orders (order_id, customer_id, order_date, amount) VALUES
(1, 101, '2026-09-10 09:15:00', 350.00),
(2, 102, '2026-09-10 12:40:00', 620.00),
(3, 103, '2026-09-10 19:05:00', 275.50),
(4, 104, '2026-09-11 08:30:00', 410.00),
(5, 105, '2026-09-11 14:20:00', 199.00),
(6, 106, '2026-09-12 10:00:00', 890.00),
(7, 107, '2026-09-12 20:45:00', 320.00),
(8, 108, '2026-09-13 11:10:00', 500.00),
(9, 109, '2026-09-13 21:30:00', 275.00),
(10,110, '2026-09-14 13:00:00', 640.00);