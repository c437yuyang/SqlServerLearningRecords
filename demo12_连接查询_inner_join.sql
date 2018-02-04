USE MyFiveDatabase
SELECT * FROM PhoneNum
SELECT * from PhoneGroup
SELECT * FROM PhoneGroup,PhoneNum --笛卡尔积

SELECT * FROM PhoneNum

SELECT 
	* --这里的*就是两个表的所有列了
	FROM PhoneNum
	INNER JOIN PhoneGroup 
	on PhoneNum.pTypeId=PhoneGroup.ptid --为每个联系人增加一列分组名称

SELECT * FROM PhoneNum --可以看出不等于是完全不一样的（笛卡尔积的原因）
INNER JOIN PhoneGroup on PhoneNum.pTypeId<>PhoneGroup.ptid

SELECT pid,pname,pCellPhone,pHomePhone,ptName FROM PhoneNum --指定想要的列，有重名的话就前面加表名.
INNER JOIN PhoneGroup on PhoneNum.pTypeId=PhoneGroup.ptid

SELECT * from PhoneNum
SELECT * FROM PhoneGroup
--有重名的话就前面加表名.
SELECT	pn.pid,
		pn.pname,
		pn.pCellPhone,
		pn.pHomePhone,
		pg.ptName
FROM PhoneNum as pn
INNER JOIN PhoneGroup as pg 
on pn.pTypeId=pg.ptid


SELECT * from TblPerson

------------------------------练习

--tblstudent,tblclass
USE Itcast2014
SELECT * FROM TblStudent
SELECT * from TblClass

--查询学生年龄姓名班级
SELECT	
	ts.tSName,
	ts.tSAge,
	tc.tClassName	
FROM TblStudent as ts
INNER JOIN TblClass as tc 
on ts.tSClassId=tc.tClassId --可以看到NULL也会被处理

--查询学生年龄大于20岁的年龄姓名班级
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

--查询学生的姓名年龄班级成绩(两个外键的情况)
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

