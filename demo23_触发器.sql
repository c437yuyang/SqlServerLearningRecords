--尽量不写触发器，
SELECT * FROM TblClass

--创建一个表结构和TblClass一样结构的表
select TOP 0 * INTO TblClassBackUp FROM TblClass

SELECT * from TblClassBackUp
--创建一个删除触发器
create trigger tri_delete_TblClass on TblClass
after delete
as
begin
	--deleted表，只能在触发器里面才能访问
	insert INTO TblClassBackUp(tClassName,tClassDesc) SELECT tclassName,tClassDesc from DELETED
end

delete FROM TblClass where tClassName like '%XXXXXX%'