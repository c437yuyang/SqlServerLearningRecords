

--
--xtype：区分表、视图、存储过程等。表为 u、视图为 v、存储过程为 p  (详细见附1）

--name ：表、视图等的名称

--查询有哪些数据库
SELECT Name from master..Sysdatabases order by Name

--查询当前数据库有哪些表
SELECT Name FROM Sysobjects WHERE XTYPE='U' ORDER BY Name

--查询当前表有哪些列
select name from syscolumns 
where id=
(
	select max(id) from sysobjects where xtype='u' and name='MyStudent'
)


----存储过程版本：
EXEC sys.sp_tables --可不加exec
sys.sp_databases
sys.sp_columns 'tblperson'

----另一个版本：
SELECT * FROM sys.tables --类似于mysql中的show tables
--另一个版本:
SELECT * from INFORMATION_SCHEMA.TABLES
SELECT INFORMATION_SCHEMA.TABLES.TABLE_NAME from INFORMATION_SCHEMA.TABLES
SELECT INFORMATION_SCHEMA.TABLES.TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_TYPE='BASE TABLE'