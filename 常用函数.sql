

--
--xtype�����ֱ���ͼ���洢���̵ȡ���Ϊ u����ͼΪ v���洢����Ϊ p  (��ϸ����1��

--name ������ͼ�ȵ�����

--��ѯ����Щ���ݿ�
SELECT Name from master..Sysdatabases order by Name

--��ѯ��ǰ���ݿ�����Щ��
SELECT Name FROM Sysobjects WHERE XTYPE='U' ORDER BY Name

--��ѯ��ǰ������Щ��
select name from syscolumns 
where id=
(
	select max(id) from sysobjects where xtype='u' and name='MyStudent'
)


----�洢���̰汾��
EXEC sys.sp_tables --�ɲ���exec
sys.sp_databases
sys.sp_columns 'tblperson'

----��һ���汾��
SELECT * FROM sys.tables --������mysql�е�show tables
--��һ���汾:
SELECT * from INFORMATION_SCHEMA.TABLES
SELECT INFORMATION_SCHEMA.TABLES.TABLE_NAME from INFORMATION_SCHEMA.TABLES
SELECT INFORMATION_SCHEMA.TABLES.TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_TYPE='BASE TABLE'