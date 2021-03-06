USE [master]
GO
/****** Object:  Database [pazarSistemi]    Script Date: 31.12.2019 12:38:50 ******/
CREATE DATABASE [pazarSistemi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pazarSistemi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\pazarSistemi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pazarSistemi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\pazarSistemi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [pazarSistemi] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pazarSistemi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pazarSistemi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pazarSistemi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pazarSistemi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pazarSistemi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pazarSistemi] SET ARITHABORT OFF 
GO
ALTER DATABASE [pazarSistemi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pazarSistemi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pazarSistemi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pazarSistemi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pazarSistemi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pazarSistemi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pazarSistemi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pazarSistemi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pazarSistemi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pazarSistemi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pazarSistemi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pazarSistemi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pazarSistemi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pazarSistemi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pazarSistemi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pazarSistemi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pazarSistemi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pazarSistemi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [pazarSistemi] SET  MULTI_USER 
GO
ALTER DATABASE [pazarSistemi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pazarSistemi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pazarSistemi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pazarSistemi] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [pazarSistemi] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'pazarSistemi', N'ON'
GO
ALTER DATABASE [pazarSistemi] SET QUERY_STORE = OFF
GO
USE [pazarSistemi]
GO
/****** Object:  Table [dbo].[tb_Calisan]    Script Date: 31.12.2019 12:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Calisan](
	[calisanId] [int] NOT NULL,
	[marketId] [int] NOT NULL,
	[gorevId] [int] NOT NULL,
	[maas] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_CariHesap]    Script Date: 31.12.2019 12:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_CariHesap](
	[urunId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[satilanAdet] [int] NOT NULL,
	[toplamFiyat] [float] NOT NULL,
	[toplamMaliyet] [float] NOT NULL,
	[marketId] [int] NULL,
	[toplamKar] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Gelir]    Script Date: 31.12.2019 12:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Gelir](
	[marketId] [int] NOT NULL,
	[gelir] [float] NOT NULL,
	[gider] [float] NOT NULL,
	[netKazanc] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Gorev]    Script Date: 31.12.2019 12:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Gorev](
	[gorevId] [int] IDENTITY(1,1) NOT NULL,
	[gorevAd] [nvarchar](max) NOT NULL,
	[gorevTanim] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tb_Gorev] PRIMARY KEY CLUSTERED 
(
	[gorevId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Kategoriler]    Script Date: 31.12.2019 12:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Kategoriler](
	[kategoriId] [int] IDENTITY(1,1) NOT NULL,
	[kategoriAd] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tb_Kategoriler] PRIMARY KEY CLUSTERED 
(
	[kategoriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Market]    Script Date: 31.12.2019 12:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Market](
	[marketId] [int] IDENTITY(1,1) NOT NULL,
	[marketAd] [nvarchar](max) NOT NULL,
	[marketTelefon] [nvarchar](max) NOT NULL,
	[marketYoneticiId] [int] NOT NULL,
 CONSTRAINT [PK_tb_Market] PRIMARY KEY CLUSTERED 
(
	[marketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_MarketUrun]    Script Date: 31.12.2019 12:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_MarketUrun](
	[marketId] [int] NOT NULL,
	[urunId] [int] NOT NULL,
	[stok] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Urun]    Script Date: 31.12.2019 12:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Urun](
	[urunId] [int] IDENTITY(1,1) NOT NULL,
	[urunAd] [nvarchar](max) NOT NULL,
	[urunSKT] [nvarchar](max) NOT NULL,
	[urunFiyat] [float] NOT NULL,
	[urunKategoriId] [int] NOT NULL,
 CONSTRAINT [PK_tb_Urun_Detay] PRIMARY KEY CLUSTERED 
(
	[urunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_User]    Script Date: 31.12.2019 12:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_User](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[userEmail] [nvarchar](max) NOT NULL,
	[userPassword] [nvarchar](max) NOT NULL,
	[userPermission] [int] NULL,
 CONSTRAINT [PK_tb_User] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_User_Detail]    Script Date: 31.12.2019 12:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_User_Detail](
	[Name] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[Age] [nvarchar](max) NOT NULL,
	[GSM] [nvarchar](max) NOT NULL,
	[Adress] [nvarchar](max) NOT NULL,
	[userId] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tb_Calisan]  WITH CHECK ADD  CONSTRAINT [FK_tb_Calisan_tb_Gorev] FOREIGN KEY([gorevId])
REFERENCES [dbo].[tb_Gorev] ([gorevId])
GO
ALTER TABLE [dbo].[tb_Calisan] CHECK CONSTRAINT [FK_tb_Calisan_tb_Gorev]
GO
ALTER TABLE [dbo].[tb_Calisan]  WITH CHECK ADD  CONSTRAINT [FK_tb_Calisan_tb_Market] FOREIGN KEY([marketId])
REFERENCES [dbo].[tb_Market] ([marketId])
GO
ALTER TABLE [dbo].[tb_Calisan] CHECK CONSTRAINT [FK_tb_Calisan_tb_Market]
GO
ALTER TABLE [dbo].[tb_Calisan]  WITH CHECK ADD  CONSTRAINT [FK_tb_Calisan_tb_User] FOREIGN KEY([calisanId])
REFERENCES [dbo].[tb_User] ([userId])
GO
ALTER TABLE [dbo].[tb_Calisan] CHECK CONSTRAINT [FK_tb_Calisan_tb_User]
GO
ALTER TABLE [dbo].[tb_CariHesap]  WITH CHECK ADD  CONSTRAINT [FK_tb_CariHesap_tb_Market] FOREIGN KEY([marketId])
REFERENCES [dbo].[tb_Market] ([marketId])
GO
ALTER TABLE [dbo].[tb_CariHesap] CHECK CONSTRAINT [FK_tb_CariHesap_tb_Market]
GO
ALTER TABLE [dbo].[tb_CariHesap]  WITH CHECK ADD  CONSTRAINT [FK_tb_CariHesap_tb_Urun] FOREIGN KEY([urunId])
REFERENCES [dbo].[tb_Urun] ([urunId])
GO
ALTER TABLE [dbo].[tb_CariHesap] CHECK CONSTRAINT [FK_tb_CariHesap_tb_Urun]
GO
ALTER TABLE [dbo].[tb_CariHesap]  WITH CHECK ADD  CONSTRAINT [FK_tb_CariHesap_tb_User] FOREIGN KEY([userId])
REFERENCES [dbo].[tb_User] ([userId])
GO
ALTER TABLE [dbo].[tb_CariHesap] CHECK CONSTRAINT [FK_tb_CariHesap_tb_User]
GO
ALTER TABLE [dbo].[tb_Gelir]  WITH CHECK ADD  CONSTRAINT [FK_tb_Gelir_tb_Market] FOREIGN KEY([marketId])
REFERENCES [dbo].[tb_Market] ([marketId])
GO
ALTER TABLE [dbo].[tb_Gelir] CHECK CONSTRAINT [FK_tb_Gelir_tb_Market]
GO
ALTER TABLE [dbo].[tb_Market]  WITH CHECK ADD  CONSTRAINT [FK_tb_Market_tb_User] FOREIGN KEY([marketYoneticiId])
REFERENCES [dbo].[tb_User] ([userId])
GO
ALTER TABLE [dbo].[tb_Market] CHECK CONSTRAINT [FK_tb_Market_tb_User]
GO
ALTER TABLE [dbo].[tb_MarketUrun]  WITH CHECK ADD  CONSTRAINT [FK_tb_MarketUrun_tb_Market] FOREIGN KEY([marketId])
REFERENCES [dbo].[tb_Market] ([marketId])
GO
ALTER TABLE [dbo].[tb_MarketUrun] CHECK CONSTRAINT [FK_tb_MarketUrun_tb_Market]
GO
ALTER TABLE [dbo].[tb_MarketUrun]  WITH CHECK ADD  CONSTRAINT [FK_tb_MarketUrun_tb_Urun] FOREIGN KEY([urunId])
REFERENCES [dbo].[tb_Urun] ([urunId])
GO
ALTER TABLE [dbo].[tb_MarketUrun] CHECK CONSTRAINT [FK_tb_MarketUrun_tb_Urun]
GO
ALTER TABLE [dbo].[tb_Urun]  WITH CHECK ADD  CONSTRAINT [FK_tb_Urun_Detay_tb_Kategoriler] FOREIGN KEY([urunKategoriId])
REFERENCES [dbo].[tb_Kategoriler] ([kategoriId])
GO
ALTER TABLE [dbo].[tb_Urun] CHECK CONSTRAINT [FK_tb_Urun_Detay_tb_Kategoriler]
GO
ALTER TABLE [dbo].[tb_User_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tb_User_Detail_tb_User] FOREIGN KEY([userId])
REFERENCES [dbo].[tb_User] ([userId])
GO
ALTER TABLE [dbo].[tb_User_Detail] CHECK CONSTRAINT [FK_tb_User_Detail_tb_User]
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_URUNFROMMAGAZA]    Script Date: 31.12.2019 12:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SP_DELETE_URUNFROMMAGAZA]
@urunId int
as
DELETE FROM tb_MarketUrun where urunId = @urunId
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_PRODUCT]    Script Date: 31.12.2019 12:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INSERT_PRODUCT] @urunAd nvarchar(max), @urunSKT nvarchar(max), @urunFiyat float,   @urunKategoriId int 
AS
	INSERT INTO tb_Urun VALUES ( @urunAd, @urunSKT, @urunFiyat, @urunKategoriId  )
GO
/****** Object:  StoredProcedure [dbo].[SP_SEARCH_URUNAD]    Script Date: 31.12.2019 12:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_SEARCH_URUNAD]
@urunAd nvarchar(max),
@marketId int
as

Select tb_Market.marketAd as Market, tb_User_Detail.Name as İsim, tb_User_Detail.Surname as Soyisim, tb_Urun.urunAd as Ürün,
       tb_CariHesap.satilanAdet as SatılanAdet, tb_CariHesap.toplamFiyat as AlınanÜcret, tb_CariHesap.toplamMaliyet as Maliyet
from tb_CariHesap
inner join tb_Market on tb_CariHesap.marketId = tb_Market.marketId
inner join tb_User_Detail on tb_CariHesap.userId = tb_User_Detail.userId
inner join tb_Urun on tb_CariHesap.urunId = tb_Urun.urunId
where tb_Market.marketId = @marketId and tb_Urun.urunAd = @urunAd
GO
/****** Object:  StoredProcedure [dbo].[SP_SEARCH_URUNADET]    Script Date: 31.12.2019 12:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SEARCH_URUNADET]
@min int,
@max int,
@marketId int
as
Select tb_Market.marketAd as Market, tb_User_Detail.Name as İsim, tb_User_Detail.Surname as Soyisim, tb_Urun.urunAd as Ürün,
       tb_CariHesap.satilanAdet as SatılanAdet, tb_CariHesap.toplamFiyat as AlınanÜcret, tb_CariHesap.toplamMaliyet as Maliyet from tb_CariHesap

inner join tb_Market on tb_CariHesap.marketId = tb_Market.marketId
inner join tb_User_Detail on tb_CariHesap.userId = tb_User_Detail.userId
inner join tb_Urun on tb_CariHesap.urunId = tb_Urun.urunId
WHERE satilanAdet BETWEEN @min AND @max;
GO
/****** Object:  StoredProcedure [dbo].[SP_SEARCH_USERAD]    Script Date: 31.12.2019 12:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_SEARCH_USERAD]
@musteriAd nvarchar(max),
@marketId int
as

Select tb_Market.marketAd as Market, tb_User_Detail.Name as İsim, tb_User_Detail.Surname as Soyisim, tb_Urun.urunAd as Ürün,
       tb_CariHesap.satilanAdet as SatılanAdet, tb_CariHesap.toplamFiyat as AlınanÜcret, tb_CariHesap.toplamMaliyet as Maliyet
from tb_CariHesap
inner join tb_Market on tb_CariHesap.marketId = tb_Market.marketId
inner join tb_User_Detail on tb_CariHesap.userId = tb_User_Detail.userId
inner join tb_Urun on tb_CariHesap.urunId = tb_Urun.urunId
where tb_Market.marketId = @marketId and tb_User_Detail.Name = @musteriAd
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_MARKET]    Script Date: 31.12.2019 12:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SP_SELECT_MARKET]
@yonetici int
AS

Select * from tb_Market where marketYoneticiId = @yonetici
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_MARKETCIRO]    Script Date: 31.12.2019 12:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SP_SELECT_MARKETCIRO]
@marketId int
as

Select tb_Market.marketAd as Market, tb_User_Detail.Name as İsim, tb_User_Detail.Surname as Soyisim, tb_Urun.urunAd as Ürün,
       tb_CariHesap.satilanAdet as SatılanAdet, tb_CariHesap.toplamFiyat as AlınanÜcret, tb_CariHesap.toplamMaliyet as Maliyet
from tb_CariHesap
inner join tb_Market on tb_CariHesap.marketId = tb_Market.marketId
inner join tb_User_Detail on tb_CariHesap.userId = tb_User_Detail.userId
inner join tb_Urun on tb_CariHesap.urunId = tb_Urun.urunId
where tb_Market.marketId = @marketId
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_MarketProductUnique]    Script Date: 31.12.2019 12:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_SELECT_MarketProductUnique]
@marketId int
as
Select tb_CariHesap.urunId , urunAd  from tb_Urun
inner join tb_CariHesap on tb_Urun.urunId  = tb_CariHesap.urunId
where marketId = @marketId
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_NETKAZANC]    Script Date: 31.12.2019 12:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_SELECT_NETKAZANC]
@marketId int
as
SELECT netKazanc from tb_Gelir where marketId = @marketId
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_PRODUCTS]    Script Date: 31.12.2019 12:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_SELECT_PRODUCTS]
@marketId int,
@urunKategoriId int
AS

Select urunAd AS AD ,urunFiyat AS FIYAT  ,urunSKT AS SKT, stok as Stok from tb_Urun
inner join tb_MarketUrun on tb_Urun.urunId = tb_MarketUrun.urunId
where marketId = @marketId and tb_Urun.urunKategoriId = @urunKategoriId
GO
USE [master]
GO
ALTER DATABASE [pazarSistemi] SET  READ_WRITE 
GO
