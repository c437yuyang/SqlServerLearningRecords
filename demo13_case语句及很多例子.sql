-------case����������Ŀ���ÿһ��λ����ʾʲô����
-------(���������Լ�����һ���л򼸸��п��ƾ�����ʾʲô����һ���ϱ����Ӳ�ѯ������Ҳ���鷳һ�㣩)
USE MyFiveDatabase
CREATE table [user]
(
	uId int identity(1,1) primary key,
	name nvarchar(50),
	level int
)

INSERT into [user] values('�ŷ�1',1)
INSERT into [user] values('�ŷ�2',2)
INSERT into [user] values('�ŷ�3',3)
INSERT into [user] values('�ŷ�4',4)
SELECT * FROM [user]

--�൱��c#��if(�Ƽ�ʹ����һ��)
SELECT 
	*,
	ͷ��=CASE 
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
	*,
	����=CASE
		WHEN tEnglish IS NULL THEN 'ȱ��'
		WHEN tEnglish<60 THEN '������'
		WHEN tEnglish>=60 AND tEnglish<80 THEN '����'
		WHEN tEnglish>=80 AND tenglish<90 THEN '����'
		ELSE '����'
		END
FROM TblScore

select 
*,
Ӣ������ = case
				WHEN tEnglish IS NULL THEN 'ȱ��'
				when tEnglish < 60 then '������'
				when tEnglish >= 60 and tEnglish < 80 then '����'
				when tEnglish >=80 then '����' 
				end
				,			
��ѧ���� = case
				WHEN tMath IS NULL THEN 'ȱ��'
				when tMath < 60 then '������'
				when tMath >= 60 and tMath < 80 then '����'
				when tMath >=80 then '����' 
				end
				--,
--������ = case --�����ֲ���ֱ���� case��������������ֻ�������е�������
--				WHEN ��ѧ����=='����' and Ӣ������=='����'
--				end				
from TblScore

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

SELECT	AB���ֵ=CASE
				WHEN A > B THEN A
				ELSE B
				END				
		,BC���ֵ=case
				when B > C THEN B
				ELSE C
				END				
FROM TestA

SELECT * from MyOrders


SELECT 
	����Ա
	FROM MyOrders
	GROUP BY ����Ա

--ͳ��ÿ������Ա����������������ͷ��
SELECT 
	����Ա,
	�ܽ��=SUM(���ۼ۸�*��������),
	�ƺ�=CASE
		WHEN SUM(���ۼ۸�*��������)>6000 THEN '����'
		WHEN SUM(���ۼ۸�*��������)>5000 THEN '����'
		WHEN SUM(���ۼ۸�*��������)>2000 THEN 'ͭ��'
		ELSE '��ͨ'
		END
	FROM MyOrders
	GROUP BY ����Ա
	
---------------��ϰ���ѽ��������ʾδ�����֧������
create table TestB
(
	���� varchar(10),
	��� int
)

INSERT into TestB values('Rk1',10)
INSERT into TestB values('Rk2',20)
INSERT into TestB values('Rk3',-30)
INSERT into TestB values('Rk4',-10)

SELECT * FROM TestB

SELECT ����
		,����=CASE
				WHEN ���>0 THEN ���
				WHEN ���<0 THEN 0
				end	
		,֧��=case
				when ���>0 then 0
				when ���<0 then -��� --��abs(���)
				end
from TestB

----case�������group by����ʹ��
--------------ͳ�Ƹ������ʤ��ʧ�ܳ���----------------------------------
SELECT * from TeamScore

SELECT
	�������=teamName,
	ʤ=	sum(CASE
				WHEN gameResult='ʤ' then 1
				ELSE 0
			end),
	��=	sum(CASE
				WHEN gameResult='��' then 1
				ELSE 0
			end)
from TeamScore
GROUP BY teamName
order by ʤ
desc

-----------------------------------------------------
--����count����,��ͳ�ƿ�ֵ
SELECT
	�������=teamName,
	ʤ=count(CASE
			WHEN gameResult='ʤ' then 1
			ELSE NULL
		end),
	��=count(CASE
		WHEN gameResult='��' then 1
		ELSE NULL
	end)
from TeamScore
GROUP BY teamName

------------ͳ�Ƹ�����Ӳ�ͬ�����÷�-------------
SELECT * FROM NBAScore

SELECT  --��ʵ��������Ч��
	teamName,
	��1�����÷�=CASE
				WHEN seasonName='��1����' THEN Score
				ELSE NULL
			END,
	��2�����÷�=CASE
				WHEN seasonName='��2����' THEN Score
				ELSE NULL
			END,
	��3�����÷�=CASE
				WHEN seasonName='��3����' THEN Score
				ELSE NULL
			END
from NBAScore

-------�ٷ���--------------
SELECT 
	teamName,
	��1�����÷�=sum(CASE
				WHEN seasonName='��1����' THEN Score
				ELSE NULL
			END),
	��2�����÷�=sum(CASE
				WHEN seasonName='��2����' THEN Score
				ELSE NULL
			END),
	��3�����÷�=sum(CASE
				WHEN seasonName='��3����' THEN Score
				ELSE NULL
			END)
from NBAScore
GROUP BY teamName


--��ѯÿ��ѧ����ÿһ�Ƴɼ�
-----------------------------------
SELECT * FROM StudentScore
SELECT 
	studentId,
		����=max(case
			WHEN courseName='����' THEN score
			else NULL
			END),
		��ѧ=max(case
			WHEN courseName='��ѧ' THEN score
			else NULL
			END),
		Ӣ��=max(case
			WHEN courseName='Ӣ��' THEN score
			else NULL
			END)

from StudentScore
GROUP BY studentId





--------------------------------------------------
--ÿ������Ա�ܹ����ۿɿڿ��ֵ�����
SELECT
����Ա,
���ۿɿڿ�������=SUM(��������)
from MyOrders 
where ��Ʒ����='�ɿڿ���'
group by ����Ա


--ͳ��ÿ����Ʒÿ������Ա����������
SELECT
	��Ʒ����,��Ʒ���,
	������������=sum(CASE
					WHEN ����Ա='����' THEN ��������
					ELSE NULL
					END),
	������������=sum(CASE
					WHEN ����Ա='����' THEN ��������
					ELSE NULL
					END),
	������������=sum(CASE
					WHEN ����Ա='����' THEN ��������
					ELSE NULL
					END),
	������������=sum(CASE
					WHEN ����Ա='����' THEN ��������
					ELSE NULL
					END),
	������������=sum(CASE
					WHEN ����Ա='����' THEN ��������
					ELSE NULL
					END)
from MyOrders
GROUP BY ��Ʒ����,��Ʒ��� --group by������������֧


SELECT
	��Ʒ����,
	������������=sum(CASE
					WHEN ����Ա='����' THEN ��������
					ELSE NULL
					END),
	������������=sum(CASE
					WHEN ����Ա='����' THEN ��������
					ELSE NULL
					END),
	������������=sum(CASE
					WHEN ����Ա='����' THEN ��������
					ELSE NULL
					END),
	������������=sum(CASE
					WHEN ����Ա='����' THEN ��������
					ELSE NULL
					END),
	������������=sum(CASE
					WHEN ����Ա='����' THEN ��������
					ELSE NULL
					END)
from MyOrders
GROUP BY ��Ʒ����