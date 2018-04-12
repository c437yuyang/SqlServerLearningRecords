--------------------子查询:即在一个查询的结果上进行查询
USE Itcast2014
--仅查询高二二班的所有学生
SELECT * FROM TblClass
SELECT * from TblStudent 

--嵌套子查询
SELECT * from TblStudent WHERE tSClassId = --这里用where in 也可以的
(SELECT tClassId FROM TblClass where tClassName='高二二班')

SELECT *,班级='高二二班' from TblStudent WHERE tSClassId=
(SELECT tClassId FROM TblClass where tClassName='高二二班')

SELECT * 
	from TblStudent as ts
	INNER JOIN TblClass as tc 
	on ts.tSClassId = tc.tClassId
	WHERE tc.tClassName='高二二班' ----使用连接查询也可以实现，但是上面的效率高一些(不涉及笛卡尔积)

---------------相关子查询
SELECT * 
	from TblStudent as ts 
	WHERE EXISTS
		(SELECT * 
			from TblClass as tc 
			WHERE ts.tSClassId = tc.tClassId AND tc.tClassName='高二二班')

--相关子查询的执行依赖于外部查询。多数情况下是子查询的WHERE子句中引用了外部查询的表。执行过程：

--（1）从外层查询中取出一个元组，将元组相关列的值传给内层查询。

--（2）执行内层查询，得到子查询操作的值。

--（3）外查询根据子查询返回的结果或结果集得到满足条件的行。

--（4）然后外层查询取出下一个元组重复做步骤1-3，直到外层的元组全部处理完毕。 

--查询年龄大于自己班级平均年龄的学生姓名
select * from tblstudent t1 where t1.tsage>
(
	select avg(t2.tsage) from tblstudent t2 
		where t1.tSClassId=t2.tSClassid
)

--每个班的平均年龄
select 
tsClassId,平均age=avg(tsAge)
from tblStudent
group by tsClassId

--子查询分为嵌套子查询和相关子查询
--具体请看https://www.cnblogs.com/ziyandeyanhuo/p/7877519.html
--嵌套子查询:子查询的执行不依赖于外部的查询，
--相关子查询:子查询的执行要依赖于外部查询。多数情况下是子查询的WHERE子句中引用了外部查询的表



--------------------------使用top实现分页查询(有分页一定要有排序)

SELECT * from Customers
--每页显示7条数据

--第一页
SELECT 
	TOP 7 
	* from Customers 
	order BY CustomerID 
	asc
	

--请查询出前两页的数据
SELECT 
	TOP (7*2) 
	* from Customers 
	order BY CustomerID 
	asc

--第二页
--2.1先查询出对（2-1）页的数据ID
SELECT 
	TOP (7*1) 
	* from Customers 
	WHERE CustomerID NOT in
	(
		(--已经看过的(第一页的)数据的ID
			SELECT 
				top (7*(2-1))
				CustomerId 
				from Customers 
				ORDER BY CustomerID 
				ASC
		) 
	) 
	ORDER BY CustomerID 
	ASC
 
--第五页
SELECT TOP (7*1) * from Customers WHERE CustomerID NOT in
(
	(--已经看过的(第一页的)数据的ID
		SELECT top (7*(5-1)) CustomerId 
		from Customers ORDER BY CustomerID ASC
	) 
) ORDER BY CustomerID ASC

select * from tblstudent
--选出第5到7条记录
select top 3 * from tblstudent where tsid not in (select top 4 tsid from tblstudent)
--另一种方法，先正序拿到前7个，再逆序拿前三个
select top 3 * from tblstudent where tsid in (
	select top 7 tsid from tblstudent order by tsid asc
) order by tsid desc --但是这样是逆序的
--因此再套一层,变成正序
select * from 
(
	select top 3 * from tblstudent where tsid in (
		select top 7 tsid from tblstudent order by tsid asc
	) order by tsid desc
) t2 order by t2.tsid asc

------------------------使用row_number()实现分页(缺点是必须自己指明列名，不然会多一行row_number)
--1.为数据排序,然后编号
--2.根据用户需求查看其中几条

--over里面的order by指明行编号的生成顺序，最后的order by指明最终排序
SELECT
	*,
	编号=ROW_NUMBER() OVER(ORDER BY CustomerID) 
	from Customers 
	ORDER BY 编号 --其实最后的这个可以不要了，前面只要order by了，数据就已经是按照over里面指定的排序的了，如果需要按照其他列排序才重新制定
	asc
	
--每页显示七条,查看第八爷
--从(8-1)*7+1 to 8*7
SELECT * FROM
(
	SELECT	*,
			编号=ROW_NUMBER() OVER(ORDER BY CustomerID ASC)
	from Customers
) as t
where t.编号 between (8-1)*7+1 and 8*7 -- AND sys.columns!='编号'  


SELECT * FROM MyStudent

SELECT * FROM
(
	SELECT	*,
			编号=ROW_NUMBER() OVER(ORDER BY Fid ASC)
	from MyStudent
) as t
where t.编号 between (11-1)*10+1 and 11*10


--partition by
--partition  by关键字是分析性函数的一部分，它和聚合函数（如group by）不同的地方在于它能返回一个分组中的多条记录，而聚合函数一般只有一条反映统计值的记录，
--partition  by用于给结果集分组，如果没有指定那么它把整个结果集作为一个分组。
--partition by 与group by不同之处在于前者返回的是分组里的每一条数据，并且可以对分组数据进行排序操作。后者只能返回聚合之后的组的数据统计值的记录。
SELECT
	*,
	编号=ROW_NUMBER() OVER(partition by city ORDER BY CustomerID) --这时order by 就是按照partition后的数据排序的了，并且是对partition得到的不同组分别内部进行排序，不会组间排序
	from Customers 