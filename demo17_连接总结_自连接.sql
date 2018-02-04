--http://blog.csdn.net/jiuqiyuliang/article/details/10474221
--其实连接一共三种:交叉连接(cross join)，内连接(inner join)，外连接(outer join)


-----自连接表重复了必须要给表起别名，所以自连接其实就是连接的特例
-----对同一个表进行连接就是自连接(不管是哪种类型的连接)
SELECT 
	* 
	from TblArea as t1,
	TblArea as t2  --笛卡尔积
--简单一点:
select * from tblsTudent,tblClass
select * from tblsTudent cross join tblClass --笛卡尔积其实应该叫做交叉连接
	

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