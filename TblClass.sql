create table TblClass
(
	tClassId int identity(1,1) primary key,
	tClassName nvarchar(10),
	tClassDesc nvarchar(10)
)

INSERT INTO TblClass VALUES('高三1班','文科班')
INSERT INTO TblClass VALUES('高三2班','文科班')
INSERT INTO TblClass VALUES('高三3班','理科班')
INSERT INTO TblClass VALUES('高三4班','理科班')
INSERT INTO TblClass VALUES('高三5班','文科班')
INSERT INTO TblClass VALUES('高三6班','理科班')

INSERT INTO TblClass VALUES('高一1班','文科班')
INSERT INTO TblClass VALUES('高一2班','文科班')
INSERT INTO TblClass VALUES('高一3班','理科班')
INSERT INTO TblClass VALUES('高一4班','理科班')
INSERT INTO TblClass VALUES('高一5班','文科班')


INSERT INTO TblClass VALUES('高二1班','文科班')
INSERT INTO TblClass VALUES('高二2班','文科班')
INSERT INTO TblClass VALUES('高二3班','理科班')
INSERT INTO TblClass VALUES('高二4班','理科班')
INSERT INTO TblClass VALUES('高二5班','文科班')
INSERT INTO TblClass VALUES('高二6班','理科班')
INSERT INTO TblClass VALUES('高二7班','文科班')
INSERT INTO TblClass VALUES('高二8班','理科班')

INSERT INTO TblClass VALUES('高二9班',NULL)
SELECT COUNT(*) from TblClass
SELECT * FROM TblClass

--update TblClass SET tClassName='{0}',tClassDesc='{1}' WHERE tClassId='{2}'

--DELETE FROM TblClass WHERE tClassId={0}

INSERT INTO TblClass output inserted.tClassId VALUES('a','b')