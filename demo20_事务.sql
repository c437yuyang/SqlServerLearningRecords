SELECT * from bank

--��֤�������ͬʱִ�гɹ�(ʹ������)
UPDATE bank set balance=100 WHERE cId=0001
UPDATE bank set balance=910 WHERE cId=0002

print @@error

--����
BEGIN transaction
	DECLARE @sum int = 0;
	--����ʹ��if else����������ִ�,���������Ļ�.net�Ǳ�Ҳ�ᱨ�쳣��
	UPDATE bank set balance-=100 WHERE cId=0001
	SET @sum+=@@error
	UPDATE bank set balance+=100 WHERE cId=0002
	SET @sum+=@@error
	--ֻҪ��һ���������һ������0
	IF(@sum<>0)
	begin --������
		rollback transaction--�ع�(trainsaction����ʡ��)
	end
	else --û����
	begin
		commit transaction--�ύ
	end
	
	
	
	
--�Զ��ύ����(����sql��䶼�ǣ������ʱ�򶼻��Զ��ع�)
INSERT INTO aaa VALUES(aaa)


--��ʽ����
--set IMPLICIT_TRANSACTIONS {ON|OFF}
--��һ����ʽ����
SET IMPLICIT_TRANSACTIONS ON
INSERT into bank VALUES('0004',1000000) --��һ���µ�����(sql�ű�)���ѯ����δ�ύ�����ʾһֱ���ڲ�ѯ
COMMIT
SET IMPLICIT_TRANSACTIONS OFF

--��ʾ����:��Ҫ�ֶ��������ֶ��ύ��ع�
