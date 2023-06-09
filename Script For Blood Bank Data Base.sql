USE [master]
GO
/****** Object:  Database [BloodBank]    Script Date: 01-05-2023 15:44:05 ******/
CREATE DATABASE [BloodBank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BloodBank', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BloodBank.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BloodBank_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BloodBank_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BloodBank] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BloodBank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BloodBank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BloodBank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BloodBank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BloodBank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BloodBank] SET ARITHABORT OFF 
GO
ALTER DATABASE [BloodBank] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BloodBank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BloodBank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BloodBank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BloodBank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BloodBank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BloodBank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BloodBank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BloodBank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BloodBank] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BloodBank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BloodBank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BloodBank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BloodBank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BloodBank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BloodBank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BloodBank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BloodBank] SET RECOVERY FULL 
GO
ALTER DATABASE [BloodBank] SET  MULTI_USER 
GO
ALTER DATABASE [BloodBank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BloodBank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BloodBank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BloodBank] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BloodBank] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BloodBank] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BloodBank', N'ON'
GO
ALTER DATABASE [BloodBank] SET QUERY_STORE = OFF
GO
USE [BloodBank]
GO
/****** Object:  Table [dbo].[BloodBag]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodBag](
	[BloodBagSearialNumber] [int] IDENTITY(1,1) NOT NULL,
	[DonorID] [int] NOT NULL,
	[BloodGroupID] [int] NULL,
	[DonateDate] [datetime] NULL,
	[ExpireDate] [datetime] NULL,
	[OutPatientID] [nvarchar](100) NULL,
	[VerificationDoctorID] [int] NULL,
	[Status] [nvarchar](50) NOT NULL,
	[VerificationDoctorRemarks] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_BloodBag] PRIMARY KEY CLUSTERED 
(
	[BloodBagSearialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BloodBank]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodBank](
	[BloodBankID] [int] IDENTITY(1,1) NOT NULL,
	[BloodBankName] [nvarchar](250) NOT NULL,
	[StateID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[ContactNumber] [nvarchar](50) NOT NULL,
	[EastablishmentDate] [datetime] NULL,
	[Image] [nvarchar](100) NULL,
	[Latitude] [nvarchar](50) NOT NULL,
	[Longtitude] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
	[UserID] [int] NOT NULL,
	[Address] [nvarchar](250) NULL,
 CONSTRAINT [PK_BloodBank] PRIMARY KEY CLUSTERED 
(
	[BloodBankID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BloodGroup]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodGroup](
	[BloodGroupID] [int] IDENTITY(1,1) NOT NULL,
	[BloodGroupName] [nvarchar](100) NULL,
	[Price] [decimal](5, 2) NULL,
	[Description] [nvarchar](250) NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_BloodGroup] PRIMARY KEY CLUSTERED 
(
	[BloodGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[StateID] [int] NOT NULL,
	[CityName] [nvarchar](100) NOT NULL,
	[CityCode] [nvarchar](50) NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
	[UserID] [int] NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[DoctorID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorName] [nvarchar](100) NOT NULL,
	[StateID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
	[Address] [nvarchar](250) NULL,
	[ContactNumber] [nvarchar](50) NOT NULL,
	[BirthDate] [datetime] NULL,
	[Email] [nvarchar](100) NULL,
	[Gender] [nvarchar](50) NULL,
	[Description] [nvarchar](250) NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donor]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donor](
	[DonorID] [int] IDENTITY(1,1) NOT NULL,
	[DonorName] [nvarchar](100) NOT NULL,
	[StateID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[ContactNumber] [nvarchar](50) NOT NULL,
	[BirthDate] [datetime] NULL,
	[Email] [nvarchar](100) NULL,
	[Gender] [nvarchar](50) NULL,
	[ProofType] [nvarchar](50) NULL,
	[ProofNumber] [nvarchar](50) NULL,
	[Pulse] [nvarchar](50) NULL,
	[BP] [nvarchar](50) NULL,
	[Weight] [decimal](5, 2) NULL,
	[Image] [nvarchar](250) NULL,
	[BloodGroupID] [int] NOT NULL,
	[Description] [nvarchar](250) NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Donor] PRIMARY KEY CLUSTERED 
(
	[DonorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OutPatient]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutPatient](
	[OutPatientID] [int] IDENTITY(1,1) NOT NULL,
	[OutPatientName] [nvarchar](100) NULL,
	[BloodGroupID] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](5, 2) NULL,
	[TotalPrice] [decimal](5, 2) NULL,
	[OutDate] [datetime] NULL,
	[BloodCrossVerifiedBy] [int] NULL,
	[DoctorCrossVerificationRemarks] [nvarchar](250) NULL,
	[ContactNumber] [nvarchar](50) NULL,
	[Description] [nvarchar](250) NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_OutPatient] PRIMARY KEY CLUSTERED 
(
	[OutPatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](100) NOT NULL,
	[StateCode] [nvarchar](50) NULL,
	[Description] [nvarchar](250) NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[ContactNumber] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BloodBag] ON 

INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (7, 8, 1, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, 1, N'InStock', N'done match', NULL, CAST(N'2023-04-05T05:17:53.113' AS DateTime), CAST(N'2023-04-05T05:17:53.113' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (8, 10, 2, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), N'30', 1, N'OutStock', N'done match', NULL, CAST(N'2023-04-05T05:18:07.723' AS DateTime), CAST(N'2023-04-05T05:18:07.723' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (9, 11, 3, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), N'28', 2, N'OutStock', N'done match', NULL, CAST(N'2023-04-05T05:18:28.397' AS DateTime), CAST(N'2023-04-05T05:18:28.397' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (10, 13, 3, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, 1, N'InStock', N'done match', NULL, CAST(N'2023-04-05T05:18:43.210' AS DateTime), CAST(N'2023-04-05T05:18:43.210' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (11, 20, 3, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), N'28', 2, N'OutStock', N'done match', NULL, CAST(N'2023-04-05T05:19:03.507' AS DateTime), CAST(N'2023-04-05T05:19:03.507' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (12, 22, 3, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, 1, N'InStock', N'done match', NULL, CAST(N'2023-04-05T05:19:22.610' AS DateTime), CAST(N'2023-04-05T05:19:22.610' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (13, 24, 3, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), N'28', 2, N'OutStock', N'done match', NULL, CAST(N'2023-04-05T05:19:57.700' AS DateTime), CAST(N'2023-04-05T05:19:57.700' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (14, 12, 4, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), N'32', 1, N'OutStock', N'done match', NULL, CAST(N'2023-04-05T05:20:16.960' AS DateTime), CAST(N'2023-04-05T05:20:16.960' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (15, 14, 4, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), N'32', 2, N'OutStock', N'done match', NULL, CAST(N'2023-04-05T05:21:02.180' AS DateTime), CAST(N'2023-04-05T05:21:02.180' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (16, 15, 5, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), N'31', 1, N'OutStock', N'done match', NULL, CAST(N'2023-04-05T05:21:33.703' AS DateTime), CAST(N'2023-04-05T05:21:33.703' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (17, 23, 5, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'done match', NULL, CAST(N'2023-04-05T05:22:16.047' AS DateTime), CAST(N'2023-04-05T05:22:16.047' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (18, 21, 6, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'done match', NULL, CAST(N'2023-04-05T05:22:35.850' AS DateTime), CAST(N'2023-04-05T05:22:35.850' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (19, 16, 6, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, 1, N'InStock', N'done match', NULL, CAST(N'2023-04-05T05:23:01.337' AS DateTime), CAST(N'2023-04-05T05:23:01.337' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (20, 17, 7, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), N'29', 2, N'OutStock', N'done match', NULL, CAST(N'2023-04-05T05:23:28.687' AS DateTime), CAST(N'2023-04-05T05:23:28.687' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (21, 19, 7, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), N'29', 2, N'OutStock', N'done match', NULL, CAST(N'2023-04-05T05:23:50.117' AS DateTime), CAST(N'2023-04-05T05:23:50.117' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (22, 17, 7, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), N'29', 1, N'OutStock', N'done match', NULL, CAST(N'2023-04-05T05:24:14.723' AS DateTime), CAST(N'2023-04-05T05:24:14.723' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (23, 18, 8, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'done match', NULL, CAST(N'2023-04-05T05:24:32.253' AS DateTime), CAST(N'2023-04-05T05:24:32.253' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (24, 25, 8, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, 1, N'InStock', N'done match', NULL, CAST(N'2023-04-05T05:24:47.347' AS DateTime), CAST(N'2023-04-05T05:24:47.347' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (25, 26, 2, CAST(N'2023-04-09T00:00:00.000' AS DateTime), CAST(N'2023-05-21T00:00:00.000' AS DateTime), N'30', 1, N'OutStock', N'done match', NULL, CAST(N'2023-04-09T19:43:08.863' AS DateTime), CAST(N'2023-04-09T19:43:08.863' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (27, 26, 2, CAST(N'2023-01-09T00:00:00.000' AS DateTime), CAST(N'2023-03-09T00:00:00.000' AS DateTime), NULL, 2, N'ExpireStock', N'done', NULL, CAST(N'2023-04-16T15:24:39.747' AS DateTime), CAST(N'2023-04-16T15:24:39.747' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (28, 10, 2, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'Valid Blood ', NULL, CAST(N'2023-05-01T14:32:27.633' AS DateTime), CAST(N'2023-05-01T14:32:27.633' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (29, 29, 7, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), NULL, 1, N'InStock', N'valid', NULL, CAST(N'2023-05-01T14:55:43.023' AS DateTime), CAST(N'2023-05-01T14:55:43.023' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (30, 32, 8, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), NULL, 1, N'InStock', N'valid', NULL, CAST(N'2023-05-01T14:56:00.180' AS DateTime), CAST(N'2023-05-01T14:56:00.180' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (31, 31, 5, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'valid', NULL, CAST(N'2023-05-01T14:56:17.590' AS DateTime), CAST(N'2023-05-01T14:56:17.590' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (32, 30, 5, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'valid', NULL, CAST(N'2023-05-01T14:56:32.143' AS DateTime), CAST(N'2023-05-01T14:56:32.143' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (33, 28, 3, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'valid', NULL, CAST(N'2023-05-01T14:57:58.977' AS DateTime), CAST(N'2023-05-01T14:57:58.977' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (34, 28, 3, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), NULL, 1, N'InStock', N'valid', NULL, CAST(N'2023-05-01T14:58:20.723' AS DateTime), CAST(N'2023-05-01T14:58:20.723' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (35, 34, 7, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'valid', NULL, CAST(N'2023-05-01T15:06:21.780' AS DateTime), CAST(N'2023-05-01T15:06:21.780' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (36, 33, 2, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'valid', NULL, CAST(N'2023-05-01T15:06:48.730' AS DateTime), CAST(N'2023-05-01T15:06:48.730' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (37, 36, 4, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'valid', NULL, CAST(N'2023-05-01T15:07:08.790' AS DateTime), CAST(N'2023-05-01T15:07:08.790' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (38, 37, 4, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), N'32', 1, N'OutStock', N'valid', NULL, CAST(N'2023-05-01T15:07:24.493' AS DateTime), CAST(N'2023-05-01T15:07:24.493' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (39, 35, 8, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'valid', NULL, CAST(N'2023-05-01T15:07:46.887' AS DateTime), CAST(N'2023-05-01T15:07:46.887' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (40, 43, 3, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'Valid', NULL, CAST(N'2023-05-01T15:17:55.500' AS DateTime), CAST(N'2023-05-01T15:17:55.500' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (41, 44, 4, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), N'32', 1, N'OutStock', N'Valid', NULL, CAST(N'2023-05-01T15:18:24.837' AS DateTime), CAST(N'2023-05-01T15:18:24.837' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (42, 42, 7, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'Valid', NULL, CAST(N'2023-05-01T15:19:08.307' AS DateTime), CAST(N'2023-05-01T15:19:08.307' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (43, 39, 8, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'Valid', NULL, CAST(N'2023-05-01T15:20:01.490' AS DateTime), CAST(N'2023-05-01T15:20:01.490' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (44, 38, 5, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), NULL, 1, N'InStock', N'Valid', NULL, CAST(N'2023-05-01T15:20:24.923' AS DateTime), CAST(N'2023-05-01T15:20:24.923' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (45, 41, 3, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), NULL, 1, N'InStock', N'Valid', NULL, CAST(N'2023-05-01T15:20:41.947' AS DateTime), CAST(N'2023-05-01T15:20:41.947' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (46, 40, 2, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'Valid', NULL, CAST(N'2023-05-01T15:20:57.967' AS DateTime), CAST(N'2023-05-01T15:20:57.967' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (47, 52, 8, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'valid', NULL, CAST(N'2023-05-01T15:36:01.717' AS DateTime), CAST(N'2023-05-01T15:36:01.717' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (48, 45, 7, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), NULL, 1, N'InStock', N'valid', NULL, CAST(N'2023-05-01T15:36:25.867' AS DateTime), CAST(N'2023-05-01T15:36:25.867' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (49, 48, 5, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), N'31', 1, N'OutStock', N'valid', NULL, CAST(N'2023-05-01T15:36:46.010' AS DateTime), CAST(N'2023-05-01T15:36:46.010' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (50, 50, 2, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'valid', NULL, CAST(N'2023-05-01T15:37:01.097' AS DateTime), CAST(N'2023-05-01T15:37:01.097' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (51, 46, 3, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'valid', NULL, CAST(N'2023-05-01T15:37:33.193' AS DateTime), CAST(N'2023-05-01T15:37:33.193' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (52, 51, 6, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'valid', NULL, CAST(N'2023-05-01T15:37:54.507' AS DateTime), CAST(N'2023-05-01T15:37:54.507' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (53, 47, 4, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'valid', NULL, CAST(N'2023-05-01T15:38:12.097' AS DateTime), CAST(N'2023-05-01T15:38:12.097' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[BloodBag] OFF
GO
SET IDENTITY_INSERT [dbo].[BloodBank] ON 

INSERT [dbo].[BloodBank] ([BloodBankID], [BloodBankName], [StateID], [CityID], [Email], [ContactNumber], [EastablishmentDate], [Image], [Latitude], [Longtitude], [Description], [CreationDate], [ModificationDate], [UserID], [Address]) VALUES (5, N'Hindustan Blood Bank', 4, 5, N'hindustan@gmail.com', N'8981213731', CAST(N'1997-12-12T00:00:00.000' AS DateTime), N'~/BloodBankImage/bloodbank.jpg', N'22.3013', N'70.7651', NULL, CAST(N'2023-04-11T16:39:17.610' AS DateTime), CAST(N'2023-04-11T16:39:17.610' AS DateTime), 1, N'Raiya Road, Rajkot')
SET IDENTITY_INSERT [dbo].[BloodBank] OFF
GO
SET IDENTITY_INSERT [dbo].[BloodGroup] ON 

INSERT [dbo].[BloodGroup] ([BloodGroupID], [BloodGroupName], [Price], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (1, N'A-', CAST(190.00 AS Decimal(5, 2)), NULL, CAST(N'2023-04-03T08:25:39.723' AS DateTime), CAST(N'2023-04-04T04:35:12.307' AS DateTime), 1)
INSERT [dbo].[BloodGroup] ([BloodGroupID], [BloodGroupName], [Price], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (2, N'A+', CAST(200.00 AS Decimal(5, 2)), NULL, CAST(N'2023-04-04T04:18:50.370' AS DateTime), CAST(N'2023-04-04T06:25:27.730' AS DateTime), 1)
INSERT [dbo].[BloodGroup] ([BloodGroupID], [BloodGroupName], [Price], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (3, N'B+', CAST(210.00 AS Decimal(5, 2)), NULL, CAST(N'2023-04-04T04:19:00.017' AS DateTime), CAST(N'2023-04-04T04:35:30.797' AS DateTime), 1)
INSERT [dbo].[BloodGroup] ([BloodGroupID], [BloodGroupName], [Price], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (4, N'B-', CAST(220.00 AS Decimal(5, 2)), NULL, CAST(N'2023-04-04T04:19:08.100' AS DateTime), CAST(N'2023-04-04T04:35:40.993' AS DateTime), 1)
INSERT [dbo].[BloodGroup] ([BloodGroupID], [BloodGroupName], [Price], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (5, N'AB-', CAST(230.00 AS Decimal(5, 2)), NULL, CAST(N'2023-04-04T04:19:14.990' AS DateTime), CAST(N'2023-04-04T04:35:51.927' AS DateTime), 1)
INSERT [dbo].[BloodGroup] ([BloodGroupID], [BloodGroupName], [Price], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (6, N'AB+', CAST(240.00 AS Decimal(5, 2)), NULL, CAST(N'2023-04-04T04:19:21.910' AS DateTime), CAST(N'2023-04-04T04:36:04.277' AS DateTime), 1)
INSERT [dbo].[BloodGroup] ([BloodGroupID], [BloodGroupName], [Price], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (7, N'O+', CAST(300.00 AS Decimal(5, 2)), NULL, CAST(N'2023-04-04T04:19:32.120' AS DateTime), CAST(N'2023-04-04T04:36:15.767' AS DateTime), 1)
INSERT [dbo].[BloodGroup] ([BloodGroupID], [BloodGroupName], [Price], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (8, N'O-', CAST(350.00 AS Decimal(5, 2)), NULL, CAST(N'2023-04-04T04:19:39.960' AS DateTime), CAST(N'2023-04-04T04:36:36.383' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[BloodGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityID], [StateID], [CityName], [CityCode], [CreationDate], [ModificationDate], [UserID], [Description]) VALUES (4, 2, N'Mumbai', N'MB', CAST(N'2023-04-01T15:33:03.887' AS DateTime), CAST(N'2023-04-04T03:52:35.533' AS DateTime), 1, NULL)
INSERT [dbo].[City] ([CityID], [StateID], [CityName], [CityCode], [CreationDate], [ModificationDate], [UserID], [Description]) VALUES (5, 4, N'surat', N'srt', CAST(N'2023-04-04T03:47:31.610' AS DateTime), CAST(N'2023-04-04T03:50:12.737' AS DateTime), 1, NULL)
INSERT [dbo].[City] ([CityID], [StateID], [CityName], [CityCode], [CreationDate], [ModificationDate], [UserID], [Description]) VALUES (6, 6, N'Amritsar', N'AS', CAST(N'2023-04-04T03:52:52.583' AS DateTime), CAST(N'2023-04-04T03:52:52.583' AS DateTime), 1, NULL)
INSERT [dbo].[City] ([CityID], [StateID], [CityName], [CityCode], [CreationDate], [ModificationDate], [UserID], [Description]) VALUES (7, 5, N'Jaipur', N'JP', CAST(N'2023-04-04T03:53:08.440' AS DateTime), CAST(N'2023-04-04T03:53:08.440' AS DateTime), 1, NULL)
INSERT [dbo].[City] ([CityID], [StateID], [CityName], [CityCode], [CreationDate], [ModificationDate], [UserID], [Description]) VALUES (8, 4, N'Rajkot', N'RJT', CAST(N'2023-04-04T03:53:27.173' AS DateTime), CAST(N'2023-04-10T04:20:41.933' AS DateTime), 1, NULL)
INSERT [dbo].[City] ([CityID], [StateID], [CityName], [CityCode], [CreationDate], [ModificationDate], [UserID], [Description]) VALUES (14, 17, N'Patna', N'PT', CAST(N'2023-05-01T14:46:26.010' AS DateTime), CAST(N'2023-05-01T14:46:26.010' AS DateTime), 1, NULL)
INSERT [dbo].[City] ([CityID], [StateID], [CityName], [CityCode], [CreationDate], [ModificationDate], [UserID], [Description]) VALUES (15, 16, N'Lucknow', N'LN', CAST(N'2023-05-01T14:46:58.153' AS DateTime), CAST(N'2023-05-01T14:46:58.153' AS DateTime), 1, NULL)
INSERT [dbo].[City] ([CityID], [StateID], [CityName], [CityCode], [CreationDate], [ModificationDate], [UserID], [Description]) VALUES (16, 18, N'Madoli', N'MD', CAST(N'2023-05-01T14:47:18.317' AS DateTime), CAST(N'2023-05-01T14:47:18.317' AS DateTime), 1, NULL)
INSERT [dbo].[City] ([CityID], [StateID], [CityName], [CityCode], [CreationDate], [ModificationDate], [UserID], [Description]) VALUES (17, 19, N'GuruGram', N'GG', CAST(N'2023-05-01T14:47:41.447' AS DateTime), CAST(N'2023-05-01T14:47:41.447' AS DateTime), 1, NULL)
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Doctor] ON 

INSERT [dbo].[Doctor] ([DoctorID], [DoctorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (1, N'Dr.Harsh Patel', 2, 4, NULL, N'9090909090', CAST(N'2002-04-03T00:00:00.000' AS DateTime), N'harsh@gmail.com', N'Male', NULL, CAST(N'2023-04-03T09:09:07.760' AS DateTime), CAST(N'2023-04-04T04:15:11.940' AS DateTime), 1)
INSERT [dbo].[Doctor] ([DoctorID], [DoctorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (2, N'Dr. Dhara Chavda', 4, 8, NULL, N'1234567890', CAST(N'2000-08-31T00:00:00.000' AS DateTime), N'dc@gmail.com', N'Female', NULL, CAST(N'2023-04-04T04:13:14.320' AS DateTime), CAST(N'2023-04-04T04:14:43.280' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Doctor] OFF
GO
SET IDENTITY_INSERT [dbo].[Donor] ON 

INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (8, N'Chetan G. Chavda', 4, 5, N'surat', N'7899876098', CAST(N'1967-08-01T00:00:00.000' AS DateTime), N'chetan.chavda@gmail.com', N'Male', N'Aadhar', N'12345678', N'110', N'90', CAST(78.90 AS Decimal(5, 2)), N'~/DonorImage/1.jfif', 1, NULL, CAST(N'2023-04-05T04:18:20.173' AS DateTime), CAST(N'2023-04-05T04:18:20.173' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (10, N'Dhruvi Patel', 4, 8, N'Ashapura Society, Rajkot', N'7879876542', CAST(N'2006-05-01T00:00:00.000' AS DateTime), N'dhruvi@gmail.com', N'Female', N'Pan', N'1234567', N'90', N'120', CAST(67.78 AS Decimal(5, 2)), N'~/DonorImage/g1.jfif', 2, NULL, CAST(N'2023-04-05T04:45:29.953' AS DateTime), CAST(N'2023-04-05T04:45:29.953' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (11, N'Denisha Patel', 2, 4, N'Gokuldham Society', N'7899876541', CAST(N'2000-07-18T00:00:00.000' AS DateTime), N'denish@gmail.com', N'Male', N'Licence', N'1234567890', N'80', N'90', CAST(56.78 AS Decimal(5, 2)), N'~/DonorImage/2.jfif', 3, NULL, CAST(N'2023-04-05T04:49:13.177' AS DateTime), CAST(N'2023-04-05T04:49:13.177' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (12, N'SurendraSinh Sodhi', 4, 0, N'Amrit sir', N'987654321', CAST(N'2002-09-20T00:00:00.000' AS DateTime), N'ss@gmail.com', N'Male', N'Aadhar', N'12345678', N'80', N'89', CAST(78.89 AS Decimal(5, 2)), N'~/DonorImage/3.jfif', 4, NULL, CAST(N'2023-04-05T04:50:11.490' AS DateTime), CAST(N'2023-04-05T04:50:11.490' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (13, N'Sodhi Paji', 6, 6, N'amritsir', N'789970651', CAST(N'2000-01-17T00:00:00.000' AS DateTime), N'sodhi.paji@gmail.com', N'Male', N'Aadhar', N'12345678', N'122', N'89', CAST(78.89 AS Decimal(5, 2)), N'~/DonorImage/3.jfif', 3, NULL, CAST(N'2023-04-05T04:51:36.777' AS DateTime), CAST(N'2023-04-05T04:51:36.777' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (14, N'Drish Patel', 2, 4, N'100 ft road', N'8900987654', CAST(N'2000-05-07T00:00:00.000' AS DateTime), N'drisha@gmail.com', N'Female', N'Aadhar', N'890890098', N'100', N'89', CAST(89.90 AS Decimal(5, 2)), N'~/DonorImage/g2.jfif', 4, NULL, CAST(N'2023-04-05T04:52:51.693' AS DateTime), CAST(N'2023-04-05T04:52:51.693' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (15, N'Ramesh Raiyani', 5, 7, N'rajasthan', N'9015473956', CAST(N'1978-07-19T00:00:00.000' AS DateTime), N'ramesh@gmail.com', N'Male', N'Election', N'88999888', N'100', N'89', CAST(90.90 AS Decimal(5, 2)), N'~/DonorImage/4.jfif', 5, NULL, CAST(N'2023-04-05T04:54:05.387' AS DateTime), CAST(N'2023-04-05T04:54:05.387' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (16, N'Riya Parmar', 4, 5, N'hanumanji mandir 100 ft road,surat ', N'890765190', CAST(N'2001-09-01T00:00:00.000' AS DateTime), N'riya@gmail.com', N'Female', N'Pan', N'890890098', N'80', N'90', CAST(54.89 AS Decimal(5, 2)), N'~/DonorImage/g3.jpg', 6, NULL, CAST(N'2023-04-05T04:55:46.990' AS DateTime), CAST(N'2023-04-05T04:55:46.990' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (17, N'Sodhi Hardip sinh', 6, 6, N'panjab', N'89009886767', CAST(N'1978-01-01T00:00:00.000' AS DateTime), N'hd@gmail.com', N'Male', N'Election', N'9090990', N'190', N'99', CAST(89.90 AS Decimal(5, 2)), N'~/DonorImage/6.jfif', 7, NULL, CAST(N'2023-04-05T04:56:59.797' AS DateTime), CAST(N'2023-04-05T04:56:59.797' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (18, N'Alpa Patel', 2, 4, N'50 ft road', N'219090909', CAST(N'1967-04-03T00:00:00.000' AS DateTime), N'alpa@gmail.com', N'Female', N'Aadhar', N'89898989', N'89', N'89', CAST(90.89 AS Decimal(5, 2)), N'~/DonorImage/g4.jpg', 8, NULL, CAST(N'2023-04-05T04:58:31.000' AS DateTime), CAST(N'2023-04-05T04:58:31.000' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (19, N'Priti Patel', 5, 7, N'jaipur', N'8908906781', CAST(N'2009-08-19T00:00:00.000' AS DateTime), N'priti@gmail.com', N'Female', N'Aadhar', N'12345678', N'100', N'89', CAST(67.90 AS Decimal(5, 2)), N'~/DonorImage/g5.jpg', 7, NULL, CAST(N'2023-04-05T04:59:43.733' AS DateTime), CAST(N'2023-04-05T04:59:43.733' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (20, N'Krupali Panday', 6, 6, N'rajshthan', N'8907890776', CAST(N'2003-05-16T00:00:00.000' AS DateTime), N'krupali@gmail.com', N'Female', N'Pan', N'11', N'122', N'90', CAST(89.90 AS Decimal(5, 2)), N'~/DonorImage/g6.jpg', 3, NULL, CAST(N'2023-04-05T05:00:49.710' AS DateTime), CAST(N'2023-04-05T05:00:49.710' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (21, N'Darshan A. Tank', 4, 8, N'near bus stand', N'01234567890', CAST(N'2003-08-17T00:00:00.000' AS DateTime), N'darshantank29@gmail.com', N'Male', N'Aadhar', N'1234567', N'100', N'90', CAST(78.78 AS Decimal(5, 2)), N'~/DonorImage/9.jfif', 6, NULL, CAST(N'2023-04-05T05:01:51.540' AS DateTime), CAST(N'2023-04-05T05:01:51.540' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (22, N'Dhruvi Tank', 2, 4, N'near sg road', N'8900980987', CAST(N'2002-09-18T00:00:00.000' AS DateTime), N'dhruvi@gmail.com', N'Female', N'Pan', N'12345678', N'89', N'89', CAST(89.90 AS Decimal(5, 2)), N'~/DonorImage/g7.jfif', 3, NULL, CAST(N'2023-04-05T05:02:48.247' AS DateTime), CAST(N'2023-04-05T05:02:48.247' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (23, N'Parth Gosai', 2, 4, N'near bs road', N'8901234567', CAST(N'2003-06-17T00:00:00.000' AS DateTime), N'parth.gosai@gmail.com', N'Male', N'Aadhar', N'123456', N'89', N'90', CAST(90.89 AS Decimal(5, 2)), N'~/DonorImage/11.jfif', 5, NULL, CAST(N'2023-04-05T05:04:35.050' AS DateTime), CAST(N'2023-04-05T05:04:35.050' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (24, N'Deep patel', 4, 5, N'near sardar patel road', N'8900987654', CAST(N'2003-12-13T00:00:00.000' AS DateTime), N'deep.patel@gmail.com', N'Male', N'Aadhar', N'12345678', N'80', N'90', CAST(90.89 AS Decimal(5, 2)), N'~/DonorImage/donor_2.jfif', 3, NULL, CAST(N'2023-04-05T05:05:50.600' AS DateTime), CAST(N'2023-04-05T05:05:50.600' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (25, N'Hemang Kateshiya', 5, 7, N'near gandhi road', N'7887878765', CAST(N'2003-04-16T00:00:00.000' AS DateTime), N'hemang.master@gmail.com', N'Male', N'Pan', N'111111', N'80', N'89.90', CAST(90.90 AS Decimal(5, 2)), N'~/DonorImage/donor_3.jfif', 8, NULL, CAST(N'2023-04-05T05:06:54.290' AS DateTime), CAST(N'2023-04-05T05:06:54.290' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (26, N'Jeel Savaliya', 4, 5, N'bhavnagar road surat', N'8989012345', CAST(N'2002-02-10T00:00:00.000' AS DateTime), N'jeel.savaliya@gmail.com', N'Male', N'Pan', N'890890', N'90', N'110', CAST(78.89 AS Decimal(5, 2)), N'~/DonorImage/donor_1.jpg', 2, NULL, CAST(N'2023-04-09T19:30:55.783' AS DateTime), CAST(N'2023-04-09T19:30:55.783' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (28, N'Aum Patel', 17, 14, N'Patna,Bihar', N'7899876541', CAST(N'2000-09-18T00:00:00.000' AS DateTime), N'aum@gmail.com', N'Male', N'Pan', N'P-123456', N'100', N'80', CAST(67.00 AS Decimal(5, 2)), N'~/DonorImage/4.jfif', 3, NULL, CAST(N'2023-05-01T14:49:29.033' AS DateTime), CAST(N'2023-05-01T14:49:29.033' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (29, N'jiya patel', 17, 14, N'patna', N'8908907654', CAST(N'1996-06-19T00:00:00.000' AS DateTime), N'jiya.ghoniya@gmail.com', N'Female', N'Licence', N'L-909090', N'89', N'89', CAST(89.00 AS Decimal(5, 2)), N'~/DonorImage/g4.jpg', 7, NULL, CAST(N'2023-05-01T14:50:49.810' AS DateTime), CAST(N'2023-05-01T14:50:49.810' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (30, N'Rajat Sharma`', 17, 14, N'patna', N'8889997776', CAST(N'1992-05-06T00:00:00.000' AS DateTime), N'rajat@gmail.com', N'Male', N'Aadhar', N'787878787878', N'90', N'91', CAST(57.00 AS Decimal(5, 2)), N'~/DonorImage/6.jfif', 5, NULL, CAST(N'2023-05-01T14:51:57.620' AS DateTime), CAST(N'2023-05-01T14:51:57.620' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (31, N'Kinjal Kaneriya', 17, 14, N'patna', N'7890987656', CAST(N'2003-08-19T00:00:00.000' AS DateTime), N'kinju@gmail.com', N'Female', N'Election', N'E-909078', N'78', N'89', CAST(56.00 AS Decimal(5, 2)), N'~/DonorImage/g5.jpg', 5, NULL, CAST(N'2023-05-01T14:53:02.723' AS DateTime), CAST(N'2023-05-01T14:53:02.723' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (32, N'Subham Dabgar', 17, 14, N'patna', N'8900987654', CAST(N'2000-06-15T00:00:00.000' AS DateTime), N'shubham.dabgar@gmail.com', N'Male', N'Aadhar', N'908765781234', N'90', N'90', CAST(67.00 AS Decimal(5, 2)), N'~/DonorImage/1.jfif', 8, NULL, CAST(N'2023-05-01T14:54:24.007' AS DateTime), CAST(N'2023-05-01T14:54:24.007' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (33, N'Divyesh Kareliya', 18, 16, N'delhi', N'7897799909', CAST(N'1998-03-17T00:00:00.000' AS DateTime), N'divyesh.kareliya@gmail.com', N'Male', N'Licence', N'L-909898', N'89', N'89', CAST(89.00 AS Decimal(5, 2)), N'~/DonorImage/1.jfif', 2, NULL, CAST(N'2023-05-01T14:59:52.260' AS DateTime), CAST(N'2023-05-01T14:59:52.260' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (34, N'DivyaBa Jadeja', 18, 16, N'delhi', N'7788997788', CAST(N'2000-06-18T00:00:00.000' AS DateTime), N'divyaba.jadeja@gmail.com', N'Female', N'Election', N'E-090909', N'100', N'99', CAST(56.00 AS Decimal(5, 2)), N'~/DonorImage/g1.jfif', 7, NULL, CAST(N'2023-05-01T15:01:18.620' AS DateTime), CAST(N'2023-05-01T15:01:18.620' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (35, N'Kirtan Patel', 18, 16, N'delhi', N'9090901234', CAST(N'1994-08-19T00:00:00.000' AS DateTime), N'kirtan@gmail.com', N'Male', N'Pan', N'P-900990', N'87', N'95', CAST(76.00 AS Decimal(5, 2)), N'~/DonorImage/11.jfif', 8, NULL, CAST(N'2023-05-01T15:02:51.323' AS DateTime), CAST(N'2023-05-01T15:02:51.323' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (36, N'Krishna Patel', 18, 16, N'delhi', N'6786786785', CAST(N'2001-05-15T00:00:00.000' AS DateTime), N'krishna@gmail.com', N'Female', N'Aadhar', N'678912345632', N'76', N'89', CAST(45.00 AS Decimal(5, 2)), N'~/DonorImage/g2.jfif', 4, NULL, CAST(N'2023-05-01T15:04:06.163' AS DateTime), CAST(N'2023-05-01T15:04:06.163' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (37, N'Hemanshi Sharma', 18, 16, N'delhi', N'7899876543', CAST(N'1993-09-10T00:00:00.000' AS DateTime), N'hemanshi@gmail.com', N'Female', N'Aadhar', N'989854541232', N'89', N'90', CAST(65.00 AS Decimal(5, 2)), N'~/DonorImage/g7.jfif', 4, NULL, CAST(N'2023-05-01T15:05:30.453' AS DateTime), CAST(N'2023-05-01T15:05:30.453' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (38, N'Hiren Bhalada', 19, 17, N'hariyana', N'7658765431', CAST(N'1996-08-17T00:00:00.000' AS DateTime), N'hiren@gmail.com', N'Male', N'Pan', N'P-0987654', N'89', N'86', CAST(56.00 AS Decimal(5, 2)), N'~/DonorImage/1.jfif', 5, NULL, CAST(N'2023-05-01T15:09:39.350' AS DateTime), CAST(N'2023-05-01T15:09:39.350' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (39, N'Hiral Sharma', 19, 17, N'hariyana', N'7897896543', CAST(N'2000-05-16T00:00:00.000' AS DateTime), N'hiral@gmail.com', N'Female', N'Aadhar', N'908765431290', N'89', N'78', CAST(46.00 AS Decimal(5, 2)), N'~/DonorImage/g5.jpg', 8, NULL, CAST(N'2023-05-01T15:10:46.547' AS DateTime), CAST(N'2023-05-01T15:10:46.547' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (40, N'Yashvi Sharma', 19, 17, N'hariyana', N'6353423231', CAST(N'2003-08-20T00:00:00.000' AS DateTime), N'yashvi@gmail.com', N'Female', N'Election', N'E-890890', N'78', N'89', CAST(56.00 AS Decimal(5, 2)), N'~/DonorImage/g3.jpg', 2, NULL, CAST(N'2023-05-01T15:11:58.480' AS DateTime), CAST(N'2023-05-01T15:11:58.480' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (41, N'Swapnil Patel', 19, 17, N'hariyana', N'7897896543', CAST(N'2000-05-16T00:00:00.000' AS DateTime), N'swap@gmail.com', N'Male', N'Licence', N'L-908908', N'78', N'89', CAST(67.00 AS Decimal(5, 2)), N'~/DonorImage/5.jfif', 3, NULL, CAST(N'2023-05-01T15:13:04.080' AS DateTime), CAST(N'2023-05-01T15:13:04.080' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (42, N'Ravi Chavda', 4, 8, N'150 feet mavdi rajkot', N'7899876543', CAST(N'2001-05-17T00:00:00.000' AS DateTime), N'ravi@gmail.com', N'Male', N'Aadhar', N'890076005421', N'78', N'78', CAST(89.00 AS Decimal(5, 2)), N'~/DonorImage/4.jfif', 7, NULL, CAST(N'2023-05-01T15:14:49.050' AS DateTime), CAST(N'2023-05-01T15:14:49.050' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (43, N'Rajesh Sharma', 16, 15, N'up', N'7897895432', CAST(N'2000-03-14T00:00:00.000' AS DateTime), N'rajesh@gmail.com', N'Male', N'Aadhar', N'171698952939', N'89', N'89', CAST(78.00 AS Decimal(5, 2)), N'~/DonorImage/2.jfif', 3, NULL, CAST(N'2023-05-01T15:15:59.013' AS DateTime), CAST(N'2023-05-01T15:15:59.013' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (44, N'Khushi Patel', 16, 15, N'up', N'7887788765', CAST(N'2004-02-10T00:00:00.000' AS DateTime), N'khushi@gmail.com', N'Female', N'Licence', N'L-909090', N'89', N'89', CAST(67.00 AS Decimal(5, 2)), N'~/DonorImage/donor_3.jfif', 4, NULL, CAST(N'2023-05-01T15:17:01.633' AS DateTime), CAST(N'2023-05-01T15:17:01.633' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (45, N'Dinesh Parmar', 4, 8, N'rajkot kothariya', N'9917635469', CAST(N'2000-09-10T00:00:00.000' AS DateTime), N'dino@gmail.com', N'Male', N'Aadhar', N'897615142223', N'78', N'89', CAST(78.00 AS Decimal(5, 2)), N'~/DonorImage/4.jfif', 7, NULL, CAST(N'2023-05-01T15:22:40.557' AS DateTime), CAST(N'2023-05-01T15:22:40.557' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (46, N'Manan Patel', 4, 8, N'biliyada gondal rajkot', N'7654321907', CAST(N'2000-06-17T00:00:00.000' AS DateTime), N'manan@gmail.com', N'Male', N'Licence', N'L-907856', N'89', N'89', CAST(89.00 AS Decimal(5, 2)), N'~/DonorImage/12.jfif', 3, NULL, CAST(N'2023-05-01T15:25:39.523' AS DateTime), CAST(N'2023-05-01T15:25:39.523' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (47, N'Priya Vadidariya', 4, 8, N'gondal, rajkot', N'1234567891', CAST(N'2003-04-05T00:00:00.000' AS DateTime), N'priya@gmail.com', N'Female', N'Aadhar', N'674589671234', N'67', N'89', CAST(56.00 AS Decimal(5, 2)), N'~/DonorImage/g2.jfif', 4, NULL, CAST(N'2023-05-01T15:27:04.780' AS DateTime), CAST(N'2023-05-01T15:27:04.780' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (48, N'Komal Jadhav', 4, 8, N'rajkot near bus stand', N'6677559988', CAST(N'2000-09-20T00:00:00.000' AS DateTime), N'komal@gmail.com', N'Female', N'Election', N'E-89766', N'90', N'90', CAST(67.00 AS Decimal(5, 2)), N'~/DonorImage/g4.jpg', 5, NULL, CAST(N'2023-05-01T15:28:27.993' AS DateTime), CAST(N'2023-05-01T15:28:27.993' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (49, N'Snehal Patel', 4, 8, N'gondal,rajkot', N'8908907654', CAST(N'1997-05-17T00:00:00.000' AS DateTime), N'snehal@gmail.com', N'Female', N'Aadhar', N'122316', N'78', N'89', CAST(56.00 AS Decimal(5, 2)), N'~/DonorImage/g6.jpg', 6, NULL, CAST(N'2023-05-01T15:29:59.693' AS DateTime), CAST(N'2023-05-01T15:29:59.693' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (50, N'Lalo bhawad', 4, 8, N'ahir chock,rajkot', N'7876543221', CAST(N'2000-04-15T00:00:00.000' AS DateTime), N'lalo@gmail.com', N'Male', N'Pan', N'18918965', N'78', N'89', CAST(67.00 AS Decimal(5, 2)), N'~/DonorImage/1.jfif', 2, NULL, CAST(N'2023-05-01T15:30:59.133' AS DateTime), CAST(N'2023-05-01T15:30:59.133' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (51, N'Prapti Patel', 4, 8, N'bhakti nagar circle,hrajkot', N'6767676712', CAST(N'2000-02-14T00:00:00.000' AS DateTime), N'prapti@gmail.com', N'Female', N'Pan', N'12345543', N'78', N'78', CAST(65.00 AS Decimal(5, 2)), N'~/DonorImage/g6.jpg', 6, NULL, CAST(N'2023-05-01T15:32:10.533' AS DateTime), CAST(N'2023-05-01T15:32:10.533' AS DateTime), 1)
INSERT [dbo].[Donor] ([DonorID], [DonorName], [StateID], [CityID], [Address], [ContactNumber], [BirthDate], [Email], [Gender], [ProofType], [ProofNumber], [Pulse], [BP], [Weight], [Image], [BloodGroupID], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (52, N'Devang Solanki', 4, 8, N'ahir chock,rajkot', N'7878905432', CAST(N'2002-05-01T00:00:00.000' AS DateTime), N'devang.solanki@gmail.com', N'Male', N'Licence', N'L-90896543', N'89', N'78', CAST(56.00 AS Decimal(5, 2)), N'~/DonorImage/8.jpg', 8, NULL, CAST(N'2023-05-01T15:33:22.813' AS DateTime), CAST(N'2023-05-01T15:33:22.813' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Donor] OFF
GO
SET IDENTITY_INSERT [dbo].[OutPatient] ON 

INSERT [dbo].[OutPatient] ([OutPatientID], [OutPatientName], [BloodGroupID], [Quantity], [Price], [TotalPrice], [OutDate], [BloodCrossVerifiedBy], [DoctorCrossVerificationRemarks], [ContactNumber], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (28, N'Ramesh bhai Raiyani', 3, 3, CAST(210.00 AS Decimal(5, 2)), CAST(630.00 AS Decimal(5, 2)), CAST(N'2023-04-16T00:00:00.000' AS DateTime), 2, N'done cross match', N'9690781342', NULL, CAST(N'2023-04-16T16:44:34.827' AS DateTime), CAST(N'2023-04-16T16:44:34.827' AS DateTime), 1)
INSERT [dbo].[OutPatient] ([OutPatientID], [OutPatientName], [BloodGroupID], [Quantity], [Price], [TotalPrice], [OutDate], [BloodCrossVerifiedBy], [DoctorCrossVerificationRemarks], [ContactNumber], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (29, N'demo bhai', 7, 3, CAST(300.00 AS Decimal(5, 2)), CAST(900.00 AS Decimal(5, 2)), CAST(N'2023-04-17T00:00:00.000' AS DateTime), 1, N'cross match done', N'1234567890', NULL, CAST(N'2023-04-17T09:26:18.257' AS DateTime), CAST(N'2023-04-17T09:26:18.257' AS DateTime), 1)
INSERT [dbo].[OutPatient] ([OutPatientID], [OutPatientName], [BloodGroupID], [Quantity], [Price], [TotalPrice], [OutDate], [BloodCrossVerifiedBy], [DoctorCrossVerificationRemarks], [ContactNumber], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (30, N'Suresh bhai Patoliya', 2, 2, CAST(200.00 AS Decimal(5, 2)), CAST(400.00 AS Decimal(5, 2)), CAST(N'2023-04-26T00:00:00.000' AS DateTime), 2, N'done', N'8908908911', NULL, CAST(N'2023-04-26T10:56:05.497' AS DateTime), CAST(N'2023-04-26T10:56:05.497' AS DateTime), 1)
INSERT [dbo].[OutPatient] ([OutPatientID], [OutPatientName], [BloodGroupID], [Quantity], [Price], [TotalPrice], [OutDate], [BloodCrossVerifiedBy], [DoctorCrossVerificationRemarks], [ContactNumber], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (31, N'Priyanka Poriya', 5, 2, CAST(230.00 AS Decimal(5, 2)), CAST(460.00 AS Decimal(5, 2)), CAST(N'2023-05-01T00:00:00.000' AS DateTime), 1, N'cross matched', N'9876543215', NULL, CAST(N'2023-05-01T15:40:08.780' AS DateTime), CAST(N'2023-05-01T15:40:08.780' AS DateTime), 1)
INSERT [dbo].[OutPatient] ([OutPatientID], [OutPatientName], [BloodGroupID], [Quantity], [Price], [TotalPrice], [OutDate], [BloodCrossVerifiedBy], [DoctorCrossVerificationRemarks], [ContactNumber], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (32, N'amisha patel', 4, 4, CAST(220.00 AS Decimal(5, 2)), CAST(880.00 AS Decimal(5, 2)), CAST(N'2023-05-01T00:00:00.000' AS DateTime), 2, N'cross match done', N'9876884321', NULL, CAST(N'2023-05-01T15:41:05.390' AS DateTime), CAST(N'2023-05-01T15:41:05.390' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[OutPatient] OFF
GO
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([StateID], [StateName], [StateCode], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (2, N'Maharashtra', N'MH', N'Mayalu ', CAST(N'2023-04-01T13:23:19.510' AS DateTime), CAST(N'2023-04-04T03:42:02.743' AS DateTime), 1)
INSERT [dbo].[State] ([StateID], [StateName], [StateCode], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (4, N'Gujarat', N'GJ', NULL, CAST(N'2023-04-04T03:49:39.047' AS DateTime), CAST(N'2023-04-04T03:49:39.047' AS DateTime), 1)
INSERT [dbo].[State] ([StateID], [StateName], [StateCode], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (5, N'Rajshthan', N'RJ', NULL, CAST(N'2023-04-04T03:49:46.673' AS DateTime), CAST(N'2023-04-04T03:52:16.663' AS DateTime), 1)
INSERT [dbo].[State] ([StateID], [StateName], [StateCode], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (6, N'Panjab', N'PB', NULL, CAST(N'2023-04-04T03:49:53.497' AS DateTime), CAST(N'2023-04-04T03:49:53.497' AS DateTime), 1)
INSERT [dbo].[State] ([StateID], [StateName], [StateCode], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (16, N'Uttar Pradesh', N'UP', NULL, CAST(N'2023-05-01T14:42:11.140' AS DateTime), CAST(N'2023-05-01T14:42:11.140' AS DateTime), 1)
INSERT [dbo].[State] ([StateID], [StateName], [StateCode], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (17, N'Bihar', N'BH', NULL, CAST(N'2023-05-01T14:42:22.313' AS DateTime), CAST(N'2023-05-01T14:42:22.313' AS DateTime), 1)
INSERT [dbo].[State] ([StateID], [StateName], [StateCode], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (18, N'Delhi', N'DL', NULL, CAST(N'2023-05-01T14:42:31.753' AS DateTime), CAST(N'2023-05-01T14:42:31.753' AS DateTime), 1)
INSERT [dbo].[State] ([StateID], [StateName], [StateCode], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (19, N'Hariyana', N'HR', NULL, CAST(N'2023-05-01T14:45:45.577' AS DateTime), CAST(N'2023-05-01T14:45:54.527' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[State] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [ContactNumber], [Password], [Description], [CreationDate], [ModificationDate]) VALUES (1, N'Keval', N'9016504960', N'123', NULL, CAST(N'2023-04-01T13:12:28.760' AS DateTime), CAST(N'2023-04-01T13:12:28.760' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[BloodBag]  WITH CHECK ADD  CONSTRAINT [FK_BloodBag_BloodGroup] FOREIGN KEY([BloodGroupID])
REFERENCES [dbo].[BloodGroup] ([BloodGroupID])
GO
ALTER TABLE [dbo].[BloodBag] CHECK CONSTRAINT [FK_BloodBag_BloodGroup]
GO
ALTER TABLE [dbo].[BloodBag]  WITH CHECK ADD  CONSTRAINT [FK_BloodBag_Doctor] FOREIGN KEY([VerificationDoctorID])
REFERENCES [dbo].[Doctor] ([DoctorID])
GO
ALTER TABLE [dbo].[BloodBag] CHECK CONSTRAINT [FK_BloodBag_Doctor]
GO
ALTER TABLE [dbo].[BloodBag]  WITH CHECK ADD  CONSTRAINT [FK_BloodBag_Donor] FOREIGN KEY([DonorID])
REFERENCES [dbo].[Donor] ([DonorID])
GO
ALTER TABLE [dbo].[BloodBag] CHECK CONSTRAINT [FK_BloodBag_Donor]
GO
ALTER TABLE [dbo].[BloodBag]  WITH CHECK ADD  CONSTRAINT [FK_BloodBag_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[BloodBag] CHECK CONSTRAINT [FK_BloodBag_User]
GO
ALTER TABLE [dbo].[BloodBank]  WITH CHECK ADD  CONSTRAINT [FK_BloodBank_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[BloodBank] CHECK CONSTRAINT [FK_BloodBank_City]
GO
ALTER TABLE [dbo].[BloodBank]  WITH CHECK ADD  CONSTRAINT [FK_BloodBank_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[BloodBank] CHECK CONSTRAINT [FK_BloodBank_State]
GO
ALTER TABLE [dbo].[BloodBank]  WITH CHECK ADD  CONSTRAINT [FK_BloodBank_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[BloodBank] CHECK CONSTRAINT [FK_BloodBank_User]
GO
ALTER TABLE [dbo].[BloodGroup]  WITH CHECK ADD  CONSTRAINT [FK_BloodGroup_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[BloodGroup] CHECK CONSTRAINT [FK_BloodGroup_User]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_State]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_User]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_City]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_State]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_User]
GO
ALTER TABLE [dbo].[Donor]  WITH CHECK ADD  CONSTRAINT [FK_Donor_State] FOREIGN KEY([BloodGroupID])
REFERENCES [dbo].[BloodGroup] ([BloodGroupID])
GO
ALTER TABLE [dbo].[Donor] CHECK CONSTRAINT [FK_Donor_State]
GO
ALTER TABLE [dbo].[Donor]  WITH CHECK ADD  CONSTRAINT [FK_Donor_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Donor] CHECK CONSTRAINT [FK_Donor_User]
GO
ALTER TABLE [dbo].[OutPatient]  WITH CHECK ADD  CONSTRAINT [FK_OutPatient_BloodGroup] FOREIGN KEY([BloodGroupID])
REFERENCES [dbo].[BloodGroup] ([BloodGroupID])
GO
ALTER TABLE [dbo].[OutPatient] CHECK CONSTRAINT [FK_OutPatient_BloodGroup]
GO
ALTER TABLE [dbo].[OutPatient]  WITH CHECK ADD  CONSTRAINT [FK_OutPatient_Doctor] FOREIGN KEY([BloodCrossVerifiedBy])
REFERENCES [dbo].[Doctor] ([DoctorID])
GO
ALTER TABLE [dbo].[OutPatient] CHECK CONSTRAINT [FK_OutPatient_Doctor]
GO
ALTER TABLE [dbo].[OutPatient]  WITH CHECK ADD  CONSTRAINT [FK_OutPatient_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[OutPatient] CHECK CONSTRAINT [FK_OutPatient_User]
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_User]
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodBag_DeleteByPK]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodBag_DeleteByPK]
	@BloodBagSearialNumber int
AS
DELETE FROM 
[BloodBank].[dbo].[BloodBag]
WHERE
[dbo].[BloodBag].[BloodBagSearialNumber]=@BloodBagSearialNumber
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodBag_InsertByUserID]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodBag_InsertByUserID]
      @DonorID                      int,
      @BloodGroupID                 int,
      @DonateDate                   datetime,
      @ExpireDate                   datetime,
      @VerifiedDoctorID             int,
      @VerificationDoctorRemarks    nvarchar(250),
      @OutPatientID                  int,
      @Status                       nvarchar(50),
      @Description                  nvarchar(250),
      @UserID                       int
AS

INSERT INTO
[BloodBank].[dbo].[BloodBag]
(
       [dbo].[BloodBag].[DonorID]
      ,[dbo].[BloodBag].[BloodGroupID]
      ,[dbo].[BloodBag].[DonateDate]
      ,[dbo].[BloodBag].[ExpireDate]
      ,[dbo].[BloodBag].[OutPatientID]
      ,[dbo].[BloodBag].[VerificationDoctorID]
      ,[dbo].[BloodBag].[Status]
      ,[dbo].[BloodBag].[VerificationDoctorRemarks]
      ,[dbo].[BloodBag].[Description]
      ,[dbo].[BloodBag].[CreationDate]
      ,[dbo].[BloodBag].[ModificationDate]
      ,[dbo].[BloodBag].[UserID]
)
VALUES
(
      @DonorID,
	  @BloodGroupID,
	  @DonateDate,
	  @ExpireDate,
	  @OutPatientID,
	  @VerifiedDoctorID,
	  @Status,
	  @VerificationDoctorRemarks,
	  @Description,
	  GETDATE(),
	  GETDATE(),
	  @UserID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodBag_SelectAll]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodBag_SelectAll]
AS
SELECT [dbo].[BloodBag].[BloodBagSearialNumber]
      ,[dbo].[Donor].[DonorName]
	  ,[dbo].[BloodGroup].[BloodGroupName]
      ,[dbo].[BloodBag].[DonateDate]
      ,[dbo].[BloodBag].[ExpireDate]
      ,[dbo].[OutPatient].[OutPatientName]
      ,[dbo].[Doctor].[DoctorName]
      ,[dbo].[BloodBag].[Status]
      ,[dbo].[BloodBag].[VerificationDoctorRemarks]
      ,[dbo].[BloodBag].[Description]
      ,[dbo].[BloodBag].[CreationDate]
      ,[dbo].[BloodBag].[ModificationDate]
      ,[dbo].[BloodBag].[UserID],
	  [dbo].[BloodGroup].[Price]
  FROM [BloodBank].[dbo].[BloodBag]
  INNER JOIN [BloodBank].[dbo].[Donor]
  ON [dbo].[BloodBag].[DonorID]=[dbo].[Donor].[DonorID]
  LEFT OUTER JOIN [BloodBank].[dbo].[OutPatient]
  ON [dbo].[BloodBag].[OutPatientID]=[dbo].[OutPatient].[OutPatientID]
  INNER JOIN [BloodBank].[dbo].[Doctor]
  ON [dbo].[BloodBag].[VerificationDoctorID]=[dbo].[Doctor].[DoctorID]
  INNER JOIN [BloodBank].[dbo].[BloodGroup]
  ON [dbo].[BloodBag].[BloodGroupID]=[dbo].[BloodGroup].[BloodGroupID]



GO
/****** Object:  StoredProcedure [dbo].[PR_BloodBag_SelectAllInStockBloodBags]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodBag_SelectAllInStockBloodBags]
AS
SELECT [dbo].[BloodBag].[BloodBagSearialNumber]
      ,[dbo].[Donor].[DonorName]
	  ,[dbo].[BloodGroup].[BloodGroupName]
      ,[dbo].[BloodBag].[DonateDate]
      ,[dbo].[BloodBag].[ExpireDate]
      ,[dbo].[OutPatient].[OutPatientName]
      ,[dbo].[Doctor].[DoctorName]
      ,[dbo].[BloodBag].[Status]
      ,[dbo].[BloodBag].[VerificationDoctorRemarks]
      ,[dbo].[BloodBag].[Description]
      ,[dbo].[BloodBag].[CreationDate]
      ,[dbo].[BloodBag].[ModificationDate]
      ,[dbo].[BloodBag].[UserID],
	  [dbo].[BloodGroup].[Price]
  FROM [BloodBank].[dbo].[BloodBag]
  INNER JOIN [BloodBank].[dbo].[Donor]
  ON [dbo].[BloodBag].[DonorID]=[dbo].[Donor].[DonorID]
  LEFT OUTER JOIN [BloodBank].[dbo].[OutPatient]
  ON [dbo].[BloodBag].[OutPatientID]=[dbo].[OutPatient].[OutPatientID]
  INNER JOIN [BloodBank].[dbo].[Doctor]
  ON [dbo].[BloodBag].[VerificationDoctorID]=[dbo].[Doctor].[DoctorID]
  INNER JOIN [BloodBank].[dbo].[BloodGroup]
  ON [dbo].[BloodBag].[BloodGroupID]=[dbo].[BloodGroup].[BloodGroupID]


  WHERE
  [dbo].[BloodBag].[Status]='InStock'
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodBag_SelectByFilterBloodGroupStatus]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_BloodBag_SelectByFilterBloodGroupStatus]
	@BloodGroupID int,
	@Status nvarchar(50)
AS
SELECT [dbo].[BloodBag].[BloodBagSearialNumber]
      ,[dbo].[Donor].[DonorName]
	  ,[dbo].[BloodGroup].[BloodGroupName]
      ,[dbo].[BloodBag].[DonateDate]
      ,[dbo].[BloodBag].[ExpireDate]
      ,[dbo].[OutPatient].[OutPatientName]
      ,[dbo].[Doctor].[DoctorName]
      ,[dbo].[BloodBag].[Status]
      ,[dbo].[BloodBag].[VerificationDoctorRemarks]
      ,[dbo].[BloodBag].[Description]
      ,[dbo].[BloodBag].[CreationDate]
      ,[dbo].[BloodBag].[ModificationDate]
      ,[dbo].[BloodBag].[UserID]
  FROM [BloodBank].[dbo].[BloodBag]
  INNER JOIN [BloodBank].[dbo].[Donor]
  ON [dbo].[BloodBag].[DonorID]=[dbo].[Donor].[DonorID]
  LEFT OUTER JOIN [BloodBank].[dbo].[OutPatient]
  ON [dbo].[BloodBag].[OutPatientID]=[dbo].[OutPatient].[OutPatientID]
  INNER JOIN [BloodBank].[dbo].[Doctor]
  ON [dbo].[BloodBag].[VerificationDoctorID]=[dbo].[Doctor].[DoctorID]
  INNER JOIN [BloodBank].[dbo].[BloodGroup]
  ON [dbo].[BloodBag].[BloodGroupID]=[dbo].[BloodGroup].[BloodGroupID]

  WHERE
	(@BloodGroupID IS NULL OR  [dbo].[BloodBag].[BloodGroupID]=@BloodGroupID)
	AND
	(@Status IS NULL OR  [dbo].[BloodBag].[Status]=@Status)





GO
/****** Object:  StoredProcedure [dbo].[PR_BloodBag_SelectByPK]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodBag_SelectByPK]
	@BloodBagSearialNumber int
AS
SELECT [dbo].[BloodBag].[BloodBagSearialNumber]
      ,[dbo].[BloodBag].[DonorID]
      ,[dbo].[BloodBag].[BloodGroupID]
      ,[dbo].[BloodBag].[DonateDate]
      ,[dbo].[BloodBag].[ExpireDate]
      ,[dbo].[BloodBag].[OutPatientID]
      ,[dbo].[BloodBag].[VerificationDoctorID]
      ,[dbo].[BloodBag].[Status]
      ,[dbo].[BloodBag].[VerificationDoctorRemarks]
      ,[dbo].[BloodBag].[Description]
      ,[dbo].[BloodBag].[CreationDate]
      ,[dbo].[BloodBag].[ModificationDate]
      ,[dbo].[BloodBag].[UserID]
  FROM [BloodBank].[dbo].[BloodBag]
  WHERE
  [dbo].[BloodBag].[BloodBagSearialNumber]=@BloodBagSearialNumber
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodBag_SelectInStockBloodBagsAndPriceByBloodGroup]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodBag_SelectInStockBloodBagsAndPriceByBloodGroup]
	@BloodGroupID int
AS
SELECT
	[dbo].[BloodBag].[BloodBagSearialNumber],
	[dbo].[BloodGroup].[Price]
FROM
[dbo].[BloodBag]
INNER JOIN [dbo].[BloodGroup]
ON [dbo].[BloodBag].[BloodGroupID]=[dbo].[BloodGroup].[BloodGroupID]
WHERE
	[dbo].[BloodBag].[BloodGroupID]=@BloodGroupID
	AND
	[dbo].[BloodBag].[Status]='InStock'
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodBag_SelectInStockBloodBagsCountByBloodGroup]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PR_BloodBag_SelectInStockBloodBagsCountByBloodGroup]
AS
SELECT
	[dbo].[BloodGroup].[BloodGroupName],COUNT([dbo].[BloodBag].[BloodBagSearialNumber]) as 'TotalBags'
FROM
[dbo].[BloodBag]
INNER JOIN [dbo].[BloodGroup]
ON [dbo].[BloodBag].[BloodGroupID]=[dbo].[BloodGroup].[BloodGroupID]
WHERE [dbo].[BloodBag].[Status]='InStock'
GROUP BY [dbo].[BloodGroup].[BloodGroupName]




GO
/****** Object:  StoredProcedure [dbo].[PR_BloodBag_SelectStatusWiseBloodBagCount]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodBag_SelectStatusWiseBloodBagCount]
AS

SELECT
	[BloodBag].[Status],
	COUNT([BloodBag].[BloodBagSearialNumber]) as 'Count'
FROM
	[dbo].[BloodBag]
GROUP BY
	[BloodBag].[Status]
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodBag_UpdateByPKUserID]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_BloodBag_UpdateByPKUserID]
	  @BloodBagSearialNumber		int,
      @DonorID                      int,
      @BloodGroupID                 int,
      @DonateDate                   datetime,
      @ExpireDate                   datetime,
      @VerifiedDoctorID             int,
      @VerificationDoctorRemarks    nvarchar(250),
      @OutPatientID                  int,
      @Status                       nvarchar(50),
      @Description                  nvarchar(250),
      @UserID                       int
AS
UPDATE
[BloodBank].[dbo].[BloodBag]
SET
       [dbo].[BloodBag].[DonorID]=@DonorID
      ,[dbo].[BloodBag].[BloodGroupID]=@BloodGroupID
      ,[dbo].[BloodBag].[DonateDate]=@DonateDate
      ,[dbo].[BloodBag].[ExpireDate]=@ExpireDate
      ,[dbo].[BloodBag].[OutPatientID]=@OutPatientID
      ,[dbo].[BloodBag].[VerificationDoctorID]=@VerifiedDoctorID
      ,[dbo].[BloodBag].[Status]=@Status
      ,[dbo].[BloodBag].[VerificationDoctorRemarks]=@VerificationDoctorRemarks
      ,[dbo].[BloodBag].[Description]=@Description
      ,[dbo].[BloodBag].[ModificationDate]=GETDATE()
      ,[dbo].[BloodBag].[UserID]=@UserID
WHERE
	   [dbo].[BloodBag].[BloodBagSearialNumber]=@BloodBagSearialNumber
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodBag_UpdateByUserID]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_BloodBag_UpdateByUserID]
	  @BloodBagSerialNumber			int,
      @DonorID                      int,
      @BloodGroupID                 int,
      @DonateDate                   datetime,
      @ExpireDate                   datetime,
      @VerifiedDoctorID             int,
      @VerificationDoctorRemarks    nvarchar(250),
      @OutPatientID                  int,
      @Status                       nvarchar(50),
      @Description                  nvarchar(250),
      @UserID                       int
AS
UPDATE
[BloodBank].[dbo].[BloodBag]
SET
       [dbo].[BloodBag].[DonorID]=@DonorID
      ,[dbo].[BloodBag].[BloodGroupID]=@BloodGroupID
      ,[dbo].[BloodBag].[DonateDate]=@DonateDate
      ,[dbo].[BloodBag].[ExpireDate]=@ExpireDate
      ,[dbo].[BloodBag].[OutPatientID]=@OutPatientID
      ,[dbo].[BloodBag].[VerificationDoctorID]=@VerifiedDoctorID
      ,[dbo].[BloodBag].[Status]=@Status
      ,[dbo].[BloodBag].[VerificationDoctorRemarks]=@VerificationDoctorRemarks
      ,[dbo].[BloodBag].[Description]=@Description
      ,[dbo].[BloodBag].[ModificationDate]=GETDATE()
      ,[dbo].[BloodBag].[UserID]= @UserID
WHERE
	   [dbo].[BloodBag].[BloodBagSearialNumber]=@BloodBagSerialNumber
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodBag_UpdateStatusByBloodBagSerialNumber]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodBag_UpdateStatusByBloodBagSerialNumber]
	@BloodBagIdForOut int,
	@OutPatientID     nvarchar(100)
AS
UPDATE
[dbo].[BloodBag]
SET
	[dbo].[BloodBag].[Status]='OutStock',
	[dbo].[BloodBag].[OutPatientID]=@OutPatientID
WHERE	
	[dbo].[BloodBag].[BloodBagSearialNumber]=@BloodBagIdForOut
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodBagUpdateStatusByExpireDate]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodBagUpdateStatusByExpireDate]
AS
UPDATE BloodBag
SET		[dbo].[BloodBag].[Status]='ExpireStock'
WHERE
ExpireDate<=GETDATE()
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodBank_DeleteByPK]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodBank_DeleteByPK] 
      @BloodBankID int
AS
  DELETE
  FROM [BloodBank].[dbo].[BloodBank]
  WHERE
  [dbo].[BloodBank].[BloodBankID]=@BloodBankID
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodBank_InsertByUserID]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_BloodBank_InsertByUserID] 
       @BloodBankName                 nvarchar(100)              
      ,@StateID                       int                   
      ,@CityID                        int              
      ,@Email                         nvarchar(100)               
      ,@ContactNumber                 nvarchar(50)              
      ,@EastablishmentDate            datetime               
      ,@Image                         nvarchar(250)                
      ,@Latitude                      nvarchar(50)            
      ,@Longtitude                    nvarchar(50)
      ,@Description                   nvarchar(250)                 
      ,@UserID                        int  
	  ,@Address						  nvarchar(250)
AS
INSERT INTO
       [BloodBank].[dbo].[BloodBank]
       (
       [dbo].[BloodBank].[BloodBankName]
      ,[dbo].[BloodBank].[StateID]
      ,[dbo].[BloodBank].[CityID]
      ,[dbo].[BloodBank].[Email]
      ,[dbo].[BloodBank].[ContactNumber]
      ,[dbo].[BloodBank].[EastablishmentDate]
      ,[dbo].[BloodBank].[Image]
      ,[dbo].[BloodBank].[Latitude]
      ,[dbo].[BloodBank].[Longtitude]
      ,[dbo].[BloodBank].[Description]
      ,[dbo].[BloodBank].[CreationDate]
      ,[dbo].[BloodBank].[ModificationDate]
      ,[dbo].[BloodBank].[UserID]
	  ,[dbo].[BloodBank].[Address]
      )
      VALUES
      (
       @BloodBankName                 
      ,@StateID                       
      ,@CityID                    
      ,@Email                         
      ,@ContactNumber                 
      ,@EastablishmentDate           
      ,@Image                        
      ,@Latitude                      
      ,@Longtitude           
      ,@Description
      ,GETDATE()
      ,GETDATE()                   
      ,@UserID
	  ,@Address
      )
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodBank_SelectAll]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PR_BloodBank_SelectAll]
AS
SELECT [dbo].[BloodBank].[BloodBankID]
	  ,[dbo].[BloodBank].[StateID]
	  ,[dbo].[BloodBank].[CityID]
	  ,[dbo].[BloodBank].[Address]
      ,[dbo].[BloodBank].[BloodBankName]
      ,[dbo].[State].[StateName]
      ,[dbo].[City].[CityName]
      ,[dbo].[BloodBank].[Email]
      ,[dbo].[BloodBank].[ContactNumber]
      ,[dbo].[BloodBank].[EastablishmentDate]
      ,[dbo].[BloodBank].[Image]
      ,[dbo].[BloodBank].[Latitude]
      ,[dbo].[BloodBank].[Longtitude]
      ,[dbo].[BloodBank].[Description]
      ,[dbo].[BloodBank].[CreationDate]
      ,[dbo].[BloodBank].[ModificationDate]
      ,[dbo].[BloodBank].[UserID]
  FROM [BloodBank].[dbo].[BloodBank]
  INNER JOIN [BloodBank].[dbo].[State]
  ON [BloodBank].[dbo].[BloodBank].[StateID]=[BloodBank].[dbo].[State].[StateID]
  INNER JOIN [BloodBank].[dbo].[City]
  ON [BloodBank].[dbo].[BloodBank].[CityID]=[BloodBank].[dbo].[City].[CityID]
  ORDER BY
  [dbo].[State].[StateName],
  [dbo].[City].[CityName],
  [dbo].[BloodBank].[BloodBankName]
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodBank_SelectByPK]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodBank_SelectByPK]
      @BloodBankID int
AS
SELECT [dbo].[BloodBank].[BloodBankID]
      ,[dbo].[BloodBank].[BloodBankName]
      ,[dbo].[BloodBank].[StateID]
      ,[dbo].[BloodBank].[CityID]
      ,[dbo].[BloodBank].[Email]
      ,[dbo].[BloodBank].[ContactNumber]
      ,[dbo].[BloodBank].[EastablishmentDate]
      ,[dbo].[BloodBank].[Image]
      ,[dbo].[BloodBank].[Latitude]
      ,[dbo].[BloodBank].[Longtitude]
      ,[dbo].[BloodBank].[Description]
      ,[dbo].[BloodBank].[CreationDate]
      ,[dbo].[BloodBank].[ModificationDate]
      ,[dbo].[BloodBank].[UserID]
  FROM [BloodBank].[dbo].[BloodBank]
  WHERE
  [dbo].[BloodBank].[BloodBankID]=@BloodBankID
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodBank_UpdateByPKUserID]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_BloodBank_UpdateByPKUserID]
	   @BloodBankID					  int
      ,@BloodBankName                 nvarchar(100)              
      ,@StateID                       int                   
      ,@CityID                        int              
      ,@Email                         nvarchar(100)               
      ,@ContactNumber                 nvarchar(50)              
      ,@EastablishmentDate            datetime               
      ,@Image                         nvarchar(250)                
      ,@Latitude                      decimal(5,4)            
      ,@Longtitude                    decimal(5,4)
      ,@Description                   nvarchar(250)                 
      ,@UserID                        int     
AS
UPDATE
       [BloodBank].[dbo].[BloodBank]
       SET
       [dbo].[BloodBank].[BloodBankName]=@BloodBankName
      ,[dbo].[BloodBank].[StateID]=@StateID 
      ,[dbo].[BloodBank].[CityID]=@CityID 
      ,[dbo].[BloodBank].[Email]=@Email
      ,[dbo].[BloodBank].[ContactNumber]=@ContactNumber
      ,[dbo].[BloodBank].[EastablishmentDate]=@EastablishmentDate
      ,[dbo].[BloodBank].[Image]=@Image 
      ,[dbo].[BloodBank].[Latitude]=@Latitude 
      ,[dbo].[BloodBank].[Longtitude]=@Longtitude
      ,[dbo].[BloodBank].[Description]=@Description
      ,[dbo].[BloodBank].[ModificationDate]=GETDATE()
      ,[dbo].[BloodBank].[UserID]=@UserID 
	  WHERE
	  [dbo].[BloodBank].[BloodBankID]=@BloodBankID
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_DeleteByPK]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodGroup_DeleteByPK]
	@BloodGroupID int
AS
DELETE FROM
	 [dbo].[BloodGroup]
  WHERE
	 [dbo].[BloodGroup].[BloodGroupID]=@BloodGroupID

GO
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_InsertByUserID]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodGroup_InsertByUserID]
	@BloodGroupName nvarchar(100),
	@Price			decimal(5,2),
	@Description	nvarchar(250),
	@UserID			int
AS
INSERT INTO  [dbo].[BloodGroup]
		(
      [dbo].[BloodGroup].[BloodGroupName]
      ,[dbo].[BloodGroup].[Price]
      ,[dbo].[BloodGroup].[Description]
      ,[dbo].[BloodGroup].[CreationDate]
      ,[dbo].[BloodGroup].[ModificationDate]
      ,[dbo].[BloodGroup].[UserID]
	  )
	  VALUES
	  (
		@BloodGroupName,
		@Price,
		@Description,
		GETDATE(),
		GETDATE(),
		@UserID
	   )

GO
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_SelectAll]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodGroup_SelectAll]
AS
SELECT [dbo].[BloodGroup].[BloodGroupID]
      ,[dbo].[BloodGroup].[BloodGroupName]
      ,[dbo].[BloodGroup].[Price]
      ,[dbo].[BloodGroup].[Description]
      ,[dbo].[BloodGroup].[CreationDate]
      ,[dbo].[BloodGroup].[ModificationDate]
      ,[dbo].[BloodGroup].[UserID]
  FROM [BloodBank].[dbo].[BloodGroup]

GO
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_SelectByPK]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodGroup_SelectByPK]
	@BloodGroupID int
AS
SELECT [dbo].[BloodGroup].[BloodGroupID]
      ,[dbo].[BloodGroup].[BloodGroupName]
      ,[dbo].[BloodGroup].[Price]
      ,[dbo].[BloodGroup].[Description]
      ,[dbo].[BloodGroup].[CreationDate]
      ,[dbo].[BloodGroup].[ModificationDate]
      ,[dbo].[BloodGroup].[UserID]
  FROM [BloodBank].[dbo].[BloodGroup]
  WHERE
		[dbo].[BloodGroup].[BloodGroupID]=@BloodGroupID

GO
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_UpdateByPKUserID]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodGroup_UpdateByPKUserID] 
	@BloodGroupID	int,
	@BloodGroupName nvarchar(100),
	@Price			decimal(5,2),
	@Description	nvarchar(250),
	@UserID			int
AS
UPDATE  [dbo].[BloodGroup]
SET
       [dbo].[BloodGroup].[BloodGroupName]=@BloodGroupName
      ,[dbo].[BloodGroup].[Price]=@Price
      ,[dbo].[BloodGroup].[Description]=@Description
      ,[dbo].[BloodGroup].[ModificationDate]=GETDATE()
      ,[dbo].[BloodGroup].[UserID]=@UserID
WHERe	
	  [dbo].[BloodGroup].[BloodGroupID]=@BloodGroupID
		
		

GO
/****** Object:  StoredProcedure [dbo].[PR_BloodGroupSelectForDropDownList]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_BloodGroupSelectForDropDownList]
AS
SELECT [dbo].[BloodGroup].[BloodGroupID]
      ,[dbo].[BloodGroup].[BloodGroupName]
  FROM [BloodBank].[dbo].[BloodGroup]

GO
/****** Object:  StoredProcedure [dbo].[PR_City_DeleteByPK]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_City_DeleteByPK] 
	@CityID		int
AS
DELETE 
FROM   [dbo].[City]   
WHERE	[dbo].[City].[CityID]=@CityID
 

GO
/****** Object:  StoredProcedure [dbo].[PR_City_InsertByUserID]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_City_InsertByUserID] 
	@StateID	nvarchar(100),
	@CityName	nvarchar(100),
	@CityCode	nvarchar(100),
	@UserID  	int,
	@Description nvarchar(250)
AS
INSERT INTO 
[dbo].[City]
(
       [dbo].[City].[StateID],
       [dbo].[City].[CityName]
      ,[dbo].[City].[CityCode]
      ,[dbo].[City].[UserID]
      ,[dbo].[City].[Description]
      ,[dbo].[City].[CreationDate]
      ,[dbo].[City].[ModificationDate]
)
VALUES
(
		@StateID,
	    @CityName,
	    @CityCode,
	    @UserID,
	    @Description,
	    GETDATE(),
	    GETDATE()
)		

GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectAll]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_SelectAll]
AS
SELECT [dbo].[City].[CityID]
      ,[dbo].[State].[StateName],
	   [dbo].[City].[CityName]
      ,[dbo].[City].[CityCode],
	  [dbo].[City].[Description]
      ,[dbo].[City].[CreationDate]
      ,[dbo].[City].[ModificationDate]
  FROM [dbo].[City]
  INNER JOIN
  [dbo].[State]
  ON [dbo].[State].[StateID]=[dbo].[City].[StateID]
  ORDER BY
		[dbo].[State].[StateName],
  		[dbo].[City].[CityName]

GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectByPK]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_SelectByPK]
	@CityID int
AS
SELECT [dbo].[City].[CityID]
      ,[dbo].[City].[StateID]
	  ,[dbo].[City].[CityName]
      ,[dbo].[City].[CityCode]
	  ,[dbo].[City].[Description]
      ,[dbo].[City].[CreationDate]
      ,[dbo].[City].[ModificationDate]
  FROM [dbo].[City]
  WHERE
  		[dbo].[City].[CityID]=@CityID

GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectForDropDownListByStateID]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_City_SelectForDropDownListByStateID]
	@StateID int
AS
SELECT [dbo].[City].[CityID]
	   ,[dbo].[City].[CityName]
  FROM [dbo].[City]
  WHERE
  [dbo].[City].[StateID]=@StateID

GO
/****** Object:  StoredProcedure [dbo].[PR_City_UpdateByPKUserID]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_City_UpdateByPKUserID] 
	@CityID		int,
	@StateID	nvarchar(100),
	@CityName	nvarchar(100),
	@CityCode	nvarchar(100),
	@UserID  	int,
	@Description nvarchar(250)
AS
UPDATE 
[dbo].[City]
SET
       [dbo].[City].[StateID]=@StateID,
       [dbo].[City].[CityName]=@CityName,
       [dbo].[City].[CityCode]=@CityCode,
       [dbo].[City].[UserID]=@UserID,
       [dbo].[City].[Description]=@Description,
       [dbo].[City].[ModificationDate]=GETDATE()
WHERE
	[dbo].[City].[CityID]=@CityID

GO
/****** Object:  StoredProcedure [dbo].[PR_Doctor_DeleteByPK]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Doctor_DeleteByPK]
	@DoctorID int
AS
DELETE
FROM [BloodBank].[dbo].[Doctor]
WHERE
  [dbo].[Doctor].[DoctorID]=@DoctorID

GO
/****** Object:  StoredProcedure [dbo].[PR_Doctor_InsertByUserID]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Doctor_InsertByUserID]
       @DoctorName      nvarchar(100)
      ,@StateID         int
      ,@CityID          int
      ,@Address         nvarchar(250)
      ,@ContactNumber   nvarchar(50)
      ,@BirthDate       datetime
      ,@Email           nvarchar(100)
      ,@Gender          nvarchar(50)
      ,@Description     nvarchar(250)
      ,@UserID          int 
AS
INSERT INTO 
      [BloodBank].[dbo].[Doctor]
      (
       [dbo].[Doctor].[DoctorName]
      ,[dbo].[Doctor].[StateID]
      ,[dbo].[Doctor].[CityID]
      ,[dbo].[Doctor].[Address]
      ,[dbo].[Doctor].[ContactNumber]
      ,[dbo].[Doctor].[BirthDate]
      ,[dbo].[Doctor].[Email]
      ,[dbo].[Doctor].[Gender]
      ,[dbo].[Doctor].[Description]
      ,[dbo].[Doctor].[CreationDate]
      ,[dbo].[Doctor].[ModificationDate]
      ,[dbo].[Doctor].[UserID]
      )
      VALUES
      (
       @DoctorName
      ,@StateID
      ,@CityID
      ,@Address
      ,@ContactNumber
      ,@BirthDate
      ,@Email
      ,@Gender
      ,@Description
      ,GETDATE()
      ,GETDATE()
      ,@UserID
      )

GO
/****** Object:  StoredProcedure [dbo].[PR_Doctor_SelectAll]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Doctor_SelectAll]
AS
SELECT [dbo].[Doctor].[DoctorID]
      ,[dbo].[Doctor].[DoctorName]
      ,[dbo].[State].[StateName]
      ,[dbo].[City].[CityName]
      ,[dbo].[Doctor].[Address]
      ,[dbo].[Doctor].[ContactNumber]
      ,[dbo].[Doctor].[BirthDate]
      ,[dbo].[Doctor].[Email]
      ,[dbo].[Doctor].[Gender]
      ,[dbo].[Doctor].[Description]
      ,[dbo].[Doctor].[CreationDate]
      ,[dbo].[Doctor].[ModificationDate]
      ,[dbo].[Doctor].[UserID]
  FROM [BloodBank].[dbo].[Doctor]
  INNER JOIN
  [BloodBank].[dbo].[State]
  ON [dbo].[Doctor].[StateID]=[dbo].[State].[StateID]
  INNER JOIN
  [BloodBank].[dbo].[City]
  ON [dbo].[Doctor].[CityID]=[dbo].[City].[CityID]
  ORDER BY
  [dbo].[Doctor].[DoctorName]

GO
/****** Object:  StoredProcedure [dbo].[PR_Doctor_SelectByPK]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Doctor_SelectByPK]
	@DoctorID int
AS
SELECT [dbo].[Doctor].[DoctorID]
      ,[dbo].[Doctor].[DoctorName]
      ,[dbo].[Doctor].[StateID]
      ,[dbo].[Doctor].[CityID]
      ,[dbo].[Doctor].[Address]
      ,[dbo].[Doctor].[ContactNumber]
      ,[dbo].[Doctor].[BirthDate]
      ,[dbo].[Doctor].[Email]
      ,[dbo].[Doctor].[Gender]
      ,[dbo].[Doctor].[Description]
      ,[dbo].[Doctor].[CreationDate]
      ,[dbo].[Doctor].[ModificationDate]
      ,[dbo].[Doctor].[UserID]
  FROM [BloodBank].[dbo].[Doctor]
  WHERE
  [dbo].[Doctor].[DoctorID]=@DoctorID

GO
/****** Object:  StoredProcedure [dbo].[PR_Doctor_SelectForDropDownList]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_Doctor_SelectForDropDownList]
AS
SELECT [dbo].[Doctor].[DoctorID]
      ,[dbo].[Doctor].[DoctorName]
  FROM [BloodBank].[dbo].[Doctor]

GO
/****** Object:  StoredProcedure [dbo].[PR_Doctor_UpdateByPKUserID]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Doctor_UpdateByPKUserID]
	   @DoctorID        int,
       @DoctorName      nvarchar(100)
      ,@StateID         int
      ,@CityID          int
      ,@Address         nvarchar(250)
      ,@ContactNumber   nvarchar(50)
      ,@BirthDate       datetime
      ,@Email           nvarchar(100)
      ,@Gender          nvarchar(50)
      ,@Description     nvarchar(250)
      ,@UserID          int 
AS
UPDATE
      [BloodBank].[dbo].[Doctor]
SET
       [dbo].[Doctor].[DoctorName]=@DoctorName
      ,[dbo].[Doctor].[StateID]=@StateID
      ,[dbo].[Doctor].[CityID]=@CityID
      ,[dbo].[Doctor].[Address]=@Address
      ,[dbo].[Doctor].[ContactNumber]=@ContactNumber
      ,[dbo].[Doctor].[BirthDate]=@BirthDate
      ,[dbo].[Doctor].[Email]=@Email
      ,[dbo].[Doctor].[Gender]=@Gender
      ,[dbo].[Doctor].[Description]=@Description
      ,[dbo].[Doctor].[ModificationDate]=GETDATE()
      ,[dbo].[Doctor].[UserID]=@UserID
WHERE
	   [dbo].[Doctor].[DoctorID]=@DoctorID

GO
/****** Object:  StoredProcedure [dbo].[PR_Donor_DeleteByPK]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Donor_DeleteByPK]
	@DonorID int
AS
DELETE FROM
	[BloodBank].[dbo].[Donor]
  WHERE
    [dbo].[Donor].[DonorID]=@DonorID
GO
/****** Object:  StoredProcedure [dbo].[PR_Donor_InsertByUserID]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Donor_InsertByUserID]
       @DonorName             nvarchar(100)
      ,@StateID               int
      ,@CityID                int
      ,@Address               nvarchar(250)
      ,@ContactNumber         nvarchar(50)
      ,@BirthDate            datetime
      ,@Email                 nvarchar(100)
      ,@Gender                nvarchar(50)
      ,@ProofType             nvarchar(50)
      ,@ProofNumber           nvarchar(100)
      ,@Pulse                 nvarchar(50)
      ,@BP                    nvarchar(50)
      ,@Weight                decimal(5,2)
      ,@Image                 nvarchar(250)
      ,@BloodGroupID          int
      ,@Description           nvarchar(250)
      ,@UserID                int
AS
INSERT INTO [BloodBank].[dbo].[Donor]
       (     
      [dbo].[donor].[DonorName]
      ,[dbo].[donor].[StateID]
      ,[dbo].[donor].[CityID]
      ,[dbo].[donor].[Address]
      ,[dbo].[donor].[ContactNumber]
      ,[dbo].[donor].[BirthDate]
      ,[dbo].[donor].[Email]
      ,[dbo].[donor].[Gender]
      ,[dbo].[donor].[ProofType]
      ,[dbo].[donor].[ProofNumber]
      ,[dbo].[donor].[Pulse]
      ,[dbo].[donor].[BP]
      ,[dbo].[donor].[Weight]
      ,[dbo].[donor].[Image]
      ,[dbo].[donor].[BloodGroupID]
      ,[dbo].[donor].[Description]
      ,[dbo].[donor].[CreationDate]
      ,[dbo].[donor].[ModificationDate]
      ,[dbo].[donor].[UserID]
       )

       VALUES
       (
        @DonorName
      ,@StateID
      ,@CityID
      ,@Address
      ,@ContactNumber
      ,@BirthDate
      ,@Email
      ,@Gender
      ,@ProofType
      ,@ProofNumber
      ,@Pulse
      ,@BP
      ,@Weight
      ,@Image
      ,@BloodGroupID
      ,@Description
      ,GETDATE()
      ,GETDATE()
      ,@UserID
       )
GO
/****** Object:  StoredProcedure [dbo].[PR_Donor_SelectAll]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Donor_SelectAll]
AS
SELECT [dbo].[Donor].[DonorID]
      ,[dbo].[Donor].[DonorName]
      ,[dbo].[State].[StateName]
      ,[dbo].[City].[CityName]
      ,[dbo].[Donor].[Address]
      ,[dbo].[Donor].[ContactNumber]
      ,[dbo].[Donor].[BirthDate]
      ,[dbo].[Donor].[Email]
      ,[dbo].[Donor].[Gender]
      ,[dbo].[Donor].[ProofType]
      ,[dbo].[Donor].[ProofNumber]
      ,[dbo].[Donor].[Pulse]
      ,[dbo].[Donor].[BP]
      ,[dbo].[Donor].[Weight]
      ,[dbo].[Donor].[Image]
      ,[dbo].[BloodGroup].[BloodGroupName]
      ,[dbo].[Donor].[Description]
      ,[dbo].[Donor].[CreationDate]
      ,[dbo].[Donor].[ModificationDate]
      ,[dbo].[Donor].[UserID]
  FROM [BloodBank].[dbo].[Donor]
  INNER JOIN [BloodBank].[dbo].[State]
  ON [dbo].[Donor].[StateID]=[dbo].[State].[StateID]
  INNER JOIN [BloodBank].[dbo].[City]
  ON [dbo].[Donor].[CityID]=[dbo].[City].[CityID]
  INNER JOIN [BloodBank].[dbo].[BloodGroup]
  ON [dbo].[Donor].[BloodGroupID]=[dbo].[BloodGroup].[BloodGroupID]
  ORDER BY 
  [dbo].[State].[StateName]
 ,[dbo].[City].[CityName]
 ,[dbo].[Donor].[DonorName]

GO
/****** Object:  StoredProcedure [dbo].[PR_Donor_SelectByBloodGroup]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Donor_SelectByBloodGroup]
	@BloodGroupID  int
AS
SELECT [dbo].[Donor].[DonorID]
      ,[dbo].[Donor].[DonorName]
  FROM [BloodBank].[dbo].[Donor]
  WHERE
  [dbo].[Donor].[BloodGroupID]=@BloodGroupID
GO
/****** Object:  StoredProcedure [dbo].[PR_Donor_SelectByFilterBloodGroupStateCity]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_Donor_SelectByFilterBloodGroupStateCity]
	@BloodGroupID int,
	@StateID int,
	@CityID int
AS
SELECT [dbo].[Donor].[DonorID]
      ,[dbo].[Donor].[DonorName]
      ,[dbo].[State].[StateName]
      ,[dbo].[City].[CityName]
      ,[dbo].[Donor].[Address]
      ,[dbo].[Donor].[ContactNumber]
      ,[dbo].[Donor].[BirthDate]
      ,[dbo].[Donor].[Email]
      ,[dbo].[Donor].[Gender]
      ,[dbo].[Donor].[ProofType]
      ,[dbo].[Donor].[ProofNumber]
      ,[dbo].[Donor].[Pulse]
      ,[dbo].[Donor].[BP]
      ,[dbo].[Donor].[Weight]
      ,[dbo].[Donor].[Image]
      ,[dbo].[BloodGroup].[BloodGroupName]
      ,[dbo].[Donor].[Description]
      ,[dbo].[Donor].[CreationDate]
      ,[dbo].[Donor].[ModificationDate]
      ,[dbo].[Donor].[UserID]
  FROM [BloodBank].[dbo].[Donor]
  INNER JOIN [BloodBank].[dbo].[State]
  ON [dbo].[Donor].[StateID]=[dbo].[State].[StateID]
  INNER JOIN [BloodBank].[dbo].[City]
  ON [dbo].[Donor].[CityID]=[dbo].[City].[CityID]
  INNER JOIN [BloodBank].[dbo].[BloodGroup]
  ON [dbo].[Donor].[BloodGroupID]=[dbo].[BloodGroup].[BloodGroupID]

   WHERE
	(@BloodGroupID IS NULL OR  [dbo].[Donor].[BloodGroupID]=@BloodGroupID)
	AND
	(@StateID IS NULL OR  [dbo].[Donor].[StateID]=@StateID)
	AND
	(@CityID IS NULL OR  [dbo].[Donor].[CityID]=@CityID)


  ORDER BY 
  [dbo].[State].[StateName]
 ,[dbo].[City].[CityName]
 ,[dbo].[Donor].[DonorName]

GO
/****** Object:  StoredProcedure [dbo].[PR_Donor_SelectByPK]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Donor_SelectByPK]
	@DonorID int
AS
SELECT [dbo].[donor].[DonorID]
      ,[dbo].[donor].[DonorName]
      ,[dbo].[donor].[StateID]
      ,[dbo].[donor].[CityID]
      ,[dbo].[donor].[Address]
      ,[dbo].[donor].[ContactNumber]
      ,[dbo].[donor].[BirthDate]
      ,[dbo].[donor].[Email]
      ,[dbo].[donor].[Gender]
      ,[dbo].[donor].[ProofType]
      ,[dbo].[donor].[ProofNumber]
      ,[dbo].[donor].[Pulse]
      ,[dbo].[donor].[BP]
      ,[dbo].[donor].[Weight]
      ,[dbo].[donor].[Image]
      ,[dbo].[donor].[BloodGroupID]
      ,[dbo].[donor].[Description]
      ,[dbo].[donor].[CreationDate]
      ,[dbo].[donor].[ModificationDate]
      ,[dbo].[donor].[UserID]
  FROM [BloodBank].[dbo].[Donor]
  WHERE
       [dbo].[Donor].[DonorID]=@DonorID
GO
/****** Object:  StoredProcedure [dbo].[PR_Donor_SelectForDropDownList]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Donor_SelectForDropDownList]
AS
SELECT [dbo].[Donor].[DonorID]
      ,[dbo].[Donor].[DonorName]
  FROM [BloodBank].[dbo].[Donor]
GO
/****** Object:  StoredProcedure [dbo].[PR_Donor_UpdateByPKUserID]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Donor_UpdateByPKUserID]
       @DonorID               int
      ,@DonorName             nvarchar(100)
      ,@StateID               int
      ,@CityID                int
      ,@Address               nvarchar(250)
      ,@ContactNumber         nvarchar(50)
      ,@BirthDate            datetime
      ,@Email                 nvarchar(100)
      ,@Gender                nvarchar(50)
      ,@ProofType             nvarchar(50)
      ,@ProofNumber           nvarchar(100)
      ,@Pulse                 nvarchar(50)
      ,@BP                    nvarchar(50)
      ,@Weight                decimal(5,2)
      ,@Image                 nvarchar(250)
      ,@BloodGroupID          int
      ,@Description           nvarchar(250)
      ,@UserID                int
AS
UPDATE [BloodBank].[dbo].[Donor]
       SET
       [dbo].[donor].[DonorName]=@DonorName
      ,[dbo].[donor].[StateID]=@StateID
      ,[dbo].[donor].[CityID]=@CityID
      ,[dbo].[donor].[Address]=@Address
      ,[dbo].[donor].[ContactNumber]=@ContactNumber
      ,[dbo].[donor].[BirthDate]=@BirthDate
      ,[dbo].[donor].[Email]=@Email
      ,[dbo].[donor].[Gender]=@Gender
      ,[dbo].[donor].[ProofType]=@ProofType
      ,[dbo].[donor].[ProofNumber]=@ProofNumber
      ,[dbo].[donor].[Pulse]=@Pulse
      ,[dbo].[donor].[BP]=@BP
      ,[dbo].[donor].[Weight]=@Weight
      ,[dbo].[donor].[Image]=@Image
      ,[dbo].[donor].[BloodGroupID]=@BloodGroupID
      ,[dbo].[donor].[Description]=@Description
      ,[dbo].[donor].[ModificationDate]=GETDATE()
      ,[dbo].[donor].[UserID]=@UserID
       
      WHERE
      [dbo].[donor].[DonorID]=@DonorID
GO
/****** Object:  StoredProcedure [dbo].[PR_OutPatient_DeleteByPK]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_OutPatient_DeleteByPK]
      @OutPatientID     int
AS
  DELETE
  FROM [BloodBank].[dbo].[OutPatient]
  WHERE
  [dbo].[OutPatient].[OutPatientID]=@OutPatientID
GO
/****** Object:  StoredProcedure [dbo].[PR_OutPatient_InsertByUserID]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_OutPatient_InsertByUserID]  
       @OutPatientName                                nvarchar(100)
      ,@BloodGroupID                                  int    
      ,@Quantity                                      int
      ,@Price                                         decimal(5,2)
      ,@TotalPrice                                    decimal(5,2)
      ,@OutDate                                       datetime
      ,@BloodCrossVerifiedBy                          int
      ,@DoctorCrossVerificationRemarks                nvarchar(250)
      ,@ContactNumber                                 nvarchar(100)
      ,@Description                                   nvarchar(250)
      ,@UserID                                        int
	  ,@OutPatientID								  int OUT
AS
INSERT INTO
       [BloodBank].[dbo].[OutPatient]
       (
       [dbo].[OutPatient].[OutPatientName]
      ,[dbo].[OutPatient].[BloodGroupID]
      ,[dbo].[OutPatient].[Quantity]
      ,[dbo].[OutPatient].[Price]
      ,[dbo].[OutPatient].[TotalPrice]
      ,[dbo].[OutPatient].[OutDate]
      ,[dbo].[OutPatient].[BloodCrossVerifiedBy]
      ,[dbo].[OutPatient].[DoctorCrossVerificationRemarks]
      ,[dbo].[OutPatient].[ContactNumber]
      ,[dbo].[OutPatient].[Description]
      ,[dbo].[OutPatient].[CreationDate]
      ,[dbo].[OutPatient].[ModificationDate]
      ,[dbo].[OutPatient].[UserID]
       )
       VALUES
       (
       @OutPatientName                                
      ,@BloodGroupID                            
      ,@Quantity                            
      ,@Price                                        
      ,@TotalPrice                                   
      ,@OutDate                                  
      ,@BloodCrossVerifiedBy                
      ,@DoctorCrossVerificationRemarks                
      ,@ContactNumber                                 
      ,@Description                                   
      ,GETDATE()                             
      ,GETDATE()                        
      ,@UserID                              
       )
SET @OutPatientID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[PR_OutPatient_SelectAll]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_OutPatient_SelectAll]
AS
SELECT [dbo].[OutPatient].[OutPatientID]
      ,[dbo].[OutPatient].[OutPatientName]
      ,[dbo].[BloodGroup].[BloodGroupName]
      ,[dbo].[OutPatient].[Quantity]
      ,[dbo].[OutPatient].[Price]
      ,[dbo].[OutPatient].[TotalPrice]
      ,[dbo].[OutPatient].[OutDate]
      ,[dbo].[Doctor].[DoctorName]
      ,[dbo].[OutPatient].[DoctorCrossVerificationRemarks]
      ,[dbo].[OutPatient].[ContactNumber]
      ,[dbo].[OutPatient].[Description]
      ,[dbo].[OutPatient].[CreationDate]
      ,[dbo].[OutPatient].[ModificationDate]
      ,[dbo].[OutPatient].[UserID]
  FROM [BloodBank].[dbo].[OutPatient]
  INNER JOIN [dbo].[BloodGroup]
  ON  [dbo].[OutPatient].[BloodGroupID]=[dbo].[BloodGroup].[BloodGroupID]
  INNER JOIN [dbo].[Doctor]
  ON  [dbo].[OutPatient].[BloodCrossVerifiedBy]=[dbo].[Doctor].[DoctorID]
  
GO
/****** Object:  StoredProcedure [dbo].[PR_OutPatient_SelectByPK]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_OutPatient_SelectByPK]
      @OutPatientID     int
AS
SELECT [dbo].[OutPatient].[OutPatientID]
      ,[dbo].[OutPatient].[OutPatientName]
      ,[dbo].[OutPatient].[BloodGroupID]
      ,[dbo].[OutPatient].[Quantity]
      ,[dbo].[OutPatient].[Price]
      ,[dbo].[OutPatient].[TotalPrice]
      ,[dbo].[OutPatient].[OutDate]
      ,[dbo].[OutPatient].[BloodCrossVerifiedBy]
      ,[dbo].[OutPatient].[DoctorCrossVerificationRemarks]
      ,[dbo].[OutPatient].[ContactNumber]
      ,[dbo].[OutPatient].[Description]
      ,[dbo].[OutPatient].[CreationDate]
      ,[dbo].[OutPatient].[ModificationDate]
      ,[dbo].[OutPatient].[UserID]
  FROM [BloodBank].[dbo].[OutPatient]
  WHERE
  [dbo].[OutPatient].[OutPatientID]=@OutPatientID
GO
/****** Object:  StoredProcedure [dbo].[PR_OutPatient_UpdateByPKUserID]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_OutPatient_UpdateByPKUserID]
       @OutPatientID                                  int
      ,@OutPatientName                                nvarchar(100)
      ,@BloodGroupID                                  int    
      ,@Quantity                                      int
      ,@Price                                         decimal(5,2)
      ,@TotalPrice                                    decimal(5,2)
      ,@OutDate                                       datetime
      ,@BloodCrossVerifiedBy                          int
      ,@DoctorCrossVerificationRemarks                nvarchar(250)
      ,@ContactNumber                                 nvarchar(100)
      ,@Description                                   nvarchar(250)
      ,@CreationDate                                  datetime
      ,@ModificationDate                              datetime
      ,@UserID                                        int
AS
UPDATE
       [BloodBank].[dbo].[OutPatient]
       SET
       [dbo].[OutPatient].[OutPatientName]=@OutPatientName
      ,[dbo].[OutPatient].[BloodGroupID]=@BloodGroupID
      ,[dbo].[OutPatient].[Quantity]=@Quantity
      ,[dbo].[OutPatient].[Price]=@Price
      ,[dbo].[OutPatient].[TotalPrice]=@TotalPrice
      ,[dbo].[OutPatient].[OutDate]=@OutDate
      ,[dbo].[OutPatient].[BloodCrossVerifiedBy]=@BloodCrossVerifiedBy
      ,[dbo].[OutPatient].[DoctorCrossVerificationRemarks]=@DoctorCrossVerificationRemarks
      ,[dbo].[OutPatient].[ContactNumber]=@ContactNumber
      ,[dbo].[OutPatient].[Description]=@Description
      ,[dbo].[OutPatient].[ModificationDate]=GETDATE()
      ,[dbo].[OutPatient].[UserID]  =@UserID   
	  WHERE
	  [dbo].[OutPatient].[OutPatientID]=@OutPatientID
                                    
       
GO
/****** Object:  StoredProcedure [dbo].[PR_State_DeleteByPK]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_DeleteByPK]
	@StateID int
AS
DELETE FROM 
[dbo].[State]
  WHERE
	[dbo].[State].[StateID]=@StateID

GO
/****** Object:  StoredProcedure [dbo].[PR_State_InsertByUserID]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_InsertByUserID] 
	@StateName	nvarchar(100),
	@StateCode	nvarchar(100),
	@UserID  	int,
	@Description nvarchar(250)
AS
INSERT INTO 
[dbo].[State]
(
       [dbo].[State].[StateName]
      ,[dbo].[State].[StateCode]
      ,[dbo].[State].[UserID]
      ,[dbo].[State].[Description]
      ,[dbo].[State].[CreationDate]
      ,[dbo].[State].[ModificationDate]
)
VALUES
(
	    @StateName,
	    @StateCode,
	    @UserID,
	    @Description,
	    GETDATE(),
	    GETDATE()
)

GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectAll]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_SelectAll]
AS
SELECT [dbo].[State].[StateID]
      ,[dbo].[State].[StateName]
      ,[dbo].[State].[StateCode]
	  ,[dbo].[State].[Description]
      ,[dbo].[State].[CreationDate]
      ,[dbo].[State].[ModificationDate]
  FROM [dbo].[State]
  ORDER BY
  		[dbo].[State].[StateName]

GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectByPK]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_SelectByPK]
	@StateID int
AS
SELECT [dbo].[State].[StateID]
      ,[dbo].[State].[StateName]
      ,[dbo].[State].[StateCode]
	  ,[dbo].[State].[Description]
      ,[dbo].[State].[CreationDate]
      ,[dbo].[State].[ModificationDate]
  FROM [dbo].[State]
  WHERE
	[dbo].[State].[StateID]=@StateID

GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectForDropDownList]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_SelectForDropDownList]
AS
SELECT [dbo].[State].[StateID]
      ,[dbo].[State].[StateName]
  FROM [dbo].[State]
  ORDER BY
  		[dbo].[State].[StateName]
GO
/****** Object:  StoredProcedure [dbo].[PR_State_UpdateByPKUserID]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_UpdateByPKUserID] 
	@StateID	int,
	@StateName	nvarchar(100),
	@StateCode	nvarchar(100),
	@UserID  	int,
	@Description nvarchar(250)
AS
UPDATE  
[dbo].[State]
SET
       [dbo].[State].[StateName]=@StateName
      ,[dbo].[State].[StateCode]=@StateCode
      ,[dbo].[State].[UserID]=@UserID
      ,[dbo].[State].[Description]=@Description
      ,[dbo].[State].[ModificationDate]= GETDATE()
WHERE
	
	[dbo].[State].[StateID]=@StateID

GO
/****** Object:  StoredProcedure [dbo].[PR_User_SelectByNamePassword]    Script Date: 01-05-2023 15:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_User_SelectByNamePassword]
      @UserName         nvarchar(250),
      @Password         nvarchar(100)
AS
SELECT [dbo].[User].[UserID]
      ,[dbo].[User].[UserName]
      ,[dbo].[User].[ContactNumber]
      ,[dbo].[User].[Password]
      ,[dbo].[User].[Description]
  FROM [BloodBank].[dbo].[User]
  WHERE
  [dbo].[User].[UserName]=@UserName
  AND
  [dbo].[User].[Password]=@Password
GO
USE [master]
GO
ALTER DATABASE [BloodBank] SET  READ_WRITE 
GO
