USE [master]
GO
/****** Object:  Database [DemoDBSIB]    Script Date: 10.06.2021 14:39:00 ******/
CREATE DATABASE [DemoDBSIB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DemoDBSIB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.LLSQLSEVER\MSSQL\DATA\DemoDBSIB_Primary.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DemoDBSIB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.LLSQLSEVER\MSSQL\DATA\DemoDBSIB_Primary.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DemoDBSIB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DemoDBSIB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DemoDBSIB] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [DemoDBSIB] SET ANSI_NULLS ON 
GO
ALTER DATABASE [DemoDBSIB] SET ANSI_PADDING ON 
GO
ALTER DATABASE [DemoDBSIB] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [DemoDBSIB] SET ARITHABORT ON 
GO
ALTER DATABASE [DemoDBSIB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DemoDBSIB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DemoDBSIB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DemoDBSIB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DemoDBSIB] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [DemoDBSIB] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [DemoDBSIB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DemoDBSIB] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [DemoDBSIB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DemoDBSIB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DemoDBSIB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DemoDBSIB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DemoDBSIB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DemoDBSIB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DemoDBSIB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DemoDBSIB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DemoDBSIB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DemoDBSIB] SET RECOVERY FULL 
GO
ALTER DATABASE [DemoDBSIB] SET  MULTI_USER 
GO
ALTER DATABASE [DemoDBSIB] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [DemoDBSIB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DemoDBSIB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DemoDBSIB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DemoDBSIB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DemoDBSIB] SET QUERY_STORE = OFF
GO
USE [DemoDBSIB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [DemoDBSIB]
GO
/****** Object:  Table [dbo].[Component]    Script Date: 10.06.2021 14:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Component](
	[component_id] [int] IDENTITY(1,1) NOT NULL,
	[structure_id] [char](10) NOT NULL,
	[name] [text] NOT NULL,
	[AsbIngNr] [nchar](15) NOT NULL,
	[location] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[component_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Condition]    Script Date: 10.06.2021 14:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Condition](
	[condition_id] [int] IDENTITY(1,1) NOT NULL,
	[component_id] [int] NOT NULL,
	[inspection_id] [int] NOT NULL,
	[safetyGrade] [int] NOT NULL,
	[stabilityGrade] [int] NOT NULL,
	[durabilityGrade] [int] NOT NULL,
	[damageDescription] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[condition_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inspection]    Script Date: 10.06.2021 14:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inspection](
	[inspection_id] [int] IDENTITY(1,1) NOT NULL,
	[structure_id] [char](10) NOT NULL,
	[inspector] [nchar](50) NOT NULL,
	[inspectionBody] [text] NOT NULL,
	[inspectionDate] [date] NOT NULL,
	[inspectionType] [text] NOT NULL,
	[structureGrade] [decimal](2, 1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[inspection_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Structure]    Script Date: 10.06.2021 14:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Structure](
	[structure_id] [char](10) NOT NULL,
	[name] [text] NOT NULL,
	[type] [text] NULL,
	[amt] [text] NOT NULL,
	[location] [text] NOT NULL,
	[constructionYear] [nchar](4) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[structure_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Component] ON 

INSERT [dbo].[Component] ([component_id], [structure_id], [name], [AsbIngNr], [location]) VALUES (1, N'DE10000000', N'foudation west', N'130021212100000', N'west')
INSERT [dbo].[Component] ([component_id], [structure_id], [name], [AsbIngNr], [location]) VALUES (2, N'DE10000000', N'foudation east', N'130021212100000', N'east')
INSERT [dbo].[Component] ([component_id], [structure_id], [name], [AsbIngNr], [location]) VALUES (3, N'DE10000000', N'abutment wall east', N'130011911000000', N'east')
INSERT [dbo].[Component] ([component_id], [structure_id], [name], [AsbIngNr], [location]) VALUES (5, N'DE10000000', N'abutment wall west', N'130011911000000', N'west')
INSERT [dbo].[Component] ([component_id], [structure_id], [name], [AsbIngNr], [location]) VALUES (6, N'DE10000000', N'Bearing west', N'130011913000000', N'west')
INSERT [dbo].[Component] ([component_id], [structure_id], [name], [AsbIngNr], [location]) VALUES (8, N'DE10000000', N'Bearing east', N'130011913000000', N'east')
INSERT [dbo].[Component] ([component_id], [structure_id], [name], [AsbIngNr], [location]) VALUES (9, N'DE10000000', N'main girder north', N'13001111200000 ', N'north')
INSERT [dbo].[Component] ([component_id], [structure_id], [name], [AsbIngNr], [location]) VALUES (10, N'DE10000000', N'main girder south', N'13001111200000 ', N'south')
INSERT [dbo].[Component] ([component_id], [structure_id], [name], [AsbIngNr], [location]) VALUES (11, N'DE10000000', N'pavement', N'13002210000000 ', NULL)
INSERT [dbo].[Component] ([component_id], [structure_id], [name], [AsbIngNr], [location]) VALUES (12, N'DE10000000', N'railing north', N'13002212100000 ', N'north')
INSERT [dbo].[Component] ([component_id], [structure_id], [name], [AsbIngNr], [location]) VALUES (13, N'DE10000000', N'railing south', N'13002212100000 ', N'south')
SET IDENTITY_INSERT [dbo].[Component] OFF
GO
SET IDENTITY_INSERT [dbo].[Condition] ON 

INSERT [dbo].[Condition] ([condition_id], [component_id], [inspection_id], [safetyGrade], [stabilityGrade], [durabilityGrade], [damageDescription]) VALUES (1, 3, 3, 1, 1, 2, N'Cracks on the abutment wall with wide of 1mm ')
INSERT [dbo].[Condition] ([condition_id], [component_id], [inspection_id], [safetyGrade], [stabilityGrade], [durabilityGrade], [damageDescription]) VALUES (2, 3, 4, 1, 1, 2, N'Cracks on the abutment wall with wide of 1 - 2mm ')
INSERT [dbo].[Condition] ([condition_id], [component_id], [inspection_id], [safetyGrade], [stabilityGrade], [durabilityGrade], [damageDescription]) VALUES (3, 10, 5, 1, 2, 3, N'Spalling on solid elements of concrete, with area 0,3 m x 0,5 m')
SET IDENTITY_INSERT [dbo].[Condition] OFF
GO
SET IDENTITY_INSERT [dbo].[Inspection] ON 

INSERT [dbo].[Inspection] ([inspection_id], [structure_id], [inspector], [inspectionBody], [inspectionDate], [inspectionType], [structureGrade]) VALUES (3, N'DE10000000', N'John Co                                           ', N'Engineer consortium', CAST(N'2010-02-01' AS Date), N'visual', CAST(1.7 AS Decimal(2, 1)))
INSERT [dbo].[Inspection] ([inspection_id], [structure_id], [inspector], [inspectionBody], [inspectionDate], [inspectionType], [structureGrade]) VALUES (4, N'DE10000000', N'Muster                                            ', N'Muster consortium', CAST(N'2015-09-04' AS Date), N'visual', CAST(2.3 AS Decimal(2, 1)))
INSERT [dbo].[Inspection] ([inspection_id], [structure_id], [inspector], [inspectionBody], [inspectionDate], [inspectionType], [structureGrade]) VALUES (5, N'DE25315654', N'John Co.                                          ', N'Engineer consortium', CAST(N'2004-06-07' AS Date), N'einfach visual', CAST(1.0 AS Decimal(2, 1)))
INSERT [dbo].[Inspection] ([inspection_id], [structure_id], [inspector], [inspectionBody], [inspectionDate], [inspectionType], [structureGrade]) VALUES (10, N'DE10000000', N'John Co                                           ', N'Jo & Co. Engineer Consortium', CAST(N'2021-03-17' AS Date), N'', CAST(2.5 AS Decimal(2, 1)))
SET IDENTITY_INSERT [dbo].[Inspection] OFF
GO
INSERT [dbo].[Structure] ([structure_id], [name], [type], [amt], [location], [constructionYear]) VALUES (N'DE10000000', N'Road bridge', N'concrete bam bridge', N'Germnay', N'NRW, Germany', N'1995')
INSERT [dbo].[Structure] ([structure_id], [name], [type], [amt], [location], [constructionYear]) VALUES (N'DE25315002', N'Freeway bridge', N'steel grid bridge', N'Germany', N'NRW, Germany', N'1998')
INSERT [dbo].[Structure] ([structure_id], [name], [type], [amt], [location], [constructionYear]) VALUES (N'DE25315654', N'Pederstrain bridge', N'cable stray bridge', N'Germany', N'Germany', N'2002')
GO
ALTER TABLE [dbo].[Component]  WITH CHECK ADD  CONSTRAINT [FK_Component_Structure] FOREIGN KEY([structure_id])
REFERENCES [dbo].[Structure] ([structure_id])
GO
ALTER TABLE [dbo].[Component] CHECK CONSTRAINT [FK_Component_Structure]
GO
ALTER TABLE [dbo].[Condition]  WITH CHECK ADD  CONSTRAINT [FK_Condition_Component] FOREIGN KEY([component_id])
REFERENCES [dbo].[Component] ([component_id])
GO
ALTER TABLE [dbo].[Condition] CHECK CONSTRAINT [FK_Condition_Component]
GO
ALTER TABLE [dbo].[Condition]  WITH CHECK ADD  CONSTRAINT [FK_Condition_Inspection] FOREIGN KEY([inspection_id])
REFERENCES [dbo].[Inspection] ([inspection_id])
GO
ALTER TABLE [dbo].[Condition] CHECK CONSTRAINT [FK_Condition_Inspection]
GO
ALTER TABLE [dbo].[Inspection]  WITH CHECK ADD  CONSTRAINT [FK_Inspection_Structure] FOREIGN KEY([structure_id])
REFERENCES [dbo].[Structure] ([structure_id])
GO
ALTER TABLE [dbo].[Inspection] CHECK CONSTRAINT [FK_Inspection_Structure]
GO
USE [master]
GO
ALTER DATABASE [DemoDBSIB] SET  READ_WRITE 
GO
