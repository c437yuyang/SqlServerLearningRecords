SELECT * from TestIndex1002

--�����ۼ���������������������ʹ洢˳��һ�£�����ֻ����һ��
CREATE clustered index IXc4 on TestIndex1002(c4)
SELECT * from TestIndex1002 WHERE c4 = 1
DROP INDEX TestIndex1002.IXc4

--�����Ǿۼ��������߼�����������Ҫ�ʹ洢˳��һ�£����������ж��
CREATE nonclustered index IXc3 on TestIndex1002(c3)
SELECT * from TestIndex1002 WHERE c3='aAddress'
DROP INDEX TestIndex1002.IXc3