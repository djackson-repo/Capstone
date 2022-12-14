USE [master]
GO
/****** Object:  Database [Round1]    Script Date: 12/8/2022 9:46:56 PM ******/
CREATE DATABASE [Round1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Round1', FILENAME = N'C:\Users\djack\Round1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Round1_log', FILENAME = N'C:\Users\djack\Round1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Round1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Round1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Round1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Round1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Round1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Round1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Round1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Round1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Round1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Round1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Round1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Round1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Round1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Round1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Round1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Round1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Round1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Round1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Round1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Round1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Round1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Round1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Round1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Round1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Round1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Round1] SET  MULTI_USER 
GO
ALTER DATABASE [Round1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Round1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Round1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Round1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Round1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Round1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Round1] SET QUERY_STORE = OFF
GO
USE [Round1]
GO
/****** Object:  User [app]    Script Date: 12/8/2022 9:46:56 PM ******/
CREATE USER [app] FOR LOGIN [app] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 12/8/2022 9:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[GameId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[GameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 12/8/2022 9:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[TeamId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[Private] [bit] NULL,
	[GameId] [bigint] NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tourney]    Script Date: 12/8/2022 9:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tourney](
	[TourneyId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[GameId] [bigint] NULL,
	[Online] [bit] NULL,
	[Time] [datetime] NULL,
	[Private] [bit] NULL,
 CONSTRAINT [PK_Tourney_1] PRIMARY KEY CLUSTERED 
(
	[TourneyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TUser]    Script Date: 12/8/2022 9:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TUser](
	[TUserId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[TourneyId] [bigint] NULL,
	[manager] [bit] NULL,
 CONSTRAINT [PK_TUser] PRIMARY KEY CLUSTERED 
(
	[TUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/8/2022 9:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Wins] [bigint] NULL,
	[Loss] [bigint] NULL,
	[GameId] [bigint] NULL,
	[TeamId] [bigint] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_Game] FOREIGN KEY([GameId])
REFERENCES [dbo].[Game] ([GameId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_Game]
GO
ALTER TABLE [dbo].[Tourney]  WITH CHECK ADD  CONSTRAINT [FK_Tourney_Game] FOREIGN KEY([GameId])
REFERENCES [dbo].[Game] ([GameId])
GO
ALTER TABLE [dbo].[Tourney] CHECK CONSTRAINT [FK_Tourney_Game]
GO
ALTER TABLE [dbo].[TUser]  WITH CHECK ADD  CONSTRAINT [FK_TUser_User] FOREIGN KEY([TourneyId])
REFERENCES [dbo].[Tourney] ([TourneyId])
GO
ALTER TABLE [dbo].[TUser] CHECK CONSTRAINT [FK_TUser_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Game] FOREIGN KEY([GameId])
REFERENCES [dbo].[Game] ([GameId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Game]
GO
ALTER TABLE [dbo].[User]  WITH NOCHECK ADD  CONSTRAINT [FK_User_Team] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([TeamId])
GO
ALTER TABLE [dbo].[User] NOCHECK CONSTRAINT [FK_User_Team]
GO
USE [master]
GO
ALTER DATABASE [Round1] SET  READ_WRITE 
GO
