USE [master]
GO
/****** Object:  Database [ArtBank_Data]    Script Date: 6/23/2019 18:22:51 ******/
CREATE DATABASE [ArtBank_Data]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ArtBank_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ArtBank_Data.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ArtBank_Data_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ArtBank_Data_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ArtBank_Data] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ArtBank_Data].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ArtBank_Data] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ArtBank_Data] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ArtBank_Data] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ArtBank_Data] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ArtBank_Data] SET ARITHABORT OFF 
GO
ALTER DATABASE [ArtBank_Data] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ArtBank_Data] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ArtBank_Data] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ArtBank_Data] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ArtBank_Data] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ArtBank_Data] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ArtBank_Data] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ArtBank_Data] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ArtBank_Data] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ArtBank_Data] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ArtBank_Data] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ArtBank_Data] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ArtBank_Data] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ArtBank_Data] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ArtBank_Data] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ArtBank_Data] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ArtBank_Data] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ArtBank_Data] SET RECOVERY FULL 
GO
ALTER DATABASE [ArtBank_Data] SET  MULTI_USER 
GO
ALTER DATABASE [ArtBank_Data] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ArtBank_Data] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ArtBank_Data] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ArtBank_Data] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ArtBank_Data] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ArtBank_Data', N'ON'
GO
USE [ArtBank_Data]
GO
/****** Object:  Table [dbo].[BatchInfos]    Script Date: 6/23/2019 18:22:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchInfos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestCounter] [int] NOT NULL,
	[RequestedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_BatchInfos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Valutes]    Script Date: 6/23/2019 18:22:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Valutes](
	[Id] [nvarchar](450) NOT NULL,
	[NumCode] [nvarchar](max) NULL,
	[CharCode] [nvarchar](max) NULL,
	[Nominal] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_Valutes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01010', N'036', N'AUD', N'1', N'Австралийский доллар', N'43,8706')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01020A', N'944', N'AZN', N'1', N'Азербайджанский манат', N'37,3638')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01035', N'826', N'GBP', N'1', N'Фунт стерлингов Соединенного королевства', N'80,6545')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01060', N'051', N'AMD', N'100', N'Армянских драмов', N'13,2721')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01090B', N'933', N'BYN', N'1', N'Белорусский рубль', N'30,9465')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01100', N'975', N'BGN', N'1', N'Болгарский лев', N'36,6001')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01115', N'986', N'BRL', N'1', N'Бразильский реал', N'16,5115')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01135', N'348', N'HUF', N'100', N'Венгерских форинтов', N'22,0932')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01200', N'344', N'HKD', N'10', N'Гонконгских долларов', N'81,1134')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01215', N'208', N'DKK', N'10', N'Датских крон', N'95,8793')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01235', N'840', N'USD', N'1', N'Доллар США', N'63,3877')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01239', N'978', N'EUR', N'1', N'Евро', N'71,5457')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01270', N'356', N'INR', N'100', N'Индийских рупий', N'91,0808')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01335', N'398', N'KZT', N'100', N'Казахстанских тенге', N'16,6777')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01350', N'124', N'CAD', N'1', N'Канадский доллар', N'47,9919')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01370', N'417', N'KGS', N'100', N'Киргизских сомов', N'90,7483')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01375', N'156', N'CNY', N'10', N'Китайских юаней', N'92,5314')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01500', N'498', N'MDL', N'10', N'Молдавских леев', N'34,8476')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01535', N'578', N'NOK', N'10', N'Норвежских крон', N'73,9854')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01565', N'985', N'PLN', N'1', N'Польский злотый', N'16,8093')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01585F', N'946', N'RON', N'1', N'Румынский лей', N'15,1395')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01589', N'960', N'XDR', N'1', N'СДР (специальные права заимствования)', N'87,5467')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01625', N'702', N'SGD', N'1', N'Сингапурский доллар', N'46,7048')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01670', N'972', N'TJS', N'10', N'Таджикских сомони', N'67,1430')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01700J', N'949', N'TRY', N'1', N'Турецкая лира', N'11,0474')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01710A', N'934', N'TMT', N'1', N'Новый туркменский манат', N'18,1367')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01717', N'860', N'UZS', N'10000', N'Узбекских сумов', N'74,2833')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01720', N'980', N'UAH', N'10', N'Украинских гривен', N'24,0105')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01760', N'203', N'CZK', N'10', N'Чешских крон', N'27,9426')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01770', N'752', N'SEK', N'10', N'Шведских крон', N'67,3270')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01775', N'756', N'CHF', N'1', N'Швейцарский франк', N'64,1836')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01810', N'710', N'ZAR', N'10', N'Южноафриканских рэндов', N'44,5313')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01815', N'410', N'KRW', N'1000', N'Вон Республики Корея', N'54,6361')
INSERT [dbo].[Valutes] ([Id], [NumCode], [CharCode], [Nominal], [Name], [Value]) VALUES (N'R01820', N'392', N'JPY', N'100', N'Японских иен', N'58,8421')
USE [master]
GO
ALTER DATABASE [ArtBank_Data] SET  READ_WRITE 
GO
