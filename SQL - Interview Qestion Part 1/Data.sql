-- ============================================
-- SHIP OF LEARNING | SQL INTERVIEW SET 1 - MASTER SCRIPT
-- ============================================

IF OBJECT_ID('dbo.departments', 'U') IS NOT NULL
    DROP TABLE dbo.departments;
GO
-- ---------- DEPARTMENTS ----------
CREATE TABLE departments (
    dept_id     INT PRIMARY KEY,
    dept_name   VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'Engineering'),
(2, 'Sales'),
(3, 'HR'),
(4, 'Marketing');

IF OBJECT_ID('dbo.employees', 'U') IS NOT NULL
    DROP TABLE dbo.employees;
GO
-- ---------- EMPLOYEES ----------
CREATE TABLE employees (
    emp_id      INT PRIMARY KEY,
    emp_name    VARCHAR(50),
    dept_id     INT,
    salary      DECIMAL(10,2),
    manager_id  INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employees VALUES
(101, 'Rohan Mehta',    1, 95000, NULL),
(102, 'Isha Verma',     1, 72000, 101),
(103, 'Karan Malhotra', 1, 61000, 101),
(104, 'Neha Kapoor',    1, 45000, 102),
(105, 'Aditya Rao',     2, 88000, NULL),
(106, 'Priya Nair',     2, 54000, 105),
(107, 'Vikram Singh',   2, 39000, 105),
(108, 'Sneha Reddy',    3, 42000, NULL),
(109, 'Arjun Desai',    3, 38000, 108),
(110, 'Meera Iyer',     4, 51000, NULL),
(111, 'Rahul Khanna',   4, 47000, 110),
(112, 'Divya Joshi',    4, 33000, 110);

IF OBJECT_ID('dbo.customers', 'U') IS NOT NULL
    DROP TABLE dbo.customers;
GO
-- ---------- CUSTOMERS (with duplicate emails + NULL phone) ----------
CREATE TABLE customers (
    customer_id     INT PRIMARY KEY,
    customer_name   VARCHAR(50),
    email           VARCHAR(80),
    phone           VARCHAR(15)
);

INSERT INTO customers VALUES
(1, 'Aman Gupta',    'aman.gupta@mail.com',  '9876500001'),
(2, 'Simran Kaur',   'simran.kaur@mail.com', NULL),
(3, 'Rajesh Kumar',  'aman.gupta@mail.com',  '9876500003'),  -- duplicate email
(4, 'Pooja Sharma',  'pooja.sharma@mail.com',NULL),
(5, 'Manish Tiwari', 'manish.t@mail.com',    '9876500005'),
(6, 'Anita Bose',    'anita.bose@mail.com',  'NULL_TEST'),
(7, 'Kabir Anand',   'kabir.anand@mail.com', NULL),
(8, 'Ritu Chawla',   'aman.gupta@mail.com',  '9876500008');  -- duplicate email

IF OBJECT_ID('dbo.categories', 'U') IS NOT NULL
    DROP TABLE dbo.categories;
GO
-- ---------- CATEGORIES ----------
CREATE TABLE categories (
    category_id     INT PRIMARY KEY,
    category_name   VARCHAR(50)
);

INSERT INTO categories VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Groceries');

IF OBJECT_ID('dbo.products', 'U') IS NOT NULL
    DROP TABLE dbo.products;
GO
-- ---------- PRODUCTS ----------
CREATE TABLE products (
    product_id      INT PRIMARY KEY,
    product_name    VARCHAR(50),
    category_id     INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO products VALUES
(201, 'Smartphone',   1),
(202, 'Laptop',       1),
(203, 'Headphones',   1),
(204, 'T-Shirt',      2),
(205, 'Jeans',        2),
(206, 'Rice 5kg',     3),
(207, 'Cooking Oil',  3);

IF OBJECT_ID('dbo.orders', 'U') IS NOT NULL
    DROP TABLE dbo.orders;
GO
-- ---------- ORDERS ----------
CREATE TABLE orders (
    order_id        INT PRIMARY KEY,
    customer_id     INT,
    order_date      DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders VALUES
(1001, 1, '2025-01-05'),
(1002, 1, '2025-02-14'),
(1003, 3, '2025-01-20'),
(1004, 4, '2025-03-02'),
(1005, 5, '2025-02-25'),
(1006, 1, '2025-03-10'),
(1007, 6, '2025-01-11'),
(1008, 3, '2025-03-19');
-- Note: customer_id 2, 7, 8 intentionally have NO orders (used in Q7 & Q13)

IF OBJECT_ID('dbo.order_items', 'U') IS NOT NULL
    DROP TABLE dbo.order_items;
GO
-- ---------- ORDER_ITEMS ----------
CREATE TABLE order_items (
    order_item_id   INT PRIMARY KEY,
    order_id        INT,
    product_id      INT,
    quantity        INT,
    price           DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items VALUES
(1, 1001, 201, 1, 25000),
(2, 1001, 204, 3, 500),
(3, 1002, 202, 1, 55000),
(4, 1003, 206, 5, 300),
(5, 1003, 207, 2, 180),
(6, 1004, 205, 2, 1200),
(7, 1005, 203, 1, 2500),
(8, 1005, 204, 1, 500),
(9, 1006, 201, 1, 25000),
(10, 1006, 206, 10, 300),
(11, 1007, 202, 1, 52000),
(12, 1008, 206, 3, 300),
(13, 1008, 207, 4, 180);
