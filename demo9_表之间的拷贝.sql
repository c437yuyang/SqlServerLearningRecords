
use MyFiveDatabase

SELECT * FROM Employees
SELECT * FROM Employees_BACKUP

drop table Employees_BACKUP1
drop table Employees_BACKUP2
drop table Employees_BACKUP

--����Employees������Employees_BACKUP��������Ȳ����ڣ�����˵�����ظ�ִ�У��У�����Լ�����´��
SELECT * INTO Employees_BACKUP FROM Employees --����Ҳ��Լ����Ҳ���´����������ȥ��ֻ������

--ֻ������ṹ���������κ�һ������
DROP TABLE Employees_BACKUP
SELECT top 0 * INTO Employees_BACKUP1 FROM Employees --����Ҳ��û��Լ����
SELECT * INTO Employees_BACKUP2 FROM Employees WHERE 1<>1 --����Ҳ���ԣ��������ܵ�
--�������Ҫ����һ����Ļ�����û������������create���(������䶼�Ǵ�Լ����)��Ȼ��ֱ���滻�м������

-----ԭ�����Ѿ����ڣ�׷�Ӽ�¼
SELECT * FROM Employees_BACKUP1
INSERT INTO Employees_BACKUP1 --��ʵ�������Ӳ�ѯ�����Ϊ����ֵ�ˣ�ֻ������insert into��values�ؼ���
	SELECT 
		EmpName,EmpGender,EmpAge,EmpEmail,EmpAddress,EmpDepId FROM Employees
		WHERE EmpGender='Ů'


---����ʾ��
-- ������*��Ϊ��ID������������ҪIDENTITY_INSERT Ϊ ON�����������
SELECT * FROM Employees_BACKUP2
INSERT INTO Employees_BACKUP2
	SELECT 
		* 
		FROM Employees 
		WHERE EmpGender='Ů'