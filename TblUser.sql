CREATE table [user]
(
	uId int identity(1,1) primary key,
	name nvarchar(50),
	level int
)

INSERT into [user] values('�ŷ�1',1)
INSERT into [user] values('�ŷ�2',2)
INSERT into [user] values('�ŷ�3',3)
SELECT * FROM [user]

--�൱��c#��if
SELECT 
	*,ͷ��=CASE 
			WHEN level=1 THEN '����'
			WHEN level=2 THEN '����'
			WHEN level=3 THEN '��ʦ'
			ELSE '�ǻ�'
			end
FROM [user]


--������c#��switch
SELECT 
	*,ͷ��=CASE [level]
			WHEN 1 THEN '����'
			WHEN 2 THEN '����'
			WHEN 3 THEN '��ʦ'
			ELSE '�ǻ�' --�������ͱ��뻹��ͳһ(��ΪҪ�ŵ�ͬһ��)
			END
			
FROM [user]

use itcast2014
SELECT * from TblScore

SELECT 
	*,����=CASE
		WHEN tEnglish IS NULL THEN 'ȱ��'
		WHEN tEnglish<60 THEN '������'
		WHEN tEnglish>=60 AND tEnglish<80 THEN '����'
		WHEN tEnglish>=80 AND tenglish<90 THEN '����'
		ELSE '����'
		END
FROM TblScore

CREATE table TestA
(
	A int,
	B int,
	C int
)

INSERT into TestA values(20,30,10)
INSERT into TestA values(30,10,20)
INSERT into TestA values(10,20,30)

SELECT * FROM TestA

SELECT ��һ��=CASE
				WHEN A > B THEN A
				ELSE B
				END				
		,�ڶ���=case
				when B>C THEN B
				ELSE C
				END				
FROM TestA

SELECT * from MyOrders