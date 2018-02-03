--create database MyFirstDatabase;
--drop database [MyFirstDatabase];

--�������ݿ�
create database MyFourDatabase
on primary(
	name = 'MyFourDatabase',--�߼�����
	filename = 'C:\MySqlServerData\MyFourDatabase.mdf',
	size=5MB,
	maxsize=150mb,
	filegrowth=20%
)
log on 
(
	--��־�ļ�ѡ��
	name = 'MyFourDatabase',
	filename = 'C:\MySqlServerData\MyFourDatabase_log.mdf',
	size=4096KB, --��дСдһ����
	filegrowth=20%
)

--����һ����
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

----------------------------------------------����в�������

--insert into (col1,col2)���������Զ�����в���ֵ
insert into Departments(DepartmentName) values('������')
insert into Departments(DepartmentName) values('��Ʋ�')
select * from Departments

insert into Employees
(EmpIDCard,EmpName,EmpGender,EmpJoinDate,EmpAge,EmpDeptID,EmpPhone)
values('123456789123456789','����','��','2016-7-12',20,1,'12345678912')

insert into Employees --���Բ�Ҫ�����б�,��Ĭ�ϳ����Զ������
values('123456789123456788','����','Ů','2016-7-11',19,2,'12345678913') --bit���ʹ���1���Զ�Ϊ1��
select * from Employees;

insert into Employees --���벿���е�ֵ(��Ҫ�ڲ�����ָ�����)
(EmpIDCard,EmpGender,EmpDeptID,EmpPhone)
values('123456789123456781',0,1,'12345678912')

--���Զ���ŵ��в���ֵ
set identity_insert Departments on --ǿ�Ʋ���ָ�����
insert into Departments(DepId,DepName)
values(500,'���Բ�')
set identity_insert Departments off
select * from Departments --����֮�����Զ�����Ļ��ǽ���500����

insert into Employees --��N��ֹ������Ϊ��������������������룬�򵥵�˵����SQL�������ĵ����ʹ�һ��N
values('123456789123456788',N'�Ŷ�',2,'2016-7-11',22,'��','12345678920')
select * from Employees;