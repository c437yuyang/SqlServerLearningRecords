PRINT getdate()
print sysdatetime()

SELECT DATEADD(DAY,200,GETDATE())
SELECT DATEADD(MINUTE,200,GETDATE())
print DATEADD(MINUTE,200,GETDATE())


SELECT DATEDIFF(day,GETDATE(),DATEADD(DAY,100,GETDATE()))
SELECT '�����ҵ�����:',DATEDIFF(YEAR,'1995-12-08',getdate())--��datepart��year����ֱ��������year���
SELECT '�����ҵ�����:',convert(int,ROUND(DATEDIFF(day,'1995-12-08',getdate())/365.0,0))  --�����������ֻᾫȷһЩ

--��ȡ���ڵ�ĳһ����
print datepart(year,getdate())
print year(getdate())