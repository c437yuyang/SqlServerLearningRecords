create table PhoneGroup
(
	ptId int identity(1,1) primary key,
	ptName nvarchar(10)
)

create table PhoneNum
(
	pId int identity(1,1) primary key,
	pTypeId int not null,
	pName nvarchar(10),
	pCellPhone char(11),
	pHomePhone char(8) constraint CK_PhoneGroup_pHomePhone check(len(pHomePhone)=8)
)
ALTER table PhoneNum add constraint CK_PhoneGroup_pCellPhone CHECK(len(pCellPhone)=11)
ALTER table PhoneNum
alter column pName nvarchar(20)

INSERT INTO PhoneGroup VALUES('朋友')
INSERT INTO PhoneGroup VALUES('同事')
INSERT INTO PhoneGroup VALUES('同学')
INSERT INTO PhoneGroup VALUES('家人')




INSERT INTO PhoneNum VALUES(1,'c437yuyang1','12345678912','12345671')
INSERT INTO PhoneNum VALUES(1,'c437yuyang2','12345678913','12345672')
INSERT INTO PhoneNum VALUES(2,'c437yuyang3','12345678914','12345673')
INSERT INTO PhoneNum VALUES(2,'c437yuyang4','12345678915','12345674')
INSERT INTO PhoneNum VALUES(2,'c437yuyang5','12345678916','12345675')
INSERT INTO PhoneNum VALUES(3,'c437yuyang6','12345678917','12345676')
INSERT INTO PhoneNum VALUES(3,'c437yuyang7','12345678918','12345677')
INSERT INTO PhoneNum VALUES(3,'c437yuyang8','12345678919','12345678')
INSERT INTO PhoneNum VALUES(4,'c437yuyang9','12345678910','12345679')
INSERT INTO PhoneNum VALUES(4,'c437yuyan10','12345678911','12345610')
INSERT INTO PhoneNum VALUES(4,'c437yuyan11','12345678111','12345611')
SELECT * FROM PhoneNum
SELECT * FROM PhoneGroup
