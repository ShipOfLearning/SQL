SELECT * FROM Students 
SELECT * FROM Subjects 

SELECT StudentName,SubjectName
FROM 
Students T1
CROSS JOIN
Subjects as T2
