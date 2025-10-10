-- Step 1: Create Department table (Parent)
CREATE TABLE Department (
   DeptID INT PRIMARY KEY,
   DeptName VARCHAR(50)
);

-- Step 2: Create Student table (Child)
CREATE TABLE Student (
   StudentID INT PRIMARY KEY,
   StudentName VARCHAR(50),
   DeptID INT,
   FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- Step 3: Wrong insert (Foreign Key Violation)
INSERT INTO Student VALUES (1, 'Aman', 10);
-- ERROR: Foreign key constraint fails

-- Step 4: Correct insert sequence
INSERT INTO Department VALUES (10, 'Computer Science');
INSERT INTO Student VALUES (1, 'Aman', 10);

-- Step 5: View Data
SELECT * FROM Department;
SELECT * FROM Student;