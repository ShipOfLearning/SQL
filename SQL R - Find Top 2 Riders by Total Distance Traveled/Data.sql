/* ================================================================
   SHIP OF LEARNING : Zomato
   TOPIC: Find Top 2 Riders Who Have Traveled the Greatest
            Total Distance to Deliver Orders
   ==============================================================*/
   

/* ================================================================
   STEP 1: DROP TABLES IF THEY ALREADY EXIST
   ================================================================ */

IF OBJECT_ID('dbo.Deliveries', 'U') IS NOT NULL
    DROP TABLE dbo.Deliveries;

IF OBJECT_ID('dbo.Riders', 'U') IS NOT NULL
    DROP TABLE dbo.Riders;


/* ================================================================
   STEP 2: CREATE RIDERS MASTER TABLE
   ================================================================ */

CREATE TABLE dbo.Riders
(
    rider_id   INT PRIMARY KEY,
    rider_name VARCHAR(100) NOT NULL
);


/* ================================================================
   STEP 3: CREATE DELIVERIES TRANSACTION TABLE
   ================================================================ */

CREATE TABLE dbo.Deliveries
(
    delivery_id INT PRIMARY KEY,
    rider_id    INT NOT NULL,
    order_id    INT NOT NULL,
    distance_km DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_Deliveries_Riders
        FOREIGN KEY (rider_id)
        REFERENCES dbo.Riders(rider_id)
);


/* ================================================================
   STEP 4: INSERT RIDER MASTER DATA
   ================================================================ */

INSERT INTO dbo.Riders
(
    rider_id,
    rider_name
)
VALUES
(101, 'Rahul'),
(102, 'Amit'),
(103, 'Vijay'),
(104, 'Rohit'),
(105, 'Karan');


/* ================================================================
   STEP 5: INSERT DELIVERY DATA
   ================================================================ */

INSERT INTO dbo.Deliveries
(
    delivery_id,
    rider_id,
    order_id,
    distance_km
)
VALUES
-- Rahul
(1,  101, 1001, 12.50),
(2,  101, 1002, 18.00),
(3,  101, 1003, 15.50),
(4,  101, 1004, 20.00),

-- Amit
(5,  102, 1005, 25.00),
(6,  102, 1006, 17.50),
(7,  102, 1007, 22.00),

-- Vijay
(8,  103, 1008, 10.00),
(9,  103, 1009, 15.00),
(10, 103, 1010, 12.50),

-- Rohit
(11, 104, 1011, 30.00),
(12, 104, 1012, 28.50),
(13, 104, 1013, 25.00),

-- Karan
(14, 105, 1014, 20.00),
(15, 105, 1015, 19.50),
(16, 105, 1016, 21.00);


/* ================================================================
   STEP 6: CHECK MASTER DATA
   ================================================================ */

SELECT *
FROM dbo.Riders;


/* ================================================================
   STEP 7: CHECK DELIVERY DATA
   ================================================================ */

SELECT *
FROM dbo.Deliveries;

