DROP TABLE IF EXISTS Shipments;
GO

CREATE TABLE Shipments
(
    ShipmentID INT,
    CustomerName VARCHAR(100),
    ShipmentDate DATE,
    City VARCHAR(100)
);

INSERT INTO Shipments
VALUES
(1001,'Rahul','2025-01-03','Mumbai'),
(1002,'Amit','2025-01-05','Delhi'),
(1002,'Amit','2025-01-05','Delhi'),
(1003,'Neha','2025-01-15','Pune'),
(1004,'Riya','2025-02-02','Ahmedabad'),
(1005,'Karan','2025-02-04','Delhi'),
(1005,'Karan','2025-02-04','Delhi'),
(1006,'Ankit','2025-02-15','Mumbai'),
(1007,'Priya','2025-03-02','Pune'),
(1008,'Sonia','2025-03-08','Surat'),
(1008,'Sonia','2025-03-08','Surat'),
(1009,'Raj','2025-03-20','Delhi'),
(1010,'Vikas','2025-04-01','Mumbai');