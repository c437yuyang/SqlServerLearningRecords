USE AdventureWorks2008
---------union����ͬ�Ĳ�ѯ���vertical����
--union��ȥ���ظ���������������,union allֱ����������

--Ĭ��ʹ�õ�һ��������

select * from Humanresources.Department
SELECT TOP 2 Name from Humanresources.Department
union all --�������ӵĽ����������һ�²���
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

--����������е㲻�����������Ҫ�����Ļ������밴������������У���Ϊorderby ֻ�ܷŵ���󣬲�����union allǰ���order by
--��û�ҵ�����������Ӳ�ѯ���У��Ӳ�ѯ�ڲ�������orderby order byֻ�ܶ����ս������֮������row_number������

--����취:
--������кţ������к�����Լ���Ҫ������
select t1.*,no = row_number() over(order by t1.������������ desc)
 from 
(
	SELECT 
	'����:'+convert(varchar,EmpDepId) as ����ID,
	������������=COUNT(EmpGender)
	FROM Employees
	WHERE EmpGender='��'
	GROUP BY EmpDepId
) as t1

--�������Ӳ�ѯȥ����Ҫ����
select ����ID,������������ from --���棬������*����ָ���н����Ȼ��һ����������Ϊ�Զ������Ż����𣿾���˵��⵽�㲢����Ҫrow_number��һ�оͲ�ִ�������кŵ������
--select * from 
(
	select t1.*,no = row_number() over(order by t1.������������ desc)
		 from 
		(
			SELECT 
			'����:'+convert(varchar,EmpDepId) as ����ID,
			������������=COUNT(EmpGender)
			FROM Employees
			WHERE EmpGender='��'
			GROUP BY EmpDepId
		) as t1
) as t2
UNION ALL
SELECT '����������',COUNT(*) FROM --�������ܼ�
(SELECT * FROM Employees WHERE EmpGender='��') AS T

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
SELECT ����='ƽ������',����1=avg(EmpAge)*1.0 --���Կ�������������һ�����������ջᰴ�յ�һ��ָ����������
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