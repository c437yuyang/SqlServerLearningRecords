USE MyFiveDatabase
SELECT * FROM Employees
SELECT * from Departments
--统计不同部门的人数，注意这里NULL也是可以成为一组的
SELECT EmpDepId as 部门ID,
	部门人数=COUNT(*)
	FROM Employees
	GROUP BY EmpDepId
	

SELECT 
	性别=case 
			when empGender='男' then '男'
			when empGender='女' then '女'
			when empGender is null then '人妖'
			end,
	性别人数=COUNT(*)
	FROM Employees
	GROUP BY EmpGender
	
--统计不同部门的男性人数
--使用了聚合函数或分组，则不能出现其他列了，只能出现分组中的列了
SELECT 
	EmpDepId as 部门ID,
	部门男性人数=COUNT(*)
	FROM Employees
	WHERE EmpGender='男'
	GROUP BY EmpDepId
	
--统计不同部门男性人数，增加一列显示部门名称（用到连接查询）
SELECT
	部门ID=t1.EmpDepId,
	部门=t2.DepName,
	部门男性人数=COUNT(*)
from Employees as t1
inner join Departments as t2 on t2.DepId=t1.EmpDepId
WHERE t1.EmpGender='男'
GROUP BY t2.DepName,t1.EmpDepId