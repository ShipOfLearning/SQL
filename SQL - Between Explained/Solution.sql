-- @ShipOfLearning
-- BETWEEN KEYWORD
SELECT * FROM Students

SELECT StudentName, Marks
FROM Students
WHERE Marks < 60 OR Marks > 80;

SELECT 
	StudentName, Marks
FROM Students
WHERE Marks NOT BETWEEN 60 AND 80