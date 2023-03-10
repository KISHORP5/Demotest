USE [master]
GO
/****** Object:  Database [demotest2023]    Script Date: 27-01-2023 17:52:13 ******/
CREATE DATABASE [demotest2023]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'demotest2023', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\demotest2023.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'demotest2023_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\demotest2023_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [demotest2023] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [demotest2023].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [demotest2023] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [demotest2023] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [demotest2023] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [demotest2023] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [demotest2023] SET ARITHABORT OFF 
GO
ALTER DATABASE [demotest2023] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [demotest2023] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [demotest2023] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [demotest2023] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [demotest2023] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [demotest2023] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [demotest2023] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [demotest2023] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [demotest2023] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [demotest2023] SET  DISABLE_BROKER 
GO
ALTER DATABASE [demotest2023] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [demotest2023] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [demotest2023] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [demotest2023] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [demotest2023] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [demotest2023] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [demotest2023] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [demotest2023] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [demotest2023] SET  MULTI_USER 
GO
ALTER DATABASE [demotest2023] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [demotest2023] SET DB_CHAINING OFF 
GO
ALTER DATABASE [demotest2023] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [demotest2023] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [demotest2023] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [demotest2023] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [demotest2023] SET QUERY_STORE = OFF
GO
USE [demotest2023]
GO
/****** Object:  Table [dbo].[City]    Script Date: 27-01-2023 17:52:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](30) NULL,
	[StateId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 27-01-2023 17:52:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNo] [nvarchar](11) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[StateId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[Agree] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 27-01-2023 17:52:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[sp_Addmember]    Script Date: 27-01-2023 17:52:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create procedure [dbo].[sp_Addmember] (@Name nvarchar(50),@Email nvarchar(50),@PhoneNo nvarchar(11),@Address nvarchar(50),@StateId int,@CityId int,@Agree bit)
 as begin 
  insert into Member(Name,Email,PhoneNo,Address,StateId,CityId,Agree)
 values(@Name,@Email,@PhoneNo,@Address,@StateId,@CityId,@Agree)
 end
GO
/****** Object:  StoredProcedure [dbo].[sp_Deleteemember]    Script Date: 27-01-2023 17:52:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create procedure [dbo].[sp_Deleteemember] (@Id int)
 as begin 
 delete from   Member where Id=@Id;
 end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetaLLemembers]    Script Date: 27-01-2023 17:52:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    create procedure [dbo].[sp_GetaLLemembers] 
 as begin 
  select Id,Name,Email,PhoneNo from Member
 end;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetememberById]    Script Date: 27-01-2023 17:52:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create procedure [dbo].[sp_GetememberById](@Id int) 
 as begin 
  select Id,Name,Email,PhoneNo from Member where Id= @Id
 end;
GO
/****** Object:  StoredProcedure [dbo].[sp_Updatemember]    Script Date: 27-01-2023 17:52:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create procedure [dbo].[sp_Updatemember] (@Id int,@Name nvarchar(50),@Email nvarchar(50),@PhoneNo nvarchar(11),@Address nvarchar(50),@StateId int,@CityId int,@Agree bit)
 as begin 
 update  Member set Name=@Name,Email=@Email,PhoneNo=@PhoneNo,Address=@Address ,@StateId=@StateId ,CityId=@CityId ,Agree=@Agree where Id=@Id;
 end
GO
USE [master]
GO
ALTER DATABASE [demotest2023] SET  READ_WRITE 
GO
