USE [master]
GO
/****** Object:  Database [electronix]    Script Date: 23.6.2016 01:17:07 ******/
CREATE DATABASE [electronix]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'electronix', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\electronix.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'electronix_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\electronix_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [electronix] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [electronix].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [electronix] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [electronix] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [electronix] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [electronix] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [electronix] SET ARITHABORT OFF 
GO
ALTER DATABASE [electronix] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [electronix] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [electronix] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [electronix] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [electronix] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [electronix] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [electronix] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [electronix] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [electronix] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [electronix] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [electronix] SET  ENABLE_BROKER 
GO
ALTER DATABASE [electronix] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [electronix] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [electronix] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [electronix] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [electronix] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [electronix] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [electronix] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [electronix] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [electronix] SET  MULTI_USER 
GO
ALTER DATABASE [electronix] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [electronix] SET DB_CHAINING OFF 
GO
ALTER DATABASE [electronix] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [electronix] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [electronix]
GO
/****** Object:  User [HP\VİLDAN]    Script Date: 23.6.2016 01:17:07 ******/
CREATE USER [HP\VİLDAN] FOR LOGIN [HP\VİLDAN] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 23.6.2016 01:17:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Kategoriler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 23.6.2016 01:17:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [varchar](50) NOT NULL,
	[Soyad] [varchar](50) NOT NULL,
	[Sifre] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[TcNo] [int] NOT NULL,
	[Telefon] [int] NOT NULL,
	[Adres] [varchar](max) NOT NULL,
	[Statu] [bit] NULL,
	[Silindi] [bit] NOT NULL,
 CONSTRAINT [PK_Kullanicilar] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Markalar]    Script Date: 23.6.2016 01:17:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Markalar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Markalar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Odemeler]    Script Date: 23.6.2016 01:17:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Odemeler](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[taksitsayisi] [int] NOT NULL,
	[banka] [varchar](50) NOT NULL,
	[cvcno] [int] NOT NULL,
	[kulid] [int] NOT NULL,
 CONSTRAINT [PK_Odemeler] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Satislar]    Script Date: 23.6.2016 01:17:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satislar](
	[SatisNo] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciNo] [int] NULL,
	[SiparisTarih] [datetime] NULL,
	[TeslimTarihi] [datetime] NULL,
	[Miktar] [int] NULL,
	[Tutar] [decimal](18, 0) NULL,
	[Durumu] [bigint] NULL,
	[Silindi] [bit] NULL,
	[OdemeId] [int] NULL,
 CONSTRAINT [PK_Satislar] PRIMARY KEY CLUSTERED 
(
	[SatisNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SepeteEklenen]    Script Date: 23.6.2016 01:17:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SepeteEklenen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SatisNo] [int] NOT NULL,
	[UrunId] [int] NOT NULL,
	[Adet] [int] NULL,
	[Fiyat] [decimal](18, 0) NULL,
	[Tutar] [decimal](18, 0) NOT NULL,
	[Satildi] [bit] NOT NULL,
	[Detay] [varchar](50) NULL,
 CONSTRAINT [PK_SepeteEklenen] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 23.6.2016 01:17:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Urunler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KategoriId] [int] NOT NULL,
	[MarkaId] [int] NOT NULL,
	[Model] [varchar](25) NULL,
	[Fiyat] [float] NOT NULL,
	[Detay] [nvarchar](500) NOT NULL,
	[Resim] [nvarchar](50) NOT NULL,
	[Yeni] [bit] NOT NULL,
	[Ozel] [bit] NOT NULL,
	[Vitrin] [bit] NOT NULL,
	[Tavsiye] [bit] NOT NULL,
	[Adet] [int] NULL,
 CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_FK_KategoriUrun]    Script Date: 23.6.2016 01:17:07 ******/
CREATE NONCLUSTERED INDEX [IX_FK_KategoriUrun] ON [dbo].[Urunler]
(
	[KategoriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_MarkaUrun]    Script Date: 23.6.2016 01:17:07 ******/
CREATE NONCLUSTERED INDEX [IX_FK_MarkaUrun] ON [dbo].[Urunler]
(
	[MarkaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Kullanicilar] ADD  CONSTRAINT [DF_Kullanicilar_Statu]  DEFAULT ((0)) FOR [Statu]
GO
ALTER TABLE [dbo].[Kullanicilar] ADD  CONSTRAINT [DF_Kullanicilar_Silindi]  DEFAULT ((0)) FOR [Silindi]
GO
ALTER TABLE [dbo].[Satislar] ADD  CONSTRAINT [DF_Satislar_Silindi]  DEFAULT ((0)) FOR [Silindi]
GO
ALTER TABLE [dbo].[Satislar] ADD  DEFAULT ((0)) FOR [OdemeId]
GO
ALTER TABLE [dbo].[SepeteEklenen] ADD  CONSTRAINT [DF_SepeteEklenen_Satildi]  DEFAULT ((0)) FOR [Satildi]
GO
ALTER TABLE [dbo].[Urunler] ADD  DEFAULT ((0)) FOR [Adet]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_KategoriUrun] FOREIGN KEY([KategoriId])
REFERENCES [dbo].[Kategoriler] ([Id])
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_KategoriUrun]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_MarkaUrun] FOREIGN KEY([MarkaId])
REFERENCES [dbo].[Markalar] ([Id])
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_MarkaUrun]
GO
USE [master]
GO
ALTER DATABASE [electronix] SET  READ_WRITE 
GO
