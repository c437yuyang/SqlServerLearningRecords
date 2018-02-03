DROP TABLE tblUsers;
create table TblUsers
(
	autoId int identity(1,1) primary key,
	loginName varchar(20) constraint UQ_TblUsers_loginName unique(loginName),
	loginPswd varchar(20)
)

INSERT INTO TblUsers VALUES('c437yuyang','8598018')
INSERT INTO TblUsers VALUES('c437yuyang1','8598018')
INSERT INTO TblUsers VALUES('c437yuyang2','8598018')
INSERT INTO TblUsers VALUES('c437yuyang3','8598018')
INSERT INTO TblUsers VALUES('c437yuyang4','8598018')

SELECT * from TblUsers

SELECT COUNT(*) from TblUsers WHERE loginName='c437yuyang' AND loginPswd='8598018'
SELECT COUNT(*) from TblUsers WHERE loginName='c437yuyang' or 1=1 --' AND loginPswd='sasas'
SELECT COUNT(*) from TblUsers WHERE loginName='c437yuyang' AND loginPswd='sa'
SELECT COUNT(*) from TblUsers WHERE loginName='c437yuyang' or 1=1 --' AND loginPswd='sa'
SELECT COUNT(*) from TblUsers WHERE loginName='c437yuyang or 1=1 --' AND loginPswd='sa'