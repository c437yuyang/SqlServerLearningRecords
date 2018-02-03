TRUNCATE table departments
INSERT INTO Departments VALUES('设计部')
INSERT INTO Departments VALUES('摄影部')
INSERT INTO Departments VALUES('伙食部')
SELECT * FROM Departments

TRUNCATE table employees
INSERT INTO Employees VALUES('张三一','男',20,'954222619@qq.com','四川得意',2)
INSERT INTO Employees VALUES('张三三','男',22,'954222639@qq.com','四川阿萨飒飒',1)
INSERT INTO Employees VALUES('张三二','女',23,'954222629@qq.com','倒萨倒萨大是否',2)
INSERT INTO Employees VALUES('张三死','女',23,'954222629@qq.com','倒萨倒萨大是否',2)
INSERT INTO Employees VALUES('张三撒','女',23,'954222629@qq.com','倒萨倒萨大是否',2)
INSERT INTO Employees VALUES('张三东方卫视','女',23,'954222629@qq.com','倒萨倒萨大是否',2)
INSERT INTO Employees VALUES('张飒服务','女',24,'954222622@qq.com','撒旦撒旦萨法上午',1)
INSERT INTO Employees VALUES('张电视大赛','女',25,'954222622@qq.com','撒旦撒旦分五个',3)
INSERT INTO Employees VALUES('张三三','男',22,'954222639@qq.com','四川阿萨飒飒',1)

INSERT INTO Employees VALUES('热恶烷三','男',22,'954222639@qq.com','四川阿萨飒飒',1)
INSERT INTO Employees VALUES('俄方分','男',25,'954222622@qq.com','撒旦撒旦分五个',3)

INSERT INTO Employees VALUES('股份我国','男',25,'954222622@qq.com','撒旦撒旦分五个',3)
INSERT INTO Employees VALUES('股份我国5','男',25,'954222622@qq.com','撒旦撒旦分五个',2)
INSERT INTO Employees VALUES('股份我国1','男',36,'954222622@qq.com','撒旦撒旦分五个',2)
INSERT INTO Employees VALUES('股份我国2','男',29,'954222622@qq.com','撒旦撒旦分五个',2)
INSERT INTO Employees VALUES('股份我国3','男',16,'954222622@qq.com','撒旦撒旦分五个',2)
INSERT INTO Employees VALUES('股份我国4','男',15,'954222622@qq.com','撒旦撒旦分五个',2)
SELECT * FROM Employees
SELECT * FROM Employees WHERE empDepId=2
SELECT empId,empName FROM Employees

SELECT 
	empName as 名称,
	EmpGender as 性别,
	EmpId as '序号'
FROM Employees 

--也可以不要as,有特殊符号用''
SELECT 
	empName 名称,
	EmpGender 性别,
	EmpId '(序号)'
FROM Employees 

--也可以用等号,不过前后顺序注意和as是反的
SELECT 
	名称=EmpName,
	性别=EmpGender,
	序号=EmpId
FROM Employees 

SELECT 
	empName as 名称,
	EmpGender as 性别,
	EmpId as '序号',
	'否' as 婚否 --也可以自己加一列
FROM Employees 


--select也可以单独使用
SELECT 当前系统时间=GETDATE()

SELECT
	班长='验收为',
	班草='哈哈'
	
	
--针对已经查询到的结果去除重复(针对某一行来说的,就是说只要一行组合起来不是重复即可)
SELECT DISTINCT * FROM Employees
SELECT DISTINCT empName FROM Employees  --查看empname有哪些

--排序
SELECT * FROM Employees ORDER BY EmpAge DESC
SELECT * FROM Employees ORDER BY 1 DESC  --也可以按照第一列排序，这个序号是*里面的第1列，就是指定的那些列的指定列
SELECT * FROM Employees ORDER BY EmpAge ASC --默认就是升序排序
update Employees set empage=20 where EmpID=3
SELECT top 2 * FROM Employees ORDER BY EmpAge ASC
SELECT top (1*2) * FROM Employees ORDER BY EmpAge ASC --可加表达式(带括号)
SELECT top 34 PERCENT * FROM Employees ORDER BY EmpAge ASC --可加表达式(百分比都是向上取整)

----------聚合函数(max,min,avg,sum,count)
SELECT SUM(EmpAge) as 年龄总和 FROM Employees
SELECT COUNT(*) as 记录数 FROM Employees
SELECT COUNT(1) as 记录数 FROM Employees
--SELECT 平均年龄=
--	(SELECT SUM(EmpAge) as 年龄总和 FROM Employees)*1.0 / --*1.0变成实数
--	(SELECT COUNT(*) as 记录数 FROM Employees)
SELECT 平均年龄=
	(SELECT SUM(EmpAge) FROM Employees)*1.0 / --*1.0变成实数
	(SELECT COUNT(*) FROM Employees)

SELECT MAX(EmpAge) as 最大年龄 FROM Employees
SELECT MIN(EmpAge) as 最大年龄 FROM Employees
SELECT AVG(EmpAge*1.0) as 最大年龄 FROM Employees

-----------聚合函数的一些问题
--聚合函数不统计空值


---带条件的查询
UPDATE Employees SET EmpAge=26 WHERE EmpId=5
SELECT * FROM Employees WHERE EmpAge<24
SELECT * FROM Employees WHERE EmpAge BETWEEN 20 AND 23 --BETWEEn用法
SELECT * FROM Employees WHERE EmpAge IN (23,20,26) --也可以用In,更简单,但是性能其实不如用between and 或者where+条件

--模糊查询
--_下划线代表一个字
SELECT * FROM Employees WHERE EmpName LIKE '张__'

--%百分号是通配符
SELECT * FROM Employees WHERE EmpName LIKE '张%'
SELECT * FROM Employees WHERE EmpName LIKE '张%' and LEN(EmpName)=3

UPDATE Employees set EmpName=REPLACE(EmpName,'张',' ')
SELECT * FROM Employees
SELECT * FROM Employees WHERE EmpName LIKE '三[0-9]' --数字或字母
SELECT * FROM Employees WHERE EmpName LIKE '三[0-9a-z]' --数字或字母
SELECT * FROM Employees WHERE EmpName LIKE '张三[^a-z]' --取非
SELECT * FROM Employees WHERE EmpName LIKE '张三[%]' --查询带特殊字符的,如%，用[]转义


UPDATE Employees set EmpGender=NULL WHERE EmpAge=20
--------------空值处理
--用 is null 或 is not null

SELECT * FROM Employees WHERE EmpGender IS NULL
SELECT * FROM Employees WHERE EmpGender IS not NULL
SELECT * FROM Employees WHERE EmpGender<>'男' --<>表示不等于
SELECT * FROM Employees WHERE EmpGender<>NULL --这样查不到

SELECT 工资=2000+NULL --任何值和null进行计算都是null，所以在计算前一定要先判断是不是null


--order by 其他注意事项
--1.必须放到最后order by
--2.根据多列进行排序，order by a desc,b asc 则当a相同再比较b
--3.也可以按表达式进行排序
SELECT * FROM Employees ORDER BY (len(EmpName)+LEN(EmpAddress))



---count(1)和count(*)的区别
SELECT * from Employees
select COUNT(*) from Employees --找到最短的一列进行count()
select *,1 from Employees --加一列1
SELECT COUNT(1) from Employees --所有下面这个是对增加的一列1进行count，所以更快