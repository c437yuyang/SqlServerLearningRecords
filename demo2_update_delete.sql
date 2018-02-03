use MySecondDatabase

--CTRL+R打开和关闭查询窗口

--update 表明 set 列1=新值,列2=新值,...where 条件
--若不加where则是对表中所有的数据都进行修改
select * from Employees
update Employees set EmpName='张五',empAge=empAge-1 where empName = '张三'


--delete语句
--delete from employees 不加条件代表删除所有数据,但是表还在,和drop table不同
delete from Employees where EmpName='张五'

--truncate table biaoming 语句，也可以删除表中的全部数据,建议使用这个语句,
--效率更高(因为记录的日志更少,ldf文件),而且无法设置条件，并且自动把自动编号恢复初始
--truncate不会触发delete触发器

SELECT * from tblImage
UPDATE TblImage SET im_path=REPLACE(im_path,'E:/','C:/')

select REPLACE('E:/aaa','E:/','C:/')