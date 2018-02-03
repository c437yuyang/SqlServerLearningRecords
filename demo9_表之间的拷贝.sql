
use MyFiveDatabase

SELECT * FROM Employees
SELECT * FROM Employees_BACKUP

drop table Employees_BACKUP1
drop table Employees_BACKUP2
drop table Employees_BACKUP

--将表Employees拷贝到Employees_BACKUP（表必须先不存在，或者说不能重复执行）中，但是约束不会拷贝
SELECT * INTO Employees_BACKUP FROM Employees

--只拷贝表结构，不拷贝任何一条数据
DROP TABLE Employees_BACKUP1
SELECT top 0 * INTO Employees_BACKUP2 FROM Employees
SELECT * INTO Employees_BACKUP1 FROM Employees WHERE 1<>1 --这样也可以，不过性能低

-----原来表已经存在，追加记录
SELECT * FROM Employees_BACKUP1
INSERT INTO Employees_BACKUP1
	SELECT EmpName,EmpGender,EmpAge,EmpEmail,EmpAddress,EmpDepId FROM Employees
WHERE EmpGender='女'


---错误示范
-- 不能用*因为，ID列是主键，需要IDENTITY_INSERT 为 ON才能这样添加
SELECT * FROM Employees_BACKUP2
INSERT INTO Employees_BACKUP2
	SELECT * FROM Employees 
WHERE EmpGender='女'