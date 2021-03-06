USE [master]
GO
/****** Object:  Database [RealEstateWebsite]    Script Date: 11/8/2018 8:04:11 AM ******/
CREATE DATABASE [RealEstateWebsite]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RealEstaleWebsite', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\RealEstaleWebsite.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RealEstaleWebsite_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\RealEstaleWebsite_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RealEstateWebsite] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RealEstateWebsite].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RealEstateWebsite] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RealEstateWebsite] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RealEstateWebsite] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RealEstateWebsite] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RealEstateWebsite] SET ARITHABORT OFF 
GO
ALTER DATABASE [RealEstateWebsite] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RealEstateWebsite] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RealEstateWebsite] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RealEstateWebsite] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RealEstateWebsite] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RealEstateWebsite] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RealEstateWebsite] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RealEstateWebsite] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RealEstateWebsite] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RealEstateWebsite] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RealEstateWebsite] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RealEstateWebsite] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RealEstateWebsite] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RealEstateWebsite] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RealEstateWebsite] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RealEstateWebsite] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RealEstateWebsite] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RealEstateWebsite] SET RECOVERY FULL 
GO
ALTER DATABASE [RealEstateWebsite] SET  MULTI_USER 
GO
ALTER DATABASE [RealEstateWebsite] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RealEstateWebsite] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RealEstateWebsite] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RealEstateWebsite] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RealEstateWebsite] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RealEstateWebsite', N'ON'
GO
ALTER DATABASE [RealEstateWebsite] SET QUERY_STORE = OFF
GO
USE [RealEstateWebsite]
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
USE [RealEstateWebsite]
GO
/****** Object:  Schema [Customer]    Script Date: 11/8/2018 8:04:11 AM ******/
CREATE SCHEMA [Customer]
GO
/****** Object:  Schema [Employee]    Script Date: 11/8/2018 8:04:11 AM ******/
CREATE SCHEMA [Employee]
GO
/****** Object:  Schema [Post]    Script Date: 11/8/2018 8:04:11 AM ******/
CREATE SCHEMA [Post]
GO
/****** Object:  Table [Customer].[Block]    Script Date: 11/8/2018 8:04:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Customer].[Block](
	[Cus_ID] [int] NOT NULL,
	[Block_ID] [int] IDENTITY(1,1) NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
	[Emp_Block] [int] NULL,
	[BlockTime] [datetime] NULL,
 CONSTRAINT [PK_Block] PRIMARY KEY CLUSTERED 
(
	[Cus_ID] ASC,
	[Block_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Customer].[Customer]    Script Date: 11/8/2018 8:04:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Customer].[Customer](
	[Customer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Cus_Type] [varchar](10) NULL,
	[BlockStatus] [bit] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Customer].[PhoneNumber]    Script Date: 11/8/2018 8:04:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Customer].[PhoneNumber](
	[Customer_ID] [int] NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_PhoneNumber] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC,
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/8/2018 8:04:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Account_ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[PasswordHash] [varchar](50) NOT NULL,
	[PasswordSalt] [varchar](50) NULL,
	[AccountType] [varchar](20) NOT NULL,
	[Emp_ID] [int] NULL,
	[Cus_ID] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Account_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatabaseLog]    Script Date: 11/8/2018 8:04:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatabaseLog](
	[DatabaseLogID] [int] IDENTITY(1,1) NOT NULL,
	[PostTime] [datetime] NOT NULL,
	[DatabaseUser] [sysname] NOT NULL,
	[Event] [sysname] NOT NULL,
	[Schema] [sysname] NULL,
	[Object] [sysname] NULL,
	[TSQL] [nvarchar](max) NOT NULL,
	[XmlEvent] [xml] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Employee].[Block]    Script Date: 11/8/2018 8:04:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Employee].[Block](
	[Emp_ID] [int] NOT NULL,
	[Block_ID] [int] IDENTITY(1,1) NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[UnBlockDate] [datetime] NULL,
	[BlockDate] [datetime] NULL,
 CONSTRAINT [PK_Block_2] PRIMARY KEY CLUSTERED 
(
	[Emp_ID] ASC,
	[Block_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Employee].[Employee]    Script Date: 11/8/2018 8:04:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Employee].[Employee](
	[Employee_ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[IDNumber] [varchar](20) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[Email] [varchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[Manager_ID] [int] NULL,
	[QuitStatus] [bit] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Employee].[Quit]    Script Date: 11/8/2018 8:04:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Employee].[Quit](
	[Emp_ID] [int] NOT NULL,
	[Quit_ID] [int] IDENTITY(1,1) NOT NULL,
	[Reason] [nvarchar](100) NOT NULL,
	[QuitDate] [datetime] NULL,
 CONSTRAINT [PK_Quit] PRIMARY KEY CLUSTERED 
(
	[Emp_ID] ASC,
	[Quit_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Post].[Post]    Script Date: 11/8/2018 8:04:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Post].[Post](
	[Post_ID] [int] IDENTITY(1,1) NOT NULL,
	[PostType] [int] NOT NULL,
	[PostTime] [datetime] NULL,
	[Price] [money] NOT NULL,
	[Location] [nvarchar](100) NOT NULL,
	[Area] [decimal](18, 2) NOT NULL,
	[Sale] [nvarchar](100) NULL,
	[Form] [nvarchar](50) NULL,
	[Project] [int] NULL,
	[Description] [nvarchar](500) NOT NULL,
	[RealEstaleType] [int] NOT NULL,
	[Status] [bit] NULL,
	[Censor] [int] NULL,
	[CensorshipTime] [datetime] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Post_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Post].[Project]    Script Date: 11/8/2018 8:04:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Post].[Project](
	[Project_ID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](50) NOT NULL,
	[Location] [nvarchar](100) NOT NULL,
	[Protential] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Project_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Post].[RealEstaleType]    Script Date: 11/8/2018 8:04:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Post].[RealEstaleType](
	[RealEstaleType_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RealEstaleType] PRIMARY KEY CLUSTERED 
(
	[RealEstaleType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Post].[Type]    Script Date: 11/8/2018 8:04:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Post].[Type](
	[PostType_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PostType] PRIMARY KEY CLUSTERED 
(
	[PostType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DatabaseLog] ON 

INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (18, CAST(N'2018-11-07T21:01:40.747' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'Customer', N'ALTER TABLE Customer.Customer ADD CONSTRAINT
	PK_Customer PRIMARY KEY CLUSTERED 
	(
	Customer_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T21:01:40.747</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Customer</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>PK_Customer</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.Customer ADD CONSTRAINT
	PK_Customer PRIMARY KEY CLUSTERED 
	(
	Customer_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (19, CAST(N'2018-11-07T21:01:40.747' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'Customer', N'ALTER TABLE Customer.Customer ADD CONSTRAINT
	CK_Customer_CusType CHECK (([Cus_Type]=''Normal'' OR [Cus_Type]=''Vip''))', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T21:01:40.747</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Customer</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>CK_Customer_CusType</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.Customer ADD CONSTRAINT
	CK_Customer_CusType CHECK (([Cus_Type]=''Normal'' OR [Cus_Type]=''Vip''))</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (20, CAST(N'2018-11-07T21:01:40.777' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Account', N'ALTER TABLE dbo.Account ADD CONSTRAINT
	FK_Account_Customer FOREIGN KEY
	(
	Cus_ID
	) REFERENCES Customer.Customer
	(
	Customer_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T21:01:40.777</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Account</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>FK_Account_Customer</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Account ADD CONSTRAINT
	FK_Account_Customer FOREIGN KEY
	(
	Cus_ID
	) REFERENCES Customer.Customer
	(
	Customer_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (25, CAST(N'2018-11-07T21:01:40.820' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'Block', N'ALTER TABLE Customer.Block SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T21:01:40.820</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Block</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.Block SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (10, CAST(N'2018-11-07T21:01:37.783' AS DateTime), N'dbo', N'DROP_TRIGGER', N'Customer', N'setStatusCus_TypeCus', N'DROP TRIGGER [Customer].[setStatusCus_TypeCus]', N'<EVENT_INSTANCE><EventType>DROP_TRIGGER</EventType><PostTime>2018-11-07T21:01:37.770</PostTime><SPID>57</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>setStatusCus_TypeCus</ObjectName><ObjectType>TRIGGER</ObjectType><TargetObjectName>Customer</TargetObjectName><TargetObjectType>TABLE</TargetObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>DROP TRIGGER [Customer].[setStatusCus_TypeCus]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (11, CAST(N'2018-11-07T21:01:40.727' AS DateTime), N'dbo', N'CREATE_TABLE', N'Customer', N'Tmp_Customer', N'CREATE TABLE Customer.Tmp_Customer
	(
	Customer_ID int NOT NULL,
	Firstname nvarchar(100) NOT NULL,
	LastName nvarchar(100) NOT NULL,
	Email varchar(50) NOT NULL,
	Address nvarchar(200) NOT NULL,
	Cus_Type varchar(10) NULL,
	BlockStatus bit NULL,
	ModifiedDate datetime NULL
	)  ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>CREATE_TABLE</EventType><PostTime>2018-11-07T21:01:40.727</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Tmp_Customer</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>CREATE TABLE Customer.Tmp_Customer
	(
	Customer_ID int NOT NULL,
	Firstname nvarchar(100) NOT NULL,
	LastName nvarchar(100) NOT NULL,
	Email varchar(50) NOT NULL,
	Address nvarchar(200) NOT NULL,
	Cus_Type varchar(10) NULL,
	BlockStatus bit NULL,
	ModifiedDate datetime NULL
	)  ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (12, CAST(N'2018-11-07T21:01:40.730' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'Tmp_Customer', N'ALTER TABLE Customer.Tmp_Customer SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T21:01:40.727</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Tmp_Customer</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.Tmp_Customer SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (13, CAST(N'2018-11-07T21:01:40.733' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'Block', N'ALTER TABLE Customer.Block
	DROP CONSTRAINT FK_Block_Customer', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T21:01:40.733</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Block</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Drop><Constraints><Name>FK_Block_Customer</Name></Constraints></Drop></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.Block
	DROP CONSTRAINT FK_Block_Customer</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (14, CAST(N'2018-11-07T21:01:40.737' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Account', N'ALTER TABLE dbo.Account
	DROP CONSTRAINT FK_Account_Customer', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T21:01:40.733</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Account</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Drop><Constraints><Name>FK_Account_Customer</Name></Constraints></Drop></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Account
	DROP CONSTRAINT FK_Account_Customer</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (15, CAST(N'2018-11-07T21:01:40.737' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'PhoneNumber', N'ALTER TABLE Customer.PhoneNumber
	DROP CONSTRAINT FK_PhoneNumber_Customer', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T21:01:40.737</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>PhoneNumber</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Drop><Constraints><Name>FK_PhoneNumber_Customer</Name></Constraints></Drop></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.PhoneNumber
	DROP CONSTRAINT FK_PhoneNumber_Customer</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (16, CAST(N'2018-11-07T21:01:40.740' AS DateTime), N'dbo', N'DROP_TABLE', N'Customer', N'Customer', N'DROP TABLE Customer.Customer
', N'<EVENT_INSTANCE><EventType>DROP_TABLE</EventType><PostTime>2018-11-07T21:01:40.740</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Customer</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>DROP TABLE Customer.Customer
</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (17, CAST(N'2018-11-07T21:01:40.743' AS DateTime), N'dbo', N'RENAME', N'Customer', N'Tmp_Customer', N'EXECUTE sp_rename N''Customer.Tmp_Customer'', N''Customer'', ''OBJECT''', N'<EVENT_INSTANCE><EventType>RENAME</EventType><PostTime>2018-11-07T21:01:40.743</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Tmp_Customer</ObjectName><ObjectType>TABLE</ObjectType><TargetObjectName /><TargetObjectType /><NewObjectName>Customer</NewObjectName><Parameters><Param>Customer.Tmp_Customer</Param><Param>Customer</Param><Param>OBJECT</Param></Parameters><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>EXECUTE sp_rename N''Customer.Tmp_Customer'', N''Customer'', ''OBJECT''</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (21, CAST(N'2018-11-07T21:01:40.780' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Account', N'ALTER TABLE dbo.Account SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T21:01:40.777</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Account</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Account SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (23, CAST(N'2018-11-07T21:01:40.793' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'PhoneNumber', N'ALTER TABLE Customer.PhoneNumber SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T21:01:40.793</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>PhoneNumber</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.PhoneNumber SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (22, CAST(N'2018-11-07T21:01:40.793' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'PhoneNumber', N'ALTER TABLE Customer.PhoneNumber ADD CONSTRAINT
	FK_PhoneNumber_Customer FOREIGN KEY
	(
	Customer_ID
	) REFERENCES Customer.Customer
	(
	Customer_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T21:01:40.790</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>PhoneNumber</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>FK_PhoneNumber_Customer</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.PhoneNumber ADD CONSTRAINT
	FK_PhoneNumber_Customer FOREIGN KEY
	(
	Customer_ID
	) REFERENCES Customer.Customer
	(
	Customer_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (24, CAST(N'2018-11-07T21:01:40.817' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'Block', N'ALTER TABLE Customer.Block ADD CONSTRAINT
	FK_Block_Customer FOREIGN KEY
	(
	Cus_ID
	) REFERENCES Customer.Customer
	(
	Customer_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T21:01:40.817</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Block</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>FK_Block_Customer</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.Block ADD CONSTRAINT
	FK_Block_Customer FOREIGN KEY
	(
	Cus_ID
	) REFERENCES Customer.Customer
	(
	Customer_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (26, CAST(N'2018-11-07T21:15:40.580' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Account', N'ALTER TABLE dbo.Account
	DROP CONSTRAINT FK_Account_Customer', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T21:15:40.580</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Account</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Drop><Constraints><Name>FK_Account_Customer</Name></Constraints></Drop></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Account
	DROP CONSTRAINT FK_Account_Customer</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (27, CAST(N'2018-11-07T21:15:40.583' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'Customer', N'ALTER TABLE Customer.Customer SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T21:15:40.583</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Customer</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.Customer SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (28, CAST(N'2018-11-07T21:15:40.610' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Account', N'ALTER TABLE dbo.Account
	DROP CONSTRAINT FK_Account_Employee', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T21:15:40.610</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Account</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Drop><Constraints><Name>FK_Account_Employee</Name></Constraints></Drop></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Account
	DROP CONSTRAINT FK_Account_Employee</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (29, CAST(N'2018-11-07T21:15:40.610' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Employee', N'ALTER TABLE dbo.Employee SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T21:15:40.610</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Employee</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Employee SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (30, CAST(N'2018-11-07T21:15:40.670' AS DateTime), N'dbo', N'CREATE_TABLE', N'dbo', N'Tmp_Account', N'CREATE TABLE dbo.Tmp_Account
	(
	Account_ID int NOT NULL,
	UserName varchar(50) NOT NULL,
	PasswordHash varchar(50) NOT NULL,
	PasswordSalt varchar(50) NULL,
	AccountType varchar(20) NOT NULL,
	Emp_ID int NULL,
	Cus_ID int NULL,
	ModifiedDate datetime NULL
	)  ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>CREATE_TABLE</EventType><PostTime>2018-11-07T21:15:40.670</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Tmp_Account</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>CREATE TABLE dbo.Tmp_Account
	(
	Account_ID int NOT NULL,
	UserName varchar(50) NOT NULL,
	PasswordHash varchar(50) NOT NULL,
	PasswordSalt varchar(50) NULL,
	AccountType varchar(20) NOT NULL,
	Emp_ID int NULL,
	Cus_ID int NULL,
	ModifiedDate datetime NULL
	)  ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (31, CAST(N'2018-11-07T21:15:40.673' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Tmp_Account', N'ALTER TABLE dbo.Tmp_Account SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T21:15:40.673</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Tmp_Account</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Tmp_Account SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (32, CAST(N'2018-11-07T21:15:40.677' AS DateTime), N'dbo', N'DROP_TABLE', N'dbo', N'Account', N'DROP TABLE dbo.Account
', N'<EVENT_INSTANCE><EventType>DROP_TABLE</EventType><PostTime>2018-11-07T21:15:40.677</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Account</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>DROP TABLE dbo.Account
</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (33, CAST(N'2018-11-07T21:15:40.680' AS DateTime), N'dbo', N'RENAME', N'dbo', N'Tmp_Account', N'EXECUTE sp_rename N''dbo.Tmp_Account'', N''Account'', ''OBJECT''', N'<EVENT_INSTANCE><EventType>RENAME</EventType><PostTime>2018-11-07T21:15:40.680</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Tmp_Account</ObjectName><ObjectType>TABLE</ObjectType><TargetObjectName /><TargetObjectType /><NewObjectName>Account</NewObjectName><Parameters><Param>dbo.Tmp_Account</Param><Param>Account</Param><Param>OBJECT</Param></Parameters><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>EXECUTE sp_rename N''dbo.Tmp_Account'', N''Account'', ''OBJECT''</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (34, CAST(N'2018-11-07T21:15:40.683' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Account', N'ALTER TABLE dbo.Account ADD CONSTRAINT
	PK_Account PRIMARY KEY CLUSTERED 
	(
	Account_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T21:15:40.683</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Account</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>PK_Account</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Account ADD CONSTRAINT
	PK_Account PRIMARY KEY CLUSTERED 
	(
	Account_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (35, CAST(N'2018-11-07T21:15:40.683' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Account', N'ALTER TABLE dbo.Account ADD CONSTRAINT
	FK_Account_Employee FOREIGN KEY
	(
	Emp_ID
	) REFERENCES dbo.Employee
	(
	Employee_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T21:15:40.683</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Account</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>FK_Account_Employee</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Account ADD CONSTRAINT
	FK_Account_Employee FOREIGN KEY
	(
	Emp_ID
	) REFERENCES dbo.Employee
	(
	Employee_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (37, CAST(N'2018-11-07T22:58:54.007' AS DateTime), N'dbo', N'ALTER_TABLE', N'Employee', N'Quit', N'ALTER TABLE Employee.Quit
	DROP CONSTRAINT FK_Quit_Employee', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T22:58:53.983</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Quit</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Drop><Constraints><Name>FK_Quit_Employee</Name></Constraints></Drop></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Employee.Quit
	DROP CONSTRAINT FK_Quit_Employee</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (36, CAST(N'2018-11-07T21:15:40.687' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Account', N'ALTER TABLE dbo.Account ADD CONSTRAINT
	FK_Account_Customer FOREIGN KEY
	(
	Cus_ID
	) REFERENCES Customer.Customer
	(
	Customer_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T21:15:40.687</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Account</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>FK_Account_Customer</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Account ADD CONSTRAINT
	FK_Account_Customer FOREIGN KEY
	(
	Cus_ID
	) REFERENCES Customer.Customer
	(
	Customer_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (38, CAST(N'2018-11-07T22:58:54.010' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Employee', N'ALTER TABLE dbo.Employee SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T22:58:54.010</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Employee</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Employee SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (39, CAST(N'2018-11-07T22:58:54.103' AS DateTime), N'dbo', N'CREATE_TABLE', N'Employee', N'Tmp_Quit', N'CREATE TABLE Employee.Tmp_Quit
	(
	Emp_ID int NOT NULL,
	Quit_ID int NOT NULL,
	QuitDate datetime NOT NULL,
	Reason nvarchar(100) NOT NULL
	)  ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>CREATE_TABLE</EventType><PostTime>2018-11-07T22:58:54.103</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Tmp_Quit</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>CREATE TABLE Employee.Tmp_Quit
	(
	Emp_ID int NOT NULL,
	Quit_ID int NOT NULL,
	QuitDate datetime NOT NULL,
	Reason nvarchar(100) NOT NULL
	)  ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (40, CAST(N'2018-11-07T22:58:54.107' AS DateTime), N'dbo', N'ALTER_TABLE', N'Employee', N'Tmp_Quit', N'ALTER TABLE Employee.Tmp_Quit SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T22:58:54.107</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Tmp_Quit</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Employee.Tmp_Quit SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (41, CAST(N'2018-11-07T22:58:54.110' AS DateTime), N'dbo', N'DROP_TABLE', N'Employee', N'Quit', N'DROP TABLE Employee.Quit
', N'<EVENT_INSTANCE><EventType>DROP_TABLE</EventType><PostTime>2018-11-07T22:58:54.110</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Quit</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>DROP TABLE Employee.Quit
</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (42, CAST(N'2018-11-07T22:58:54.323' AS DateTime), N'dbo', N'RENAME', N'Employee', N'Tmp_Quit', N'EXECUTE sp_rename N''Employee.Tmp_Quit'', N''Quit'', ''OBJECT''', N'<EVENT_INSTANCE><EventType>RENAME</EventType><PostTime>2018-11-07T22:58:54.323</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Tmp_Quit</ObjectName><ObjectType>TABLE</ObjectType><TargetObjectName /><TargetObjectType /><NewObjectName>Quit</NewObjectName><Parameters><Param>Employee.Tmp_Quit</Param><Param>Quit</Param><Param>OBJECT</Param></Parameters><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>EXECUTE sp_rename N''Employee.Tmp_Quit'', N''Quit'', ''OBJECT''</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (43, CAST(N'2018-11-07T22:58:54.327' AS DateTime), N'dbo', N'ALTER_TABLE', N'Employee', N'Quit', N'ALTER TABLE Employee.Quit ADD CONSTRAINT
	PK_Quit PRIMARY KEY CLUSTERED 
	(
	Emp_ID,
	Quit_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T22:58:54.327</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Quit</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>PK_Quit</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Employee.Quit ADD CONSTRAINT
	PK_Quit PRIMARY KEY CLUSTERED 
	(
	Emp_ID,
	Quit_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (44, CAST(N'2018-11-07T22:58:54.330' AS DateTime), N'dbo', N'ALTER_TABLE', N'Employee', N'Quit', N'ALTER TABLE Employee.Quit ADD CONSTRAINT
	FK_Quit_Employee FOREIGN KEY
	(
	Emp_ID
	) REFERENCES dbo.Employee
	(
	Employee_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T22:58:54.330</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Quit</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>FK_Quit_Employee</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Employee.Quit ADD CONSTRAINT
	FK_Quit_Employee FOREIGN KEY
	(
	Emp_ID
	) REFERENCES dbo.Employee
	(
	Employee_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (45, CAST(N'2018-11-07T22:59:40.457' AS DateTime), N'dbo', N'ALTER_TABLE', N'Employee', N'Quit', N'ALTER TABLE Employee.Quit
	DROP CONSTRAINT FK_Quit_Employee', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T22:59:40.440</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Quit</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Drop><Constraints><Name>FK_Quit_Employee</Name></Constraints></Drop></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Employee.Quit
	DROP CONSTRAINT FK_Quit_Employee</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (46, CAST(N'2018-11-07T22:59:40.460' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Employee', N'ALTER TABLE dbo.Employee SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T22:59:40.460</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Employee</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Employee SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (145, CAST(N'2018-11-07T23:09:53.623' AS DateTime), N'dbo', N'ALTER_TRIGGER', N'dbo', N'setStatusEmp', N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[setStatusEmp] ON  [dbo].[Employee]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @employee_id int;

	SELECT @employee_id = i.Employee_ID FROM inserted i;

--	UPDATE dbo.Employee 
--	SET Status = 1
--	WHERE Employee_ID = @employee_id

END
', N'<EVENT_INSTANCE><EventType>ALTER_TRIGGER</EventType><PostTime>2018-11-07T23:09:53.607</PostTime><SPID>51</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>setStatusEmp</ObjectName><ObjectType>TRIGGER</ObjectType><TargetObjectName>Employee</TargetObjectName><TargetObjectType>TABLE</TargetObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>-- =============================================
-- Author:		&lt;Author,,Name&gt;
-- Create date: &lt;Create Date,,&gt;
-- Description:	&lt;Description,,&gt;
-- =============================================
ALTER TRIGGER [dbo].[setStatusEmp] ON  [dbo].[Employee]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @employee_id int;

	SELECT @employee_id = i.Employee_ID FROM inserted i;

--	UPDATE dbo.Employee 
--	SET Status = 1
--	WHERE Employee_ID = @employee_id

END
</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (146, CAST(N'2018-11-08T08:01:39.253' AS DateTime), N'dbo', N'ALTER_SCHEMA', N'Employee', N'Employee', N'ALTER SCHEMA Employee TRANSFER dbo.Employee 
', N'<EVENT_INSTANCE><EventType>ALTER_SCHEMA</EventType><PostTime>2018-11-08T08:01:39.240</PostTime><SPID>52</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Employee</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER SCHEMA Employee TRANSFER dbo.Employee 
</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (147, CAST(N'2018-11-08T08:01:39.263' AS DateTime), N'dbo', N'ALTER_TABLE', N'Employee', N'Employee', N'ALTER TABLE Employee.Employee SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-08T08:01:39.263</PostTime><SPID>52</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Employee</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Employee.Employee SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (47, CAST(N'2018-11-07T22:59:40.547' AS DateTime), N'dbo', N'CREATE_TABLE', N'Employee', N'Tmp_Quit', N'CREATE TABLE Employee.Tmp_Quit
	(
	Emp_ID int NOT NULL,
	Quit_ID int NOT NULL,
	Reason nvarchar(100) NOT NULL,
	QuitDate datetime NULL
	)  ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>CREATE_TABLE</EventType><PostTime>2018-11-07T22:59:40.547</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Tmp_Quit</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>CREATE TABLE Employee.Tmp_Quit
	(
	Emp_ID int NOT NULL,
	Quit_ID int NOT NULL,
	Reason nvarchar(100) NOT NULL,
	QuitDate datetime NULL
	)  ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (48, CAST(N'2018-11-07T22:59:40.550' AS DateTime), N'dbo', N'ALTER_TABLE', N'Employee', N'Tmp_Quit', N'ALTER TABLE Employee.Tmp_Quit SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T22:59:40.550</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Tmp_Quit</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Employee.Tmp_Quit SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (49, CAST(N'2018-11-07T22:59:40.550' AS DateTime), N'dbo', N'DROP_TABLE', N'Employee', N'Quit', N'DROP TABLE Employee.Quit
', N'<EVENT_INSTANCE><EventType>DROP_TABLE</EventType><PostTime>2018-11-07T22:59:40.550</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Quit</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>DROP TABLE Employee.Quit
</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (50, CAST(N'2018-11-07T22:59:40.740' AS DateTime), N'dbo', N'RENAME', N'Employee', N'Tmp_Quit', N'EXECUTE sp_rename N''Employee.Tmp_Quit'', N''Quit'', ''OBJECT''', N'<EVENT_INSTANCE><EventType>RENAME</EventType><PostTime>2018-11-07T22:59:40.737</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Tmp_Quit</ObjectName><ObjectType>TABLE</ObjectType><TargetObjectName /><TargetObjectType /><NewObjectName>Quit</NewObjectName><Parameters><Param>Employee.Tmp_Quit</Param><Param>Quit</Param><Param>OBJECT</Param></Parameters><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>EXECUTE sp_rename N''Employee.Tmp_Quit'', N''Quit'', ''OBJECT''</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (51, CAST(N'2018-11-07T22:59:40.743' AS DateTime), N'dbo', N'ALTER_TABLE', N'Employee', N'Quit', N'ALTER TABLE Employee.Quit ADD CONSTRAINT
	PK_Quit PRIMARY KEY CLUSTERED 
	(
	Emp_ID,
	Quit_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T22:59:40.743</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Quit</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>PK_Quit</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Employee.Quit ADD CONSTRAINT
	PK_Quit PRIMARY KEY CLUSTERED 
	(
	Emp_ID,
	Quit_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (52, CAST(N'2018-11-07T22:59:40.750' AS DateTime), N'dbo', N'ALTER_TABLE', N'Employee', N'Quit', N'ALTER TABLE Employee.Quit ADD CONSTRAINT
	FK_Quit_Employee FOREIGN KEY
	(
	Emp_ID
	) REFERENCES dbo.Employee
	(
	Employee_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T22:59:40.747</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Quit</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>FK_Quit_Employee</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Employee.Quit ADD CONSTRAINT
	FK_Quit_Employee FOREIGN KEY
	(
	Emp_ID
	) REFERENCES dbo.Employee
	(
	Employee_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (53, CAST(N'2018-11-07T23:00:21.490' AS DateTime), N'dbo', N'ALTER_TABLE', N'Employee', N'Quit', N'ALTER TABLE Employee.Quit
	DROP CONSTRAINT FK_Quit_Employee', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:00:21.490</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Quit</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Drop><Constraints><Name>FK_Quit_Employee</Name></Constraints></Drop></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Employee.Quit
	DROP CONSTRAINT FK_Quit_Employee</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (54, CAST(N'2018-11-07T23:00:21.493' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Employee', N'ALTER TABLE dbo.Employee SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:00:21.493</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Employee</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Employee SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (55, CAST(N'2018-11-07T23:00:21.537' AS DateTime), N'dbo', N'CREATE_TABLE', N'Employee', N'Tmp_Quit', N'CREATE TABLE Employee.Tmp_Quit
	(
	Emp_ID int NOT NULL,
	Quit_ID int NOT NULL IDENTITY (1, 1),
	Reason nvarchar(100) NOT NULL,
	QuitDate datetime NULL
	)  ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>CREATE_TABLE</EventType><PostTime>2018-11-07T23:00:21.537</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Tmp_Quit</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>CREATE TABLE Employee.Tmp_Quit
	(
	Emp_ID int NOT NULL,
	Quit_ID int NOT NULL IDENTITY (1, 1),
	Reason nvarchar(100) NOT NULL,
	QuitDate datetime NULL
	)  ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (56, CAST(N'2018-11-07T23:00:21.537' AS DateTime), N'dbo', N'ALTER_TABLE', N'Employee', N'Tmp_Quit', N'ALTER TABLE Employee.Tmp_Quit SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:00:21.537</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Tmp_Quit</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Employee.Tmp_Quit SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (57, CAST(N'2018-11-07T23:00:21.543' AS DateTime), N'dbo', N'DROP_TABLE', N'Employee', N'Quit', N'DROP TABLE Employee.Quit
', N'<EVENT_INSTANCE><EventType>DROP_TABLE</EventType><PostTime>2018-11-07T23:00:21.540</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Quit</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>DROP TABLE Employee.Quit
</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (58, CAST(N'2018-11-07T23:00:21.543' AS DateTime), N'dbo', N'RENAME', N'Employee', N'Tmp_Quit', N'EXECUTE sp_rename N''Employee.Tmp_Quit'', N''Quit'', ''OBJECT''', N'<EVENT_INSTANCE><EventType>RENAME</EventType><PostTime>2018-11-07T23:00:21.543</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Tmp_Quit</ObjectName><ObjectType>TABLE</ObjectType><TargetObjectName /><TargetObjectType /><NewObjectName>Quit</NewObjectName><Parameters><Param>Employee.Tmp_Quit</Param><Param>Quit</Param><Param>OBJECT</Param></Parameters><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>EXECUTE sp_rename N''Employee.Tmp_Quit'', N''Quit'', ''OBJECT''</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (59, CAST(N'2018-11-07T23:00:21.550' AS DateTime), N'dbo', N'ALTER_TABLE', N'Employee', N'Quit', N'ALTER TABLE Employee.Quit ADD CONSTRAINT
	PK_Quit PRIMARY KEY CLUSTERED 
	(
	Emp_ID,
	Quit_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:00:21.550</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Quit</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>PK_Quit</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Employee.Quit ADD CONSTRAINT
	PK_Quit PRIMARY KEY CLUSTERED 
	(
	Emp_ID,
	Quit_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (60, CAST(N'2018-11-07T23:00:21.553' AS DateTime), N'dbo', N'ALTER_TABLE', N'Employee', N'Quit', N'ALTER TABLE Employee.Quit ADD CONSTRAINT
	FK_Quit_Employee FOREIGN KEY
	(
	Emp_ID
	) REFERENCES dbo.Employee
	(
	Employee_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:00:21.553</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Quit</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>FK_Quit_Employee</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Employee.Quit ADD CONSTRAINT
	FK_Quit_Employee FOREIGN KEY
	(
	Emp_ID
	) REFERENCES dbo.Employee
	(
	Employee_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (61, CAST(N'2018-11-07T23:01:03.203' AS DateTime), N'dbo', N'ALTER_TABLE', N'Employee', N'Block', N'ALTER TABLE Employee.Block
	DROP CONSTRAINT FK_Block_Employee', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:01:03.173</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Block</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Drop><Constraints><Name>FK_Block_Employee</Name></Constraints></Drop></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Employee.Block
	DROP CONSTRAINT FK_Block_Employee</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (62, CAST(N'2018-11-07T23:01:03.210' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Employee', N'ALTER TABLE dbo.Employee SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:01:03.210</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Employee</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Employee SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (64, CAST(N'2018-11-07T23:01:03.300' AS DateTime), N'dbo', N'ALTER_TABLE', N'Employee', N'Tmp_Block', N'ALTER TABLE Employee.Tmp_Block SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:01:03.300</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Tmp_Block</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Employee.Tmp_Block SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (63, CAST(N'2018-11-07T23:01:03.300' AS DateTime), N'dbo', N'CREATE_TABLE', N'Employee', N'Tmp_Block', N'CREATE TABLE Employee.Tmp_Block
	(
	Emp_ID int NOT NULL,
	Block_ID int NOT NULL,
	Reason nvarchar(100) NULL,
	UnBlockDate datetime NULL,
	BlockDate datetime NULL
	)  ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>CREATE_TABLE</EventType><PostTime>2018-11-07T23:01:03.297</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Tmp_Block</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>CREATE TABLE Employee.Tmp_Block
	(
	Emp_ID int NOT NULL,
	Block_ID int NOT NULL,
	Reason nvarchar(100) NULL,
	UnBlockDate datetime NULL,
	BlockDate datetime NULL
	)  ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (65, CAST(N'2018-11-07T23:01:03.303' AS DateTime), N'dbo', N'DROP_TABLE', N'Employee', N'Block', N'DROP TABLE Employee.Block
', N'<EVENT_INSTANCE><EventType>DROP_TABLE</EventType><PostTime>2018-11-07T23:01:03.303</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Block</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>DROP TABLE Employee.Block
</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (66, CAST(N'2018-11-07T23:01:03.557' AS DateTime), N'dbo', N'RENAME', N'Employee', N'Tmp_Block', N'EXECUTE sp_rename N''Employee.Tmp_Block'', N''Block'', ''OBJECT''', N'<EVENT_INSTANCE><EventType>RENAME</EventType><PostTime>2018-11-07T23:01:03.553</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Tmp_Block</ObjectName><ObjectType>TABLE</ObjectType><TargetObjectName /><TargetObjectType /><NewObjectName>Block</NewObjectName><Parameters><Param>Employee.Tmp_Block</Param><Param>Block</Param><Param>OBJECT</Param></Parameters><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>EXECUTE sp_rename N''Employee.Tmp_Block'', N''Block'', ''OBJECT''</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (71, CAST(N'2018-11-07T23:03:12.053' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'Block', N'ALTER TABLE Customer.Block
	DROP CONSTRAINT FK_Block_Customer', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:03:12.053</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Block</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Drop><Constraints><Name>FK_Block_Customer</Name></Constraints></Drop></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.Block
	DROP CONSTRAINT FK_Block_Customer</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (72, CAST(N'2018-11-07T23:03:12.057' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'Customer', N'ALTER TABLE Customer.Customer SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:03:12.057</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Customer</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.Customer SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (67, CAST(N'2018-11-07T23:01:03.563' AS DateTime), N'dbo', N'ALTER_TABLE', N'Employee', N'Block', N'ALTER TABLE Employee.Block ADD CONSTRAINT
	PK_Block_2 PRIMARY KEY CLUSTERED 
	(
	Emp_ID,
	Block_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:01:03.563</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Block</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>PK_Block_2</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Employee.Block ADD CONSTRAINT
	PK_Block_2 PRIMARY KEY CLUSTERED 
	(
	Emp_ID,
	Block_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (68, CAST(N'2018-11-07T23:01:03.567' AS DateTime), N'dbo', N'ALTER_TABLE', N'Employee', N'Block', N'ALTER TABLE Employee.Block ADD CONSTRAINT
	FK_Block_Employee FOREIGN KEY
	(
	Emp_ID
	) REFERENCES dbo.Employee
	(
	Employee_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:01:03.567</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Block</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>FK_Block_Employee</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Employee.Block ADD CONSTRAINT
	FK_Block_Employee FOREIGN KEY
	(
	Emp_ID
	) REFERENCES dbo.Employee
	(
	Employee_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (69, CAST(N'2018-11-07T23:03:11.910' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'Block', N'ALTER TABLE Customer.Block
	DROP CONSTRAINT FK_Block_Employee', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:03:11.890</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Block</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Drop><Constraints><Name>FK_Block_Employee</Name></Constraints></Drop></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.Block
	DROP CONSTRAINT FK_Block_Employee</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (70, CAST(N'2018-11-07T23:03:11.913' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Employee', N'ALTER TABLE dbo.Employee SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:03:11.910</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Employee</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Employee SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (73, CAST(N'2018-11-07T23:03:12.400' AS DateTime), N'dbo', N'CREATE_TABLE', N'Customer', N'Tmp_Block', N'CREATE TABLE Customer.Tmp_Block
	(
	Cus_ID int NOT NULL,
	Block_ID int NOT NULL IDENTITY (1, 1),
	Reason nvarchar(100) NULL,
	ModifiedDate datetime NULL,
	Emp_Block int NULL,
	BlockTime datetime NULL
	)  ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>CREATE_TABLE</EventType><PostTime>2018-11-07T23:03:12.397</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Tmp_Block</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>CREATE TABLE Customer.Tmp_Block
	(
	Cus_ID int NOT NULL,
	Block_ID int NOT NULL IDENTITY (1, 1),
	Reason nvarchar(100) NULL,
	ModifiedDate datetime NULL,
	Emp_Block int NULL,
	BlockTime datetime NULL
	)  ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (74, CAST(N'2018-11-07T23:03:12.400' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'Tmp_Block', N'ALTER TABLE Customer.Tmp_Block SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:03:12.400</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Tmp_Block</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.Tmp_Block SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (75, CAST(N'2018-11-07T23:03:12.403' AS DateTime), N'dbo', N'DROP_TABLE', N'Customer', N'Block', N'DROP TABLE Customer.Block
', N'<EVENT_INSTANCE><EventType>DROP_TABLE</EventType><PostTime>2018-11-07T23:03:12.403</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Block</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>DROP TABLE Customer.Block
</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (76, CAST(N'2018-11-07T23:03:12.570' AS DateTime), N'dbo', N'RENAME', N'Customer', N'Tmp_Block', N'EXECUTE sp_rename N''Customer.Tmp_Block'', N''Block'', ''OBJECT''', N'<EVENT_INSTANCE><EventType>RENAME</EventType><PostTime>2018-11-07T23:03:12.570</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Tmp_Block</ObjectName><ObjectType>TABLE</ObjectType><TargetObjectName /><TargetObjectType /><NewObjectName>Block</NewObjectName><Parameters><Param>Customer.Tmp_Block</Param><Param>Block</Param><Param>OBJECT</Param></Parameters><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>EXECUTE sp_rename N''Customer.Tmp_Block'', N''Block'', ''OBJECT''</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (80, CAST(N'2018-11-07T23:03:19.873' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'Block', N'ALTER TABLE Customer.Block SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:03:19.873</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Block</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.Block SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (77, CAST(N'2018-11-07T23:03:12.573' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'Block', N'ALTER TABLE Customer.Block ADD CONSTRAINT
	FK_Block_Customer FOREIGN KEY
	(
	Cus_ID
	) REFERENCES Customer.Customer
	(
	Customer_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:03:12.573</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Block</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>FK_Block_Customer</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.Block ADD CONSTRAINT
	FK_Block_Customer FOREIGN KEY
	(
	Cus_ID
	) REFERENCES Customer.Customer
	(
	Customer_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (78, CAST(N'2018-11-07T23:03:12.577' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'Block', N'ALTER TABLE Customer.Block ADD CONSTRAINT
	FK_Block_Employee FOREIGN KEY
	(
	Emp_Block
	) REFERENCES dbo.Employee
	(
	Employee_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:03:12.577</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Block</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>FK_Block_Employee</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.Block ADD CONSTRAINT
	FK_Block_Employee FOREIGN KEY
	(
	Emp_Block
	) REFERENCES dbo.Employee
	(
	Employee_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (79, CAST(N'2018-11-07T23:03:19.867' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'Block', N'ALTER TABLE Customer.Block ADD CONSTRAINT
	PK_Block PRIMARY KEY CLUSTERED 
	(
	Cus_ID,
	Block_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:03:19.867</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Block</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>PK_Block</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.Block ADD CONSTRAINT
	PK_Block PRIMARY KEY CLUSTERED 
	(
	Cus_ID,
	Block_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (81, CAST(N'2018-11-07T23:03:38.603' AS DateTime), N'dbo', N'ALTER_TABLE', N'Employee', N'Block', N'ALTER TABLE Employee.Block
	DROP CONSTRAINT FK_Block_Employee', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:03:38.603</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Block</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Drop><Constraints><Name>FK_Block_Employee</Name></Constraints></Drop></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Employee.Block
	DROP CONSTRAINT FK_Block_Employee</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (82, CAST(N'2018-11-07T23:03:38.607' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Employee', N'ALTER TABLE dbo.Employee SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:03:38.603</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Employee</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Employee SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (83, CAST(N'2018-11-07T23:03:38.800' AS DateTime), N'dbo', N'CREATE_TABLE', N'Employee', N'Tmp_Block', N'CREATE TABLE Employee.Tmp_Block
	(
	Emp_ID int NOT NULL,
	Block_ID int NOT NULL IDENTITY (1, 1),
	Reason nvarchar(100) NULL,
	UnBlockDate datetime NULL,
	BlockDate datetime NULL
	)  ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>CREATE_TABLE</EventType><PostTime>2018-11-07T23:03:38.800</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Tmp_Block</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>CREATE TABLE Employee.Tmp_Block
	(
	Emp_ID int NOT NULL,
	Block_ID int NOT NULL IDENTITY (1, 1),
	Reason nvarchar(100) NULL,
	UnBlockDate datetime NULL,
	BlockDate datetime NULL
	)  ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (84, CAST(N'2018-11-07T23:03:38.803' AS DateTime), N'dbo', N'ALTER_TABLE', N'Employee', N'Tmp_Block', N'ALTER TABLE Employee.Tmp_Block SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:03:38.800</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Tmp_Block</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Employee.Tmp_Block SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (85, CAST(N'2018-11-07T23:03:38.807' AS DateTime), N'dbo', N'DROP_TABLE', N'Employee', N'Block', N'DROP TABLE Employee.Block
', N'<EVENT_INSTANCE><EventType>DROP_TABLE</EventType><PostTime>2018-11-07T23:03:38.807</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Block</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>DROP TABLE Employee.Block
</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (86, CAST(N'2018-11-07T23:03:38.810' AS DateTime), N'dbo', N'RENAME', N'Employee', N'Tmp_Block', N'EXECUTE sp_rename N''Employee.Tmp_Block'', N''Block'', ''OBJECT''', N'<EVENT_INSTANCE><EventType>RENAME</EventType><PostTime>2018-11-07T23:03:38.810</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Tmp_Block</ObjectName><ObjectType>TABLE</ObjectType><TargetObjectName /><TargetObjectType /><NewObjectName>Block</NewObjectName><Parameters><Param>Employee.Tmp_Block</Param><Param>Block</Param><Param>OBJECT</Param></Parameters><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>EXECUTE sp_rename N''Employee.Tmp_Block'', N''Block'', ''OBJECT''</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (87, CAST(N'2018-11-07T23:03:38.813' AS DateTime), N'dbo', N'ALTER_TABLE', N'Employee', N'Block', N'ALTER TABLE Employee.Block ADD CONSTRAINT
	PK_Block_2 PRIMARY KEY CLUSTERED 
	(
	Emp_ID,
	Block_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:03:38.813</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Block</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>PK_Block_2</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Employee.Block ADD CONSTRAINT
	PK_Block_2 PRIMARY KEY CLUSTERED 
	(
	Emp_ID,
	Block_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (88, CAST(N'2018-11-07T23:03:38.820' AS DateTime), N'dbo', N'ALTER_TABLE', N'Employee', N'Block', N'ALTER TABLE Employee.Block ADD CONSTRAINT
	FK_Block_Employee FOREIGN KEY
	(
	Emp_ID
	) REFERENCES dbo.Employee
	(
	Employee_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:03:38.817</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Employee</SchemaName><ObjectName>Block</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>FK_Block_Employee</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Employee.Block ADD CONSTRAINT
	FK_Block_Employee FOREIGN KEY
	(
	Emp_ID
	) REFERENCES dbo.Employee
	(
	Employee_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (89, CAST(N'2018-11-07T23:04:03.713' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Account', N'ALTER TABLE dbo.Account
	DROP CONSTRAINT FK_Account_Customer', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:04:03.697</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Account</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Drop><Constraints><Name>FK_Account_Customer</Name></Constraints></Drop></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Account
	DROP CONSTRAINT FK_Account_Customer</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (90, CAST(N'2018-11-07T23:04:03.717' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'Customer', N'ALTER TABLE Customer.Customer SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:04:03.717</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Customer</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.Customer SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (91, CAST(N'2018-11-07T23:04:04.063' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Account', N'ALTER TABLE dbo.Account
	DROP CONSTRAINT FK_Account_Employee', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:04:04.063</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Account</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Drop><Constraints><Name>FK_Account_Employee</Name></Constraints></Drop></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Account
	DROP CONSTRAINT FK_Account_Employee</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (92, CAST(N'2018-11-07T23:04:04.063' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Employee', N'ALTER TABLE dbo.Employee SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:04:04.063</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Employee</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Employee SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (93, CAST(N'2018-11-07T23:04:04.273' AS DateTime), N'dbo', N'CREATE_TABLE', N'dbo', N'Tmp_Account', N'CREATE TABLE dbo.Tmp_Account
	(
	Account_ID int NOT NULL IDENTITY (1, 1),
	UserName varchar(50) NOT NULL,
	PasswordHash varchar(50) NOT NULL,
	PasswordSalt varchar(50) NULL,
	AccountType varchar(20) NOT NULL,
	Emp_ID int NULL,
	Cus_ID int NULL,
	ModifiedDate datetime NULL
	)  ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>CREATE_TABLE</EventType><PostTime>2018-11-07T23:04:04.270</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Tmp_Account</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>CREATE TABLE dbo.Tmp_Account
	(
	Account_ID int NOT NULL IDENTITY (1, 1),
	UserName varchar(50) NOT NULL,
	PasswordHash varchar(50) NOT NULL,
	PasswordSalt varchar(50) NULL,
	AccountType varchar(20) NOT NULL,
	Emp_ID int NULL,
	Cus_ID int NULL,
	ModifiedDate datetime NULL
	)  ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (94, CAST(N'2018-11-07T23:04:04.283' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Tmp_Account', N'ALTER TABLE dbo.Tmp_Account SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:04:04.283</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Tmp_Account</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Tmp_Account SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (95, CAST(N'2018-11-07T23:04:04.290' AS DateTime), N'dbo', N'DROP_TABLE', N'dbo', N'Account', N'DROP TABLE dbo.Account
', N'<EVENT_INSTANCE><EventType>DROP_TABLE</EventType><PostTime>2018-11-07T23:04:04.290</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Account</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>DROP TABLE dbo.Account
</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (96, CAST(N'2018-11-07T23:04:04.487' AS DateTime), N'dbo', N'RENAME', N'dbo', N'Tmp_Account', N'EXECUTE sp_rename N''dbo.Tmp_Account'', N''Account'', ''OBJECT''', N'<EVENT_INSTANCE><EventType>RENAME</EventType><PostTime>2018-11-07T23:04:04.487</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Tmp_Account</ObjectName><ObjectType>TABLE</ObjectType><TargetObjectName /><TargetObjectType /><NewObjectName>Account</NewObjectName><Parameters><Param>dbo.Tmp_Account</Param><Param>Account</Param><Param>OBJECT</Param></Parameters><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>EXECUTE sp_rename N''dbo.Tmp_Account'', N''Account'', ''OBJECT''</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (97, CAST(N'2018-11-07T23:04:04.493' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Account', N'ALTER TABLE dbo.Account ADD CONSTRAINT
	PK_Account PRIMARY KEY CLUSTERED 
	(
	Account_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:04:04.493</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Account</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>PK_Account</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Account ADD CONSTRAINT
	PK_Account PRIMARY KEY CLUSTERED 
	(
	Account_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (98, CAST(N'2018-11-07T23:04:04.497' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Account', N'ALTER TABLE dbo.Account ADD CONSTRAINT
	FK_Account_Employee FOREIGN KEY
	(
	Emp_ID
	) REFERENCES dbo.Employee
	(
	Employee_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:04:04.497</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Account</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>FK_Account_Employee</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Account ADD CONSTRAINT
	FK_Account_Employee FOREIGN KEY
	(
	Emp_ID
	) REFERENCES dbo.Employee
	(
	Employee_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (101, CAST(N'2018-11-07T23:04:24.133' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'Tmp_Customer', N'ALTER TABLE Customer.Tmp_Customer SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:04:24.133</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Tmp_Customer</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.Tmp_Customer SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (99, CAST(N'2018-11-07T23:04:04.500' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Account', N'ALTER TABLE dbo.Account ADD CONSTRAINT
	FK_Account_Customer FOREIGN KEY
	(
	Cus_ID
	) REFERENCES Customer.Customer
	(
	Customer_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:04:04.497</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Account</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>FK_Account_Customer</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Account ADD CONSTRAINT
	FK_Account_Customer FOREIGN KEY
	(
	Cus_ID
	) REFERENCES Customer.Customer
	(
	Customer_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (100, CAST(N'2018-11-07T23:04:24.130' AS DateTime), N'dbo', N'CREATE_TABLE', N'Customer', N'Tmp_Customer', N'CREATE TABLE Customer.Tmp_Customer
	(
	Customer_ID int NOT NULL IDENTITY (1, 1),
	Firstname nvarchar(100) NOT NULL,
	LastName nvarchar(100) NOT NULL,
	Email varchar(50) NOT NULL,
	Address nvarchar(200) NOT NULL,
	Cus_Type varchar(10) NULL,
	BlockStatus bit NULL,
	ModifiedDate datetime NULL
	)  ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>CREATE_TABLE</EventType><PostTime>2018-11-07T23:04:24.130</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Tmp_Customer</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>CREATE TABLE Customer.Tmp_Customer
	(
	Customer_ID int NOT NULL IDENTITY (1, 1),
	Firstname nvarchar(100) NOT NULL,
	LastName nvarchar(100) NOT NULL,
	Email varchar(50) NOT NULL,
	Address nvarchar(200) NOT NULL,
	Cus_Type varchar(10) NULL,
	BlockStatus bit NULL,
	ModifiedDate datetime NULL
	)  ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (102, CAST(N'2018-11-07T23:04:24.143' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'Block', N'ALTER TABLE Customer.Block
	DROP CONSTRAINT FK_Block_Customer', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:04:24.143</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Block</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Drop><Constraints><Name>FK_Block_Customer</Name></Constraints></Drop></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.Block
	DROP CONSTRAINT FK_Block_Customer</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (103, CAST(N'2018-11-07T23:04:24.147' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Account', N'ALTER TABLE dbo.Account
	DROP CONSTRAINT FK_Account_Customer', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:04:24.143</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Account</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Drop><Constraints><Name>FK_Account_Customer</Name></Constraints></Drop></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Account
	DROP CONSTRAINT FK_Account_Customer</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (104, CAST(N'2018-11-07T23:04:24.150' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'PhoneNumber', N'ALTER TABLE Customer.PhoneNumber
	DROP CONSTRAINT FK_PhoneNumber_Customer', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:04:24.150</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>PhoneNumber</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Drop><Constraints><Name>FK_PhoneNumber_Customer</Name></Constraints></Drop></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.PhoneNumber
	DROP CONSTRAINT FK_PhoneNumber_Customer</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (105, CAST(N'2018-11-07T23:04:24.153' AS DateTime), N'dbo', N'DROP_TABLE', N'Customer', N'Customer', N'DROP TABLE Customer.Customer
', N'<EVENT_INSTANCE><EventType>DROP_TABLE</EventType><PostTime>2018-11-07T23:04:24.153</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Customer</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>DROP TABLE Customer.Customer
</CommandText></TSQLCommand></EVENT_INSTANCE>')
GO
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (106, CAST(N'2018-11-07T23:04:24.157' AS DateTime), N'dbo', N'RENAME', N'Customer', N'Tmp_Customer', N'EXECUTE sp_rename N''Customer.Tmp_Customer'', N''Customer'', ''OBJECT''', N'<EVENT_INSTANCE><EventType>RENAME</EventType><PostTime>2018-11-07T23:04:24.157</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Tmp_Customer</ObjectName><ObjectType>TABLE</ObjectType><TargetObjectName /><TargetObjectType /><NewObjectName>Customer</NewObjectName><Parameters><Param>Customer.Tmp_Customer</Param><Param>Customer</Param><Param>OBJECT</Param></Parameters><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>EXECUTE sp_rename N''Customer.Tmp_Customer'', N''Customer'', ''OBJECT''</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (110, CAST(N'2018-11-07T23:04:24.507' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'PhoneNumber', N'ALTER TABLE Customer.PhoneNumber SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:04:24.503</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>PhoneNumber</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.PhoneNumber SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (112, CAST(N'2018-11-07T23:04:24.813' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Account', N'ALTER TABLE dbo.Account SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:04:24.813</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Account</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Account SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (107, CAST(N'2018-11-07T23:04:24.160' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'Customer', N'ALTER TABLE Customer.Customer ADD CONSTRAINT
	PK_Customer PRIMARY KEY CLUSTERED 
	(
	Customer_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:04:24.160</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Customer</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>PK_Customer</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.Customer ADD CONSTRAINT
	PK_Customer PRIMARY KEY CLUSTERED 
	(
	Customer_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (108, CAST(N'2018-11-07T23:04:24.163' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'Customer', N'ALTER TABLE Customer.Customer ADD CONSTRAINT
	CK_Customer_CusType CHECK (([Cus_Type]=''Normal'' OR [Cus_Type]=''Vip''))', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:04:24.163</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Customer</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>CK_Customer_CusType</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.Customer ADD CONSTRAINT
	CK_Customer_CusType CHECK (([Cus_Type]=''Normal'' OR [Cus_Type]=''Vip''))</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (109, CAST(N'2018-11-07T23:04:24.500' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'PhoneNumber', N'ALTER TABLE Customer.PhoneNumber ADD CONSTRAINT
	FK_PhoneNumber_Customer FOREIGN KEY
	(
	Customer_ID
	) REFERENCES Customer.Customer
	(
	Customer_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:04:24.500</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>PhoneNumber</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>FK_PhoneNumber_Customer</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.PhoneNumber ADD CONSTRAINT
	FK_PhoneNumber_Customer FOREIGN KEY
	(
	Customer_ID
	) REFERENCES Customer.Customer
	(
	Customer_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (114, CAST(N'2018-11-07T23:04:25.000' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'Block', N'ALTER TABLE Customer.Block SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:04:25</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Block</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.Block SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (111, CAST(N'2018-11-07T23:04:24.810' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Account', N'ALTER TABLE dbo.Account ADD CONSTRAINT
	FK_Account_Customer FOREIGN KEY
	(
	Cus_ID
	) REFERENCES Customer.Customer
	(
	Customer_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:04:24.810</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Account</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>FK_Account_Customer</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Account ADD CONSTRAINT
	FK_Account_Customer FOREIGN KEY
	(
	Cus_ID
	) REFERENCES Customer.Customer
	(
	Customer_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (113, CAST(N'2018-11-07T23:04:25.000' AS DateTime), N'dbo', N'ALTER_TABLE', N'Customer', N'Block', N'ALTER TABLE Customer.Block ADD CONSTRAINT
	FK_Block_Customer FOREIGN KEY
	(
	Cus_ID
	) REFERENCES Customer.Customer
	(
	Customer_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:04:24.997</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Customer</SchemaName><ObjectName>Block</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>FK_Block_Customer</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Customer.Block ADD CONSTRAINT
	FK_Block_Customer FOREIGN KEY
	(
	Cus_ID
	) REFERENCES Customer.Customer
	(
	Customer_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (115, CAST(N'2018-11-07T23:05:37.593' AS DateTime), N'dbo', N'ALTER_TABLE', N'Post', N'Post', N'ALTER TABLE Post.Post
	DROP CONSTRAINT FK_Post_Employee', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:05:37.567</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Post</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Drop><Constraints><Name>FK_Post_Employee</Name></Constraints></Drop></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Post.Post
	DROP CONSTRAINT FK_Post_Employee</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (116, CAST(N'2018-11-07T23:05:37.597' AS DateTime), N'dbo', N'ALTER_TABLE', N'dbo', N'Employee', N'ALTER TABLE dbo.Employee SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:05:37.597</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Employee</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE dbo.Employee SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (118, CAST(N'2018-11-07T23:05:37.770' AS DateTime), N'dbo', N'ALTER_TABLE', N'Post', N'Tmp_Project', N'ALTER TABLE Post.Tmp_Project SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:05:37.770</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Tmp_Project</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Post.Tmp_Project SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (117, CAST(N'2018-11-07T23:05:37.767' AS DateTime), N'dbo', N'CREATE_TABLE', N'Post', N'Tmp_Project', N'CREATE TABLE Post.Tmp_Project
	(
	Project_ID int NOT NULL IDENTITY (1, 1),
	ProjectName nvarchar(50) NOT NULL,
	Location nvarchar(100) NOT NULL,
	Protential nvarchar(500) NULL,
	ModifiedDate datetime NULL
	)  ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>CREATE_TABLE</EventType><PostTime>2018-11-07T23:05:37.767</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Tmp_Project</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>CREATE TABLE Post.Tmp_Project
	(
	Project_ID int NOT NULL IDENTITY (1, 1),
	ProjectName nvarchar(50) NOT NULL,
	Location nvarchar(100) NOT NULL,
	Protential nvarchar(500) NULL,
	ModifiedDate datetime NULL
	)  ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (119, CAST(N'2018-11-07T23:05:37.780' AS DateTime), N'dbo', N'ALTER_TABLE', N'Post', N'Post', N'ALTER TABLE Post.Post
	DROP CONSTRAINT FK_Post_Project', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:05:37.777</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Post</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Drop><Constraints><Name>FK_Post_Project</Name></Constraints></Drop></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Post.Post
	DROP CONSTRAINT FK_Post_Project</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (120, CAST(N'2018-11-07T23:05:37.787' AS DateTime), N'dbo', N'DROP_TABLE', N'Post', N'Project', N'DROP TABLE Post.Project
', N'<EVENT_INSTANCE><EventType>DROP_TABLE</EventType><PostTime>2018-11-07T23:05:37.787</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Project</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>DROP TABLE Post.Project
</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (121, CAST(N'2018-11-07T23:05:38.043' AS DateTime), N'dbo', N'RENAME', N'Post', N'Tmp_Project', N'EXECUTE sp_rename N''Post.Tmp_Project'', N''Project'', ''OBJECT''', N'<EVENT_INSTANCE><EventType>RENAME</EventType><PostTime>2018-11-07T23:05:38.043</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Tmp_Project</ObjectName><ObjectType>TABLE</ObjectType><TargetObjectName /><TargetObjectType /><NewObjectName>Project</NewObjectName><Parameters><Param>Post.Tmp_Project</Param><Param>Project</Param><Param>OBJECT</Param></Parameters><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>EXECUTE sp_rename N''Post.Tmp_Project'', N''Project'', ''OBJECT''</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (123, CAST(N'2018-11-07T23:05:38.283' AS DateTime), N'dbo', N'CREATE_TABLE', N'Post', N'Tmp_RealEstaleType', N'CREATE TABLE Post.Tmp_RealEstaleType
	(
	RealEstaleType_ID int NOT NULL IDENTITY (1, 1),
	Name nvarchar(50) NOT NULL
	)  ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>CREATE_TABLE</EventType><PostTime>2018-11-07T23:05:38.283</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Tmp_RealEstaleType</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>CREATE TABLE Post.Tmp_RealEstaleType
	(
	RealEstaleType_ID int NOT NULL IDENTITY (1, 1),
	Name nvarchar(50) NOT NULL
	)  ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (122, CAST(N'2018-11-07T23:05:38.050' AS DateTime), N'dbo', N'ALTER_TABLE', N'Post', N'Project', N'ALTER TABLE Post.Project ADD CONSTRAINT
	PK_Project PRIMARY KEY CLUSTERED 
	(
	Project_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:05:38.047</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Project</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>PK_Project</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Post.Project ADD CONSTRAINT
	PK_Project PRIMARY KEY CLUSTERED 
	(
	Project_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (124, CAST(N'2018-11-07T23:05:38.287' AS DateTime), N'dbo', N'ALTER_TABLE', N'Post', N'Tmp_RealEstaleType', N'ALTER TABLE Post.Tmp_RealEstaleType SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:05:38.287</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Tmp_RealEstaleType</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Post.Tmp_RealEstaleType SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (125, CAST(N'2018-11-07T23:05:38.297' AS DateTime), N'dbo', N'ALTER_TABLE', N'Post', N'Post', N'ALTER TABLE Post.Post
	DROP CONSTRAINT FK_Post_RealEstaleType', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:05:38.293</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Post</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Drop><Constraints><Name>FK_Post_RealEstaleType</Name></Constraints></Drop></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Post.Post
	DROP CONSTRAINT FK_Post_RealEstaleType</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (126, CAST(N'2018-11-07T23:05:38.300' AS DateTime), N'dbo', N'DROP_TABLE', N'Post', N'RealEstaleType', N'DROP TABLE Post.RealEstaleType
', N'<EVENT_INSTANCE><EventType>DROP_TABLE</EventType><PostTime>2018-11-07T23:05:38.300</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>RealEstaleType</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>DROP TABLE Post.RealEstaleType
</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (127, CAST(N'2018-11-07T23:05:38.300' AS DateTime), N'dbo', N'RENAME', N'Post', N'Tmp_RealEstaleType', N'EXECUTE sp_rename N''Post.Tmp_RealEstaleType'', N''RealEstaleType'', ''OBJECT''', N'<EVENT_INSTANCE><EventType>RENAME</EventType><PostTime>2018-11-07T23:05:38.300</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Tmp_RealEstaleType</ObjectName><ObjectType>TABLE</ObjectType><TargetObjectName /><TargetObjectType /><NewObjectName>RealEstaleType</NewObjectName><Parameters><Param>Post.Tmp_RealEstaleType</Param><Param>RealEstaleType</Param><Param>OBJECT</Param></Parameters><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>EXECUTE sp_rename N''Post.Tmp_RealEstaleType'', N''RealEstaleType'', ''OBJECT''</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (128, CAST(N'2018-11-07T23:05:38.303' AS DateTime), N'dbo', N'ALTER_TABLE', N'Post', N'RealEstaleType', N'ALTER TABLE Post.RealEstaleType ADD CONSTRAINT
	PK_RealEstaleType PRIMARY KEY CLUSTERED 
	(
	RealEstaleType_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:05:38.303</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>RealEstaleType</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>PK_RealEstaleType</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Post.RealEstaleType ADD CONSTRAINT
	PK_RealEstaleType PRIMARY KEY CLUSTERED 
	(
	RealEstaleType_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (129, CAST(N'2018-11-07T23:05:38.557' AS DateTime), N'dbo', N'CREATE_TABLE', N'Post', N'Tmp_Type', N'CREATE TABLE Post.Tmp_Type
	(
	PostType_ID int NOT NULL IDENTITY (1, 1),
	Name nvarchar(50) NOT NULL
	)  ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>CREATE_TABLE</EventType><PostTime>2018-11-07T23:05:38.557</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Tmp_Type</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>CREATE TABLE Post.Tmp_Type
	(
	PostType_ID int NOT NULL IDENTITY (1, 1),
	Name nvarchar(50) NOT NULL
	)  ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (130, CAST(N'2018-11-07T23:05:38.560' AS DateTime), N'dbo', N'ALTER_TABLE', N'Post', N'Tmp_Type', N'ALTER TABLE Post.Tmp_Type SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:05:38.560</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Tmp_Type</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Post.Tmp_Type SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (131, CAST(N'2018-11-07T23:05:38.573' AS DateTime), N'dbo', N'ALTER_TABLE', N'Post', N'Post', N'ALTER TABLE Post.Post
	DROP CONSTRAINT FK_Post_PostType', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:05:38.570</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Post</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Drop><Constraints><Name>FK_Post_PostType</Name></Constraints></Drop></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Post.Post
	DROP CONSTRAINT FK_Post_PostType</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (132, CAST(N'2018-11-07T23:05:38.573' AS DateTime), N'dbo', N'DROP_TABLE', N'Post', N'Type', N'DROP TABLE Post.Type
', N'<EVENT_INSTANCE><EventType>DROP_TABLE</EventType><PostTime>2018-11-07T23:05:38.573</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Type</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>DROP TABLE Post.Type
</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (133, CAST(N'2018-11-07T23:05:38.577' AS DateTime), N'dbo', N'RENAME', N'Post', N'Tmp_Type', N'EXECUTE sp_rename N''Post.Tmp_Type'', N''Type'', ''OBJECT''', N'<EVENT_INSTANCE><EventType>RENAME</EventType><PostTime>2018-11-07T23:05:38.577</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Tmp_Type</ObjectName><ObjectType>TABLE</ObjectType><TargetObjectName /><TargetObjectType /><NewObjectName>Type</NewObjectName><Parameters><Param>Post.Tmp_Type</Param><Param>Type</Param><Param>OBJECT</Param></Parameters><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>EXECUTE sp_rename N''Post.Tmp_Type'', N''Type'', ''OBJECT''</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (134, CAST(N'2018-11-07T23:05:38.583' AS DateTime), N'dbo', N'ALTER_TABLE', N'Post', N'Type', N'ALTER TABLE Post.Type ADD CONSTRAINT
	PK_PostType PRIMARY KEY CLUSTERED 
	(
	PostType_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:05:38.583</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Type</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>PK_PostType</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Post.Type ADD CONSTRAINT
	PK_PostType PRIMARY KEY CLUSTERED 
	(
	PostType_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (135, CAST(N'2018-11-07T23:05:38.840' AS DateTime), N'dbo', N'CREATE_TABLE', N'Post', N'Tmp_Post', N'CREATE TABLE Post.Tmp_Post
	(
	Post_ID int NOT NULL IDENTITY (1, 1),
	PostType int NOT NULL,
	PostTime datetime NULL,
	Price money NOT NULL,
	Location nvarchar(100) NOT NULL,
	Area decimal(18, 2) NOT NULL,
	Sale nvarchar(100) NULL,
	Form nvarchar(50) NULL,
	Project int NULL,
	Description nvarchar(500) NOT NULL,
	RealEstaleType int NOT NULL,
	Status bit NULL,
	Censor int NULL,
	CensorshipTime datetime NULL
	)  ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>CREATE_TABLE</EventType><PostTime>2018-11-07T23:05:38.840</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Tmp_Post</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>CREATE TABLE Post.Tmp_Post
	(
	Post_ID int NOT NULL IDENTITY (1, 1),
	PostType int NOT NULL,
	PostTime datetime NULL,
	Price money NOT NULL,
	Location nvarchar(100) NOT NULL,
	Area decimal(18, 2) NOT NULL,
	Sale nvarchar(100) NULL,
	Form nvarchar(50) NULL,
	Project int NULL,
	Description nvarchar(500) NOT NULL,
	RealEstaleType int NOT NULL,
	Status bit NULL,
	Censor int NULL,
	CensorshipTime datetime NULL
	)  ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (136, CAST(N'2018-11-07T23:05:38.843' AS DateTime), N'dbo', N'ALTER_TABLE', N'Post', N'Tmp_Post', N'ALTER TABLE Post.Tmp_Post SET (LOCK_ESCALATION = TABLE)', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:05:38.843</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Tmp_Post</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Post.Tmp_Post SET (LOCK_ESCALATION = TABLE)</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (137, CAST(N'2018-11-07T23:05:38.850' AS DateTime), N'dbo', N'DROP_TABLE', N'Post', N'Post', N'DROP TABLE Post.Post
', N'<EVENT_INSTANCE><EventType>DROP_TABLE</EventType><PostTime>2018-11-07T23:05:38.850</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Post</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>DROP TABLE Post.Post
</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (138, CAST(N'2018-11-07T23:05:38.850' AS DateTime), N'dbo', N'RENAME', N'Post', N'Tmp_Post', N'EXECUTE sp_rename N''Post.Tmp_Post'', N''Post'', ''OBJECT''', N'<EVENT_INSTANCE><EventType>RENAME</EventType><PostTime>2018-11-07T23:05:38.850</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Tmp_Post</ObjectName><ObjectType>TABLE</ObjectType><TargetObjectName /><TargetObjectType /><NewObjectName>Post</NewObjectName><Parameters><Param>Post.Tmp_Post</Param><Param>Post</Param><Param>OBJECT</Param></Parameters><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>EXECUTE sp_rename N''Post.Tmp_Post'', N''Post'', ''OBJECT''</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (139, CAST(N'2018-11-07T23:05:38.860' AS DateTime), N'dbo', N'ALTER_TABLE', N'Post', N'Post', N'ALTER TABLE Post.Post ADD CONSTRAINT
	PK_Post PRIMARY KEY CLUSTERED 
	(
	Post_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:05:38.857</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Post</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>PK_Post</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Post.Post ADD CONSTRAINT
	PK_Post PRIMARY KEY CLUSTERED 
	(
	Post_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (140, CAST(N'2018-11-07T23:05:38.870' AS DateTime), N'dbo', N'ALTER_TABLE', N'Post', N'Post', N'ALTER TABLE Post.Post ADD CONSTRAINT
	FK_Post_PostType FOREIGN KEY
	(
	PostType
	) REFERENCES Post.Type
	(
	PostType_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:05:38.870</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Post</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>FK_Post_PostType</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Post.Post ADD CONSTRAINT
	FK_Post_PostType FOREIGN KEY
	(
	PostType
	) REFERENCES Post.Type
	(
	PostType_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (141, CAST(N'2018-11-07T23:05:38.870' AS DateTime), N'dbo', N'ALTER_TABLE', N'Post', N'Post', N'ALTER TABLE Post.Post ADD CONSTRAINT
	FK_Post_Project FOREIGN KEY
	(
	Project
	) REFERENCES Post.Project
	(
	Project_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:05:38.870</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Post</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>FK_Post_Project</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Post.Post ADD CONSTRAINT
	FK_Post_Project FOREIGN KEY
	(
	Project
	) REFERENCES Post.Project
	(
	Project_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (142, CAST(N'2018-11-07T23:05:38.873' AS DateTime), N'dbo', N'ALTER_TABLE', N'Post', N'Post', N'ALTER TABLE Post.Post ADD CONSTRAINT
	FK_Post_RealEstaleType FOREIGN KEY
	(
	RealEstaleType
	) REFERENCES Post.RealEstaleType
	(
	RealEstaleType_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:05:38.873</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Post</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>FK_Post_RealEstaleType</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Post.Post ADD CONSTRAINT
	FK_Post_RealEstaleType FOREIGN KEY
	(
	RealEstaleType
	) REFERENCES Post.RealEstaleType
	(
	RealEstaleType_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (143, CAST(N'2018-11-07T23:05:38.877' AS DateTime), N'dbo', N'ALTER_TABLE', N'Post', N'Post', N'ALTER TABLE Post.Post ADD CONSTRAINT
	FK_Post_Employee FOREIGN KEY
	(
	Censor
	) REFERENCES dbo.Employee
	(
	Employee_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION', N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2018-11-07T23:05:38.877</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>Post</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Constraints><Name>FK_Post_Employee</Name></Constraints></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE Post.Post ADD CONSTRAINT
	FK_Post_Employee FOREIGN KEY
	(
	Censor
	) REFERENCES dbo.Employee
	(
	Employee_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION</CommandText></TSQLCommand></EVENT_INSTANCE>')
INSERT [dbo].[DatabaseLog] ([DatabaseLogID], [PostTime], [DatabaseUser], [Event], [Schema], [Object], [TSQL], [XmlEvent]) VALUES (144, CAST(N'2018-11-07T23:05:38.880' AS DateTime), N'dbo', N'CREATE_TRIGGER', N'Post', N'setPostTime_Status', N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER setPostTime_Status ON  Post.Post
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @post_id int;

	SELECT @post_id = i.Post_ID FROM inserted i;

	UPDATE Post.Post 
	SET PostTime = GETDATE(), Status = 1
	WHERE Post_ID = @post_id

END
', N'<EVENT_INSTANCE><EventType>CREATE_TRIGGER</EventType><PostTime>2018-11-07T23:05:38.880</PostTime><SPID>55</SPID><ServerName>DESKTOP-NM2RAAF</ServerName><LoginName>MicrosoftAccount\daoxuanthuy.developer@gmail.com</LoginName><UserName>dbo</UserName><DatabaseName>RealEstateWebsite</DatabaseName><SchemaName>Post</SchemaName><ObjectName>setPostTime_Status</ObjectName><ObjectType>TRIGGER</ObjectType><TargetObjectName>Post</TargetObjectName><TargetObjectType>TABLE</TargetObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>-- =============================================
-- Author:		&lt;Author,,Name&gt;
-- Create date: &lt;Create Date,,&gt;
-- Description:	&lt;Description,,&gt;
-- =============================================
CREATE TRIGGER setPostTime_Status ON  Post.Post
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @post_id int;

	SELECT @post_id = i.Post_ID FROM inserted i;

	UPDATE Post.Post 
	SET PostTime = GETDATE(), Status = 1
	WHERE Post_ID = @post_id

END
</CommandText></TSQLCommand></EVENT_INSTANCE>')
SET IDENTITY_INSERT [dbo].[DatabaseLog] OFF
/****** Object:  Index [PK_DatabaseLog_DatabaseLogID]    Script Date: 11/8/2018 8:04:12 AM ******/
ALTER TABLE [dbo].[DatabaseLog] ADD  CONSTRAINT [PK_DatabaseLog_DatabaseLogID] PRIMARY KEY NONCLUSTERED 
(
	[DatabaseLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Customer].[Block]  WITH CHECK ADD  CONSTRAINT [FK_Block_Customer] FOREIGN KEY([Cus_ID])
REFERENCES [Customer].[Customer] ([Customer_ID])
GO
ALTER TABLE [Customer].[Block] CHECK CONSTRAINT [FK_Block_Customer]
GO
ALTER TABLE [Customer].[Block]  WITH CHECK ADD  CONSTRAINT [FK_Block_Employee] FOREIGN KEY([Emp_Block])
REFERENCES [Employee].[Employee] ([Employee_ID])
GO
ALTER TABLE [Customer].[Block] CHECK CONSTRAINT [FK_Block_Employee]
GO
ALTER TABLE [Customer].[PhoneNumber]  WITH CHECK ADD  CONSTRAINT [FK_PhoneNumber_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [Customer].[Customer] ([Customer_ID])
GO
ALTER TABLE [Customer].[PhoneNumber] CHECK CONSTRAINT [FK_PhoneNumber_Customer]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Customer] FOREIGN KEY([Cus_ID])
REFERENCES [Customer].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Customer]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Employee] FOREIGN KEY([Emp_ID])
REFERENCES [Employee].[Employee] ([Employee_ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Employee]
GO
ALTER TABLE [Employee].[Block]  WITH CHECK ADD  CONSTRAINT [FK_Block_Employee] FOREIGN KEY([Emp_ID])
REFERENCES [Employee].[Employee] ([Employee_ID])
GO
ALTER TABLE [Employee].[Block] CHECK CONSTRAINT [FK_Block_Employee]
GO
ALTER TABLE [Employee].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Employee] FOREIGN KEY([Manager_ID])
REFERENCES [Employee].[Employee] ([Employee_ID])
GO
ALTER TABLE [Employee].[Employee] CHECK CONSTRAINT [FK_Employee_Employee]
GO
ALTER TABLE [Employee].[Quit]  WITH CHECK ADD  CONSTRAINT [FK_Quit_Employee] FOREIGN KEY([Emp_ID])
REFERENCES [Employee].[Employee] ([Employee_ID])
GO
ALTER TABLE [Employee].[Quit] CHECK CONSTRAINT [FK_Quit_Employee]
GO
ALTER TABLE [Post].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Employee] FOREIGN KEY([Censor])
REFERENCES [Employee].[Employee] ([Employee_ID])
GO
ALTER TABLE [Post].[Post] CHECK CONSTRAINT [FK_Post_Employee]
GO
ALTER TABLE [Post].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_PostType] FOREIGN KEY([PostType])
REFERENCES [Post].[Type] ([PostType_ID])
GO
ALTER TABLE [Post].[Post] CHECK CONSTRAINT [FK_Post_PostType]
GO
ALTER TABLE [Post].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Project] FOREIGN KEY([Project])
REFERENCES [Post].[Project] ([Project_ID])
GO
ALTER TABLE [Post].[Post] CHECK CONSTRAINT [FK_Post_Project]
GO
ALTER TABLE [Post].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_RealEstaleType] FOREIGN KEY([RealEstaleType])
REFERENCES [Post].[RealEstaleType] ([RealEstaleType_ID])
GO
ALTER TABLE [Post].[Post] CHECK CONSTRAINT [FK_Post_RealEstaleType]
GO
ALTER TABLE [Customer].[Customer]  WITH CHECK ADD  CONSTRAINT [CK_Customer_CusType] CHECK  (([Cus_Type]='Normal' OR [Cus_Type]='Vip'))
GO
ALTER TABLE [Customer].[Customer] CHECK CONSTRAINT [CK_Customer_CusType]
GO
/****** Object:  DdlTrigger [ddlDatabaseTriggerLog]    Script Date: 11/8/2018 8:04:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [ddlDatabaseTriggerLog] ON DATABASE 
FOR DDL_DATABASE_LEVEL_EVENTS AS 
BEGIN
    SET NOCOUNT ON;

    DECLARE @data XML;
    DECLARE @schema sysname;
    DECLARE @object sysname;
    DECLARE @eventType sysname;

    SET @data = EVENTDATA();
    SET @eventType = @data.value('(/EVENT_INSTANCE/EventType)[1]', 'sysname');
    SET @schema = @data.value('(/EVENT_INSTANCE/SchemaName)[1]', 'sysname');
    SET @object = @data.value('(/EVENT_INSTANCE/ObjectName)[1]', 'sysname') 

    IF @object IS NOT NULL
        PRINT '  ' + @eventType + ' - ' + @schema + '.' + @object;
    ELSE
        PRINT '  ' + @eventType + ' - ' + @schema;

    IF @eventType IS NULL
        PRINT CONVERT(nvarchar(max), @data);

    INSERT [dbo].[DatabaseLog] 
        (
        [PostTime], 
        [DatabaseUser], 
        [Event], 
        [Schema], 
        [Object], 
        [TSQL], 
        [XmlEvent]
        ) 
    VALUES 
        (
        GETDATE(), 
        CONVERT(sysname, CURRENT_USER), 
        @eventType, 
        CONVERT(sysname, @schema), 
        CONVERT(sysname, @object), 
        @data.value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'nvarchar(max)'), 
        @data
        );
END;
GO
ENABLE TRIGGER [ddlDatabaseTriggerLog] ON DATABASE
GO
USE [master]
GO
ALTER DATABASE [RealEstateWebsite] SET  READ_WRITE 
GO
