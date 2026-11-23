--============================================================
-- CHANNEL : SHIP OF LEARNING
-- TOPIC   : FIND ORIGIN AND FINAL DESTINATION OF EVERY CUSTOMER
-- DATABASE: MICROSOFT SQL SERVER
--============================================================
--BUSINESS REQUIREMENT:
--Find the first origin and final destination
--for every customer using flight records.

--NOTE:
--Flight records are NOT stored in journey order.

--============================================================
--STEP 1: DROP EXISTING TABLE IF IT EXISTS
--============================================================

IF OBJECT_ID('dbo.Flights', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Flights;
END;
GO

--============================================================
--STEP 2: CREATE TABLE
--============================================================

CREATE TABLE dbo.Flights
(
    cust_id     INT         NOT NULL,
    flight_id   VARCHAR(10) NOT NULL,
    origin      VARCHAR(50) NOT NULL,
    destination VARCHAR(50) NOT NULL,

    CONSTRAINT PK_Flights
        PRIMARY KEY (cust_id, flight_id)
);
GO

--============================================================
--STEP 3: INSERT MASTER DATA
--============================================================

INSERT INTO dbo.Flights
(
    cust_id,
    flight_id,
    origin,
    destination
)
VALUES
    (1, 'SG1234', 'Delhi',     'Hyderabad'),
    (1, 'SG3476', 'Kochi',     'Mangalore'),
    (1, '69876',  'Hyderabad', 'Kochi'),
    (2, '68749',  'Mumbai',    'Varanasi'),
    (2, 'SG5723', 'Varanasi',  'Delhi');
GO

--============================================================
--STEP 4: VERIFY MASTER DATA
--============================================================


SELECT
    cust_id,
    flight_id,
    origin,
    destination
FROM dbo.Flights
ORDER BY
    cust_id,
    flight_id;
GO
