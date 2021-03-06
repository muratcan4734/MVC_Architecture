USE [master]
GO
/****** Object:  Database [MVCParfum]    Script Date: 8/18/2013 1:35:24 AM ******/
CREATE DATABASE [MVCParfum]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MVCParfum', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\MVCParfum.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MVCParfum_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\MVCParfum_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MVCParfum] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MVCParfum].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MVCParfum] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MVCParfum] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MVCParfum] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MVCParfum] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MVCParfum] SET ARITHABORT OFF 
GO
ALTER DATABASE [MVCParfum] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MVCParfum] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MVCParfum] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MVCParfum] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MVCParfum] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MVCParfum] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MVCParfum] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MVCParfum] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MVCParfum] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MVCParfum] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MVCParfum] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MVCParfum] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MVCParfum] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MVCParfum] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MVCParfum] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MVCParfum] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MVCParfum] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MVCParfum] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MVCParfum] SET RECOVERY FULL 
GO
ALTER DATABASE [MVCParfum] SET  MULTI_USER 
GO
ALTER DATABASE [MVCParfum] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MVCParfum] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MVCParfum] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MVCParfum] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MVCParfum', N'ON'
GO
USE [MVCParfum]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 8/18/2013 1:35:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 8/18/2013 1:35:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[PerfumeId] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 8/18/2013 1:35:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserDetailId] [int] NOT NULL,
	[ShipAddress] [nvarchar](300) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Perfumes]    Script Date: 8/18/2013 1:35:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfumes](
	[PerfumeId] [int] IDENTITY(1,1) NOT NULL,
	[PerfumeName] [nvarchar](50) NOT NULL,
	[BrandId] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[PhotoPath] [nvarchar](250) NULL,
 CONSTRAINT [PK_Perfumes] PRIMARY KEY CLUSTERED 
(
	[PerfumeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 8/18/2013 1:35:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserDetailId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([BrandId], [BrandName], [Description]) VALUES (1, N'Burberry', NULL)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [Description]) VALUES (2, N'Davidoff', NULL)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [Description]) VALUES (3, N'Lacoste', NULL)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [Description]) VALUES (4, N'Calvin Klein', NULL)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [Description]) VALUES (1002, N'Cacharel', NULL)
INSERT [dbo].[Brands] ([BrandId], [BrandName], [Description]) VALUES (1003, N'Giorgio Armani', NULL)
SET IDENTITY_INSERT [dbo].[Brands] OFF
SET IDENTITY_INSERT [dbo].[Perfumes] ON 

INSERT [dbo].[Perfumes] ([PerfumeId], [PerfumeName], [BrandId], [Price], [PhotoPath]) VALUES (1, N'IN2U Woman EDT', 4, 179.0000, NULL)
INSERT [dbo].[Perfumes] ([PerfumeId], [PerfumeName], [BrandId], [Price], [PhotoPath]) VALUES (2, N'Be EDT', 4, 191.9500, NULL)
INSERT [dbo].[Perfumes] ([PerfumeId], [PerfumeName], [BrandId], [Price], [PhotoPath]) VALUES (3, N'Cool Water EDT', 2, 189.0000, NULL)
INSERT [dbo].[Perfumes] ([PerfumeId], [PerfumeName], [BrandId], [Price], [PhotoPath]) VALUES (4, N'Noa EDT', 1002, 189.0000, NULL)
INSERT [dbo].[Perfumes] ([PerfumeId], [PerfumeName], [BrandId], [Price], [PhotoPath]) VALUES (6, N'Cool Water', 2, 149.0000, NULL)
INSERT [dbo].[Perfumes] ([PerfumeId], [PerfumeName], [BrandId], [Price], [PhotoPath]) VALUES (7, N'Classic For Men EDT', 1, 172.0000, NULL)
INSERT [dbo].[Perfumes] ([PerfumeId], [PerfumeName], [BrandId], [Price], [PhotoPath]) VALUES (8, N'Cacharel Loulou EDP 50 ml Bayan Parfüm', 1002, 169.0000, NULL)
INSERT [dbo].[Perfumes] ([PerfumeId], [PerfumeName], [BrandId], [Price], [PhotoPath]) VALUES (9, N'Giorgio Armani Idole D''Armanı Kadın Edp 50 ml', 1003, 159.0000, NULL)
INSERT [dbo].[Perfumes] ([PerfumeId], [PerfumeName], [BrandId], [Price], [PhotoPath]) VALUES (10, N'Armani Attitude Extreme Homme EDT 50ml', 1003, 123.5000, NULL)
SET IDENTITY_INSERT [dbo].[Perfumes] OFF
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Perfumes] FOREIGN KEY([PerfumeId])
REFERENCES [dbo].[Perfumes] ([PerfumeId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Perfumes]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_UserDetails] FOREIGN KEY([UserDetailId])
REFERENCES [dbo].[UserDetails] ([UserDetailId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_UserDetails]
GO
ALTER TABLE [dbo].[Perfumes]  WITH CHECK ADD  CONSTRAINT [FK_Perfumes_Brands] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([BrandId])
GO
ALTER TABLE [dbo].[Perfumes] CHECK CONSTRAINT [FK_Perfumes_Brands]
GO
USE [master]
GO
ALTER DATABASE [MVCParfum] SET  READ_WRITE 
GO
