
DECLARE @a int
SET @a = (select count(*) from TblStudent)
--�򣬶�����
SELECT @a=count(*) from TblStudent
print @a

DECLARE @b int
--SET @b = (select tsAge from TblStudent) --��ͨ��setδ������ֵ��ʱ�������ѯ��䷵��ֵ��ֹһ���ᱨ��
SELECT @b=tsAge from TblStudent		--��ͨ��selectδ������ֵ��ʱ�������ض�����ȡ���һ��

print @b

SELECT 
tSAge
from TblStudent