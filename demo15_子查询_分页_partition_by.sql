--------------------�Ӳ�ѯ:����һ����ѯ�Ľ���Ͻ��в�ѯ
USE Itcast2014
--����ѯ�߶����������ѧ��
SELECT * FROM TblClass
SELECT * from TblStudent 

--Ƕ���Ӳ�ѯ
SELECT * from TblStudent WHERE tSClassId = --������where in Ҳ���Ե�
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

--�Ӳ�ѯ��ΪǶ���Ӳ�ѯ������Ӳ�ѯ
--�����뿴https://www.cnblogs.com/ziyandeyanhuo/p/7877519.html
--Ƕ���Ӳ�ѯ��ִ�в��������ⲿ�Ĳ�ѯ��
--����Ӳ�ѯ��ִ���������ⲿ��ѯ��������������Ӳ�ѯ��WHERE�Ӿ����������ⲿ��ѯ�ı�



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
	���=ROW_NUMBER() OVER(ORDER BY CustomerID) 
	from Customers 
	ORDER BY ��� --��ʵ����������Բ�Ҫ�ˣ�ǰ��ֻҪorder by�ˣ����ݾ��Ѿ��ǰ���over����ָ����������ˣ������Ҫ��������������������ƶ�
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


--partition by
--partition  by�ؼ����Ƿ����Ժ�����һ���֣����;ۺϺ�������group by����ͬ�ĵط��������ܷ���һ�������еĶ�����¼�����ۺϺ���һ��ֻ��һ����ӳͳ��ֵ�ļ�¼��
--partition  by���ڸ���������飬���û��ָ����ô���������������Ϊһ�����顣
--partition by ��group by��֮ͬ������ǰ�߷��ص��Ƿ������ÿһ�����ݣ����ҿ��ԶԷ������ݽ����������������ֻ�ܷ��ؾۺ�֮����������ͳ��ֵ�ļ�¼��
SELECT
	*,
	���=ROW_NUMBER() OVER(partition by city ORDER BY CustomerID) --��ʱorder by ���ǰ���partition�������������ˣ������Ƕ�partition�õ��Ĳ�ͬ��ֱ��ڲ��������򣬲����������
	from Customers 