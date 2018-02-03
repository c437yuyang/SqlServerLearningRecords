-----自连接表重复了必须要给表起别名
SELECT 
	* 
	from TblArea as t1,
	TblArea as t2  --笛卡尔积

--显示每个城市的省份名称
SELECT
	t1.AreaId,
	t2.AreaName as 省份名称,
	t1.AreaName as 市名称
	from
	TblArea as t1 inner join TblArea as t2 
	ON t1.AreaPId=t2.AreaId --笛卡尔积
	ORDER BY 省份名称

delete FROM Employees WHERE EmployeeID=10

---------------------练习  显示每个员工的上司
SELECT * FROM Employees

SELECT 
	t1.EmployeeID,
	t1.FirstName,
	上司ID=t2.EmployeeID,
	上司=t2.FirstName
	from Employees as t1 inner join Employees as t2
	ON (t1.ReportsTo=t2.EmployeeID)
UNION ALL
SELECT 
	EmployeeID,
	FirstName,
	上司ID=NULL,
	上司=null
	from Employees 
	where ReportsTo IS NULL 