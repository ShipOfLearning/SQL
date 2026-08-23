CREATE TABLE Employees (
    EmpID       INT PRIMARY KEY,
    EmpName     VARCHAR(50),
    Department  VARCHAR(50),
    Salary      DECIMAL(10,2),
    HireDate    DATE
);

INSERT INTO Employees (EmpID, EmpName, Department, Salary, HireDate) VALUES
(1,  'Rohit Sharma',   'Sales', 55000, '2019-03-15'),
(2,  'Anjali Verma',   'Sales', 62000, '2020-06-10'),
(3,  'Karan Mehta',    'Sales', 48000, '2021-01-25'),
(4,  'Priya Singh',    'Sales', 62000, '2018-11-05'),
(5,  'Vikas Gupta',    'IT',    75000, '2017-02-20'),
(6,  'Neha Kapoor',    'IT',    82000, '2019-08-14'),
(7,  'Suresh Iyer',    'IT',    82000, '2020-12-01'),
(8,  'Meena Joshi',    'IT',    58000, '2022-04-18'),
(9,  'Arjun Nair',     'HR',    45000, '2016-09-09'),
(10, 'Divya Rao',      'HR',    51000, '2021-07-22'),
(11, 'Ramesh Patil',   'HR',    51000, '2019-05-30'),
(12, 'Sneha Reddy',    'Finance', 68000, '2018-03-11'),
(13, 'Amit Chawla',    'Finance', 71000, '2020-10-19'),
(14, 'Pooja Malhotra',  'Finance', 68000, '2022-01-07'),
(15, 'Deepak Yadav',   'Finance', 90000, '2017-06-25');
