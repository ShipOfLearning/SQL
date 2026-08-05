-- @ShipOfLearning
-- Swap 2 column value without TempVariable

SELECT * FROM Students
BEGIN TRAN
UPDATE
Students
SET maths = science,
science = maths
SELECT * FROM Students
COMMIT TRAN