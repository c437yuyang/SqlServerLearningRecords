-----------------------����-----------------
--1.����
DECLARE @name nvarchar(50)
DECLARE @age int

--��һ�ַ�ʽ
DECLARE @name nvarchar(50),@age int


--2.��ֵ
SET @name = '��������'
SELECT @age = 18

--3.���
print @name
print @age

SELECT @name as '����',@age as '����'


-----------------------------------ѭ��------------------------------
--whileѭ��
DECLARE @i int = 1 --����������
WHILE(@i <= 10)
BEGIN 
	print 'Hello'
	set @i = @i + 1
end

DECLARE @i int = 1
DECLARE @sum int = 0 --һ��Ҫ����ֵ����Ȼ����Null
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


-----------�������������ĺ�

DECLARE @i int =1;
DECLARE @sum int = 0;

WHILE(@i<=100)
begin
	IF @i%2=1 --sql�����ж���Ⱦ���=����==
	BEGIN
		set @sum+=@i
	end
	set @i+=1;
end
print @sum



---ϵͳ����(�����޸�)
--@@,�Լ�Ҳ���Զ���@@�ı���
print @@version

DECLARE @@i int = 19
print @@i

print @@language
print @@Max_connections
print @@servername
print @@rowcount --��һ����Ӱ������� 