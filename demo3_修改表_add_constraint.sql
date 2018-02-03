--通过t-sql创建约束
use MyFiveDatabase
create table Employees
(
	EmpId int identity(1,1),
	EmpName nvarchar(20),
	EmpGender nchar(1),
	EmpAge	int,
	EmpEmail nvarchar(20),
	EmpAddress nvarchar(50)
)

create table Departments
(
	DepId int identity(1,1),
	DepName nvarchar(10)
)

SELECT * from Employees

------------手动删除列
alter table Employees drop column EmpAddr
------------手动增加一列
alter table Employees add EmpAddr nvarchar(100) --新增的列默认为全null
alter table Employees add EmpDepId int not null
------------修改表里面的列(非空约束) 
alter table Employees alter column EmpEmail nvarchar(30) null
alter table Employees alter column EmpEmail nvarchar(40) --修改列的属性
--可以看到删除修改都带column关键字，只有增加不带

------------增加主键约束
alter table Employees add constraint PK_Employees_EmpId primary key(EmpId)
ALTER table Departments add constraint PK_Departments_DepId primary key(DepId)
------------增加唯一约束
ALTER table Employees add constraint UQ_Employees_EmpEmail unique(EmpEmail)
------------默认约束
ALTER TABLE Employees add constraint DF_Employees_EmpGender default('男') for EmpGender
------------检查约束
ALTER table	Employees add constraint CK_Employees_EmpGender check(EmpGender='男' or EmpGender='女')
ALTER table	Employees add constraint CK_Employees_EmpAge check(EmpAge>0 and EmpAge<100)

--增加外键约束
ALTER table Employees add constraint FK_Employees_Departments
foreign key(EmpDepId) references Departments(DepId)

--删除约束
ALTER table Employees drop constraint FK_Employees_Departments,CK_Employees_EmpGender

--一句话增加多个约束
ALTER TABLE Employees add 
constraint DF_Employees_EmpGender default('男') for EmpGender,
constraint CK_Employees_EmpAge check(EmpAge>0 and EmpAge<100),
constraint PK_Departments_DepId primary key(DepId)

--也可以创建表的时候就增加多个约束
DROP TABLE Employees
DROP TABLE Departments
create table Employees
(
	EmpId int identity(1,1) primary key,
	EmpName nvarchar(20) not null unique check(len(EmpName)>2 and len(EmpName) < 10),
	EmpGender nchar(1) default('男'),
	EmpAge	int check(EmpAge>0 and EmpAge < 100),
	EmpEmail nvarchar(20),
	EmpAddress nvarchar(50),
	EmpDepId int foreign key references Departments(DepId) on delete cascade
)

create table Departments
(
	DepId int identity(1,1) primary key,
	DepName nvarchar(20) not null unique
)