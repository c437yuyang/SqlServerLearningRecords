USE AdventureWorks2008
---------union将不同的查询结果vertical相连
--union会去除重复并重新排列数据,union all直接连接所有

--默认使用第一个的列名
SELECT TOP 2 Name from Humanresources.Department
union all
SELECT top 2 [JOBTITLE] from Humanresources.Employee

--通常用于最后加一个计算，比如总数这种
use MyFiveDatabase
SELECT * FROM sys.tables --类似于mysql中的show tables
SELECT *FROM Employees

SELECT 
	'部门:'+convert(varchar,EmpDepId) as 部门ID,
	部门男性人数=COUNT(EmpGender)
	FROM Employees
	WHERE EmpGender='男'
	GROUP BY EmpDepId
UNION ALL
SELECT '总男性人数',COUNT(*) FROM --最后添加总计
(SELECT * FROM Employees WHERE EmpGender='男') AS T
ORDER BY 部门男性人数 desc

SELECT 
	最大年龄=MAX(EmpAge),
	最小年龄=MIN(EmpAge),
	平均年龄=AVG(Empage)*1.0
	FROM Employees
	
SELECT 名称='最大年龄',年龄=MAX(EmpAge)
FROM Employees
UNION ALL
SELECT 名称='最小年龄',年龄=min(EmpAge)
FROM Employees
UNION ALL
SELECT 名称='平均年龄',年龄=avg(EmpAge)*1.0
FROM Employees

---------使用UNION一次向表中插入多条数据
INSERT INTO Employees
select '张三1','男',20,'954222619@qq.com','四川得意',2
UNION ALL
select '张三2','男',20,'954222619@qq.com','四川得意',2
UNION ALL
select '张三3','男',20,'954222619@qq.com','四川得意',2
UNION ALL
select '张三4','男',20,'954222619@qq.com','四川得意',2