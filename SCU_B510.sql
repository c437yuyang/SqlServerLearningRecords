--创建数据库
CREATE DATABASE [SCU_B510] ON  PRIMARY 
( NAME = N'SCU_B510', FILENAME = N'C:\MySqlServerData\SCU_B510.mdf' , SIZE = 3072KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SCU_B510_log', FILENAME = N'C:\MySqlServerData\SCU_B510_log.ldf' , SIZE = 1024KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SCU_B510] SET COMPATIBILITY_LEVEL = 100
GO
ALTER DATABASE [SCU_B510] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SCU_B510] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SCU_B510] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SCU_B510] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SCU_B510] SET ARITHABORT OFF 
GO
ALTER DATABASE [SCU_B510] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SCU_B510] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SCU_B510] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SCU_B510] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SCU_B510] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SCU_B510] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SCU_B510] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SCU_B510] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SCU_B510] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SCU_B510] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SCU_B510] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SCU_B510] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SCU_B510] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SCU_B510] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SCU_B510] SET  READ_WRITE 
GO
ALTER DATABASE [SCU_B510] SET RECOVERY FULL 
GO
ALTER DATABASE [SCU_B510] SET  MULTI_USER 
GO
ALTER DATABASE [SCU_B510] SET PAGE_VERIFY CHECKSUM  
GO
USE [SCU_B510]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [SCU_B510] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO


-------------建表
--1.user表2.活动记录表3.开支记录表4.照片记录表
use SCU_B510
create table Users
(
	uID int identity(1,1) primary key,
	uName nvarchar(20) not null,
	uPswd varchar(20) not null,
	uLevel int not null check(uLevel>=0 and uLevel<=2) --0.只读,1.可增加,2.管理员,可更改系统设置
)

create table EventRecords
(
	eID int identity(1,1) primary key,
	eTime datetime not null,
	eLocale nvarchar(20),
	eDesc nvarchar(max),
	eRecordTime datetime not null,
	eModifyTime datetime not null,
)

DROP TABLE expenditures
create table Expenditures
(
	exID int identity(1,1) primary key,
	exTime datetime not null,
	exNum float(24) not null,
	exDesc nvarchar(max),
	exRecordTime datetime not null,
	exModifyTime datetime not null,
	eID int
)


create table Photos
(
	pID int identity(1,1) primary key,
	pFileName nvarchar(200) not null,
	pDesc nvarchar(max),
	pRecordTime datetime not null,
	eID int not null
)

SELECT * from Users
INSERT INTO Users VALUES('yxp','8598018',2)
INSERT INTO Users VALUES('guest','123456',0)
INSERT INTO Users VALUES('src','123456',1)
INSERT INTO Users VALUES('zd','123456',2)
INSERT INTO Users VALUES('sj','123456',2)

SELECT COUNT(*) from Users WHERE uName=@uName and uPswd=@uPswd


SELECT * from Expenditures

INSERT INTO Expenditures VALUES(GETDATE(),-21.5,'买水',GETDATE(),GETDATE(),NULL)
INSERT INTO Expenditures VALUES(GETDATE(),-21.2,'买水1',GETDATE(),GETDATE(),NULL)
INSERT INTO Expenditures VALUES(GETDATE(),23.5,'收到一个人的钱',GETDATE(),GETDATE(),NULL)
INSERT INTO Expenditures VALUES(GETDATE(),-25.5,'买水3',GETDATE(),GETDATE(),NULL)

UPDATE Expenditures SET exNum=@exNum,exDesc=@exDesc,exModifyTime=GETDATE() WHERE exId=@exId
INSERT INTO Expenditures VALUES(GETDATE(),exNum=@exNum,exDesc=@exDesc,GETDATE(),GETDATE(),NULL)


INSERT INTO Expenditures VALUES('2017-4-1',-25.5,'买水3',GETDATE(),GETDATE(),NULL)

DECLARE @extime datetime = getdate()
DECLARE @exNUm float =1.1
DECLARE @exdesc nvarchar(max) = '哈哈哈啊哈哈哈哈'
INSERT INTO Expenditures VALUES(@exTime,@exNum,@exDesc,GETDATE(),GETDATE(),NULL)

SELECT 
总支出 = sum(CASE 
			WHEN exNum<0 THEN exNUm
			ELSE NULL
			end)
from Expenditures

SELECT 
总收入 = sum(CASE 
			WHEN exNum>0 THEN exNUm
			ELSE NULL
			end)
from Expenditures

SELECT 剩余经费 = sum(exnum) from Expenditures

TRUNCATE table expenditures

DELETE from Expenditures WHERE exId=@exId


