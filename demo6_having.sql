USE MyFiveDatabase
select *from Employees
--where�Է���ǰ�����ݽ���ɸѡ��having�Է��������ݽ���ɸѡ
--where�����þۺϺ������Ƕ�ÿһ�������жϵģ�having���ܶ�ÿһ����¼ɸѡ��ֻ��ʹ�þۺϺ���

--�Ҳ���������������1�Ĳ���
SELECT 
	EmpDepId as ����ID,
	������������=COUNT(EmpGender)
	FROM Employees
	WHERE EmpGender='��'
	GROUP BY EmpDepId
	HAVING COUNT(EmpGender)>1


--��ϰ
USE Itcast2014

SELECT * from MyOrders
SELECT 
	��Ʒ����,
	SUM(��������) as ��������
	FROM MyOrders
	group BY ��Ʒ����
	order BY �������� DESC
	
--�������ܼ۴���3000����Ʒ
SELECT 
	��Ʒ����,
	SUM(��������*���ۼ۸�) as �����ܼ�
	FROM MyOrders
	GROUP BY ��Ʒ����
	HAVING SUM(��������*���ۼ۸�) > 3000 --ֻҪ�����ܼ۴���3000��
	ORDER BY �����ܼ� DESC
	
--�ҹ���ɿڿ��ִ���20����
SELECT
	������,
	����ɿڿ������� = sum(��������)
	FROM MyOrders
	WHERE ��Ʒ����='�ɿڿ���'
	group BY ������
	having  sum(��������)>20 --���ﲻ���� ����ɿڿ������� ��Ϊ����
	ORDER BY ����ɿڿ������� DESC