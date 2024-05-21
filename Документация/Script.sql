USE [master]
GO
/****** Object:  Database [DirFitnesCentrDB]    Script Date: 21.05.2024 17:56:32 ******/
CREATE DATABASE [DirFitnesCentrDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DirFitnesCentrDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DirFitnesCentrDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DirFitnesCentrDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DirFitnesCentrDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DirFitnesCentrDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DirFitnesCentrDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DirFitnesCentrDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DirFitnesCentrDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DirFitnesCentrDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DirFitnesCentrDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DirFitnesCentrDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DirFitnesCentrDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DirFitnesCentrDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DirFitnesCentrDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DirFitnesCentrDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DirFitnesCentrDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DirFitnesCentrDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DirFitnesCentrDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DirFitnesCentrDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DirFitnesCentrDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DirFitnesCentrDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DirFitnesCentrDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DirFitnesCentrDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DirFitnesCentrDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DirFitnesCentrDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DirFitnesCentrDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DirFitnesCentrDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DirFitnesCentrDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DirFitnesCentrDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DirFitnesCentrDB] SET  MULTI_USER 
GO
ALTER DATABASE [DirFitnesCentrDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DirFitnesCentrDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DirFitnesCentrDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DirFitnesCentrDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DirFitnesCentrDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DirFitnesCentrDB] SET QUERY_STORE = OFF
GO
USE [DirFitnesCentrDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 21.05.2024 17:56:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organization]    Script Date: 21.05.2024 17:56:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Info] [nvarchar](1000) NULL,
	[Address] [nvarchar](1000) NULL,
	[Phone] [nvarchar](50) NULL,
	[Site] [nvarchar](50) NULL,
	[Latitude] [float] NOT NULL,
	[Longitude] [float] NOT NULL,
	[Rate] [float] NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[WorkTimeId] [int] NOT NULL,
 CONSTRAINT [PK_Pharmacy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 21.05.2024 17:56:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceOrganization]    Script Date: 21.05.2024 17:56:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceOrganization](
	[ServiceOrganizationId] [int] IDENTITY(1,1) NOT NULL,
	[ServiceId] [int] NOT NULL,
	[OrganizationId] [int] NOT NULL,
 CONSTRAINT [PK_ServicePharmacy] PRIMARY KEY CLUSTERED 
(
	[ServiceOrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 21.05.2024 17:56:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Username] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkTime]    Script Date: 21.05.2024 17:56:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkTime](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](1000) NULL,
 CONSTRAINT [PK_WorkTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Title]) VALUES (1, N'Салон красоты')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (2, N'Фитнес клуб')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (3, N'​Спортивно-оздоровительный комплекс')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (4, N'Центр красоты и здоровья')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (5, N'Спортивный комплекс')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (6, N'Культурно-спортивный комплекс')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Organization] ON 

INSERT [dbo].[Organization] ([Id], [Title], [Info], [Address], [Phone], [Site], [Latitude], [Longitude], [Rate], [Photo], [CategoryId], [WorkTimeId]) VALUES (1, N'Ariada gym', N'Наш зал с каждым годом расцветает, большая дружная семья, где каждый готов помочь! Душевые чистые, вытяжка, кондиционеры работают! Тренажёры самые лучшие в городе!', N'ул. Космонавтов, 15, Зеленодольск, Респ. Татарстан, 422544', N'+7 (84371) 6‒03‒03', N'', 55.850082266417836, 48.507241972909981, 4, N'2Screenshot_1.jpg', 2, 4)
INSERT [dbo].[Organization] ([Id], [Title], [Info], [Address], [Phone], [Site], [Latitude], [Longitude], [Rate], [Photo], [CategoryId], [WorkTimeId]) VALUES (3, N'Gravity gym', N'Хорошая заправка и персонал культурный, качество бензина на высшем уровне!', N'ул. Гоголя, 49а, Зеленодольск, Респ. Татарстан, 422550', N'+7‒917‒890‒97‒97', N'-', 55.851648669468993, 48.51728441952951, 4, N'11Screenshot_3.jpg', 2, 5)
INSERT [dbo].[Organization] ([Id], [Title], [Info], [Address], [Phone], [Site], [Latitude], [Longitude], [Rate], [Photo], [CategoryId], [WorkTimeId]) VALUES (4, N'Маяк', N'​Спортивно-оздоровительный комплекс', N'​Рогачёва, 34Б, Зеленодольск, Республика Татарстан, 422544', N'+7 (84371) 5‒19‒18', N'нет', 55.855566448134255, 48.481361513786652, 5, N'1111Screenshot_5.jpg', 3, 5)
INSERT [dbo].[Organization] ([Id], [Title], [Info], [Address], [Phone], [Site], [Latitude], [Longitude], [Rate], [Photo], [CategoryId], [WorkTimeId]) VALUES (7, N'Aura', N'​салон красоты с широким спектром услуг', N'Паратская, 9, Зеленодольск, Респ. Татарстан, 422550', N'+7 (84371) 7‒04‒40', N'n685441.yclients.com', 55.850128312348076, 48.486716547181885, 5, N'3Screenshot_2.jpg', 1, 3)
INSERT [dbo].[Organization] ([Id], [Title], [Info], [Address], [Phone], [Site], [Latitude], [Longitude], [Rate], [Photo], [CategoryId], [WorkTimeId]) VALUES (8, N'Matur', N'​Центр красоты и здоровья', N'​​​Улица Ленина, 63, Респ. Татарстан, 422545', N'+7 (84371) 6‒04‒84', N'матурзд.рф', 55.844900529677709, 48.526396812648336, 4, N'12Screenshot_4.jpg', 4, 4)
SET IDENTITY_INSERT [dbo].[Organization] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([Id], [Title]) VALUES (1, N'ЭМС-тренировки')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (2, N'Личный тренер')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (3, N'С фото')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (4, N'Круглосуточный')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (5, N'Доступно для инвалидов')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (6, N'Для беременных')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (7, N'Детский уголок')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (8, N'Бассеин')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (9, N'Молельная комната')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (10, N'Женский зал')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (11, N'Разовые посещения')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (12, N'Йога')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (13, N'Аэробика')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (14, N'Джампинг')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (15, N'Зумба')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (16, N'Кроссфит')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (17, N'Пилатес')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (18, N'Калланетика')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (19, N'Стретчинг')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (20, N'Шейпинг')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (21, N'Фитбол')
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceOrganization] ON 

INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (223, 2, 1)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (224, 3, 1)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (225, 5, 1)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (226, 11, 1)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (227, 1, 7)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (228, 3, 7)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (229, 6, 7)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (230, 10, 7)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (231, 11, 7)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (232, 12, 7)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (233, 13, 7)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (234, 17, 7)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (235, 19, 7)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (236, 21, 7)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (246, 2, 3)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (247, 3, 3)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (248, 5, 3)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (249, 7, 3)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (250, 10, 3)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (251, 11, 3)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (252, 15, 3)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (253, 16, 3)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (254, 17, 3)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (266, 2, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (267, 3, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (268, 6, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (269, 7, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (270, 10, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (271, 11, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (272, 13, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (273, 14, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (274, 15, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (275, 17, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (276, 19, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (301, 2, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (302, 3, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (303, 10, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (304, 11, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (305, 12, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (306, 14, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (307, 17, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (308, 20, 4)
SET IDENTITY_INSERT [dbo].[ServiceOrganization] OFF
GO
INSERT [dbo].[User] ([Username], [Password]) VALUES (N'admin', N'2')
INSERT [dbo].[User] ([Username], [Password]) VALUES (N'user', N'1')
GO
SET IDENTITY_INSERT [dbo].[WorkTime] ON 

INSERT [dbo].[WorkTime] ([Id], [Title]) VALUES (1, N'Круглосуточно')
INSERT [dbo].[WorkTime] ([Id], [Title]) VALUES (2, N'8:00 - 20:00')
INSERT [dbo].[WorkTime] ([Id], [Title]) VALUES (3, N'9:00 - 22:00')
INSERT [dbo].[WorkTime] ([Id], [Title]) VALUES (4, N'7:00 - 21:00')
INSERT [dbo].[WorkTime] ([Id], [Title]) VALUES (5, N'8:00 - 22:00')
SET IDENTITY_INSERT [dbo].[WorkTime] OFF
GO
ALTER TABLE [dbo].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_Pharmacy_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Organization] CHECK CONSTRAINT [FK_Pharmacy_Category]
GO
ALTER TABLE [dbo].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_Pharmacy_WorkTime] FOREIGN KEY([WorkTimeId])
REFERENCES [dbo].[WorkTime] ([Id])
GO
ALTER TABLE [dbo].[Organization] CHECK CONSTRAINT [FK_Pharmacy_WorkTime]
GO
ALTER TABLE [dbo].[ServiceOrganization]  WITH CHECK ADD  CONSTRAINT [FK_ServiceOrganization_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([Id])
GO
ALTER TABLE [dbo].[ServiceOrganization] CHECK CONSTRAINT [FK_ServiceOrganization_Organization]
GO
ALTER TABLE [dbo].[ServiceOrganization]  WITH CHECK ADD  CONSTRAINT [FK_ServicePharmacy_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[ServiceOrganization] CHECK CONSTRAINT [FK_ServicePharmacy_Service]
GO
USE [master]
GO
ALTER DATABASE [DirFitnesCentrDB] SET  READ_WRITE 
GO
