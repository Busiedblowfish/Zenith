/****** Object:  Database [Zenith-Fitness]    Script Date: 5/3/2016 12:48:27 AM ******/
CREATE DATABASE [Zenith-Fitness]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Zenith-Fitness', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Zenith-Fitness.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Zenith-Fitness_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Zenith-Fitness_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Zenith-Fitness] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Zenith-Fitness].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Zenith-Fitness] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Zenith-Fitness] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Zenith-Fitness] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Zenith-Fitness] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Zenith-Fitness] SET ARITHABORT OFF 
GO
ALTER DATABASE [Zenith-Fitness] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Zenith-Fitness] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Zenith-Fitness] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Zenith-Fitness] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Zenith-Fitness] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Zenith-Fitness] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Zenith-Fitness] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Zenith-Fitness] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Zenith-Fitness] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Zenith-Fitness] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Zenith-Fitness] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Zenith-Fitness] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Zenith-Fitness] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Zenith-Fitness] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Zenith-Fitness] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Zenith-Fitness] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Zenith-Fitness] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Zenith-Fitness] SET RECOVERY FULL 
GO
ALTER DATABASE [Zenith-Fitness] SET  MULTI_USER 
GO
ALTER DATABASE [Zenith-Fitness] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Zenith-Fitness] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Zenith-Fitness] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Zenith-Fitness] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Zenith-Fitness] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Zenith-Fitness', N'ON'
GO
USE [Zenith-Fitness]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 5/3/2016 12:48:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[admin_username] [nvarchar](50) NOT NULL,
	[admin_password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Member]    Script Date: 5/3/2016 12:48:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Member](
	[member_id] [int] IDENTITY(1,1) NOT NULL,
	[member_fname] [varchar](50) NOT NULL,
	[member_lname] [varchar](50) NOT NULL,
	[member_mi] [varchar](50) NULL,
	[member_email] [varchar](50) NOT NULL,
	[member_address] [varchar](50) NOT NULL,
	[member_city] [varchar](50) NOT NULL,
	[member_state] [varchar](60) NOT NULL,
	[member_zipcode] [varchar](50) NOT NULL,
	[member_gender] [varchar](50) NOT NULL,
	[member_age] [varchar](50) NOT NULL,
	[member_cellphone] [varchar](50) NOT NULL,
	[member_homephone] [varchar](50) NULL,
	[member_how] [varchar](50) NOT NULL,
	[member_username] [varchar](50) NOT NULL,
	[member_password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[member_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Membership]    Script Date: 5/3/2016 12:48:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Membership](
	[member_id] [int] NOT NULL,
	[membership_name] [varchar](10) NOT NULL,
	[membership_type] [varchar](1) NOT NULL,
	[membership_status] [varchar](10) NOT NULL,
	[membership_start] [date] NOT NULL,
	[membership_end] [date] NOT NULL,
 CONSTRAINT [PK_Membership] PRIMARY KEY CLUSTERED 
(
	[member_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 5/3/2016 12:48:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(10105,5) NOT NULL,
	[member_id] [int] NOT NULL,
	[order_amount] [decimal](5, 2) NOT NULL,
	[order_date] [date] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[member_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[State]    Script Date: 5/3/2016 12:48:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[state_id] [int] IDENTITY(1,1) NOT NULL,
	[state_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([admin_id], [admin_username], [admin_password]) VALUES (1, N'Admin1', N'Admin1*')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([member_id], [member_fname], [member_lname], [member_mi], [member_email], [member_address], [member_city], [member_state], [member_zipcode], [member_gender], [member_age], [member_cellphone], [member_homephone], [member_how], [member_username], [member_password]) VALUES (116, N'Ola', N'Obey', N'', N'Ola@a.com', N'12 test st', N'Corpus', N'Texas', N'89883', N'Male', N'18', N'2100000000', N'', N'Referral', N'Test123', N'Test123*')
SET IDENTITY_INSERT [dbo].[Member] OFF
INSERT [dbo].[Membership] ([member_id], [membership_name], [membership_type], [membership_status], [membership_start], [membership_end]) VALUES (116, N'Premium', N'P', N'Active', CAST(N'2016-05-02' AS Date), CAST(N'2016-06-01' AS Date))
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([order_id], [member_id], [order_amount], [order_date]) VALUES (10140, 116, CAST(29.99 AS Decimal(5, 2)), CAST(N'2016-05-02' AS Date))
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([state_id], [state_name]) VALUES (1, N'Alaska')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (2, N'Arizona')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (3, N'Arkansas')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (4, N'California')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (5, N'Colorado')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (6, N'Connecticut')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (7, N'Delaware')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (8, N'Florida')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (9, N'Georgia')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (10, N'Hawaii')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (11, N'Idaho')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (12, N'Illinois')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (13, N'Indiana')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (14, N'Iowa')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (15, N'Kansas')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (16, N'Kentucky')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (17, N'Louisiana')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (18, N'Maine')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (19, N'Maryland')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (20, N'Massachusetts')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (21, N'Michigan')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (22, N'Minnesota')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (23, N'Mississippi')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (24, N'Missouri')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (25, N'Montana')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (26, N'Nebraska')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (27, N'Nevada  ')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (28, N'New Hampshire')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (29, N'New Jersey')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (30, N'New Mexico')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (31, N'New York')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (32, N'North Carolina')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (33, N'North Dakota')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (34, N'Ohio')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (35, N'Oklahoma')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (36, N'Oregon')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (37, N'Pennsylvania')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (38, N'Rhode Island')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (39, N'South Carolina')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (40, N'South Dakota')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (41, N'Tennessee')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (42, N'Texas')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (43, N'Utah')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (44, N'Vermont')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (45, N'Virginia')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (46, N'Washington')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (47, N'West Virginia')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (48, N'Wisconsin')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (49, N'Wyoming')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (50, N'District of Columbia')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (51, N'Puerto Rico')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (52, N'Guam')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (53, N'American Samoa')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (54, N'U.S. Virgin Islands')
INSERT [dbo].[State] ([state_id], [state_name]) VALUES (55, N'Northern Mariana Islands')
SET IDENTITY_INSERT [dbo].[State] OFF
ALTER TABLE [dbo].[Membership]  WITH CHECK ADD  CONSTRAINT [FK_Membership_Member] FOREIGN KEY([member_id])
REFERENCES [dbo].[Member] ([member_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Membership] CHECK CONSTRAINT [FK_Membership_Member]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Member] FOREIGN KEY([member_id])
REFERENCES [dbo].[Member] ([member_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Member]
GO
/****** Object:  StoredProcedure [dbo].[Insert_Order]    Script Date: 5/3/2016 12:48:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_Order]
    @order_id int output,
	@member_id int,
    @order_amount decimal(5,2),
    @order_date date
AS
BEGIN
	SET NOCOUNT ON
INSERT INTO [dbo].[Order] ([member_id],[order_amount],[order_date])
    VALUES (@member_id, @order_amount, @order_date)
SET @order_id=SCOPE_IDENTITY()
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-1 btw Membership and Member table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Membership', @level2type=N'CONSTRAINT',@level2name=N'FK_Membership_Member'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-M btw Order and Member table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'CONSTRAINT',@level2name=N'FK_Order_Member'
GO
USE [master]
GO
ALTER DATABASE [Zenith-Fitness] SET  READ_WRITE 
GO
