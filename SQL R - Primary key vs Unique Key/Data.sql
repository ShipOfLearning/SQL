-- Create Table
CREATE TABLE Students (
    RollNo INT PRIMARY KEY,
    Email VARCHAR(100) UNIQUE,
    Name VARCHAR(50)
);

-- Insert Records
INSERT INTO Students VALUES (1, 'ravi@gmail.com', 'Ravi');
INSERT INTO Students VALUES (2, 'neha@gmail.com', 'Neha');