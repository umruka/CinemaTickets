USE [master]
GO
/****** Object:  Database [CinemaTickets]    Script Date: 12-Apr-19 11:26:56 PM ******/
CREATE DATABASE [CinemaTickets]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CinemaTickets', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CinemaTickets.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CinemaTickets_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CinemaTickets_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CinemaTickets] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CinemaTickets].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CinemaTickets] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CinemaTickets] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CinemaTickets] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CinemaTickets] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CinemaTickets] SET ARITHABORT OFF 
GO
ALTER DATABASE [CinemaTickets] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CinemaTickets] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CinemaTickets] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CinemaTickets] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CinemaTickets] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CinemaTickets] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CinemaTickets] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CinemaTickets] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CinemaTickets] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CinemaTickets] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CinemaTickets] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CinemaTickets] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CinemaTickets] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CinemaTickets] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CinemaTickets] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CinemaTickets] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CinemaTickets] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CinemaTickets] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CinemaTickets] SET  MULTI_USER 
GO
ALTER DATABASE [CinemaTickets] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CinemaTickets] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CinemaTickets] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CinemaTickets] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CinemaTickets] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CinemaTickets] SET QUERY_STORE = OFF
GO
USE [CinemaTickets]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
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
USE [CinemaTickets]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 12-Apr-19 11:26:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genres]    Script Date: 12-Apr-19 11:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genres](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
 CONSTRAINT [PK_genres] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movie_types]    Script Date: 12-Apr-19 11:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movie_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_movie_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movies]    Script Date: 12-Apr-19 11:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](500) NULL,
	[subtitle] [nvarchar](500) NULL,
	[description] [nvarchar](500) NULL,
	[trailer_url] [nvarchar](500) NULL,
	[category_id] [int] NULL,
	[genre_id] [int] NULL,
	[duration] [float] NULL,
	[producer] [nvarchar](500) NULL,
	[actors] [nvarchar](1000) NULL,
 CONSTRAINT [PK_movies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[projections]    Script Date: 12-Apr-19 11:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[projections](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[room_id] [int] NULL,
	[movie_id] [int] NULL,
	[time] [datetime] NULL,
	[movie_type_id] [int] NULL,
 CONSTRAINT [PK_projections] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reservations]    Script Date: 12-Apr-19 11:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[projection_id] [int] NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_reservations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rooms]    Script Date: 12-Apr-19 11:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rooms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
 CONSTRAINT [PK_rooms] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seats]    Script Date: 12-Apr-19 11:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seats](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ticket_id] [int] NULL,
	[seat] [int] NULL,
 CONSTRAINT [PK_seats] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ticket_types]    Script Date: 12-Apr-19 11:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_ticket_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tickets]    Script Date: 12-Apr-19 11:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tickets](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[reservation_id] [int] NULL,
	[ticket_type_id] [int] NULL,
 CONSTRAINT [PK_tickets] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12-Apr-19 11:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
	[email] [nvarchar](500) NULL,
	[phone] [nvarchar](500) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[movies]  WITH CHECK ADD  CONSTRAINT [FK_movies_categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[movies] CHECK CONSTRAINT [FK_movies_categories]
GO
ALTER TABLE [dbo].[movies]  WITH CHECK ADD  CONSTRAINT [FK_movies_genres] FOREIGN KEY([genre_id])
REFERENCES [dbo].[genres] ([id])
GO
ALTER TABLE [dbo].[movies] CHECK CONSTRAINT [FK_movies_genres]
GO
ALTER TABLE [dbo].[projections]  WITH CHECK ADD  CONSTRAINT [FK_projections_movie_types] FOREIGN KEY([movie_type_id])
REFERENCES [dbo].[movie_types] ([id])
GO
ALTER TABLE [dbo].[projections] CHECK CONSTRAINT [FK_projections_movie_types]
GO
ALTER TABLE [dbo].[projections]  WITH CHECK ADD  CONSTRAINT [FK_projections_movies] FOREIGN KEY([movie_id])
REFERENCES [dbo].[movies] ([id])
GO
ALTER TABLE [dbo].[projections] CHECK CONSTRAINT [FK_projections_movies]
GO
ALTER TABLE [dbo].[projections]  WITH CHECK ADD  CONSTRAINT [FK_projections_rooms] FOREIGN KEY([room_id])
REFERENCES [dbo].[rooms] ([id])
GO
ALTER TABLE [dbo].[projections] CHECK CONSTRAINT [FK_projections_rooms]
GO
ALTER TABLE [dbo].[reservations]  WITH CHECK ADD  CONSTRAINT [FK_reservations_projections] FOREIGN KEY([projection_id])
REFERENCES [dbo].[projections] ([id])
GO
ALTER TABLE [dbo].[reservations] CHECK CONSTRAINT [FK_reservations_projections]
GO
ALTER TABLE [dbo].[reservations]  WITH CHECK ADD  CONSTRAINT [FK_reservations_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[reservations] CHECK CONSTRAINT [FK_reservations_users]
GO
ALTER TABLE [dbo].[seats]  WITH CHECK ADD  CONSTRAINT [FK_seats_tickets] FOREIGN KEY([ticket_id])
REFERENCES [dbo].[tickets] ([id])
GO
ALTER TABLE [dbo].[seats] CHECK CONSTRAINT [FK_seats_tickets]
GO
ALTER TABLE [dbo].[tickets]  WITH CHECK ADD  CONSTRAINT [FK_tickets_reservations] FOREIGN KEY([reservation_id])
REFERENCES [dbo].[reservations] ([id])
GO
ALTER TABLE [dbo].[tickets] CHECK CONSTRAINT [FK_tickets_reservations]
GO
ALTER TABLE [dbo].[tickets]  WITH CHECK ADD  CONSTRAINT [FK_tickets_ticket_types] FOREIGN KEY([ticket_type_id])
REFERENCES [dbo].[ticket_types] ([id])
GO
ALTER TABLE [dbo].[tickets] CHECK CONSTRAINT [FK_tickets_ticket_types]
GO
USE [master]
GO
ALTER DATABASE [CinemaTickets] SET  READ_WRITE 
GO
