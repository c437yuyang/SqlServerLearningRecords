USE AdventureWorks2008
---------union����ͬ�Ĳ�ѯ���vertical����
--union��ȥ���ظ���������������,union allֱ����������

--Ĭ��ʹ�õ�һ��������
SELECT TOP 2 Name from Humanresources.Department
union all
SELECT top 2 [JOBTITLE] from Humanresources.Employee

--ͨ����������һ�����㣬������������
use MyFiveDatabase
SELECT * FROM sys.tables --������mysql�е�show tables
SELECT *FROM Employees

SELECT 
	'����:'+convert(varchar,EmpDepId) as ����ID,
	������������=COUNT(EmpGender)
	FROM Employees
	WHERE EmpGender='��'
	GROUP BY EmpDepId
UNION ALL
SELECT '����������',COUNT(*) FROM --�������ܼ�
(SELECT * FROM Employees WHERE EmpGender='��') AS T
ORDER BY ������������ desc

SELECT 
	�������=MAX(EmpAge),
	��С����=MIN(EmpAge),
	ƽ������=AVG(Empage)*1.0
	FROM Employees
	
SELECT ����='�������',����=MAX(EmpAge)
FROM Employees
UNION ALL
SELECT ����='��С����',����=min(EmpAge)
FROM Employees
UNION ALL
SELECT ����='ƽ������',����=avg(EmpAge)*1.0
FROM Employees

---------ʹ��UNIONһ������в����������
INSERT INTO Employees
select '����1','��',20,'954222619@qq.com','�Ĵ�����',2
UNION ALL
select '����2','��',20,'954222619@qq.com','�Ĵ�����',2
UNION ALL
select '����3','��',20,'954222619@qq.com','�Ĵ�����',2
UNION ALL
select '����4','��',20,'954222619@qq.com','�Ĵ�����',2