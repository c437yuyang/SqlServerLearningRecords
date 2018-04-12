USE AdventureWorks2008
---------union将不同的查询结果vertical相连
--union会去除重复并重新排列数据,union all直接连接所有

--默认使用第一个的列名

select * from Humanresources.Department
SELECT TOP 2 Name from Humanresources.Department
union all --进行连接的结果必须列数一致才行
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

--上面的做法有点不舒服，总人数要放最后的话，必须按照增序排序才行，因为orderby 只能放到最后，不能再union all前面加order by
--还没找到解决方法，子查询不行，子查询内部不能用orderby order by只能对最终结果排序，之后考虑用row_number来处理

--解决办法:
--先添加行号，利用行号完成自己想要的排序
select t1.*,no = row_number() over(order by t1.部门男性人数 desc)
 from 
(
	SELECT 
	'部门:'+convert(varchar,EmpDepId) as 部门ID,
	部门男性人数=COUNT(EmpGender)
	FROM Employees
	WHERE EmpGender='男'
	GROUP BY EmpDepId
) as t1

--再做成子查询去掉不要的列
select 部门ID,部门男性人数 from --神奇，这里用*和用指定列结果竟然不一样。。是因为自动帮你优化了吗？就是说检测到你并不需要row_number这一列就不执行生成行号的语句了
--select * from 
(
	select t1.*,no = row_number() over(order by t1.部门男性人数 desc)
		 from 
		(
			SELECT 
			'部门:'+convert(varchar,EmpDepId) as 部门ID,
			部门男性人数=COUNT(EmpGender)
			FROM Employees
			WHERE EmpGender='男'
			GROUP BY EmpDepId
		) as t1
) as t2
UNION ALL
SELECT '总男性人数',COUNT(*) FROM --最后添加总计
(SELECT * FROM Employees WHERE EmpGender='男') AS T

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
SELECT 名称='平均年龄',年龄1=avg(EmpAge)*1.0 --可以看到这里列名不一样，但是最终会按照第一个指定的列名来
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