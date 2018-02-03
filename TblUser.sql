CREATE table [user]
(
	uId int identity(1,1) primary key,
	name nvarchar(50),
	level int
)

INSERT into [user] values('张飞1',1)
INSERT into [user] values('张飞2',2)
INSERT into [user] values('张飞3',3)
SELECT * FROM [user]

--相当于c#的if
SELECT 
	*,头衔=CASE 
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
	*,评分=CASE
		WHEN tEnglish IS NULL THEN '缺考'
		WHEN tEnglish<60 THEN '不及格'
		WHEN tEnglish>=60 AND tEnglish<80 THEN '及格'
		WHEN tEnglish>=80 AND tenglish<90 THEN '良好'
		ELSE '优秀'
		END
FROM TblScore

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

SELECT 第一列=CASE
				WHEN A > B THEN A
				ELSE B
				END				
		,第二列=case
				when B>C THEN B
				ELSE C
				END				
FROM TestA

SELECT * from MyOrders