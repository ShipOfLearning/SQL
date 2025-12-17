-- Find all the unique values from below table which form a "Sandwich Pattern"
-- SELECT * FROM SandwichData

;WITH CTE AS (
SELECT sr_no,num,
	LEAD(num) OVER (ORDER BY SR_NO) NEXT_NUM,
	LAG(num) OVER (ORDER BY SR_NO) PRE_NUM
FROM SandwichData)

SELECT SR_NO, NUM FROM CTE
WHERE NEXT_NUM = PRE_NUM
AND num <> NEXT_NUM