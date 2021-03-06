USE [master]
GO
/****** Object:  Database [kuhdse202f018]    Script Date: 6/19/2021 7:55:11 PM ******/
CREATE DATABASE [kuhdse202f018]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kuhdse202f018', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\kuhdse202f018.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'kuhdse202f018_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\kuhdse202f018_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [kuhdse202f018] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kuhdse202f018].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kuhdse202f018] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kuhdse202f018] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kuhdse202f018] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kuhdse202f018] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kuhdse202f018] SET ARITHABORT OFF 
GO
ALTER DATABASE [kuhdse202f018] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [kuhdse202f018] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [kuhdse202f018] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kuhdse202f018] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kuhdse202f018] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kuhdse202f018] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kuhdse202f018] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kuhdse202f018] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kuhdse202f018] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kuhdse202f018] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kuhdse202f018] SET  DISABLE_BROKER 
GO
ALTER DATABASE [kuhdse202f018] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kuhdse202f018] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kuhdse202f018] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kuhdse202f018] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kuhdse202f018] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kuhdse202f018] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kuhdse202f018] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kuhdse202f018] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [kuhdse202f018] SET  MULTI_USER 
GO
ALTER DATABASE [kuhdse202f018] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kuhdse202f018] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kuhdse202f018] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kuhdse202f018] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [kuhdse202f018]
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmp]    Script Date: 6/19/2021 7:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteEmp]
@EmpId int
as
begin
delete EmpData where Emp_ID=@EmpId
end
GO
/****** Object:  StoredProcedure [dbo].[InsertEmp]    Script Date: 6/19/2021 7:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertEmp]
@EmpId int,
@Emp_Name nvarchar(50),
@City nvarchar(50),
@Age float,
@Sex nvarchar(20),
@JoiningDate datetime,
@Contact nvarchar(50)
as
begin
INSERT into EmpData(Emp_ID,Emp_Name,City,Age,Sex,JoiningDate,Contact)
values (@EmpId,@Emp_Name,@City,@Age,@Sex,@JoiningDate,@Contact )
end

GO
/****** Object:  StoredProcedure [dbo].[ListEmp]    Script Date: 6/19/2021 7:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ListEmp]
as
begin
select*from EmpData
end
GO
/****** Object:  StoredProcedure [dbo].[LoadEmp]    Script Date: 6/19/2021 7:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LoadEmp]
@EmpId int
as
begin
Select*from EmpData where Emp_ID=@EmpId
end

GO
/****** Object:  StoredProcedure [dbo].[UpdateEmp]    Script Date: 6/19/2021 7:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateEmp]
@EmpId int,
@Emp_Name nvarchar(50),
@City nvarchar(50),
@Age float,
@Sex nvarchar(20),
@JoiningDate datetime,
@Contact nvarchar(50)
as
begin
Update EmpData set Emp_Name=@Emp_Name,City=@City,Age=@Age,Sex=@Sex,JoiningDate=@JoiningDate,Contact=@Contact where Emp_ID=@EmpId
end
GO
/****** Object:  Table [dbo].[EmpData]    Script Date: 6/19/2021 7:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpData](
	[Emp_ID] [int] NOT NULL,
	[Emp_Name] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Age] [float] NULL,
	[Sex] [nvarchar](20) NULL,
	[JoiningDate] [datetime] NULL,
	[Contact] [nvarchar](50) NULL,
 CONSTRAINT [PK_EmpData] PRIMARY KEY CLUSTERED 
(
	[Emp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [kuhdse202f018] SET  READ_WRITE 
GO
