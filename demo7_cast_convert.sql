SELECT 100+200 
SELECT 100+'1000' --�Զ�����ת�� char to int
SELECT '1000'+10 -- char to int

print 100+'100'
PRINT 'avs'+100  --avs����ת��Ϊintʧ��

--cast(���ʽ as ��������)
--convert(�������ͣ����ʽ)
SELECT 100.0 + CAST('1000' AS int)
SELECT 100.0 + CONVERT(int,'1000')

SELECT '��İ༶���:' + CONVERT(char(1),1) as �༶���

print getdate()
print convert(varchar(100),getdate(),120)
print convert(varchar(10),getdate(),120)
