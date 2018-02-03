SELECT 100+200 
SELECT 100+'1000' --自动向上转型 char to int
SELECT '1000'+10 -- char to int

print 100+'100'
PRINT 'avs'+100  --avs向上转型为int失败

--cast(表达式 as 数据类型)
--convert(数据类型，表达式)
SELECT 100.0 + CAST('1000' AS int)
SELECT 100.0 + CONVERT(int,'1000')

SELECT '你的班级编号:' + CONVERT(char(1),1) as 班级编号

print getdate()
print convert(varchar(100),getdate(),120)
print convert(varchar(10),getdate(),120)
