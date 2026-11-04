/*==============================================================
  CHANNEL : SHIP OF LEARNING
  TOPIC   : CALCULATE LATE INVOICE PAYMENT PERCENTAGE
==============================================================*/
IF OBJECT_ID('dbo.Invoices', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Invoices;
END;
GO

CREATE TABLE dbo.Invoices
(
    InvoiceID INT NOT NULL PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    InvoiceDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    PaymentDate DATE NULL,
    InvoiceAmount DECIMAL(12,2) NOT NULL
);
GO

INSERT INTO dbo.Invoices
(InvoiceID, CustomerName, InvoiceDate, DueDate, PaymentDate, InvoiceAmount)
VALUES
(101, 'Amit',   '20261001', '20261010', '20261010', 10000.00),
(102, 'Rahul',  '20261002', '20261010', '20261012', 15000.00),
(103, 'Priya',  '20261005', '20261015', '20261020', 20000.00),
(104, 'Neha',   '20261008', '20261020', '20261018', 12000.00),
(105, 'Karan',  '20261010', '20261020', NULL,       18000.00),
(106, 'Sneha',  '20261012', '20261020', '20261021', 25000.00),
(107, 'Vikas',  '20261015', '20261025', '20261025', 14000.00),
(108, 'Anjali', '20261018', '20261028', NULL,       30000.00),
(109, 'Rohit',  '20261020', '20261030', '20261029', 22000.00),
(110, 'Pooja',  '20261022', '20261030', NULL,       16000.00);
GO
