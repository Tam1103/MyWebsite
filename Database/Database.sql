USE [MyWebsite]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1/4/2021 3:48:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 1/4/2021 3:48:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](250) NULL,
	[Password] [varchar](250) NULL,
	[FullName] [varchar](50) NULL,
	[Email] [varchar](250) NULL,
	[Photo] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/4/2021 3:48:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
	[Status] [bit] NOT NULL,
	[ParentId] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Photo]    Script Date: 1/4/2021 3:48:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[Featured] [bit] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_Photo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/4/2021 3:48:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Details] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Featured] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 1/4/2021 3:48:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleAccount]    Script Date: 1/4/2021 3:48:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleAccount](
	[RoleId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_RoleAccount] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlideShow]    Script Date: 1/4/2021 3:48:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlideShow](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
	[Title] [nvarchar](max) NULL,
	[UptoSale] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_SlideShow] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201224094754_AddLaptop', N'5.0.0')
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [Username], [Password], [FullName], [Email], [Photo], [Status]) VALUES (3, N'tamdm', N'$2b$10$/xt0AqkbQyzTuFLK16/nAOlfS7rn2EF9aXgVk2T79i9ROJHaMbMPS', N'do minh tam', N'dmt@gmail.com', N'12242020045430sebastian-leon-prado-dBiIcdxMWfE-unsplash.jpg', 1)
INSERT [dbo].[Account] ([Id], [Username], [Password], [FullName], [Email], [Photo], [Status]) VALUES (4, N'tientq', N'$2b$10$/xt0AqkbQyzTuFLK16/nAOlfS7rn2EF9aXgVk2T79i9ROJHaMbMPS', N'dinh quoc tien', N'tientq@gmail.com', NULL, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Status], [ParentId]) VALUES (1, N'Sách', 1, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Status], [ParentId]) VALUES (2, N'Báo', 1, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Status], [ParentId]) VALUES (6, N'Sách 1', 1, 1)
INSERT [dbo].[Category] ([Id], [Name], [Status], [ParentId]) VALUES (7, N'Báo 1', 1, 2)
INSERT [dbo].[Category] ([Id], [Name], [Status], [ParentId]) VALUES (8, N'Sách 2', 1, 1)
INSERT [dbo].[Category] ([Id], [Name], [Status], [ParentId]) VALUES (9, N'Báo 2', 1, 2)
INSERT [dbo].[Category] ([Id], [Name], [Status], [ParentId]) VALUES (10, N'Sách Báo', 1, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Status], [ParentId]) VALUES (13, N'Sách báo 1', 1, 10)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Photo] ON 

INSERT [dbo].[Photo] ([Id], [Name], [Status], [Featured], [ProductId]) VALUES (1, N'12282020090358daria-nepriakhina-xY55bL5mZAM-unsplash.jpg', 1, 1, 1)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Featured], [ProductId]) VALUES (3, N'12242020050129download.jfif', 1, 1, 3)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Featured], [ProductId]) VALUES (4, N'12242020050035images.jfif', 1, 1, 4)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Featured], [ProductId]) VALUES (5, N'12242020051259photo-1591102424552-53fcbb7a0b47.jfif', 1, 1, 2)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Featured], [ProductId]) VALUES (1002, N'12282020114002photo-1549122728-f519709caa9c.jfif', 1, 1, 4)
SET IDENTITY_INSERT [dbo].[Photo] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Description], [Details], [Status], [Price], [Quantity], [CategoryId], [Featured]) VALUES (1, N'Sách hay', NULL, NULL, 1, CAST(100.00 AS Decimal(18, 2)), 1, 6, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Details], [Status], [Price], [Quantity], [CategoryId], [Featured]) VALUES (2, N'Sách hay 2', NULL, NULL, 1, CAST(0.00 AS Decimal(18, 2)), 0, 8, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Details], [Status], [Price], [Quantity], [CategoryId], [Featured]) VALUES (3, N'Báo 1 1 ', NULL, NULL, 1, CAST(0.00 AS Decimal(18, 2)), 0, 7, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Details], [Status], [Price], [Quantity], [CategoryId], [Featured]) VALUES (4, N'Báo 2.2', NULL, NULL, 1, CAST(0.00 AS Decimal(18, 2)), 0, 9, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name], [Status]) VALUES (1, N'Admin', 1)
INSERT [dbo].[Role] ([Id], [Name], [Status]) VALUES (2, N'Customer', 1)
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[RoleAccount] ([RoleId], [AccountId], [Status]) VALUES (1, 3, 1)
INSERT [dbo].[RoleAccount] ([RoleId], [AccountId], [Status]) VALUES (2, 4, 1)
GO
SET IDENTITY_INSERT [dbo].[SlideShow] ON 

INSERT [dbo].[SlideShow] ([Id], [Name], [Title], [UptoSale], [Description], [Status]) VALUES (1, N'12242020045915photo-1549122728-f519709caa9c.jfif', NULL, NULL, NULL, 1)
INSERT [dbo].[SlideShow] ([Id], [Name], [Title], [UptoSale], [Description], [Status]) VALUES (2, N'12242020045919photo-1533669955142-6a73332af4db.jfif', NULL, NULL, NULL, 1)
INSERT [dbo].[SlideShow] ([Id], [Name], [Title], [UptoSale], [Description], [Status]) VALUES (3, N'12242020050057download (1).jfif', NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[SlideShow] OFF
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Category] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Category]
GO
ALTER TABLE [dbo].[Photo]  WITH CHECK ADD  CONSTRAINT [FK_Photo_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Photo] CHECK CONSTRAINT [FK_Photo_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[RoleAccount]  WITH CHECK ADD  CONSTRAINT [FK_RoleAccount_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[RoleAccount] CHECK CONSTRAINT [FK_RoleAccount_Account]
GO
ALTER TABLE [dbo].[RoleAccount]  WITH CHECK ADD  CONSTRAINT [FK_RoleAccount_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[RoleAccount] CHECK CONSTRAINT [FK_RoleAccount_Role]
GO
