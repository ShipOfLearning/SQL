-- STEP 1: Create Table
CREATE TABLE Students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    maths INT,
    science INT
);

-- STEP 2: Insert Sample Data (marks swapped by mistake)
INSERT INTO students (id, name, maths, science) VALUES
(1, 'Aman', 80, 90),
(2, 'Riya', 70, 60),
(3, 'Karan', 95, 85),
(4, 'Sneha', 65, 75);

-- Check data before swap
SELECT * FROM students;