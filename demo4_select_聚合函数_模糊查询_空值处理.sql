TRUNCATE table departments
INSERT INTO Departments VALUES('��Ʋ�')
INSERT INTO Departments VALUES('��Ӱ��')
INSERT INTO Departments VALUES('��ʳ��')
SELECT * FROM Departments

TRUNCATE table employees
INSERT INTO Employees VALUES('����һ','��',20,'954222619@qq.com','�Ĵ�����',2)
INSERT INTO Employees VALUES('������','��',22,'954222639@qq.com','�Ĵ�������',1)
INSERT INTO Employees VALUES('������','Ů',23,'954222629@qq.com','�����������Ƿ�',2)
INSERT INTO Employees VALUES('������','Ů',23,'954222629@qq.com','�����������Ƿ�',2)
INSERT INTO Employees VALUES('������','Ů',23,'954222629@qq.com','�����������Ƿ�',2)
INSERT INTO Employees VALUES('������������','Ů',23,'954222629@qq.com','�����������Ƿ�',2)
INSERT INTO Employees VALUES('��쪷���','Ů',24,'954222622@qq.com','����������������',1)
INSERT INTO Employees VALUES('�ŵ��Ӵ���','Ů',25,'954222622@qq.com','�������������',3)
INSERT INTO Employees VALUES('������','��',22,'954222639@qq.com','�Ĵ�������',1)

INSERT INTO Employees VALUES('�ȶ�����','��',22,'954222639@qq.com','�Ĵ�������',1)
INSERT INTO Employees VALUES('����','��',25,'954222622@qq.com','�������������',3)

INSERT INTO Employees VALUES('�ɷ��ҹ�','��',25,'954222622@qq.com','�������������',3)
INSERT INTO Employees VALUES('�ɷ��ҹ�5','��',25,'954222622@qq.com','�������������',2)
INSERT INTO Employees VALUES('�ɷ��ҹ�1','��',36,'954222622@qq.com','�������������',2)
INSERT INTO Employees VALUES('�ɷ��ҹ�2','��',29,'954222622@qq.com','�������������',2)
INSERT INTO Employees VALUES('�ɷ��ҹ�3','��',16,'954222622@qq.com','�������������',2)
INSERT INTO Employees VALUES('�ɷ��ҹ�4','��',15,'954222622@qq.com','�������������',2)
SELECT * FROM Employees
SELECT * FROM Employees WHERE empDepId=2
SELECT empId,empName FROM Employees

SELECT 
	empName as ����,
	EmpGender as �Ա�,
	EmpId as '���'
FROM Employees 

--Ҳ���Բ�Ҫas,�����������''
SELECT 
	empName ����,
	EmpGender �Ա�,
	EmpId '(���)'
FROM Employees 

--Ҳ�����õȺ�,����ǰ��˳��ע���as�Ƿ���
SELECT 
	����=EmpName,
	�Ա�=EmpGender,
	���=EmpId
FROM Employees 

SELECT 
	empName as ����,
	EmpGender as �Ա�,
	EmpId as '���',
	'��' as ��� --Ҳ�����Լ���һ��
FROM Employees 


--selectҲ���Ե���ʹ��
SELECT ��ǰϵͳʱ��=GETDATE()

SELECT
	�೤='����Ϊ',
	���='����'
	
	
--����Ѿ���ѯ���Ľ��ȥ���ظ�(���ĳһ����˵��,����˵ֻҪһ��������������ظ�����)
SELECT DISTINCT * FROM Employees
SELECT DISTINCT empName FROM Employees  --�鿴empname����Щ

--����
SELECT * FROM Employees ORDER BY EmpAge DESC
SELECT * FROM Employees ORDER BY 1 DESC  --Ҳ���԰��յ�һ��������������*����ĵ�1�У�����ָ������Щ�е�ָ����
SELECT * FROM Employees ORDER BY EmpAge ASC --Ĭ�Ͼ�����������
update Employees set empage=20 where EmpID=3
SELECT top 2 * FROM Employees ORDER BY EmpAge ASC
SELECT top (1*2) * FROM Employees ORDER BY EmpAge ASC --�ɼӱ��ʽ(������)
SELECT top 34 PERCENT * FROM Employees ORDER BY EmpAge ASC --�ɼӱ��ʽ(�ٷֱȶ�������ȡ��)

----------�ۺϺ���(max,min,avg,sum,count)
SELECT SUM(EmpAge) as �����ܺ� FROM Employees
SELECT COUNT(*) as ��¼�� FROM Employees
SELECT COUNT(1) as ��¼�� FROM Employees
--SELECT ƽ������=
--	(SELECT SUM(EmpAge) as �����ܺ� FROM Employees)*1.0 / --*1.0���ʵ��
--	(SELECT COUNT(*) as ��¼�� FROM Employees)
SELECT ƽ������=
	(SELECT SUM(EmpAge) FROM Employees)*1.0 / --*1.0���ʵ��
	(SELECT COUNT(*) FROM Employees)

SELECT MAX(EmpAge) as ������� FROM Employees
SELECT MIN(EmpAge) as ������� FROM Employees
SELECT AVG(EmpAge*1.0) as ������� FROM Employees

-----------�ۺϺ�����һЩ����
--�ۺϺ�����ͳ�ƿ�ֵ


---�������Ĳ�ѯ
UPDATE Employees SET EmpAge=26 WHERE EmpId=5
SELECT * FROM Employees WHERE EmpAge<24
SELECT * FROM Employees WHERE EmpAge BETWEEN 20 AND 23 --BETWEEn�÷�
SELECT * FROM Employees WHERE EmpAge IN (23,20,26) --Ҳ������In,����,����������ʵ������between and ����where+����

--ģ����ѯ
--_�»��ߴ���һ����
SELECT * FROM Employees WHERE EmpName LIKE '��__'

--%�ٷֺ���ͨ���
SELECT * FROM Employees WHERE EmpName LIKE '��%'
SELECT * FROM Employees WHERE EmpName LIKE '��%' and LEN(EmpName)=3

UPDATE Employees set EmpName=REPLACE(EmpName,'��',' ')
SELECT * FROM Employees
SELECT * FROM Employees WHERE EmpName LIKE '��[0-9]' --���ֻ���ĸ
SELECT * FROM Employees WHERE EmpName LIKE '��[0-9a-z]' --���ֻ���ĸ
SELECT * FROM Employees WHERE EmpName LIKE '����[^a-z]' --ȡ��
SELECT * FROM Employees WHERE EmpName LIKE '����[%]' --��ѯ�������ַ���,��%����[]ת��


UPDATE Employees set EmpGender=NULL WHERE EmpAge=20
--------------��ֵ����
--�� is null �� is not null

SELECT * FROM Employees WHERE EmpGender IS NULL
SELECT * FROM Employees WHERE EmpGender IS not NULL
SELECT * FROM Employees WHERE EmpGender<>'��' --<>��ʾ������
SELECT * FROM Employees WHERE EmpGender<>NULL --�����鲻��

SELECT ����=2000+NULL --�κ�ֵ��null���м��㶼��null�������ڼ���ǰһ��Ҫ���ж��ǲ���null


--order by ����ע������
--1.����ŵ����order by
--2.���ݶ��н�������order by a desc,b asc ��a��ͬ�ٱȽ�b
--3.Ҳ���԰����ʽ��������
SELECT * FROM Employees ORDER BY (len(EmpName)+LEN(EmpAddress))



---count(1)��count(*)������
SELECT * from Employees
select COUNT(*) from Employees --�ҵ���̵�һ�н���count()
select *,1 from Employees --��һ��1
SELECT COUNT(1) from Employees --������������Ƕ����ӵ�һ��1����count�����Ը���