
use MyFiveDatabase

SELECT * FROM Employees
SELECT * FROM Employees_BACKUP

drop table Employees_BACKUP1
drop table Employees_BACKUP2
drop table Employees_BACKUP

--将表Employees拷贝到Employees_BACKUP（表必须先不存在，或者说不能重复执行）中，但是约束不会拷贝
SELECT * INTO Employees_BACKUP FROM Employees --主键也是约束，也不会拷贝，拷贝过去就只有数据

--只拷贝表结构，不拷贝任何一条数据
DROP TABLE Employees_BACKUP
SELECT top 0 * INTO Employees_BACKUP1 FROM Employees --这样也是没有约束的
SELECT * INTO Employees_BACKUP2 FROM Employees WHERE 1<>1 --这样也可以，不过性能低
--所以真的要拷贝一个表的话，最好还是让软件生成create语句(这样语句都是带约束的)，然后直接替换中间的名字

-----原来表已经存在，追加记录
SELECT * FROM Employees_BACKUP1
INSERT INTO Employees_BACKUP1 --其实就是用子查询语句作为返回值了，只是少了insert into的values关键字
	SELECT 
		EmpName,EmpGender,EmpAge,EmpEmail,EmpAddress,EmpDepId FROM Employees
		WHERE EmpGender='女'


---错误示范
-- 不能用*因为，ID列是主键，需要IDENTITY_INSERT 为 ON才能这样添加
SELECT * FROM Employees_BACKUP2
INSERT INTO Employees_BACKUP2
	SELECT 
		* 
		FROM Employees 
		WHERE EmpGender='女'