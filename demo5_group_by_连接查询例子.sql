USE MyFiveDatabase
SELECT * FROM Employees
SELECT * from Departments
--ͳ�Ʋ�ͬ���ŵ�������ע������NULLҲ�ǿ��Գ�Ϊһ���
SELECT EmpDepId as ����ID,
	��������=COUNT(*)
	FROM Employees
	GROUP BY EmpDepId
	

SELECT 
	�Ա�=case 
			when empGender='��' then '��'
			when empGender='Ů' then 'Ů'
			when empGender is null then '����'
			end,
	�Ա�����=COUNT(*)
	FROM Employees
	GROUP BY EmpGender
	
--ͳ�Ʋ�ͬ���ŵ���������
--ʹ���˾ۺϺ�������飬���ܳ����������ˣ�ֻ�ܳ��ַ����е�����
SELECT 
	EmpDepId as ����ID,
	������������=COUNT(*)
	FROM Employees
	WHERE EmpGender='��'
	GROUP BY EmpDepId
	
--ͳ�Ʋ�ͬ������������������һ����ʾ�������ƣ��õ����Ӳ�ѯ��
SELECT
	����ID=t1.EmpDepId,
	����=t2.DepName,
	������������=COUNT(*)
from Employees as t1
inner join Departments as t2 on t2.DepId=t1.EmpDepId
WHERE t1.EmpGender='��'
GROUP BY t2.DepName,t1.EmpDepId