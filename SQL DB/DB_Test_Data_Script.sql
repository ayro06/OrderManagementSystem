USE [master]
GO
/****** Object:  Database [OrderManagementDbTestData]    Script Date: 29/10/2019 8:43:42 AM ******/
CREATE DATABASE [OrderManagementDbTestData]
GO
ALTER DATABASE [OrderManagementDbTestData] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OrderManagementDbTestData].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OrderManagementDbTestData] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OrderManagementDbTestData] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OrderManagementDbTestData] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OrderManagementDbTestData] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OrderManagementDbTestData] SET ARITHABORT OFF 
GO
ALTER DATABASE [OrderManagementDbTestData] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OrderManagementDbTestData] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OrderManagementDbTestData] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OrderManagementDbTestData] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OrderManagementDbTestData] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OrderManagementDbTestData] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OrderManagementDbTestData] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OrderManagementDbTestData] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OrderManagementDbTestData] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OrderManagementDbTestData] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OrderManagementDbTestData] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OrderManagementDbTestData] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OrderManagementDbTestData] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OrderManagementDbTestData] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OrderManagementDbTestData] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OrderManagementDbTestData] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OrderManagementDbTestData] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OrderManagementDbTestData] SET RECOVERY FULL 
GO
ALTER DATABASE [OrderManagementDbTestData] SET  MULTI_USER 
GO
ALTER DATABASE [OrderManagementDbTestData] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OrderManagementDbTestData] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OrderManagementDbTestData] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OrderManagementDbTestData] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [OrderManagementDbTestData] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OrderManagementDbTestData] SET QUERY_STORE = OFF
GO
USE [OrderManagementDbTestData]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [OrderManagementDbTestData]
GO
/****** Object:  Table [dbo].[OrderHeaders]    Script Date: 29/10/2019 8:43:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHeaders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderStateId] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_OrderHeader] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 29/10/2019 8:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderHeaderId] [int] NOT NULL,
	[StockItemId] [int] NOT NULL,
	[Description] [varchar](150) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[OrderHeaderId] ASC,
	[StockItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStates]    Script Date: 29/10/2019 8:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OrderState] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockItems]    Script Date: 29/10/2019 8:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[InStock] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[OrderStates] ON 

INSERT [dbo].[OrderStates] ([Id], [Name]) VALUES (1, N'New')
INSERT [dbo].[OrderStates] ([Id], [Name]) VALUES (2, N'Pending')
INSERT [dbo].[OrderStates] ([Id], [Name]) VALUES (3, N'Rejected')
INSERT [dbo].[OrderStates] ([Id], [Name]) VALUES (4, N'Complete')
SET IDENTITY_INSERT [dbo].[OrderStates] OFF
SET IDENTITY_INSERT [dbo].[StockItems] ON 

INSERT [dbo].[StockItems] ([Id], [Name], [Price], [InStock]) VALUES (1, N'Table', CAST(100 AS Decimal(18, 0)), 10)
INSERT [dbo].[StockItems] ([Id], [Name], [Price], [InStock]) VALUES (2, N'Chair', CAST(25 AS Decimal(18, 0)), 10)
INSERT [dbo].[StockItems] ([Id], [Name], [Price], [InStock]) VALUES (3, N'Sofa', CAST(250 AS Decimal(18, 0)), 10)
INSERT [dbo].[StockItems] ([Id], [Name], [Price], [InStock]) VALUES (4, N'Wardrobe', CAST(180 AS Decimal(18, 0)), 7)
INSERT [dbo].[StockItems] ([Id], [Name], [Price], [InStock]) VALUES (5, N'Cupboard', CAST(65 AS Decimal(18, 0)), 9)
INSERT [dbo].[StockItems] ([Id], [Name], [Price], [InStock]) VALUES (6, N'Single Bed', CAST(120 AS Decimal(18, 0)), 10)
INSERT [dbo].[StockItems] ([Id], [Name], [Price], [InStock]) VALUES (7, N'Double Bed', CAST(180 AS Decimal(18, 0)), 10)
INSERT [dbo].[StockItems] ([Id], [Name], [Price], [InStock]) VALUES (8, N'Queen Bed', CAST(220 AS Decimal(18, 0)), 8)
INSERT [dbo].[StockItems] ([Id], [Name], [Price], [InStock]) VALUES (9, N'King Bed', CAST(320 AS Decimal(18, 0)), 9)
SET IDENTITY_INSERT [dbo].[StockItems] OFF
ALTER TABLE [dbo].[StockItems] ADD  CONSTRAINT [DF_Product_InStock]  DEFAULT ((10)) FOR [InStock]
GO
ALTER TABLE [dbo].[OrderHeaders]  WITH CHECK ADD  CONSTRAINT [FK_OrderHeader_OrderState] FOREIGN KEY([OrderStateId])
REFERENCES [dbo].[OrderStates] ([Id])
GO
ALTER TABLE [dbo].[OrderHeaders] CHECK CONSTRAINT [FK_OrderHeader_OrderState]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_OrderHeader] FOREIGN KEY([OrderHeaderId])
REFERENCES [dbo].[OrderHeaders] ([Id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItem_OrderHeader]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Product] FOREIGN KEY([StockItemId])
REFERENCES [dbo].[StockItems] ([Id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItem_Product]
GO
ALTER TABLE [dbo].[StockItems]  WITH CHECK ADD  CONSTRAINT [CK_StockItems] CHECK  (([InStock]>=(0)))
GO
ALTER TABLE [dbo].[StockItems] CHECK CONSTRAINT [CK_StockItems]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteOrderHeaderAndOrderItems]    Script Date: 29/10/2019 8:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:  TAFE NSW
-- Create date: 20191002
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteOrderHeaderAndOrderItems]
@orderHeaderId int
AS
BEGIN
DELETE FROM OrderItems WHERE [OrderHeaderId]  = @orderHeaderId;
    DELETE FROM OrderHeaders WHERE [Id]  = @orderHeaderId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteOrderItem]    Script Date: 29/10/2019 8:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:  TAFE NSW
-- Create date: 20191002
-- =============================================
create PROCEDURE [dbo].[sp_DeleteOrderItem]
@orderHeaderId int,
@stockItemId int
AS
BEGIN
    DELETE FROM OrderItems WHERE [OrderHeaderId]  = @orderHeaderId AND [StockItemId] = @stockItemId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertOrderHeader]    Script Date: 29/10/2019 8:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		TAFE NSW
-- Create date: 20191002
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertOrderHeader]
AS
BEGIN
	SET NOCOUNT ON;
    INSERT INTO OrderHeaders (OrderStateId,DateTime) VALUES (1,GETDATE()); 
	SELECT SCOPE_IDENTITY() Id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertOrderItem]    Script Date: 29/10/2019 8:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		TAFE NSW
-- Create date: 20191002
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertOrderItem]
	@orderHeaderId int,
	@stockItemId int,
	@description varchar(150),
	@price decimal(18,0),
	@quantity int
AS
BEGIN
    INSERT INTO OrderItems([OrderHeaderId],[StockItemId],[Description],[Price],[Quantity]) VALUES (@orderHeaderId,@stockItemId,@description,@price,@quantity);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectOrderHeaderById]    Script Date: 29/10/2019 8:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		TAFE NSW
-- Create date: 20191002
-- =============================================
CREATE PROCEDURE [dbo].[sp_SelectOrderHeaderById]
	@id int
AS
BEGIN
SET NOCOUNT ON;
   SELECT 
   OrderHeaders.Id,
    OrderHeaders.OrderStateId,
   OrderHeaders.[DateTime], 
   OrderItems.StockItemId,
   OrderItems.[Description],
   OrderItems.Price,
   OrderItems.Quantity
   FROM OrderHeaders
   LEFT OUTER JOIN OrderItems ON OrderItems.OrderHeaderId = OrderHeaders.Id
   WHERE OrderHeaders.Id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectOrderHeaders]    Script Date: 29/10/2019 8:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		TAFE NSW
-- Create date: 20191002
-- =============================================
CREATE PROCEDURE [dbo].[sp_SelectOrderHeaders]
AS
BEGIN
SET NOCOUNT ON;
   SELECT 
   OrderHeaders.Id,
   OrderHeaders.OrderStateId,
   OrderHeaders.[DateTime],  
   OrderItems.StockItemId,
   OrderItems.[Description],
   OrderItems.Price,
   OrderItems.Quantity
   FROM OrderHeaders
   INNER JOIN OrderItems ON OrderItems.OrderHeaderId = OrderHeaders.Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectStockItemById]    Script Date: 29/10/2019 8:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		TAFE NSW
-- Create date: 20191002
-- =============================================
CREATE PROCEDURE [dbo].[sp_SelectStockItemById]
	@id int
AS
BEGIN
SET NOCOUNT ON;
   SELECT * FROM StockItems WHERE Id = @id; 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectStockItems]    Script Date: 29/10/2019 8:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		TAFE NSW
-- Create date: 20191002
-- =============================================
CREATE PROCEDURE [dbo].[sp_SelectStockItems]
AS
BEGIN
SET NOCOUNT ON;
   SELECT * FROM StockItems; 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateOrderState]    Script Date: 29/10/2019 8:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		TAFE NSW
-- Create date: 20191002
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateOrderState]
	@orderHeaderId int,
	@stateId int
AS
BEGIN
	SET NOCOUNT ON;
    UPDATE OrderHeaders set OrderStateId = @stateId WHERE Id = @orderHeaderId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateStockItemAmount]    Script Date: 29/10/2019 8:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		TAFE NSW
-- Create date: 20191002
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateStockItemAmount]
	@id int,
	@amount int
AS
BEGIN
SET NOCOUNT ON;
   UPDATE StockItems SET InStock = InStock + @amount WHERE Id = @id;
   SELECT InStock from StockItems WHERE Id = @id; 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpsertOrderItem]    Script Date: 29/10/2019 8:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpsertOrderItem] (@orderHeaderId int, @stockItemId int, @description varchar(150), @price decimal(18,0), @quantity int)
AS 
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRAN 
		IF EXISTS ( SELECT * FROM OrderItems WITH (UPDLOCK) WHERE OrderHeaderId = @orderHeaderId AND StockItemId = @stockItemId)
			UPDATE [OrderItems] SET [Quantity] = @quantity WHERE OrderHeaderId = @orderHeaderId AND StockItemId = @stockItemId;
		ELSE 
			INSERT INTO OrderItems([OrderHeaderId],[StockItemId],[Description],[Price],[Quantity]) VALUES (@orderHeaderId,@stockItemId,@description,@price,@quantity);
	COMMIT
GO
USE [master]
GO
ALTER DATABASE [OrderManagementDbTestData] SET  READ_WRITE 
GO
