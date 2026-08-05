-- ============================================
-- SHIP OF LEARNING - BETWEEN Keyword Demo
-- ============================================

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Subject VARCHAR(50),
    Marks INT
);

INSERT INTO Students (StudentID, StudentName, Subject, Marks) VALUES
(1, 'Aarav',   'Math',    45),
(2, 'Isha',    'Math',    72),
(3, 'Kabir',   'Math',    89),
(4, 'Meera',   'Math',    60),
(5, 'Rohan',   'Math',    80),
(6, 'Simran',  'Math',    35),
(7, 'Yash',    'Math',    95),
(8, 'Diya',    'Math',    68),
(9, 'Arjun',   'Math',    100),
(10, 'Priya',  'Math',    55);