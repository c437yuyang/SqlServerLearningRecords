-----�����ӱ��ظ��˱���Ҫ���������
SELECT 
	* 
	from TblArea as t1,
	TblArea as t2  --�ѿ�����

--��ʾÿ�����е�ʡ������
SELECT
	t1.AreaId,
	t2.AreaName as ʡ������,
	t1.AreaName as ������
	from
	TblArea as t1 inner join TblArea as t2 
	ON t1.AreaPId=t2.AreaId --�ѿ�����
	ORDER BY ʡ������

delete FROM Employees WHERE EmployeeID=10

---------------------��ϰ  ��ʾÿ��Ա������˾
SELECT * FROM Employees

SELECT 
	t1.EmployeeID,
	t1.FirstName,
	��˾ID=t2.EmployeeID,
	��˾=t2.FirstName
	from Employees as t1 inner join Employees as t2
	ON (t1.ReportsTo=t2.EmployeeID)
UNION ALL
SELECT 
	EmployeeID,
	FirstName,
	��˾ID=NULL,
	��˾=null
	from Employees 
	where ReportsTo IS NULL 