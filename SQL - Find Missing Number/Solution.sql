-- @ShipOfLearning
-- Find the Gap in sequence
SELECT * FROM SequenceData

;WITH NEWCTE AS (
SELECT
	ID, 
	LEAD(ID) OVER (ORDER BY ID) NEXTID
FROM SequenceData)

SELECT ID, NEXTID FROM NEWCTE WHERE NEXTID - ID > 1
