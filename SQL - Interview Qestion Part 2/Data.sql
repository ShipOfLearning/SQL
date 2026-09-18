-- =========================================================
-- SHIP OF LEARNING | SQL INTERVIEW SET 2 | MASTER DATA SCRIPT
-- =========================================================

-- 1. DEPARTMENTS (Finance dept kept EMPTY on purpose -> needed for Q9)
CREATE TABLE Departments (
    DeptID   INT PRIMARY KEY,
    DeptName VARCHAR(50)
);
INSERT INTO Departments (DeptID, DeptName) VALUES
(1,'HR'), (2,'Sales'), (3,'IT'), (4,'Marketing'), (5,'Finance');

-- 2. EMPLOYEES (self-referencing ManagerID -> needed for Q11)
CREATE TABLE Employees (
    EmpID     INT PRIMARY KEY,
    EmpName   VARCHAR(50),
    DeptID    INT NOT NULL FOREIGN KEY REFERENCES Departments(DeptID),
    ManagerID INT NULL,
    Salary    DECIMAL(10,2) NOT NULL,          -- Q5: NOT NULL constraint
    JoinDate  DATE
);
INSERT INTO Employees (EmpID, EmpName, DeptID, ManagerID, Salary, JoinDate) VALUES
(101,'Rahul Sharma', 1, NULL, 55000, '2021-01-15'),
(102,'Priya Verma',  1, 101,  42000, '2021-01-20'),   -- same join month as manager
(103,'Amit Singh',   2, NULL, 60000, '2020-03-10'),
(104,'Neha Gupta',   2, 103,  48000, '2020-03-25'),   -- same join month as manager
(105,'Karan Mehta',  2, 103,  52000, '2022-06-01'),
(106,'Sneha Patel',  3, NULL, 75000, '2019-11-05'),
(107,'Vikram Joshi', 3, 106,  68000, '2019-11-18'),   -- same join month as manager
(108,'Anjali Nair',  3, 106,  70000, '2023-02-14'),
(109,'Rohit Desai',  4, NULL, 50000, '2022-08-01'),
(110,'Pooja Iyer',   4, 109,  45000, '2022-08-22');   -- same join month as manager

-- 3. USERS (login system -> Q6)
CREATE TABLE Users (
    UserID   INT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE,        -- Q6: enforce uniqueness
    Password VARCHAR(50)
);
INSERT INTO Users VALUES (1,'rahul_s','Pass@123'), (2,'priya_v','Pass@456');

-- 4. TWO SAME-STRUCTURE TABLES (Q7: UNION)
CREATE TABLE Employees2023 (EmpID INT, EmpName VARCHAR(50));
CREATE TABLE Employees2024 (EmpID INT, EmpName VARCHAR(50));
INSERT INTO Employees2023 VALUES (101,'Rahul Sharma'), (102,'Priya Verma'), (103,'Amit Singh');
INSERT INTO Employees2024 VALUES (102,'Priya Verma'), (103,'Amit Singh'), (104,'Neha Gupta');

-- 5. E-COMMERCE-STYLE SALES DATA (Q10, Q13)
CREATE TABLE Categories (
    CategoryID   INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);
INSERT INTO Categories VALUES (1,'Electronics'), (2,'Clothing'), (3,'Grocery'), (4,'Books');

CREATE TABLE Products (
    ProductID   INT PRIMARY KEY,
    ProductName VARCHAR(50),
    CategoryID  INT FOREIGN KEY REFERENCES Categories(CategoryID)
);
INSERT INTO Products VALUES
(1,'Smartphone',1), (2,'Laptop',1), (3,'T-Shirt',2), (4,'Jeans',2),
(5,'Rice Bag',3), (6,'Cooking Oil',3), (7,'SQL Guide Book',4);

CREATE TABLE Orders (
    OrderID   INT PRIMARY KEY,
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    OrderDate DATE,
    Quantity  INT,
    Price     DECIMAL(10,2)
);
INSERT INTO Orders VALUES
(1,1,'2024-01-05',2,25000), (2,2,'2024-01-10',1,55000),
(3,3,'2024-01-12',5,800),   (4,4,'2024-01-15',3,1500),
(5,5,'2024-01-18',10,600),  (6,6,'2024-01-20',6,250),
(7,7,'2024-01-22',4,499),   (8,1,'2024-02-01',1,25000);

-- 6. SALARY HISTORY (Q14: year-over-year growth)
CREATE TABLE SalaryHistory (
    EmpID   INT,
    YearNum INT,
    Salary  DECIMAL(10,2)
);
INSERT INTO SalaryHistory VALUES
(101,2021,48000),(101,2022,52000),(101,2023,55000),
(103,2021,54000),(103,2022,57000),(103,2023,60000);