USE [master]
GO
/****** Object:  Database [ProductsTraining]    Script Date: 20.11.2024 14:41:19 ******/
CREATE DATABASE [ProductsTraining]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProductsTraining', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProductsTraining.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProductsTraining_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProductsTraining_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProductsTraining] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProductsTraining].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProductsTraining] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProductsTraining] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProductsTraining] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProductsTraining] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProductsTraining] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProductsTraining] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProductsTraining] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProductsTraining] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProductsTraining] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProductsTraining] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProductsTraining] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProductsTraining] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProductsTraining] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProductsTraining] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProductsTraining] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProductsTraining] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProductsTraining] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProductsTraining] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProductsTraining] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProductsTraining] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProductsTraining] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProductsTraining] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProductsTraining] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProductsTraining] SET  MULTI_USER 
GO
ALTER DATABASE [ProductsTraining] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProductsTraining] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProductsTraining] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProductsTraining] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProductsTraining] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProductsTraining] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProductsTraining] SET QUERY_STORE = ON
GO
ALTER DATABASE [ProductsTraining] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ProductsTraining]
GO
/****** Object:  Table [dbo].[NamePartner]    Script Date: 20.11.2024 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NamePartner](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NamePartner] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NameProduction]    Script Date: 20.11.2024 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NameProduction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_NameProduction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerProducts]    Script Date: 20.11.2024 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerProducts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDNameProduction] [int] NOT NULL,
	[IDNamePartner] [int] NOT NULL,
	[CountProduction] [int] NOT NULL,
	[DateOfSell] [date] NOT NULL,
 CONSTRAINT [PK_PartnerProducts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 20.11.2024 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDTypePartner] [int] NOT NULL,
	[IDNamePartner] [int] NOT NULL,
	[DirectorLastName] [nvarchar](50) NOT NULL,
	[DirectorFirstName] [nvarchar](50) NOT NULL,
	[DirectorPatronymic] [nvarchar](50) NULL,
	[EmailPartner] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[PhonePartner] [nvarchar](50) NOT NULL,
	[MailIndex] [int] NOT NULL,
	[Area] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Street] [nvarchar](50) NOT NULL,
	[House] [int] NOT NULL,
	[INN] [nvarchar](50) NOT NULL,
	[Rating] [int] NOT NULL,
 CONSTRAINT [PK_Partners] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 20.11.2024 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDProductType] [int] NOT NULL,
	[IDNameProduction] [int] NOT NULL,
	[Article] [int] NOT NULL,
	[MinCostForPartner] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 20.11.2024 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeProduction] [nvarchar](50) NOT NULL,
	[Coeff] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeMaterial]    Script Date: 20.11.2024 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeMaterial](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeMaterial] [nvarchar](50) NOT NULL,
	[Percantage] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_TypeMaterial] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypePartner]    Script Date: 20.11.2024 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypePartner](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypePartner] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[NamePartner] ON 

INSERT [dbo].[NamePartner] ([ID], [Name]) VALUES (1, N'База Строитель')
INSERT [dbo].[NamePartner] ([ID], [Name]) VALUES (2, N'МонтажПро')
INSERT [dbo].[NamePartner] ([ID], [Name]) VALUES (3, N'Паркет 29')
INSERT [dbo].[NamePartner] ([ID], [Name]) VALUES (4, N'Ремонт и отделка')
INSERT [dbo].[NamePartner] ([ID], [Name]) VALUES (5, N'Стройсервис')
INSERT [dbo].[NamePartner] ([ID], [Name]) VALUES (6, N'Заря')
INSERT [dbo].[NamePartner] ([ID], [Name]) VALUES (7, N'Паркет 291')
INSERT [dbo].[NamePartner] ([ID], [Name]) VALUES (8, N'asdasd')
INSERT [dbo].[NamePartner] ([ID], [Name]) VALUES (9, N'фывфывфы')
INSERT [dbo].[NamePartner] ([ID], [Name]) VALUES (10, N'fdgdf')
INSERT [dbo].[NamePartner] ([ID], [Name]) VALUES (11, N'fdgdf11111')
SET IDENTITY_INSERT [dbo].[NamePartner] OFF
GO
SET IDENTITY_INSERT [dbo].[NameProduction] ON 

INSERT [dbo].[NameProduction] ([ID], [Name]) VALUES (1, N'Инженерная доска Дуб Французская елка однополосная 12 мм')
INSERT [dbo].[NameProduction] ([ID], [Name]) VALUES (2, N'Ламинат Дуб дымчато-белый 33 класс 12 мм')
INSERT [dbo].[NameProduction] ([ID], [Name]) VALUES (3, N'Ламинат Дуб серый 32 класс 8 мм с фаской')
INSERT [dbo].[NameProduction] ([ID], [Name]) VALUES (4, N'Паркетная доска Ясень темный однополосная 14 мм')
INSERT [dbo].[NameProduction] ([ID], [Name]) VALUES (5, N'Пробковое напольное клеевое покрытие 32 класс 4 мм')
SET IDENTITY_INSERT [dbo].[NameProduction] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerProducts] ON 

INSERT [dbo].[PartnerProducts] ([ID], [IDNameProduction], [IDNamePartner], [CountProduction], [DateOfSell]) VALUES (1, 4, 1, 15500, CAST(N'2023-03-23' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [IDNameProduction], [IDNamePartner], [CountProduction], [DateOfSell]) VALUES (2, 2, 1, 12350, CAST(N'2023-12-18' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [IDNameProduction], [IDNamePartner], [CountProduction], [DateOfSell]) VALUES (3, 3, 1, 37400, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [IDNameProduction], [IDNamePartner], [CountProduction], [DateOfSell]) VALUES (4, 1, 3, 35000, CAST(N'2022-12-02' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [IDNameProduction], [IDNamePartner], [CountProduction], [DateOfSell]) VALUES (5, 5, 3, 1250, CAST(N'2023-05-17' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [IDNameProduction], [IDNamePartner], [CountProduction], [DateOfSell]) VALUES (6, 2, 3, 1000, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [IDNameProduction], [IDNamePartner], [CountProduction], [DateOfSell]) VALUES (7, 4, 3, 7550, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [IDNameProduction], [IDNamePartner], [CountProduction], [DateOfSell]) VALUES (8, 4, 5, 7250, CAST(N'2023-01-22' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [IDNameProduction], [IDNamePartner], [CountProduction], [DateOfSell]) VALUES (9, 1, 5, 2500, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [IDNameProduction], [IDNamePartner], [CountProduction], [DateOfSell]) VALUES (10, 3, 4, 59050, CAST(N'2023-03-20' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [IDNameProduction], [IDNamePartner], [CountProduction], [DateOfSell]) VALUES (11, 2, 4, 37200, CAST(N'2024-03-12' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [IDNameProduction], [IDNamePartner], [CountProduction], [DateOfSell]) VALUES (12, 5, 4, 4500, CAST(N'2024-05-14' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [IDNameProduction], [IDNamePartner], [CountProduction], [DateOfSell]) VALUES (13, 2, 2, 50000, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [IDNameProduction], [IDNamePartner], [CountProduction], [DateOfSell]) VALUES (14, 3, 2, 670000, CAST(N'2023-11-10' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [IDNameProduction], [IDNamePartner], [CountProduction], [DateOfSell]) VALUES (15, 4, 2, 35000, CAST(N'2024-04-15' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [IDNameProduction], [IDNamePartner], [CountProduction], [DateOfSell]) VALUES (16, 1, 2, 25000, CAST(N'2024-06-12' AS Date))
SET IDENTITY_INSERT [dbo].[PartnerProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Partners] ON 

INSERT [dbo].[Partners] ([ID], [IDTypePartner], [IDNamePartner], [DirectorLastName], [DirectorFirstName], [DirectorPatronymic], [EmailPartner], [Password], [PhonePartner], [MailIndex], [Area], [City], [Street], [House], [INN], [Rating]) VALUES (1, 1, 1, N'Иванова', N'Александра', N'Ивановна', N'aleksandraivanova@ml.ru', N'6LLd8gxpW8', N'+7 (493) 123-4567', 652050, N'Кемеровская', N'Юрга', N'Лесная', 15, N'2222455179', 7)
INSERT [dbo].[Partners] ([ID], [IDTypePartner], [IDNamePartner], [DirectorLastName], [DirectorFirstName], [DirectorPatronymic], [EmailPartner], [Password], [PhonePartner], [MailIndex], [Area], [City], [Street], [House], [INN], [Rating]) VALUES (2, 3, 7, N'Петров', N'Василий', N'Петрович', N'vppetrov@vl.ru', N'I4fNvLsOsr', N'+7 (987) 123-5678', 164500, N'Архангельская', N'Северодвинск', N'Строителей', 18, N'3333888520', 7)
INSERT [dbo].[Partners] ([ID], [IDTypePartner], [IDNamePartner], [DirectorLastName], [DirectorFirstName], [DirectorPatronymic], [EmailPartner], [Password], [PhonePartner], [MailIndex], [Area], [City], [Street], [House], [INN], [Rating]) VALUES (3, 4, 5, N'Соловьев', N'Андрей', N'Николаевич', N'ansolovev@st.ru', N'31EJqnODxN', N'+7 (812) 223-3200', 188910, N'Ленинградская', N'Приморск', N'Парковая', 21, N'4440391035', 7)
INSERT [dbo].[Partners] ([ID], [IDTypePartner], [IDNamePartner], [DirectorLastName], [DirectorFirstName], [DirectorPatronymic], [EmailPartner], [Password], [PhonePartner], [MailIndex], [Area], [City], [Street], [House], [INN], [Rating]) VALUES (4, 2, 4, N'Воробьева', N'Екатерина', N'Валерьевна', N'ekaterina.vorobeva@ml.ru', N'2de41qTFcm', N'+7 (444) 222-3311', 143960, N'Московская', N'Реутов', N'Свободы', 51, N'1111520857', 5)
INSERT [dbo].[Partners] ([ID], [IDTypePartner], [IDNamePartner], [DirectorLastName], [DirectorFirstName], [DirectorPatronymic], [EmailPartner], [Password], [PhonePartner], [MailIndex], [Area], [City], [Street], [House], [INN], [Rating]) VALUES (5, 1, 2, N'Степанов', N'Степан', N'Сергеевич', N'stepanov@stepan.ru', N'At4tQNt13Z', N'+7 (912) 888-3333', 309500, N'Белгородская', N'СтарыйОскол', N'Рабочая', 122, N'5552431140', 10)
INSERT [dbo].[Partners] ([ID], [IDTypePartner], [IDNamePartner], [DirectorLastName], [DirectorFirstName], [DirectorPatronymic], [EmailPartner], [Password], [PhonePartner], [MailIndex], [Area], [City], [Street], [House], [INN], [Rating]) VALUES (6, 1, 6, N'Зарев', N'Михаил', N'', N'Zarev@ml.ru', NULL, N'+7(955) 406-4734', 234105, N'Архангелская', N'Архангел', N'Михаила', 24, N'2201463210', 5)
INSERT [dbo].[Partners] ([ID], [IDTypePartner], [IDNamePartner], [DirectorLastName], [DirectorFirstName], [DirectorPatronymic], [EmailPartner], [Password], [PhonePartner], [MailIndex], [Area], [City], [Street], [House], [INN], [Rating]) VALUES (7, 2, 11, N'dfdsf', N'dsfdsfdsf', N'dsfdsfdsf', N'm@ml.ru', NULL, N'+7', 2323, N'asdasdas', N'sadas', N'asdasasd', 54, N'22323', 5)
SET IDENTITY_INSERT [dbo].[Partners] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [IDProductType], [IDNameProduction], [Article], [MinCostForPartner]) VALUES (1, 3, 4, 8758385, CAST(4456.90 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([ID], [IDProductType], [IDNameProduction], [Article], [MinCostForPartner]) VALUES (2, 3, 1, 8858958, CAST(7330.99 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([ID], [IDProductType], [IDNameProduction], [Article], [MinCostForPartner]) VALUES (3, 1, 2, 7750282, CAST(1799.33 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([ID], [IDProductType], [IDNameProduction], [Article], [MinCostForPartner]) VALUES (4, 1, 3, 7028748, CAST(3890.41 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([ID], [IDProductType], [IDNameProduction], [Article], [MinCostForPartner]) VALUES (5, 4, 5, 5012543, CAST(5450.59 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ID], [TypeProduction], [Coeff]) VALUES (1, N'Ламинат', CAST(2.35 AS Decimal(18, 2)))
INSERT [dbo].[ProductType] ([ID], [TypeProduction], [Coeff]) VALUES (2, N'Массивная доска', CAST(5.15 AS Decimal(18, 2)))
INSERT [dbo].[ProductType] ([ID], [TypeProduction], [Coeff]) VALUES (3, N'Паркетная доска', CAST(4.34 AS Decimal(18, 2)))
INSERT [dbo].[ProductType] ([ID], [TypeProduction], [Coeff]) VALUES (4, N'Пробковое покрытие', CAST(1.50 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeMaterial] ON 

INSERT [dbo].[TypeMaterial] ([ID], [TypeMaterial], [Percantage]) VALUES (1, N'Тип материала 1', CAST(0.0010 AS Decimal(18, 4)))
INSERT [dbo].[TypeMaterial] ([ID], [TypeMaterial], [Percantage]) VALUES (2, N'Тип материала 2', CAST(0.0095 AS Decimal(18, 4)))
INSERT [dbo].[TypeMaterial] ([ID], [TypeMaterial], [Percantage]) VALUES (3, N'Тип материала 3', CAST(0.0028 AS Decimal(18, 4)))
INSERT [dbo].[TypeMaterial] ([ID], [TypeMaterial], [Percantage]) VALUES (4, N'Тип материала 4', CAST(0.0055 AS Decimal(18, 4)))
INSERT [dbo].[TypeMaterial] ([ID], [TypeMaterial], [Percantage]) VALUES (5, N'Тип материала 5', CAST(0.0034 AS Decimal(18, 4)))
SET IDENTITY_INSERT [dbo].[TypeMaterial] OFF
GO
SET IDENTITY_INSERT [dbo].[TypePartner] ON 

INSERT [dbo].[TypePartner] ([ID], [Name]) VALUES (1, N'ЗАО')
INSERT [dbo].[TypePartner] ([ID], [Name]) VALUES (2, N'ОАО')
INSERT [dbo].[TypePartner] ([ID], [Name]) VALUES (3, N'ООО')
INSERT [dbo].[TypePartner] ([ID], [Name]) VALUES (4, N'ПАО')
SET IDENTITY_INSERT [dbo].[TypePartner] OFF
GO
ALTER TABLE [dbo].[PartnerProducts]  WITH CHECK ADD  CONSTRAINT [FK_PartnerProducts_NamePartner] FOREIGN KEY([IDNamePartner])
REFERENCES [dbo].[NamePartner] ([ID])
GO
ALTER TABLE [dbo].[PartnerProducts] CHECK CONSTRAINT [FK_PartnerProducts_NamePartner]
GO
ALTER TABLE [dbo].[PartnerProducts]  WITH CHECK ADD  CONSTRAINT [FK_PartnerProducts_NameProduction] FOREIGN KEY([IDNameProduction])
REFERENCES [dbo].[NameProduction] ([ID])
GO
ALTER TABLE [dbo].[PartnerProducts] CHECK CONSTRAINT [FK_PartnerProducts_NameProduction]
GO
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD  CONSTRAINT [FK_Partners_NamePartner] FOREIGN KEY([IDNamePartner])
REFERENCES [dbo].[NamePartner] ([ID])
GO
ALTER TABLE [dbo].[Partners] CHECK CONSTRAINT [FK_Partners_NamePartner]
GO
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD  CONSTRAINT [FK_Partners_TypePartner] FOREIGN KEY([IDTypePartner])
REFERENCES [dbo].[TypePartner] ([ID])
GO
ALTER TABLE [dbo].[Partners] CHECK CONSTRAINT [FK_Partners_TypePartner]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_NameProduction] FOREIGN KEY([IDNameProduction])
REFERENCES [dbo].[NameProduction] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_NameProduction]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductType] FOREIGN KEY([IDProductType])
REFERENCES [dbo].[ProductType] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductType]
GO
USE [master]
GO
ALTER DATABASE [ProductsTraining] SET  READ_WRITE 
GO
