--------------------�Ӳ�ѯ:����һ����ѯ�Ľ���Ͻ��в�ѯ
USE Itcast2014
--����ѯ�߶����������ѧ��
SELECT * FROM TblClass
SELECT * from TblStudent 

SELECT * from TblStudent WHERE tSClassId=
(SELECT tClassId FROM TblClass where tClassName='�߶�����')

SELECT *,�༶='�߶�����' from TblStudent WHERE tSClassId=
(SELECT tClassId FROM TblClass where tClassName='�߶�����')

SELECT * 
	from TblStudent as ts
	INNER JOIN TblClass as tc 
	on ts.tSClassId = tc.tClassId
	WHERE tc.tClassName='�߶�����' ----ʹ�����Ӳ�ѯҲ����ʵ�֣����������Ч��ò�Ƹ�һЩ

---------------����Ӳ�ѯ
SELECT * 
	from TblStudent as ts 
	WHERE EXISTS
		(SELECT * 
			from TblClass as tc 
			WHERE ts.tSClassId = tc.tClassId AND tc.tClassName='�߶�����')


--------------------------ʹ��topʵ�ַ�ҳ��ѯ(�з�ҳһ��Ҫ������)

SELECT * from Customers
--ÿҳ��ʾ7������

--��һҳ
SELECT 
	TOP 7 
	* from Customers 
	order BY CustomerID 
	asc
	

--���ѯ��ǰ��ҳ������
SELECT 
	TOP (7*2) 
	* from Customers 
	order BY CustomerID 
	asc

--�ڶ�ҳ
--2.1�Ȳ�ѯ���ԣ�2-1��ҳ������ID
SELECT 
	TOP (7*1) 
	* from Customers 
	WHERE CustomerID NOT in
	(
		(--�Ѿ�������(��һҳ��)���ݵ�ID
			SELECT 
				top (7*(2-1))
				CustomerId 
				from Customers 
				ORDER BY CustomerID 
				ASC
		) 
	) 
	ORDER BY CustomerID 
	ASC
 
--����ҳ
SELECT TOP (7*1) * from Customers WHERE CustomerID NOT in
(
	(--�Ѿ�������(��һҳ��)���ݵ�ID
		SELECT top (7*(5-1)) CustomerId 
		from Customers ORDER BY CustomerID ASC
	) 
) ORDER BY CustomerID ASC


------------------------ʹ��row_number()ʵ�ַ�ҳ(ȱ���Ǳ����Լ�ָ����������Ȼ���һ��row_number)
--1.Ϊ��������,Ȼ����
--2.�����û�����鿴���м���

--over�����order byָ���б�ŵ�����˳������order byָ����������
SELECT
	*,
	���=ROW_NUMBER() OVER(ORDER BY CustomerID ASC) 
	from Customers 
	ORDER BY ��� 
	asc
	
--ÿҳ��ʾ����,�鿴�ڰ�ү
--��(8-1)*7+1 to 8*7
SELECT * FROM
(
	SELECT	*,
			���=ROW_NUMBER() OVER(ORDER BY CustomerID ASC)
	from Customers
)
as t
where t.��� between (8-1)*7+1 and 8*7 -- AND sys.columns!='���'  


SELECT * FROM MyStudent

SELECT * FROM
(
	SELECT	*,
			���=ROW_NUMBER() OVER(ORDER BY Fid ASC)
	from MyStudent
)
as t
where t.��� between (11-1)*10+1 and 11*10
