--============================================================
--  CHANNEL  : Ship of Learning - Google
--  TOPIC    : Sum Odd and Even Numbered Measurements Separately
--============================================================

-- STEP 1: Drop the table only if it already exists.
IF OBJECT_ID(N'dbo.measurements', N'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.measurements;
END;
GO

-- STEP 2: Create the master table.
CREATE TABLE dbo.measurements
(
    measurement_id    INT           NOT NULL PRIMARY KEY,
    measurement_value DECIMAL(10,2) NOT NULL,
    measurement_time  DATETIME2(0)  NOT NULL
);
GO

-- STEP 3: Insert sample master data.
INSERT INTO dbo.measurements
    (measurement_id, measurement_value, measurement_time)
VALUES
    (131233, 1109.51, '2022-07-10T09:00:00'),
    (135211, 1662.74, '2022-07-10T11:00:00'),
    (523542, 1246.24, '2022-07-10T13:15:00'),
    (143562, 1124.50, '2022-07-11T15:00:00'),
    (346462, 1234.14, '2022-07-11T16:45:00');
GO

-- STEP 4: Inspect the master data.
SELECT
    measurement_id,
    measurement_value,
    measurement_time
FROM dbo.measurements
ORDER BY measurement_time, measurement_id;
GO

-- STEP 5: BEST SOLUTION
-- Number measurements separately within each calendar day.
-- Use a unique tie-breaker for deterministic ordering.
;WITH RankedMeasurements AS
(
    SELECT
        CAST(measurement_time AS DATE) AS measurement_day,
        measurement_id,
        measurement_value,
        measurement_time,
        ROW_NUMBER() OVER
        (
            PARTITION BY CAST(measurement_time AS DATE)
            ORDER BY measurement_time, measurement_id
        ) AS measurement_num
    FROM dbo.measurements
)
SELECT
    measurement_day,
    SUM
    (
        CASE
            WHEN measurement_num % 2 = 1
            THEN measurement_value
            ELSE 0
        END
    ) AS odd_sum,
    SUM
    (
        CASE
            WHEN measurement_num % 2 = 0
            THEN measurement_value
            ELSE 0
        END
    ) AS even_sum
FROM RankedMeasurements
GROUP BY measurement_day
ORDER BY measurement_day;
GO
