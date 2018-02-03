create table TblCategory
(
	iId int identity(1,1) primary key,
	tName nvarchar(20),
	tParentId int not null,
	tNote nvarchar(30)
)

INSERT INTO TblCategory VALUES('a',-1,'a的一系列不得了的描述')
INSERT INTO TblCategory VALUES('a',-1,'a的一系列不得了的描述')
INSERT INTO TblCategory VALUES('a',-1,'a的一系列不得了的描述')
INSERT INTO TblCategory VALUES('a',-1,'a的一系列不得了的描述')

INSERT INTO TblCategory(tName,tParentId,tNote)
SELECT 'a',-1,'a的一系列不得了的描述' UNION ALL
SELECT 'b',-1,'b的一系列不得了的描述' UNION ALL
SELECT 'c',-1,'c的一系列不得了的描述' UNION ALL
SELECT 'd',-1,'d的一系列不得了的描述'

SELECT * FROM TblCategory

INSERT INTO TblCategory(tName,tParentId,tNote)
SELECT 'aa1',1,'aa1的一系列不得了的描述' UNION ALL
SELECT 'aa2',1,'aa2的一系列不得了的描述' UNION ALL
SELECT 'aa3',1,'aa3的一系列不得了的描述' UNION ALL
SELECT 'aa4',1,'aa3的一系列不得了的描述'

INSERT INTO TblCategory(tName,tParentId,tNote)
SELECT 'bb1',2,'bb1的一系列不得了的描述' UNION ALL
SELECT 'bb2',2,'bb2的一系列不得了的描述' UNION ALL
SELECT 'bb3',2,'bb3的一系列不得了的描述' UNION ALL
SELECT 'bb4',2,'bb4的一系列不得了的描述'


INSERT INTO TblCategory(tName,tParentId,tNote)
SELECT 'cc1',3,'cc1的一系列不得了的描述' UNION ALL
SELECT 'cc2',3,'cc2的一系列不得了的描述' UNION ALL
SELECT 'cc3',3,'cc3的一系列不得了的描述' UNION ALL
SELECT 'cc4',3,'cc4的一系列不得了的描述'

INSERT INTO TblCategory(tName,tParentId,tNote)
SELECT 'dd1',4,'dd1的一系列不得了的描述' UNION ALL
SELECT 'dd2',4,'dd2的一系列不得了的描述' UNION ALL
SELECT 'dd3',4,'dd3的一系列不得了的描述' UNION ALL
SELECT 'dd4',4,'dd4的一系列不得了的描述'



create table ContentInfo
(
	dId int identity(1,1) primary key,
	dTId int not null,
	dName nvarchar(20),
	dContent nvarchar(50),
	dInTime datetime,
	dEditTime datetime,
	dIsDeleted bit not null
)
PRINT getdate()

SELECT * FROM ContentInfo
INSERT INTO ContentInfo(dTid,dName,dContent,dInTime,DEditTime,dIsDeleted)
SELECT 5,'aaa1','aaa1的文章内容哈哈哈哈哈哈',GETDATE(),GETDATE(),0 UNION ALL
SELECT 5,'aaa2','aaa2的文章内容哈哈哈哈哈哈',GETDATE(),GETDATE(),0

INSERT INTO ContentInfo(dTid,dName,dContent,dInTime,DEditTime,dIsDeleted)
SELECT 6,'bbb1','aaa1的文章内容哈哈哈哈哈哈',GETDATE(),GETDATE(),0 UNION ALL
SELECT 6,'bbb2','bbb2的文章内容哈哈哈哈哈哈',GETDATE(),GETDATE(),0

INSERT INTO ContentInfo(dTid,dName,dContent,dInTime,DEditTime,dIsDeleted)
SELECT 7,'ccc1','ccc1的文章内容哈哈哈哈哈哈',GETDATE(),GETDATE(),0 UNION ALL
SELECT 7,'ccc2','ccc2的文章内容哈哈哈哈哈哈',GETDATE(),GETDATE(),0

INSERT INTO ContentInfo(dTid,dName,dContent,dInTime,DEditTime,dIsDeleted)
SELECT 8,'ccc1','ccc1的文章内容哈哈哈哈哈哈',GETDATE(),GETDATE(),0 UNION ALL
SELECT 8,'ccc2','ccc2的文章内容哈哈哈哈哈哈',GETDATE(),GETDATE(),0

INSERT INTO ContentInfo(dTid,dName,dContent,dInTime,DEditTime,dIsDeleted)
SELECT 9,'ddd1','ddd1的文章内容哈哈哈哈哈哈',GETDATE(),GETDATE(),0 UNION ALL
SELECT 9,'ddd2','ddd2的文章内容哈哈哈哈哈哈',GETDATE(),GETDATE(),0

INSERT INTO ContentInfo(dTid,dName,dContent,dInTime,DEditTime,dIsDeleted)
SELECT 10,'eee1','eee1的文章内容哈哈哈哈哈哈',GETDATE(),GETDATE(),0 UNION ALL
SELECT 10,'eee2','eee2的文章内容哈哈哈哈哈哈',GETDATE(),GETDATE(),0



SELECT did,dname from ContentInfo where dTId = @categoryId