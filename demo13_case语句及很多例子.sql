-------case语句用于灵活的控制每一个位置显示什么内容
-------(或者用于自己增加一个列或几个列控制具体显示什么（这一点上比连接查询更灵活但是也会麻烦一点）)
USE MyFiveDatabase
CREATE table [user]
(
	uId int identity(1,1) primary key,
	name nvarchar(50),
	level int
)

INSERT into [user] values('张飞1',1)
INSERT into [user] values('张飞2',2)
INSERT into [user] values('张飞3',3)
INSERT into [user] values('张飞4',4)
SELECT * FROM [user]

--相当于c#的if(推荐使用这一种)
SELECT 
	*,
	头衔=CASE 
			WHEN level=1 THEN '菜鸟'
			WHEN level=2 THEN '老鸟'
			WHEN level=3 THEN '大师'
			ELSE '骨灰'
			end
FROM [user]


--类似于c#的switch
SELECT 
	*,头衔=CASE [level]
			WHEN 1 THEN '菜鸟'
			WHEN 2 THEN '老鸟'
			WHEN 3 THEN '大师'
			ELSE '骨灰' --数据类型必须还得统一(因为要放到同一列)
			END		
FROM [user]

use itcast2014
SELECT * from TblScore

SELECT 
	*,
	评分=CASE
		WHEN tEnglish IS NULL THEN '缺考'
		WHEN tEnglish<60 THEN '不及格'
		WHEN tEnglish>=60 AND tEnglish<80 THEN '及格'
		WHEN tEnglish>=80 AND tenglish<90 THEN '良好'
		ELSE '优秀'
		END
FROM TblScore

select 
*,
英语评分 = case
				WHEN tEnglish IS NULL THEN '缺考'
				when tEnglish < 60 then '不及格'
				when tEnglish >= 60 and tEnglish < 80 then '良好'
				when tEnglish >=80 then '优秀' 
				end
				,			
数学评分 = case
				WHEN tMath IS NULL THEN '缺考'
				when tMath < 60 then '不及格'
				when tMath >= 60 and tMath < 80 then '良好'
				when tMath >=80 then '优秀' 
				end
				--,
--总评分 = case --总评分不能直接用 case产生的列来做，只能用现有的列来做
--				WHEN 数学评分=='优秀' and 英语评分=='优秀'
--				end				
from TblScore

CREATE table TestA
(
	A int,
	B int,
	C int
)

INSERT into TestA values(20,30,10)
INSERT into TestA values(30,10,20)
INSERT into TestA values(10,20,30)

SELECT * FROM TestA

SELECT	AB最大值=CASE
				WHEN A > B THEN A
				ELSE B
				END				
		,BC最大值=case
				when B > C THEN B
				ELSE C
				END				
FROM TestA

SELECT * from MyOrders


SELECT 
	销售员
	FROM MyOrders
	GROUP BY 销售员

--统计每个销售员的销售数量并给与头衔
SELECT 
	销售员,
	总金额=SUM(销售价格*销售数量),
	称号=CASE
		WHEN SUM(销售价格*销售数量)>6000 THEN '金牌'
		WHEN SUM(销售价格*销售数量)>5000 THEN '银牌'
		WHEN SUM(销售价格*销售数量)>2000 THEN '铜牌'
		ELSE '普通'
		END
	FROM MyOrders
	GROUP BY 销售员
	
---------------练习，把金额正负显示未收入和支出两列
create table TestB
(
	单号 varchar(10),
	金额 int
)

INSERT into TestB values('Rk1',10)
INSERT into TestB values('Rk2',20)
INSERT into TestB values('Rk3',-30)
INSERT into TestB values('Rk4',-10)

SELECT * FROM TestB

SELECT 单号
		,收入=CASE
				WHEN 金额>0 THEN 金额
				WHEN 金额<0 THEN 0
				end	
		,支出=case
				when 金额>0 then 0
				when 金额<0 then -金额 --或abs(金额)
				end
from TestB

----case语句联合group by分组使用
--------------统计各个球队胜利失败场次----------------------------------
SELECT * from TeamScore

SELECT
	球队名称=teamName,
	胜=	sum(CASE
				WHEN gameResult='胜' then 1
				ELSE 0
			end),
	负=	sum(CASE
				WHEN gameResult='负' then 1
				ELSE 0
			end)
from TeamScore
GROUP BY teamName
order by 胜
desc

-----------------------------------------------------
--或用count函数,不统计空值
SELECT
	球队名称=teamName,
	胜=count(CASE
			WHEN gameResult='胜' then 1
			ELSE NULL
		end),
	负=count(CASE
		WHEN gameResult='负' then 1
		ELSE NULL
	end)
from TeamScore
GROUP BY teamName

------------统计各个球队不同赛季得分-------------
SELECT * FROM NBAScore

SELECT  --先实现这样的效果
	teamName,
	第1赛季得分=CASE
				WHEN seasonName='第1赛季' THEN Score
				ELSE NULL
			END,
	第2赛季得分=CASE
				WHEN seasonName='第2赛季' THEN Score
				ELSE NULL
			END,
	第3赛季得分=CASE
				WHEN seasonName='第3赛季' THEN Score
				ELSE NULL
			END
from NBAScore

-------再分组--------------
SELECT 
	teamName,
	第1赛季得分=sum(CASE
				WHEN seasonName='第1赛季' THEN Score
				ELSE NULL
			END),
	第2赛季得分=sum(CASE
				WHEN seasonName='第2赛季' THEN Score
				ELSE NULL
			END),
	第3赛季得分=sum(CASE
				WHEN seasonName='第3赛季' THEN Score
				ELSE NULL
			END)
from NBAScore
GROUP BY teamName


--查询每个学生的每一科成绩
-----------------------------------
SELECT * FROM StudentScore
SELECT 
	studentId,
		语文=max(case
			WHEN courseName='语文' THEN score
			else NULL
			END),
		数学=max(case
			WHEN courseName='数学' THEN score
			else NULL
			END),
		英语=max(case
			WHEN courseName='英语' THEN score
			else NULL
			END)

from StudentScore
GROUP BY studentId





--------------------------------------------------
--每个销售员总共销售可口可乐的数量
SELECT
销售员,
销售可口可乐数量=SUM(销售数量)
from MyOrders 
where 商品名称='可口可乐'
group by 销售员


--统计每种商品每个销售员的销售数量
SELECT
	商品名称,商品编号,
	王大销售数量=sum(CASE
					WHEN 销售员='王大' THEN 销售数量
					ELSE NULL
					END),
	刘七销售数量=sum(CASE
					WHEN 销售员='刘七' THEN 销售数量
					ELSE NULL
					END),
	张三销售数量=sum(CASE
					WHEN 销售员='张三' THEN 销售数量
					ELSE NULL
					END),
	李四销售数量=sum(CASE
					WHEN 销售员='李四' THEN 销售数量
					ELSE NULL
					END),
	赵五销售数量=sum(CASE
					WHEN 销售员='赵五' THEN 销售数量
					ELSE NULL
					END)
from MyOrders
GROUP BY 商品名称,商品编号 --group by可以有两个分支


SELECT
	商品名称,
	王大销售数量=sum(CASE
					WHEN 销售员='王大' THEN 销售数量
					ELSE NULL
					END),
	刘七销售数量=sum(CASE
					WHEN 销售员='刘七' THEN 销售数量
					ELSE NULL
					END),
	张三销售数量=sum(CASE
					WHEN 销售员='张三' THEN 销售数量
					ELSE NULL
					END),
	李四销售数量=sum(CASE
					WHEN 销售员='李四' THEN 销售数量
					ELSE NULL
					END),
	赵五销售数量=sum(CASE
					WHEN 销售员='赵五' THEN 销售数量
					ELSE NULL
					END)
from MyOrders
GROUP BY 商品名称