create table TblClass
(
	tClassId int identity(1,1) primary key,
	tClassName nvarchar(10),
	tClassDesc nvarchar(10)
)

INSERT INTO TblClass VALUES('����1��','�Ŀư�')
INSERT INTO TblClass VALUES('����2��','�Ŀư�')
INSERT INTO TblClass VALUES('����3��','��ư�')
INSERT INTO TblClass VALUES('����4��','��ư�')
INSERT INTO TblClass VALUES('����5��','�Ŀư�')
INSERT INTO TblClass VALUES('����6��','��ư�')

INSERT INTO TblClass VALUES('��һ1��','�Ŀư�')
INSERT INTO TblClass VALUES('��һ2��','�Ŀư�')
INSERT INTO TblClass VALUES('��һ3��','��ư�')
INSERT INTO TblClass VALUES('��һ4��','��ư�')
INSERT INTO TblClass VALUES('��һ5��','�Ŀư�')


INSERT INTO TblClass VALUES('�߶�1��','�Ŀư�')
INSERT INTO TblClass VALUES('�߶�2��','�Ŀư�')
INSERT INTO TblClass VALUES('�߶�3��','��ư�')
INSERT INTO TblClass VALUES('�߶�4��','��ư�')
INSERT INTO TblClass VALUES('�߶�5��','�Ŀư�')
INSERT INTO TblClass VALUES('�߶�6��','��ư�')
INSERT INTO TblClass VALUES('�߶�7��','�Ŀư�')
INSERT INTO TblClass VALUES('�߶�8��','��ư�')

INSERT INTO TblClass VALUES('�߶�9��',NULL)
SELECT COUNT(*) from TblClass
SELECT * FROM TblClass

--update TblClass SET tClassName='{0}',tClassDesc='{1}' WHERE tClassId='{2}'

--DELETE FROM TblClass WHERE tClassId={0}

INSERT INTO TblClass output inserted.tClassId VALUES('a','b')