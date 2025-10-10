CREATE TABLE Students (
    StudentID INT,
    StudentName VARCHAR(50)
);

CREATE TABLE Marks (
    StudentID INT,
    Subject VARCHAR(50),
    Score INT
);

INSERT INTO Students VALUES
(1, 'Aman'),
(2, 'Riya'),
(3, 'Vivek'),
(4, 'Neha');

INSERT INTO Marks VALUES
(1, 'Maths', 80),
(2, 'Maths', 70),
(3, 'Maths', 90);