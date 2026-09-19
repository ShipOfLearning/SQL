
-- =========================================================
-- SHIP OF LEARNING -- SQL REVISION EBOOK (PART 1, Q1-50)
-- Single shared database powering all 50 questions
-- Dialect: Microsoft SQL Server (T-SQL)
-- =========================================================

CREATE TABLE departments (
    dept_id     INT PRIMARY KEY,
    dept_name   VARCHAR(50)
);

CREATE TABLE employees (
    emp_id      INT PRIMARY KEY,
    name        VARCHAR(100),
    salary      INT,
    dept_id     INT NULL,
    manager_id  INT NULL,
    hire_date   DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id),
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);

CREATE TABLE customers (
    customer_id VARCHAR(5) PRIMARY KEY,
    name        VARCHAR(100),
    country     VARCHAR(50),
    signup_date DATE
);

CREATE TABLE categories (
    category_id VARCHAR(5) PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE products (
    product_id   VARCHAR(5) PRIMARY KEY,
    product_name VARCHAR(100),
    category_id  VARCHAR(5),
    price        INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id    VARCHAR(5) PRIMARY KEY,
    customer_id VARCHAR(5),
    order_date  DATE,
    amount      INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id VARCHAR(6) PRIMARY KEY,
    order_id      VARCHAR(5),
    product_id    VARCHAR(5),
    quantity      INT,
    unit_price    INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE reviews (
    review_id   VARCHAR(5) PRIMARY KEY,
    customer_id VARCHAR(5),
    product_id  VARCHAR(5),
    rating      INT,
    review_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE user_activity (
    activity_id   VARCHAR(5) PRIMARY KEY,
    user_id       VARCHAR(5),
    activity_date DATE,
    activity_type VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES customers(customer_id)
);

CREATE TABLE pages (
    page_id   VARCHAR(5) PRIMARY KEY,
    page_name VARCHAR(100)
);

CREATE TABLE page_likes (
    like_id   VARCHAR(5) PRIMARY KEY,
    page_id   VARCHAR(5),
    user_id   VARCHAR(5),
    like_date DATE,
    FOREIGN KEY (page_id) REFERENCES pages(page_id),
    FOREIGN KEY (user_id) REFERENCES customers(customer_id)
);

CREATE TABLE searches (
    search_id   VARCHAR(5) PRIMARY KEY,
    user_id     VARCHAR(5),
    search_date DATE,
    FOREIGN KEY (user_id) REFERENCES customers(customer_id)
);

CREATE TABLE employee_sales (
    emp_id     INT,
    sale_month VARCHAR(7),
    amount     INT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

CREATE TABLE salary_history (
    emp_id         INT,
    effective_date DATE,
    salary         INT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);
GO

-- =========================================================
-- SAMPLE DATA (shared across every question below)
-- =========================================================

INSERT INTO departments VALUES
(10,'Engineering'),(20,'Sales'),(30,'HR'),(40,'Marketing');

INSERT INTO employees VALUES
(101,'Aditya Rao',95000,10,NULL,'2019-03-01'),
(102,'Priya Nair',78000,10,101,'2020-06-15'),
(103,'Priya Nair',78000,10,101,'2020-06-15'),
(104,'Karan Mehta',82000,10,101,'2021-01-10'),
(105,'Sana Iqbal',65000,20,106,'2020-02-20'),
(106,'Rohit Verma',88000,20,NULL,'2018-11-05'),
(107,'Neha Gupta',60000,20,106,'2021-07-19'),
(108,'Farah Sheikh',55000,30,NULL,'2019-09-09'),
(109,'Vikram Chatterjee',97000,10,101,'2017-05-23'),
(110,'Ananya Joshi',60000,NULL,108,'2022-02-01');

INSERT INTO customers VALUES
('C1','Ritika Sharma','India','2023-01-05'),
('C2','Daniel Osei','Nigeria','2023-02-10'),
('C3','Meera Pillai','India','2023-01-20'),
('C4','John Smith','USA','2023-03-01'),
('C5','Ayesha Khan','India','2023-01-15'),
('C6','Liam Chen','Singapore','2023-02-25'),
('C7','Zara Ahmed','India','2023-04-02'),
('C8','Tom Becker','Germany','2023-01-30');

INSERT INTO categories VALUES
('CAT1','Electronics'),('CAT2','Clothing'),('CAT3','Grocery'),('CAT4','Books');

INSERT INTO products VALUES
('P1','Wireless Earbuds','CAT1',2499),
('P2','Laptop Stand','CAT1',1299),
('P3','Cotton T-Shirt','CAT2',599),
('P4','Denim Jeans','CAT2',1899),
('P5','Organic Rice 5kg','CAT3',450),
('P6','Green Tea Pack','CAT3',250),
('P7','SQL Interview Guide','CAT4',399),
('P8','Python Crash Course','CAT4',349),
('P9','Smart Watch','CAT1',4999),
('P10','Yoga Mat','CAT2',799);

INSERT INTO orders VALUES
('O1','C1','2023-01-10',2499),
('O2','C1','2023-02-14',1899),
('O3','C2','2023-01-12',599),
('O4','C3','2023-01-18',450),
('O5','C3','2023-03-05',250),
('O6','C4','2023-02-02',1299),
('O7','C5','2023-01-22',399),
('O8','C5','2023-01-25',349),
('O9','C6','2023-02-28',799),
('O10','C8','2023-01-30',2499),
('O11','C1','2023-03-10',599),
('O12','C1','2023-03-12',450),
('O13','C1','2023-03-15',399);

INSERT INTO order_items VALUES
('OI1','O1','P1',1,2499),
('OI2','O2','P4',1,1899),
('OI3','O3','P3',1,599),
('OI4','O4','P5',1,450),
('OI5','O5','P6',1,250),
('OI6','O6','P2',1,1299),
('OI7','O7','P7',1,399),
('OI8','O8','P8',1,349),
('OI9','O9','P10',1,799),
('OI10','O10','P1',1,2499),
('OI11','O11','P3',1,599),
('OI12','O12','P5',1,450),
('OI13','O13','P7',1,399);

INSERT INTO reviews VALUES
('R1','C1','P1',5,'2023-01-15'),
('R2','C3','P5',4,'2023-01-25'),
('R3','C5','P7',5,'2023-02-01'),
('R4','C2','P1',3,'2023-02-05'),
('R5','C6','P1',4,'2023-02-10'),
('R6','C8','P7',5,'2023-01-05');

INSERT INTO user_activity VALUES
('A1','C1','2023-01-10','login'),
('A2','C1','2023-01-11','login'),
('A3','C1','2023-01-12','login'),
('A4','C1','2023-01-14','login'),
('A5','C2','2023-01-10','login'),
('A6','C3','2023-01-11','login'),
('A7','C3','2023-02-10','login'),
('A8','C5','2023-01-10','login'),
('A9','C5','2023-01-11','login'),
('A10','C5','2023-01-12','login');

INSERT INTO pages VALUES
('PG1','SoL Tech Tips'),('PG2','Career Growth Hub'),('PG3','Startup Buzz');

INSERT INTO page_likes VALUES
('PL1','PG1','C1','2023-01-10'),
('PL2','PG1','C2','2023-01-11'),
('PL3','PG2','C3','2023-01-12');

INSERT INTO searches VALUES
('S1','C1','2023-01-10'),
('S2','C1','2023-01-11'),
('S3','C2','2023-01-10'),
('S4','C3','2023-01-10'),
('S5','C3','2023-01-11'),
('S6','C3','2023-01-12');

INSERT INTO employee_sales VALUES
(101,'2023-01',500000),
(101,'2023-02',620000),
(106,'2023-01',430000),
(106,'2023-02',410000);

INSERT INTO salary_history VALUES
(101,'2022-01-01',85000),
(101,'2023-01-01',95000),
(106,'2022-01-01',80000),
(106,'2023-01-01',88000);
GO

-- =========================================================
-- SQL Interview Handbook Part 1
-- SOLUTIONS -- Q01 to Q50 (Part 1)
-- =========================================================


-- ---------------------------------------------------------
-- Q01 (source Q1) | Fundamentals | Beginner | Asked in: Amazon, Flipkart, Walmart
-- Find the second-highest salary without using LIMIT, TOP, or OFFSET.
-- ---------------------------------------------------------
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);
GO

-- ---------------------------------------------------------
-- Q02 (source Q2) | Fundamentals | Beginner | Asked in: Amazon, Google
-- Find employees whose salary is greater than the average company salary.
-- ---------------------------------------------------------
SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
GO

-- ---------------------------------------------------------
-- Q03 (source Q3) | Fundamentals | Beginner | Asked in: Amazon, Flipkart, Walmart
-- Find duplicate records in a table.
-- ---------------------------------------------------------
SELECT name, salary, dept_id, COUNT(*) AS cnt
FROM employees
GROUP BY name, salary, dept_id
HAVING COUNT(*) > 1;
GO

-- ---------------------------------------------------------
-- Q04 (source Q4) | Fundamentals | Beginner | Asked in: Amazon, Flipkart
-- Find employees who earn more than their managers.
-- ---------------------------------------------------------
SELECT e.name AS employee, e.salary AS emp_salary,
       m.name AS manager, m.salary AS mgr_salary
FROM employees e
JOIN employees m ON e.manager_id = m.emp_id
WHERE e.salary > m.salary;
GO

-- ---------------------------------------------------------
-- Q05 (source Q5) | Fundamentals | Beginner | Asked in: Google, Amazon, Meta
-- Find the highest salary in each department.
-- ---------------------------------------------------------
SELECT d.dept_name, MAX(e.salary) AS highest_salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;
GO

-- ---------------------------------------------------------
-- Q06 (source Q6) | Fundamentals | Beginner | Asked in: Google, Amazon, Meta
-- Find the top 3 salaries in every department.
-- ---------------------------------------------------------
SELECT dept_id, name, salary, rnk
FROM (
    SELECT dept_id, name, salary,
           DENSE_RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rnk
    FROM employees
) t
WHERE rnk <= 3;
GO

-- ---------------------------------------------------------
-- Q07 (source Q7) | Fundamentals | Beginner | Asked in: Google, Amazon, Meta
-- Explain the difference between WHERE and HAVING.
-- ---------------------------------------------------------
-- WHERE filters rows BEFORE grouping
SELECT * FROM employees WHERE salary > 80000;

-- HAVING filters groups AFTER GROUP BY + aggregation
SELECT dept_id, COUNT(*) AS cnt
FROM employees
GROUP BY dept_id
HAVING COUNT(*) > 2;
GO

-- ---------------------------------------------------------
-- Q08 (source Q8) | Fundamentals | Beginner | Asked in: Google, Meta, LinkedIn
-- Explain INNER JOIN vs LEFT JOIN.
-- ---------------------------------------------------------
-- INNER JOIN: only matching rows
SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id;

-- LEFT JOIN: all employees, unmatched depts shown as NULL
SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id;
GO

-- ---------------------------------------------------------
-- Q09 (source Q9) | Fundamentals | Beginner | Asked in: Amazon, Meta
-- Find customers who have never placed an order.
-- ---------------------------------------------------------
SELECT c.*
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
GO

-- ---------------------------------------------------------
-- Q10 (source Q10) | Fundamentals | Beginner | Asked in: Amazon, Microsoft
-- Find products that have never been sold.
-- ---------------------------------------------------------
SELECT p.*
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.order_item_id IS NULL;
GO

-- ---------------------------------------------------------
-- Q11 (source Q21) | JOINs | Intermediate | Asked in: Amazon
-- Find users who purchased a product but never left a review.
-- ---------------------------------------------------------
SELECT DISTINCT o.customer_id, oi.product_id
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
LEFT JOIN reviews r
    ON r.customer_id = o.customer_id AND r.product_id = oi.product_id
WHERE r.review_id IS NULL;
GO

-- ---------------------------------------------------------
-- Q12 (source Q22) | JOINs | Intermediate | Asked in: Amazon
-- Find customers who purchased from every product category.
-- ---------------------------------------------------------
SELECT o.customer_id
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.customer_id
HAVING COUNT(DISTINCT p.category_id) = (SELECT COUNT(*) FROM categories);
GO

-- ---------------------------------------------------------
-- Q13 (source Q23) | JOINs | Intermediate | Asked in: Google, Amazon
-- Find employees without a department.
-- ---------------------------------------------------------
SELECT e.*
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;
GO

-- ---------------------------------------------------------
-- Q14 (source Q24) | JOINs | Intermediate | Asked in: Google, Microsoft
-- Find departments without employees.
-- ---------------------------------------------------------
SELECT d.*
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;
GO

-- ---------------------------------------------------------
-- Q15 (source Q25) | JOINs | Intermediate | Asked in: Amazon
-- Find customers who placed orders in January but not February.
-- ---------------------------------------------------------
SELECT DISTINCT customer_id
FROM orders
WHERE MONTH(order_date) = 1
AND customer_id NOT IN (
    SELECT customer_id FROM orders WHERE MONTH(order_date) = 2
);
GO

-- ---------------------------------------------------------
-- Q16 (source Q26) | JOINs | Intermediate | Asked in: Amazon
-- Find products purchased by both customer A and customer B.
-- ---------------------------------------------------------
SELECT oi1.product_id
FROM order_items oi1
JOIN orders o1 ON oi1.order_id = o1.order_id
JOIN order_items oi2 ON oi1.product_id = oi2.product_id
JOIN orders o2 ON oi2.order_id = o2.order_id
WHERE o1.customer_id = 'C1' AND o2.customer_id = 'C3';
GO

-- ---------------------------------------------------------
-- Q17 (source Q27) | JOINs | Intermediate | Asked in: Microsoft, Amazon
-- Find employees working in the same department as their manager.
-- ---------------------------------------------------------
SELECT e.*
FROM employees e
JOIN employees m ON e.manager_id = m.emp_id
WHERE e.dept_id = m.dept_id;
GO

-- ---------------------------------------------------------
-- Q18 (source Q28) | JOINs | Intermediate | Asked in: Flipkart, Microsoft
-- Join employee and department tables and display employee name + department name.
-- ---------------------------------------------------------
SELECT e.name, d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;
GO

-- ---------------------------------------------------------
-- Q19 (source Q29) | JOINs | Intermediate | Asked in: Google, Meta
-- Find unmatched rows between two tables.
-- ---------------------------------------------------------
SELECT *
FROM employees e
FULL OUTER JOIN departments d ON e.dept_id = d.dept_id
WHERE e.emp_id IS NULL OR d.dept_id IS NULL;
GO

-- ---------------------------------------------------------
-- Q20 (source Q30) | JOINs | Intermediate | Asked in: Google, Meta, Flipkart
-- Explain the difference between INNER, LEFT, RIGHT, FULL, and CROSS JOIN.
-- ---------------------------------------------------------
-- Five join types over the same two tables
SELECT * FROM employees e INNER JOIN departments d ON e.dept_id = d.dept_id;
SELECT * FROM employees e LEFT JOIN departments d ON e.dept_id = d.dept_id;
SELECT * FROM employees e RIGHT JOIN departments d ON e.dept_id = d.dept_id;
SELECT * FROM employees e FULL OUTER JOIN departments d ON e.dept_id = d.dept_id;
SELECT * FROM employees e CROSS JOIN departments d;
GO

-- ---------------------------------------------------------
-- Q21 (source Q41) | GROUP BY & Aggregation | Intermediate | Asked in: Amazon
-- Calculate monthly average product rating.
-- ---------------------------------------------------------
SELECT product_id, FORMAT(review_date,'yyyy-MM') AS month, AVG(CAST(rating AS FLOAT)) AS avg_rating
FROM reviews
GROUP BY product_id, FORMAT(review_date,'yyyy-MM');
GO

-- ---------------------------------------------------------
-- Q22 (source Q42) | GROUP BY & Aggregation | Intermediate | Asked in: Amazon
-- Find the product with the highest average rating each month.
-- ---------------------------------------------------------
WITH monthly AS (
    SELECT product_id, FORMAT(review_date,'yyyy-MM') AS month, AVG(CAST(rating AS FLOAT)) AS avg_r
    FROM reviews
    GROUP BY product_id, FORMAT(review_date,'yyyy-MM')
),
ranked AS (
    SELECT *, RANK() OVER (PARTITION BY month ORDER BY avg_r DESC) AS rnk
    FROM monthly
)
SELECT * FROM ranked WHERE rnk = 1;
GO

-- ---------------------------------------------------------
-- Q23 (source Q43) | GROUP BY & Aggregation | Intermediate | Asked in: Amazon, Flipkart
-- Find the top 10 customers by total purchase amount.
-- ---------------------------------------------------------
SELECT TOP 10 customer_id, SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC;
GO

-- ---------------------------------------------------------
-- Q24 (source Q44) | GROUP BY & Aggregation | Intermediate | Asked in: Amazon
-- Find the customer with the highest lifetime value.
-- ---------------------------------------------------------
SELECT TOP 1 customer_id, SUM(amount) AS lifetime_value
FROM orders
GROUP BY customer_id
ORDER BY lifetime_value DESC;
GO

-- ---------------------------------------------------------
-- Q25 (source Q45) | GROUP BY & Aggregation | Intermediate | Asked in: Amazon, Google
-- Find monthly revenue growth.
-- ---------------------------------------------------------
WITH monthly AS (
    SELECT FORMAT(order_date,'yyyy-MM') AS month, SUM(amount) AS revenue
    FROM orders
    GROUP BY FORMAT(order_date,'yyyy-MM')
)
SELECT month, revenue,
       revenue - LAG(revenue) OVER (ORDER BY month) AS growth
FROM monthly;
GO

-- ---------------------------------------------------------
-- Q26 (source Q46) | GROUP BY & Aggregation | Intermediate | Asked in: Google
-- Find daily active users by country.
-- ---------------------------------------------------------
SELECT ua.activity_date, c.country, COUNT(DISTINCT ua.user_id) AS dau
FROM user_activity ua
JOIN customers c ON ua.user_id = c.customer_id
GROUP BY ua.activity_date, c.country;
GO

-- ---------------------------------------------------------
-- Q27 (source Q47) | GROUP BY & Aggregation | Intermediate | Asked in: Google, Meta
-- Calculate weekly active users.
-- ---------------------------------------------------------
SELECT DATEPART(week, activity_date) AS wk, COUNT(DISTINCT user_id) AS wau
FROM user_activity
GROUP BY DATEPART(week, activity_date);
GO

-- ---------------------------------------------------------
-- Q28 (source Q48) | GROUP BY & Aggregation | Intermediate | Asked in: Google, Meta
-- Calculate monthly active users.
-- ---------------------------------------------------------
SELECT FORMAT(activity_date,'yyyy-MM') AS month, COUNT(DISTINCT user_id) AS mau
FROM user_activity
GROUP BY FORMAT(activity_date,'yyyy-MM');
GO

-- ---------------------------------------------------------
-- Q29 (source Q49) | GROUP BY & Aggregation | Intermediate | Asked in: Google, Meta
-- Calculate DAU/MAU ratio.
-- ---------------------------------------------------------
WITH d AS (
    SELECT COUNT(DISTINCT user_id) AS dau FROM user_activity WHERE activity_date = '2023-01-10'
),
m AS (
    SELECT COUNT(DISTINCT user_id) AS mau FROM user_activity WHERE FORMAT(activity_date,'yyyy-MM') = '2023-01'
)
SELECT dau, mau, ROUND(dau * 1.0 / mau, 2) AS dau_mau_ratio FROM d, m;
GO

-- ---------------------------------------------------------
-- Q30 (source Q50) | GROUP BY & Aggregation | Intermediate | Asked in: Google
-- Find the median number of searches per user.
-- ---------------------------------------------------------
WITH cnt AS (
    SELECT user_id, COUNT(*) AS c FROM searches GROUP BY user_id
)
SELECT DISTINCT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY c) OVER () AS median_searches
FROM cnt;
GO

-- ---------------------------------------------------------
-- Q31 (source Q61) | Window Functions | Advanced | Asked in: Amazon, Google, Meta
-- Find the top 3 salaries in each department.
-- ---------------------------------------------------------
SELECT dept_id, name, salary, rnk
FROM (
    SELECT dept_id, name, salary,
           DENSE_RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rnk
    FROM employees
) t
WHERE rnk <= 3;
-- Note: DENSE_RANK gives tied salaries the SAME rank with no gap;
-- RANK() would skip the next rank number after a tie.
GO

-- ---------------------------------------------------------
-- Q32 (source Q62) | Window Functions | Advanced | Asked in: Amazon
-- Find the second purchase made by every customer.
-- ---------------------------------------------------------
SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS rn
    FROM orders
) t WHERE rn = 2;
GO

-- ---------------------------------------------------------
-- Q33 (source Q63) | Window Functions | Advanced | Asked in: Amazon
-- Find each customer's first order.
-- ---------------------------------------------------------
SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS rn
    FROM orders
) t WHERE rn = 1;
GO

-- ---------------------------------------------------------
-- Q34 (source Q64) | Window Functions | Advanced | Asked in: Amazon
-- Find each customer's latest order.
-- ---------------------------------------------------------
SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS rn
    FROM orders
) t WHERE rn = 1;
GO

-- ---------------------------------------------------------
-- Q35 (source Q65) | Window Functions | Advanced | Asked in: Amazon, Flipkart
-- Calculate a running total of revenue by day.
-- ---------------------------------------------------------
SELECT order_date, SUM(amount) AS daily_revenue,
       SUM(SUM(amount)) OVER (ORDER BY order_date) AS running_total
FROM orders
GROUP BY order_date;
GO

-- ---------------------------------------------------------
-- Q36 (source Q66) | Window Functions | Advanced | Asked in: Amazon
-- Calculate cumulative sales for each customer.
-- ---------------------------------------------------------
SELECT customer_id, order_date, amount,
       SUM(amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS cumulative_sales
FROM orders;
GO

-- ---------------------------------------------------------
-- Q37 (source Q67) | Window Functions | Advanced | Asked in: Google, Amazon
-- Calculate month-over-month sales growth.
-- ---------------------------------------------------------
WITH monthly AS (
    SELECT FORMAT(order_date,'yyyy-MM') AS month, SUM(amount) AS rev
    FROM orders
    GROUP BY FORMAT(order_date,'yyyy-MM')
)
SELECT month, rev,
       ROUND((rev - LAG(rev) OVER (ORDER BY month)) * 100.0 / LAG(rev) OVER (ORDER BY month), 1) AS pct_growth
FROM monthly;
GO

-- ---------------------------------------------------------
-- Q38 (source Q68) | Window Functions | Advanced | Asked in: Google, Meta
-- Find the previous month's sales for each employee.
-- ---------------------------------------------------------
SELECT emp_id, sale_month, amount,
       LAG(amount) OVER (PARTITION BY emp_id ORDER BY sale_month) AS prev_month_sales
FROM employee_sales;
GO

-- ---------------------------------------------------------
-- Q39 (source Q69) | Window Functions | Advanced | Asked in: Amazon
-- Find the next order date for every customer.
-- ---------------------------------------------------------
SELECT customer_id, order_date,
       LEAD(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS next_order_date
FROM orders;
GO

-- ---------------------------------------------------------
-- Q40 (source Q70) | Window Functions | Advanced | Asked in: Microsoft, Amazon
-- Calculate the difference between current and previous salary.
-- ---------------------------------------------------------
SELECT emp_id, effective_date, salary,
       salary - LAG(salary) OVER (PARTITION BY emp_id ORDER BY effective_date) AS salary_diff
FROM salary_history;
GO

-- ---------------------------------------------------------
-- Q41 (source Q81) | Advanced SQL / Business Problems | Advanced | Asked in: Meta
-- Find Facebook pages that have zero likes.
-- ---------------------------------------------------------
SELECT p.*
FROM pages p
LEFT JOIN page_likes pl ON p.page_id = pl.page_id
WHERE pl.page_id IS NULL;
GO

-- ---------------------------------------------------------
-- Q42 (source Q82) | Advanced SQL / Business Problems | Advanced | Asked in: Meta
-- Calculate weekly user churn rate.
-- ---------------------------------------------------------
WITH weekly AS (
    SELECT DATEPART(week, activity_date) AS wk, COUNT(DISTINCT user_id) AS active
    FROM user_activity
    GROUP BY DATEPART(week, activity_date)
)
SELECT wk, active,
       LAG(active) OVER (ORDER BY wk) AS prev_active,
       ROUND((LAG(active) OVER (ORDER BY wk) - active) * 100.0 / LAG(active) OVER (ORDER BY wk), 1) AS churn_pct
FROM weekly;
GO

-- ---------------------------------------------------------
-- Q43 (source Q83) | Advanced SQL / Business Problems | Advanced | Asked in: Meta
-- Calculate the percentage of users who return after signing up.
-- ---------------------------------------------------------
SELECT ROUND(COUNT(DISTINCT ua.user_id) * 100.0 / COUNT(DISTINCT c.customer_id), 1) AS pct_returned
FROM customers c
LEFT JOIN user_activity ua
    ON c.customer_id = ua.user_id AND ua.activity_date > c.signup_date;
GO

-- ---------------------------------------------------------
-- Q44 (source Q84) | Advanced SQL / Business Problems | Advanced | Asked in: Meta, Amazon
-- Find users who logged in on consecutive days.
-- ---------------------------------------------------------
WITH islands AS (
    SELECT user_id, activity_date,
           DATEADD(day, -ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY activity_date), activity_date) AS grp
    FROM user_activity
)
SELECT user_id, MIN(activity_date) AS streak_start, MAX(activity_date) AS streak_end, COUNT(*) AS streak_length
FROM islands
GROUP BY user_id, grp
HAVING COUNT(*) >= 3;
GO

-- ---------------------------------------------------------
-- Q45 (source Q85) | Advanced SQL / Business Problems | Advanced | Asked in: Meta, Amazon
-- Find the longest login streak for each user.
-- ---------------------------------------------------------
WITH islands AS (
    SELECT user_id, activity_date,
           DATEADD(day, -ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY activity_date), activity_date) AS grp
    FROM user_activity
),
streaks AS (
    SELECT user_id, grp, COUNT(*) AS streak_length
    FROM islands
    GROUP BY user_id, grp
)
SELECT user_id, MAX(streak_length) AS longest_streak
FROM streaks
GROUP BY user_id;
GO

-- ---------------------------------------------------------
-- Q46 (source Q86) | Advanced SQL / Business Problems | Advanced | Asked in: Meta, Google
-- Calculate user retention by signup cohort.
-- ---------------------------------------------------------
SELECT c.signup_date AS cohort, DATEDIFF(day, c.signup_date, ua.activity_date) AS day_n,
       COUNT(DISTINCT ua.user_id) AS retained
FROM customers c
JOIN user_activity ua ON c.customer_id = ua.user_id
GROUP BY c.signup_date, DATEDIFF(day, c.signup_date, ua.activity_date);
GO

-- ---------------------------------------------------------
-- Q47 (source Q87) | Advanced SQL / Business Problems | Advanced | Asked in: Amazon
-- Find customers who made purchases in three consecutive months.
-- ---------------------------------------------------------
WITH monthly AS (
    SELECT DISTINCT customer_id, FORMAT(order_date,'yyyy-MM') AS month
    FROM orders
)
SELECT customer_id
FROM monthly
GROUP BY customer_id
HAVING COUNT(DISTINCT month) >= 3;
-- add a gaps-and-islands check on `month` if the 3 months must be strictly consecutive
GO

-- ---------------------------------------------------------
-- Q48 (source Q88) | Advanced SQL / Business Problems | Advanced | Asked in: Meta, Amazon
-- Find the first purchase after signup.
-- ---------------------------------------------------------
SELECT c.customer_id, MIN(o.order_date) AS first_purchase_after_signup
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id AND o.order_date >= c.signup_date
GROUP BY c.customer_id;
GO

-- ---------------------------------------------------------
-- Q49 (source Q89) | Advanced SQL / Business Problems | Advanced | Asked in: Meta
-- Calculate 7-day retention after signup.
-- ---------------------------------------------------------
SELECT c.customer_id,
       MAX(CASE WHEN ua.activity_date BETWEEN c.signup_date AND DATEADD(day, 7, c.signup_date) THEN 1 ELSE 0 END) AS retained_7d
FROM customers c
LEFT JOIN user_activity ua ON c.customer_id = ua.user_id
GROUP BY c.customer_id;
GO

-- ---------------------------------------------------------
-- Q50 (source Q90) | Advanced SQL / Business Problems | Advanced | Asked in: Amazon
-- Find users who purchased twice within 7 days.
-- ---------------------------------------------------------
SELECT 
    o1.customer_id, o1.order_date AS first_order, o2.order_date AS second_order,
    DATEDIFF(day, o1.order_date, o2.order_date) AS days_between
FROM orders o1
JOIN orders o2 ON o1.customer_id = o2.customer_id AND o2.order_date > o1.order_date
WHERE DATEDIFF(day, o1.order_date, o2.order_date) <= 7;
GO