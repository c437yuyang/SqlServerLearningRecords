USE MyFiveDatabase
SELECT * FROM PhoneNum
SELECT * from PhoneGroup
SELECT * FROM PhoneGroup,PhoneNum --�ѿ�����

SELECT * FROM PhoneNum

SELECT 
	* --�����*�������������������
	FROM PhoneNum
	INNER JOIN PhoneGroup 
	on PhoneNum.pTypeId=PhoneGroup.ptid --Ϊÿ����ϵ������һ�з�������

SELECT * FROM PhoneNum --���Կ�������������ȫ��һ���ģ��ѿ�������ԭ��
INNER JOIN PhoneGroup on PhoneNum.pTypeId<>PhoneGroup.ptid

SELECT pid,pname,pCellPhone,pHomePhone,ptName FROM PhoneNum --ָ����Ҫ���У��������Ļ���ǰ��ӱ���.
INNER JOIN PhoneGroup on PhoneNum.pTypeId=PhoneGroup.ptid

SELECT * from PhoneNum
SELECT * FROM PhoneGroup
--�������Ļ���ǰ��ӱ���.
SELECT	pn.pid,
		pn.pname,
		pn.pCellPhone,
		pn.pHomePhone,
		pg.ptName
FROM PhoneNum as pn
INNER JOIN PhoneGroup as pg 
on pn.pTypeId=pg.ptid


SELECT * from TblPerson

------------------------------��ϰ

--tblstudent,tblclass
USE Itcast2014
SELECT * FROM TblStudent
SELECT * from TblClass

--��ѯѧ�����������༶
SELECT	
	ts.tSName,
	ts.tSAge,
	tc.tClassName	
FROM TblStudent as ts
INNER JOIN TblClass as tc 
on ts.tSClassId=tc.tClassId --���Կ���NULLҲ�ᱻ����

--��ѯѧ���������20������������༶
SELECT	
	ts.tSName,
	ts.tSAge,
	tc.tClassName	
FROM TblStudent as ts 
INNER JOIN TblClass as tc 
on ts.tSClassId=tc.tClassId 
WHERE ts.tSAge>20


SELECT * FROM TblStudent
SELECT * from TblClass
SELECT * FROM TblScore

--��ѯѧ������������༶�ɼ�(������������)
SELECT	
	ts.tSName,
	ts.tSAge,
	tc.tClassName,
	tsc.tEnglish,
	tsc.tMath	
FROM TblStudent as ts 
INNER JOIN TblClass as tc on ts.tSClassId=tc.tClassId 
INNER JOIN TblScore as tsc ON tsc.tSId=ts.tSId
--where tsc.tEnglish is not null and tsc.tMath is not null

