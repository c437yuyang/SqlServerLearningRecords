--create database MyFirstDatabase;
--drop database [MyFirstDatabase];

--创建数据库
create database MyFourDatabase
on primary(
	name = 'MyFourDatabase',--逻辑名称
	filename = 'C:\MySqlServerData\MyFourDatabase.mdf',
	size=5MB,
	maxsize=150mb,
	filegrowth=20%
)
log on 
(
	--日志文件选项
	name = 'MyFourDatabase',
	filename = 'C:\MySqlServerData\MyFourDatabase_log.mdf',
	size=4096KB, --大写小写一样的
	filegrowth=20%
)

--创建一个表
use MyFourDatabase
create table Departments
(
	AutoID int identity(1,1) primary key,
	DepartmentName nvarchar(50) not null
)

--drop table Departments
 
create table Employees
(
	EmpID int identity(1,1) primary key,
	EmpIDCard varchar(18) not null,
	EmpName nvarchar(50) null,
	EmpGender char(1) not null,
	EmpJoinDate datetime,
	EmpAge int,
	EmpDeptID int not null,
	EmpPhone char(11) not null,
	--EmpHometown nvarchar(300) null
)

----------------------------------------------向表中插入数据

--insert into (col1,col2)，不能向自动编号列插入值
insert into Departments(DepartmentName) values('行政部')
insert into Departments(DepartmentName) values('设计部')
select * from Departments

insert into Employees
(EmpIDCard,EmpName,EmpGender,EmpJoinDate,EmpAge,EmpDeptID,EmpPhone)
values('123456789123456789','张三','男','2016-7-12',20,1,'12345678912')

insert into Employees --可以不要参数列表,则默认除了自动编号列
values('123456789123456788','貂蝉','女','2016-7-11',19,2,'12345678913') --bit类型大于1就自动为1了
select * from Employees;

insert into Employees --插入部分列的值(需要在参数里指定清楚)
(EmpIDCard,EmpGender,EmpDeptID,EmpPhone)
values('123456789123456781',0,1,'12345678912')

--向自动编号的列插入值
set identity_insert Departments on --强制插入指定编号
insert into Departments(DepId,DepName)
values(500,'测试部')
set identity_insert Departments off
select * from Departments --并且之后再自动插入的话是接着500继续

insert into Employees --加N防止出现因为排序规则的问题产生的乱码，简单的说就是SQL语句带中文的最后就带一个N
values('123456789123456788',N'张二',2,'2016-7-11',22,'男','12345678920')
select * from Employees;