--left join(左联接) 返回包括左表中的所有记录和右表中联结字段相等的记录，保留左表所有记录，如果右表对应字段没有相应记录则为null
--right join(右联接) 返回包括右表中的所有记录和左表中联结字段相等的记录
--inner join(等值连接) 只返回两个表中联结字段相等的行
--http://blog.csdn.net/u010300947/article/details/37814513 ,可以看这个博客，写的比较清楚

SELECT * from TblStudent
SELECT * FROM TblScore

--查询参加考试的学生的成绩，因为参加考试的话，必须两张表都有记录，因此用inner join
SELECT
	t1.tSName,
	t1.tSAge,
	t2.tEnglish,
	t2.tMath
from TblStudent as t1
INNER JOIN TblScore as t2 
on t1.tSId=t2.tSId

SELECT -- inner关键字可以省
	t1.tSName,
	t1.tSAge,
	t2.tEnglish,
	t2.tMath
from TblStudent as t1
JOIN TblScore as t2 
on t1.tSId=t2.tSId

--左连接会将左表的数据全部显示，同时对应于左表数据若在右表中能找到匹配的数据，那么则显示对应于右表的数据,如果找不到，则左表数据照常显示，右边显示null
--查询所有学生(没参加考试的会显示null,如果不需要后面自己加where进行筛选即可)的成绩信息
--和mysql一样，outer和inner关键字其实都可以省略
SELECT
	t1.*,
	t2.tEnglish,
	t2.tMath
from TblStudent as t1 
LEFT OUTER JOIN TblScore as t2 
on t1.tSId=t2.tSId
where t2.tEnglish is not null and t2.tMath is not null


--查询没有参加考试的学生的信息(子查询实现)
SELECT
	 * from TblStudent 
	 WHERE tSId NOT IN 
	(SELECT TblScore.tSId from TblScore)

--查询没有参加考试的学生的信息,通过连接查询实现
SELECT
	t1.*,
	t2.tEnglish,
	t2.tMath
	from TblStudent as t1 
	LEFT JOIN TblScore as t2 on t1.tSId<>t2.tSId --这样写是错的，笛卡尔积的原因

--正确的写法(左外联)
SELECT
	t1.*,
	t2.tEnglish,
	t2.tMath
	from TblStudent as t1 
	LEFT JOIN TblScore as t2 
	on t1.tSId=t2.tSId  --先通过左连接拿到所有学生的信息
	WHERE t2.tScoreId IS NULL

--正确的写法(右外联)
SELECT
	t2.*,
	t1.tEnglish,
	t1.tMath	
	from TblScore as t1 
	RIGHT JOIN TblStudent as t2 
	on t1.tSId=t2.tSId  --通过右连接拿到所有学生的信息
	WHERE t1.tScoreId IS NULL



--------------------使用外连接（或直接说连接查询）的时候，如果要指定查询的条件，注意条件尽量不要写在on里面(有时候会出错)，写在后面的where最简单
--会出错（考虑三步1.innerjoin找出笛卡尔积里符合条件的，2.再left join选择所有左表的数据进行补充3.where）
--这里on的话是在第一步innerjoin的时候筛选的,后面left join就又会添加进来，所以出错

--比如下面这个例子，查询所有没参加考试的男生，gender判断写在了on里面，就出错了
SELECT
	t2.*,
	t1.tEnglish,
	t1.tMath	
	from TblScore as t1 
	RIGHT JOIN TblStudent as t2
	on t1.tSId=t2.tSId AND t2.tSGender='男'
	WHERE t1.tScoreId IS NULL

--正确的写法，写在where里面进行筛选男生
SELECT
	t2.*,
	t1.tEnglish,
	t1.tMath	
	from TblScore as t1 RIGHT JOIN TblStudent as t2 
	on t1.tSId=t2.tSId 
	WHERE t1.tScoreId IS NULL AND t2.tSGender='男'


----------------------练习
--1.查询所有学生（参考和未参考的）的姓名年龄成绩，没参加考试显示缺考,math & english < 60 显示不及格

SELECT
	t1.tSName,
	t1.tSAge,
	'数学成绩:' = case
					when t2.tMath is null then '缺考'
					when t2.tMath < 60 then '不及格'
					else convert(varchar,t2.tMath)
					end ,
	'英语成绩' = case
					when t2.tEnglish is null then '缺考'
					when t2.tEnglish < 60 then '不及格'
					else convert(varchar,t2.tEnglish)
					end 
	from TblStudent as t1
	LEFT JOIN TblScore as t2 
	on t1.tsId=t2.tsId
	
--其实还有全连接，用full关键字，就是两个表都保留，没有的就显示null

select * from tblStudent as t1
 full join  tblscore as t2 
	on t1.tsid = t2.tsid