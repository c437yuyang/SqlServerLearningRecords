--������д��������
SELECT * FROM TblClass

--����һ����ṹ��TblClassһ���ṹ�ı�
select TOP 0 * INTO TblClassBackUp FROM TblClass

SELECT * from TblClassBackUp
--����һ��ɾ��������
create trigger tri_delete_TblClass on TblClass
after delete
as
begin
	--deleted��ֻ���ڴ�����������ܷ���
	insert INTO TblClassBackUp(tClassName,tClassDesc) SELECT tclassName,tClassDesc from DELETED
end

delete FROM TblClass where tClassName like '%XXXXXX%'