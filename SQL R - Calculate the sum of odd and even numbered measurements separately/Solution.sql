--============================================================
--CHANNEL  : Ship of Learning - Google
--TOPIC    : Sum Odd and Even Numbered Measurements Separately
--============================================================
SELECT * FROM measurements

;WITH CTE AS(
SELECT
	measurement_id, measurement_value,
	CAST(measurement_time AS date) DT,
	ROW_NUMBER() OVER
	(
		PARTITION BY CAST(measurement_time AS date)
		ORDER BY measurement_time,measurement_id
	) AS RN
FROM measurements)
SELECT
	DT,
	SUM(CASE WHEN RN % 2 =1 THEN measurement_value ELSE 0 
	END) O,
	SUM(CASE WHEN RN % 2 =0 THEN measurement_value ELSE 0 
	END) E
FROM CTE
GROUP BY
DT