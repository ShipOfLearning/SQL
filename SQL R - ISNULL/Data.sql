
/****** Object:  Table [dbo].[Employees]    Script Date: 10/3/2025 7:31:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employees](
	[EmpID] [int] NULL,
	[Name] [varchar](50) NULL,
	[Department] [varchar](50) NULL,
	[Salary] [int] NULL,
	[Email] [varchar](100) NULL,
	[Phone] [varchar](20) NULL
) ON [PRIMARY]
GO


INSERT INTO [dbo].[Employees] (EmpID, Name, Department, Salary, Email, Phone)
VALUES
(1, 'Amit',    'IT',        60000, 'amit@example.com', '9876543210'),
(2, 'Rohit',   'HR',        45000, NULL,                '9123456789'),
(3, 'Neha',    'Finance',   55000, NULL,                NULL),
(4, 'Simran',  'Marketing', 50000, 'simran@example.com', NULL),
(5, 'KK',   'IT',        70000, NULL,                NULL),
(6, 'Priya',   'HR',        48000, 'priya@company.com', NULL),
(7, 'Arjun',   'Finance',   65000, NULL,                '9812345678'),
(8, 'Meera',   'IT',        72000, 'meera@example.com', '9988776655'),
(9, 'Vikram',  'Marketing', 53000, NULL,                NULL),
(10,'Anjali',  'Finance',   60000, 'anjali@example.com', NULL);

