--SELECT * FROM Students
--SELECT * FROM Marks

SELECT StudentName
FROM Students
WHERE StudentID IN 
(SELECT StudentID FROM Marks)

SELECT StudentName
FROM Students S
WHERE EXISTS
(SELECT 1 FROM Marks M 
WHERE M.StudentID = S.StudentID)