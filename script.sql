USE [master]
GO
/****** Object:  Database [CRUDDB]    Script Date: 9/19/2020 12:41:23 AM ******/
CREATE DATABASE [CRUDDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CRUDDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CRUDDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CRUDDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CRUDDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CRUDDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CRUDDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CRUDDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CRUDDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CRUDDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CRUDDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CRUDDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CRUDDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CRUDDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CRUDDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CRUDDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CRUDDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CRUDDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CRUDDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CRUDDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CRUDDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CRUDDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CRUDDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CRUDDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CRUDDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CRUDDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CRUDDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CRUDDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CRUDDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CRUDDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CRUDDB] SET  MULTI_USER 
GO
ALTER DATABASE [CRUDDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CRUDDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CRUDDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CRUDDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CRUDDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CRUDDB] SET QUERY_STORE = OFF
GO
USE [CRUDDB]
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
USE [CRUDDB]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 9/19/2020 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Address] [varchar](max) NULL,
	[Age] [int] NULL,
	[Salary] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeID], [Name], [Address], [Age], [Salary]) VALUES (3, N'Jinu', N'Dubai', 30, 6000)
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Address], [Age], [Salary]) VALUES (4, N'Benson', N'Dubai', 38, 8000)
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Address], [Age], [Salary]) VALUES (5, N'Ajith', N'Sharjah', 25, 4500)
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Address], [Age], [Salary]) VALUES (6, N'Ajmal', N'Abu Dhabi', 28, 3500)
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Address], [Age], [Salary]) VALUES (7, N'Alfred', N'Sharjah', 36, 3600)
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Address], [Age], [Salary]) VALUES (8, N'Anwar', N'Abu Dhabi', 27, 4300)
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Address], [Age], [Salary]) VALUES (9, N'Jibin', N'Dubai', 40, 6000)
SET IDENTITY_INSERT [dbo].[Employee] OFF
/****** Object:  StoredProcedure [dbo].[sp_AverageAge]    Script Date: 9/19/2020 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_AverageAge]
as
Begin
	select avg(Age) as avgage from Employee
End
GO
/****** Object:  StoredProcedure [dbo].[sp_AverageSal]    Script Date: 9/19/2020 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_AverageSal]
as
Begin
	select avg(Salary) as avgsal from Employee
End
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteEmployee]    Script Date: 9/19/2020 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DeleteEmployee]
(
	@EmpId int=0

)
as
Begin
	
	Delete from Employee
	where EmployeeID = @EmpId
End
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllEmployee]    Script Date: 9/19/2020 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetAllEmployee]
as
Begin
	select * from Employee
End
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEmployeeById]    Script Date: 9/19/2020 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetEmployeeById]
(
	@EmpId int=0

)
as
Begin
	
	select * from Employee
	where EmployeeID = @EmpId
End
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertEmployee]    Script Date: 9/19/2020 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_InsertEmployee]
(
	@name nvarchar(150)='',
	@address nvarchar(max)='',
	@age int =0,
	@sal int=0

)
as
Begin
	insert into Employee([Name],[Address],Age,Salary)
	values (@name,@address,@age,@sal)
End
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateEmployee]    Script Date: 9/19/2020 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_UpdateEmployee]
(
	@EmpId int=0,
	@name nvarchar(150)='',
	@address nvarchar(max)='',
	@age int =0,
	@sal int=0

)
as
Begin
	
	update Employee
	set [Name] = @name,[Address] = @address,Age = @age,Salary = @sal
	where EmployeeID = @EmpId
End
GO
USE [master]
GO
ALTER DATABASE [CRUDDB] SET  READ_WRITE 
GO
