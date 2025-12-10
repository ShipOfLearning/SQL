/****** Object:  Table [dbo].[Orders]    Script Date: 12/10/2025 1:55:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[OrderDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/10/2025 1:55:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] NOT NULL,
	[ProductName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Orders] ([OrderID], [ProductID], [Quantity], [OrderDate]) VALUES (101, 1, 2, CAST(N'2024-11-12T11:05:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [ProductID], [Quantity], [OrderDate]) VALUES (102, 1, 1, CAST(N'2024-11-13T09:25:00.000' AS DateTime))
GO
INSERT [dbo].[Orders] ([OrderID], [ProductID], [Quantity], [OrderDate]) VALUES (103, 3, 5, CAST(N'2024-11-14T21:36:00.000' AS DateTime))
GO
INSERT [dbo].[Product] ([ProductID], [ProductName]) VALUES (1, N'Mobile')
GO
INSERT [dbo].[Product] ([ProductID], [ProductName]) VALUES (2, N'Laptop')
GO
INSERT [dbo].[Product] ([ProductID], [ProductName]) VALUES (3, N'Headphone')
GO
INSERT [dbo].[Product] ([ProductID], [ProductName]) VALUES (4, N'Keyboard')
GO
INSERT [dbo].[Product] ([ProductID], [ProductName]) VALUES (5, N'Mouse')
GO
