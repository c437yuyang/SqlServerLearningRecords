--视图就是一个虚拟表，只能存查询语句 并且不能传参数

SELECT
	t1.AreaId,
	t2.AreaName as 省份名称,
	t1.AreaName as 市名称
	from
	TblArea as t1 
	inner join TblArea as t2 
	ON t1.AreaPId=t2.AreaId --笛卡尔积

--视图里如果有重名一定要起别名,否则之后在查询的时候(查的就是视图的列就会冲突了)
CREATE view vw_tblArea
as 
	SELECT
		t1.AreaId,
		t2.AreaName as 省份名称,
		t1.AreaName as 市名称
		from
		TblArea as t1 inner join TblArea as t2 
		ON t1.AreaPId=t2.AreaId --笛卡尔积

--之后就跟查询表一样
SELECT * FROM vw_tblArea

SELECT * FROM vw_tblArea where AreaId>400