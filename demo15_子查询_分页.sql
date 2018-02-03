--------------------子查询:即在一个查询的结果上进行查询
USE Itcast2014
--仅查询高二二班的所有学生
SELECT * FROM TblClass
SELECT * from TblStudent 

SELECT * from TblStudent WHERE tSClassId=
(SELECT tClassId FROM TblClass where tClassName='高二二班')

SELECT *,班级='高二二班' from TblStudent WHERE tSClassId=
(SELECT tClassId FROM TblClass where tClassName='高二二班')

SELECT * 
	from TblStudent as ts
	INNER JOIN TblClass as tc 
	on ts.tSClassId = tc.tClassId
	WHERE tc.tClassName='高二二班' ----使用连接查询也可以实现，但是上面的效率貌似高一些

---------------相关子查询
SELECT * 
	from TblStudent as ts 
	WHERE EXISTS
		(SELECT * 
			from TblClass as tc 
			WHERE ts.tSClassId = tc.tClassId AND tc.tClassName='高二二班')


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


------------------------使用row_number()实现分页(缺点是必须自己指明列名，不然会多一行row_number)
--1.为数据排序,然后编号
--2.根据用户需求查看其中几条

--over里面的order by指明行编号的生成顺序，最后的order by指明最终排序
SELECT
	*,
	编号=ROW_NUMBER() OVER(ORDER BY CustomerID ASC) 
	from Customers 
	ORDER BY 编号 
	asc
	
--每页显示七条,查看第八爷
--从(8-1)*7+1 to 8*7
SELECT * FROM
(
	SELECT	*,
			编号=ROW_NUMBER() OVER(ORDER BY CustomerID ASC)
	from Customers
)
as t
where t.编号 between (8-1)*7+1 and 8*7 -- AND sys.columns!='编号'  


SELECT * FROM MyStudent

SELECT * FROM
(
	SELECT	*,
			编号=ROW_NUMBER() OVER(ORDER BY Fid ASC)
	from MyStudent
)
as t
where t.编号 between (11-1)*10+1 and 11*10
