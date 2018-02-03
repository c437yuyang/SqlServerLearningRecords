--ͨ��t-sql����Լ��
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

------------�ֶ�ɾ����
alter table Employees drop column EmpAddr
------------�ֶ�����һ��
alter table Employees add EmpAddr nvarchar(100) --��������Ĭ��Ϊȫnull
alter table Employees add EmpDepId int not null
------------�޸ı��������(�ǿ�Լ��) 
alter table Employees alter column EmpEmail nvarchar(30) null
alter table Employees alter column EmpEmail nvarchar(40) --�޸��е�����
--���Կ���ɾ���޸Ķ���column�ؼ��֣�ֻ�����Ӳ���

------------��������Լ��
alter table Employees add constraint PK_Employees_EmpId primary key(EmpId)
ALTER table Departments add constraint PK_Departments_DepId primary key(DepId)
------------����ΨһԼ��
ALTER table Employees add constraint UQ_Employees_EmpEmail unique(EmpEmail)
------------Ĭ��Լ��
ALTER TABLE Employees add constraint DF_Employees_EmpGender default('��') for EmpGender
------------���Լ��
ALTER table	Employees add constraint CK_Employees_EmpGender check(EmpGender='��' or EmpGender='Ů')
ALTER table	Employees add constraint CK_Employees_EmpAge check(EmpAge>0 and EmpAge<100)

--�������Լ��
ALTER table Employees add constraint FK_Employees_Departments
foreign key(EmpDepId) references Departments(DepId)

--ɾ��Լ��
ALTER table Employees drop constraint FK_Employees_Departments,CK_Employees_EmpGender

--һ�仰���Ӷ��Լ��
ALTER TABLE Employees add 
constraint DF_Employees_EmpGender default('��') for EmpGender,
constraint CK_Employees_EmpAge check(EmpAge>0 and EmpAge<100),
constraint PK_Departments_DepId primary key(DepId)

--Ҳ���Դ������ʱ������Ӷ��Լ��
DROP TABLE Employees
DROP TABLE Departments
create table Employees
(
	EmpId int identity(1,1) primary key,
	EmpName nvarchar(20) not null unique check(len(EmpName)>2 and len(EmpName) < 10),
	EmpGender nchar(1) default('��'),
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