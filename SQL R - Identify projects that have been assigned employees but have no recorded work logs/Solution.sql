/*===============================================================
  CHANNEL  : SHIP OF LEARNING
  TOPIC    : FIND ASSIGNED PROJECTS WITHOUT WORK LOGS
===============================================================*/
--SELECT * FROM Projects
--SELECT * FROM ProjectActivity

SELECT
	P.ProjectID,P.ProjectName
FROM Projects P
WHERE EXISTS
(
	SELECT
		1
	FROM ProjectActivity PA
	WHERE ActivityType = 'ASSIGNMENT' 
	AND P.ProjectID = PA.ProjectID
)
AND NOT EXISTS
(
	SELECT
		1
	FROM ProjectActivity PA
	WHERE ActivityType = 'WORK_LOG' 
	AND P.ProjectID = PA.ProjectID
)