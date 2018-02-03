
DECLARE @a int
SET @a = (select count(*) from TblStudent)
--或，都可以
SELECT @a=count(*) from TblStudent
print @a

DECLARE @b int
--SET @b = (select tsAge from TblStudent) --当通过set未变量赋值的时候，如果查询语句返回值不止一个会报错
SELECT @b=tsAge from TblStudent		--当通过select未变量赋值的时候，若返回多个则会取最后一个

print @b

SELECT 
tSAge
from TblStudent