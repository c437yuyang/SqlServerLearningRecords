use MySecondDatabase

--CTRL+R�򿪺͹رղ�ѯ����

--update ���� set ��1=��ֵ,��2=��ֵ,...where ����
--������where���ǶԱ������е����ݶ������޸�
select * from Employees
update Employees set EmpName='����',empAge=empAge-1 where empName = '����'


--delete���
--delete from employees ������������ɾ����������,���Ǳ���,��drop table��ͬ
delete from Employees where EmpName='����'

--truncate table biaoming ��䣬Ҳ����ɾ�����е�ȫ������,����ʹ��������,
--Ч�ʸ���(��Ϊ��¼����־����,ldf�ļ�),�����޷����������������Զ����Զ���Żָ���ʼ
--truncate���ᴥ��delete������

SELECT * from tblImage
UPDATE TblImage SET im_path=REPLACE(im_path,'E:/','C:/')

select REPLACE('E:/aaa','E:/','C:/')