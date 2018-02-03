-----------------------变量-----------------
--1.声明
DECLARE @name nvarchar(50)
DECLARE @age int

--另一种方式
DECLARE @name nvarchar(50),@age int


--2.赋值
SET @name = '哈哈哈哈'
SELECT @age = 18

--3.输出
print @name
print @age

SELECT @name as '姓名',@age as '年龄'


-----------------------------------循环------------------------------
--while循环
DECLARE @i int = 1 --声明并定义
WHILE(@i <= 10)
BEGIN 
	print 'Hello'
	set @i = @i + 1
end

DECLARE @i int = 1
DECLARE @sum int = 0 --一定要赋初值，不然就是Null
WHILE(@i <= 100)
begin
	set @sum += @i
	set @i = @i + 1
	--break;
	--continue;
end
print @sum



---if else

DECLARE @n int = 10;
IF @n > 10
begin 
	print 'n>10'
end
else if @n > 5
begin print 'n>5' end
else if @n >0
begin print 'n>0' end


-----------计算所有奇数的和

DECLARE @i int =1;
DECLARE @sum int = 0;

WHILE(@i<=100)
begin
	IF @i%2=1 --sql里面判断相等就是=不是==
	BEGIN
		set @sum+=@i
	end
	set @i+=1;
end
print @sum



---系统变量(不能修改)
--@@,自己也可以定义@@的变量
print @@version

DECLARE @@i int = 19
print @@i

print @@language
print @@Max_connections
print @@servername
print @@rowcount --上一次受影响的行数 