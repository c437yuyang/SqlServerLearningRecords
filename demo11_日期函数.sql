PRINT getdate()
print sysdatetime()

SELECT DATEADD(DAY,200,GETDATE())
SELECT DATEADD(MINUTE,200,GETDATE())
print DATEADD(MINUTE,200,GETDATE())


SELECT DATEDIFF(day,GETDATE(),DATEADD(DAY,100,GETDATE()))
SELECT '今年我的年龄:',DATEDIFF(YEAR,'1995-12-08',getdate())--若datepart填year，则直接是两个year相减
SELECT '今年我的年龄:',convert(int,ROUND(DATEDIFF(day,'1995-12-08',getdate())/365.0,0))  --所以下面这种会精确一些

--获取日期的某一部分
print datepart(year,getdate())
print year(getdate())