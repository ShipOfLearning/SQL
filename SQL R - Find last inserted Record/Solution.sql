-- get last inserte record from student table
SELECT * FROM Student

--TOP 1
SELECT  TOP 1
* FROM Student ORDER BY StudentID DESC

--MAX
SELECT * FROM Student WHERE StudentID IN 
(SELECT MAX(StudentID) FROM Student)

--OFFSET.. FETCH
SELECT * FROM Student ORDER BY StudentID DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROW ONLY;