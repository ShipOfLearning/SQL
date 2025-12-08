CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing');

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employees VALUES
(101, 'Amit', 50000, 3),
(102, 'Rohit', 35000, 1),
(103, 'Sneha', 60000, 3),
(104, 'Priya', 45000, 2),
(105, 'Vikas', 30000, 4),
(106, 'Neha', 70000, 3);
