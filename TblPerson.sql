create table TblPerson
(
	autoId int identity(1,1) primary key,
	uName nvarchar(10) not null,
	age int,
	height int,
	gender nchar(1)
)


INSERT INTO TblPerson VALUES('�������',20,170,'��')

DELETE FROM TblPerson WHERE autoId=1

UPDATE TblPerson SET uName='������',age=21 WHERE autoId=3

SELECT COUNT(*) from TblPerson
SELECT * FROM TblPerson