USE MyFiveDatabase
select *from Employees
--where对分组前的数据进行筛选，having对分组后的数据进行筛选
--where不能用聚合函数，是对每一条进行判断的，having不能对每一条记录筛选，只能使用聚合函数

--找部门男性人数大于1的部门
SELECT 
	EmpDepId as 部门ID,
	部门男性人数=COUNT(EmpGender)
	FROM Employees
	WHERE EmpGender='男'
	GROUP BY EmpDepId
	HAVING COUNT(EmpGender)>1


--练习
USE Itcast2014

SELECT * from MyOrders
SELECT 
	商品名称,
	SUM(销售数量) as 销售数量
	FROM MyOrders
	group BY 商品名称
	order BY 销售数量 DESC
	
--找销售总价大于3000的商品
SELECT 
	商品名称,
	SUM(销售数量*销售价格) as 销售总价
	FROM MyOrders
	GROUP BY 商品名称
	HAVING SUM(销售数量*销售价格) > 3000 --只要销售总价大于3000的
	ORDER BY 销售总价 DESC
	
--找购买可口可乐大于20的人
SELECT
	购买人,
	购买可口可乐数量 = sum(销售数量)
	FROM MyOrders
	WHERE 商品名称='可口可乐'
	group BY 购买人
	having  sum(销售数量)>20 --这里不能用 购买可口可乐数量 作为名字
	ORDER BY 购买可口可乐数量 DESC