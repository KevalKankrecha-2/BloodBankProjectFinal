USE [master]
GO
/****** Object:  Database [BloodBank]    Script Date: 09-04-2023 03:33:01 ******/
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
/****** Object:  Table [dbo].[BloodBag]    Script Date: 09-04-2023 03:33:01 ******/
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
/****** Object:  Table [dbo].[BloodBank]    Script Date: 09-04-2023 03:33:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodBank](
	[BloodBankID] [int] IDENTITY(1,1) NOT NULL,
	[BloodBankName] [nvarchar](250) NOT NULL,
	[StateID] [int] NULL,
	[CityID] [int] NOT NULL,
	[Email] [nvarchar](100) NULL,
	[ContactNumber] [nvarchar](50) NULL,
	[EastablishmentDate] [datetime] NULL,
	[Image] [nvarchar](100) NOT NULL,
	[Latitude] [nvarchar](50) NULL,
	[Longtitude] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[BloodGroup]    Script Date: 09-04-2023 03:33:01 ******/
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
/****** Object:  Table [dbo].[City]    Script Date: 09-04-2023 03:33:01 ******/
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
/****** Object:  Table [dbo].[Doctor]    Script Date: 09-04-2023 03:33:01 ******/
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
	[ContactNumber] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[Donor]    Script Date: 09-04-2023 03:33:01 ******/
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
	[ContactNumber] [nvarchar](50) NULL,
	[BirthDate] [datetime] NULL,
	[Email] [nvarchar](100) NULL,
	[Gender] [nvarchar](50) NULL,
	[ProofType] [nvarchar](50) NULL,
	[ProofNumber] [nvarchar](50) NULL,
	[Pulse] [nvarchar](50) NULL,
	[BP] [nvarchar](50) NULL,
	[Weight] [decimal](5, 2) NULL,
	[Image] [nvarchar](250) NOT NULL,
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
/****** Object:  Table [dbo].[OutPatient]    Script Date: 09-04-2023 03:33:01 ******/
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
/****** Object:  Table [dbo].[State]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 09-04-2023 03:33:02 ******/
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
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (8, 10, 2, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), N'12', 1, N'OutStock', N'done match', NULL, CAST(N'2023-04-05T05:18:07.723' AS DateTime), CAST(N'2023-04-05T05:18:07.723' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (9, 11, 3, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), N'11', 2, N'OutStock', N'done match', NULL, CAST(N'2023-04-05T05:18:28.397' AS DateTime), CAST(N'2023-04-05T05:18:28.397' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (10, 13, 3, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), N'11', 1, N'OutStock', N'done match', NULL, CAST(N'2023-04-05T05:18:43.210' AS DateTime), CAST(N'2023-04-05T05:18:43.210' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (11, 20, 3, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), N'11', 2, N'OutStock', N'done match', NULL, CAST(N'2023-04-05T05:19:03.507' AS DateTime), CAST(N'2023-04-05T05:19:03.507' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (12, 22, 3, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, 1, N'InStock', N'done match', NULL, CAST(N'2023-04-05T05:19:22.610' AS DateTime), CAST(N'2023-04-05T05:19:22.610' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (13, 24, 3, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'done match', NULL, CAST(N'2023-04-05T05:19:57.700' AS DateTime), CAST(N'2023-04-05T05:19:57.700' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (14, 12, 4, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, 1, N'InStock', N'done match', NULL, CAST(N'2023-04-05T05:20:16.960' AS DateTime), CAST(N'2023-04-05T05:20:16.960' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (15, 14, 4, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'done match', NULL, CAST(N'2023-04-05T05:21:02.180' AS DateTime), CAST(N'2023-04-05T05:21:02.180' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (16, 15, 5, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, 1, N'InStock', N'done match', NULL, CAST(N'2023-04-05T05:21:33.703' AS DateTime), CAST(N'2023-04-05T05:21:33.703' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (17, 23, 5, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'done match', NULL, CAST(N'2023-04-05T05:22:16.047' AS DateTime), CAST(N'2023-04-05T05:22:16.047' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (18, 21, 6, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'done match', NULL, CAST(N'2023-04-05T05:22:35.850' AS DateTime), CAST(N'2023-04-05T05:22:35.850' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (19, 16, 6, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, 1, N'InStock', N'done match', NULL, CAST(N'2023-04-05T05:23:01.337' AS DateTime), CAST(N'2023-04-05T05:23:01.337' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (20, 17, 7, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'done match', NULL, CAST(N'2023-04-05T05:23:28.687' AS DateTime), CAST(N'2023-04-05T05:23:28.687' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (21, 19, 7, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'done match', NULL, CAST(N'2023-04-05T05:23:50.117' AS DateTime), CAST(N'2023-04-05T05:23:50.117' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (22, 17, 7, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, 1, N'InStock', N'done match', NULL, CAST(N'2023-04-05T05:24:14.723' AS DateTime), CAST(N'2023-04-05T05:24:14.723' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (23, 18, 8, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, 2, N'InStock', N'done match', NULL, CAST(N'2023-04-05T05:24:32.253' AS DateTime), CAST(N'2023-04-05T05:24:32.253' AS DateTime), 1)
INSERT [dbo].[BloodBag] ([BloodBagSearialNumber], [DonorID], [BloodGroupID], [DonateDate], [ExpireDate], [OutPatientID], [VerificationDoctorID], [Status], [VerificationDoctorRemarks], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (24, 25, 8, CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, 1, N'InStock', N'done match', NULL, CAST(N'2023-04-05T05:24:47.347' AS DateTime), CAST(N'2023-04-05T05:24:47.347' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[BloodBag] OFF
GO
SET IDENTITY_INSERT [dbo].[BloodBank] ON 

INSERT [dbo].[BloodBank] ([BloodBankID], [BloodBankName], [StateID], [CityID], [Email], [ContactNumber], [EastablishmentDate], [Image], [Latitude], [Longtitude], [Description], [CreationDate], [ModificationDate], [UserID], [Address]) VALUES (1, N'hindustan blood bank', 2, 4, N'hind@gmail.com', N'9090909090', CAST(N'2023-04-09T03:18:36.523' AS DateTime), N'~/upload/img.jpg', N'89.9090', N'78.8908', N'', CAST(N'2023-04-09T03:26:55.367' AS DateTime), CAST(N'2023-04-09T03:26:55.367' AS DateTime), 1, N'150 feet road')
INSERT [dbo].[BloodBank] ([BloodBankID], [BloodBankName], [StateID], [CityID], [Email], [ContactNumber], [EastablishmentDate], [Image], [Latitude], [Longtitude], [Description], [CreationDate], [ModificationDate], [UserID], [Address]) VALUES (2, N'Indian Blood Bank', 4, 5, N'ind.bloodbank@gmail.com', N'8908908901', CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'~/BloodBankImage/bloodbank.jpg', N'21.1801', N'72.8451', N'noen', CAST(N'2023-04-09T03:31:01.567' AS DateTime), CAST(N'2023-04-09T03:31:01.567' AS DateTime), 1, N'near sg high way, surat')
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
INSERT [dbo].[City] ([CityID], [StateID], [CityName], [CityCode], [CreationDate], [ModificationDate], [UserID], [Description]) VALUES (8, 4, N'Rajkot', N'RJT', CAST(N'2023-04-04T03:53:27.173' AS DateTime), CAST(N'2023-04-04T04:13:45.817' AS DateTime), 1, N'dmoe')
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
SET IDENTITY_INSERT [dbo].[Donor] OFF
GO
SET IDENTITY_INSERT [dbo].[OutPatient] ON 

INSERT [dbo].[OutPatient] ([OutPatientID], [OutPatientName], [BloodGroupID], [Quantity], [Price], [TotalPrice], [OutDate], [BloodCrossVerifiedBy], [DoctorCrossVerificationRemarks], [ContactNumber], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (11, N'Ramesh bhai Raiyani', 3, 3, CAST(210.00 AS Decimal(5, 2)), CAST(630.00 AS Decimal(5, 2)), CAST(N'2023-01-01T00:00:00.000' AS DateTime), 2, N'done cross matching', N'6754312345', NULL, CAST(N'2023-04-09T02:35:17.390' AS DateTime), CAST(N'2023-04-09T02:35:17.390' AS DateTime), 1)
INSERT [dbo].[OutPatient] ([OutPatientID], [OutPatientName], [BloodGroupID], [Quantity], [Price], [TotalPrice], [OutDate], [BloodCrossVerifiedBy], [DoctorCrossVerificationRemarks], [ContactNumber], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (12, N'Raju bhai patel', 2, 1, CAST(200.00 AS Decimal(5, 2)), CAST(200.00 AS Decimal(5, 2)), CAST(N'2023-04-09T00:00:00.000' AS DateTime), 1, N'done cross match', N'987654321', NULL, CAST(N'2023-04-09T02:38:53.807' AS DateTime), CAST(N'2023-04-09T02:38:53.807' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[OutPatient] OFF
GO
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([StateID], [StateName], [StateCode], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (2, N'Maharashtra', N'MH', N'Mayalu ', CAST(N'2023-04-01T13:23:19.510' AS DateTime), CAST(N'2023-04-04T03:42:02.743' AS DateTime), 1)
INSERT [dbo].[State] ([StateID], [StateName], [StateCode], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (4, N'Gujarat', N'GJ', NULL, CAST(N'2023-04-04T03:49:39.047' AS DateTime), CAST(N'2023-04-04T03:49:39.047' AS DateTime), 1)
INSERT [dbo].[State] ([StateID], [StateName], [StateCode], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (5, N'Rajshthan', N'RJ', NULL, CAST(N'2023-04-04T03:49:46.673' AS DateTime), CAST(N'2023-04-04T03:52:16.663' AS DateTime), 1)
INSERT [dbo].[State] ([StateID], [StateName], [StateCode], [Description], [CreationDate], [ModificationDate], [UserID]) VALUES (6, N'Panjab', N'PB', NULL, CAST(N'2023-04-04T03:49:53.497' AS DateTime), CAST(N'2023-04-04T03:49:53.497' AS DateTime), 1)
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
/****** Object:  StoredProcedure [dbo].[PR_BloodBag_DeleteByPK]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_BloodBag_InsertByUserID]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_BloodBag_SelectAll]    Script Date: 09-04-2023 03:33:02 ******/
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



GO
/****** Object:  StoredProcedure [dbo].[PR_BloodBag_SelectByPK]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_BloodBag_SelectInStockBloodBagsAndPriceByBloodGroup]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_BloodBag_SelectInStockBloodBagsCountByBloodGroup]    Script Date: 09-04-2023 03:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_BloodBag_SelectInStockBloodBagsCountByBloodGroup]
AS
SELECT
	[dbo].[BloodGroup].[BloodGroupName],[dbo].[BloodBag].[BloodGroupID],COUNT([dbo].[BloodBag].[BloodGroupID]) as 'TotalBags'
FROM
[dbo].[BloodBag]
INNER JOIN [dbo].[BloodGroup]
ON [dbo].[BloodBag].[BloodGroupID]=[dbo].[BloodGroup].[BloodGroupID]
WHERE [dbo].[BloodBag].[Status]='InStock'
GROUP BY [dbo].[BloodBag].[BloodGroupID],[dbo].[BloodGroup].[BloodGroupName]
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodBag_UpdateByPKUserID]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_BloodBag_UpdateByUserID]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_BloodBag_UpdateStatusByBloodBagSerialNumber]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_BloodBank_DeleteByPK]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_BloodBank_InsertByUserID]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_BloodBank_SelectAll]    Script Date: 09-04-2023 03:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PR_BloodBank_SelectAll]
AS
SELECT [dbo].[BloodBank].[BloodBankID]
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
/****** Object:  StoredProcedure [dbo].[PR_BloodBank_SelectByPK]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_BloodBank_UpdateByPKUserID]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_DeleteByPK]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_InsertByUserID]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_SelectAll]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_SelectByPK]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_UpdateByPKUserID]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_BloodGroupSelectForDropDownList]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_City_DeleteByPK]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_City_InsertByUserID]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_City_SelectAll]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_City_SelectByPK]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_City_SelectForDropDownListByStateID]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_City_UpdateByPKUserID]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_Doctor_DeleteByPK]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_Doctor_InsertByUserID]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_Doctor_SelectAll]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_Doctor_SelectByPK]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_Doctor_SelectForDropDownList]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_Doctor_UpdateByPKUserID]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_Donor_DeleteByPK]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_Donor_InsertByUserID]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_Donor_SelectAll]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_Donor_SelectByBloodGroup]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_Donor_SelectByPK]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_Donor_SelectForDropDownList]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_Donor_UpdateByPKUserID]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_OutPatient_DeleteByPK]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_OutPatient_InsertByUserID]    Script Date: 09-04-2023 03:33:02 ******/
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
SELECT MAX(OutPatientID) as 'OutPatientID'
FROM
OutPatient
GO
/****** Object:  StoredProcedure [dbo].[PR_OutPatient_SelectAll]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_OutPatient_SelectByPK]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_OutPatient_UpdateByPKUserID]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_State_DeleteByPK]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_State_InsertByUserID]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_State_SelectAll]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_State_SelectByPK]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_State_SelectForDropDownList]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_State_UpdateByPKUserID]    Script Date: 09-04-2023 03:33:02 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_User_SelectByNamePassword]    Script Date: 09-04-2023 03:33:02 ******/
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
