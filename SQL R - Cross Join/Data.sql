-- Creating Students Table
CREATE TABLE Students (
    StudentID INT,
    StudentName VARCHAR(50)
);

INSERT INTO Students (StudentID, StudentName) VALUES
(1, 'Amit'),
(2, 'Priya'),
(3, 'Raj');

-- Creating Subjects Table
CREATE TABLE Subjects (
    SubjectID INT,
    SubjectName VARCHAR(50)
);

INSERT INTO Subjects (SubjectID, SubjectName) VALUES
(101, 'Math'),
(102, 'Science'),
(103, 'Social Studies'),
(104, 'Gujarati');