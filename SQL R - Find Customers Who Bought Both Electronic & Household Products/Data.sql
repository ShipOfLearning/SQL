--========================================================
--Ship of Learning | Most asked interview Quetion
--Topic: Find Customers Who Bought Both 
--	Electronic & Household Products 
--========================================================

--Step 1 — Drop Existing Table
DROP TABLE IF EXISTS Orders;


--Step 2 — Create Table
CREATE TABLE Orders
(
    OrderID       INT PRIMARY KEY,
    CustomerID    INT,
    ProductName   VARCHAR(100),
    Category      VARCHAR(50),
    Amount        DECIMAL(10,2),
    OrderDate     DATE
);


--Step 3 — Insert Sample Data
INSERT INTO Orders
(
    OrderID,
    CustomerID,
    ProductName,
    Category,
    Amount,
    OrderDate
)
VALUES
(1,  101, 'Laptop',        'Electronic',  60000, '2026-01-05'),
(2,  101, 'Mouse',         'Electronic',   1200, '2026-01-07'),
(3,  101, 'Mixer Grinder', 'Household',    4500, '2026-01-10'),

(4,  102, 'Mobile Phone',  'Electronic',  25000, '2026-01-12'),
(5,  102, 'Headphones',    'Electronic',   2500, '2026-01-15'),

(6,  103, 'Dinner Set',    'Household',    3000, '2026-01-18'),
(7,  103, 'Microwave',     'Household',    9000, '2026-01-20'),

(8,  104, 'Television',    'Electronic',  45000, '2026-01-22'),
(9,  104, 'Bedsheet',      'Household',    1800, '2026-01-25'),

(10, 105, 'Refrigerator',   'Electronic', 55000, '2026-01-28'),
(11, 105, 'Washing Machine','Household',   30000, '2026-02-01'),
(12, 105, 'Air Fryer',      'Household',    7000, '2026-02-03'),

(13, 106, 'Keyboard',       'Electronic',   1800, '2026-02-05'),
(14, 106, 'Monitor',        'Electronic',  12000, '2026-02-07'),
(15, 106, 'Chair',          'Household',    5000, '2026-02-10'),

(16, 107, 'Vacuum Cleaner', 'Household',    6500, '2026-02-12'),
(17, 108, 'Smart Watch',    'Electronic',   8000, '2026-02-15');