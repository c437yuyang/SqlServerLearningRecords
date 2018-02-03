EXEC sys.sp_tables

sys.sp_databases

sys.sp_columns 'tblperson'

sp_helptext 'sp_databases'  --�鿴ĳ���洢���̵�Դ����

--�鵽��Դ����
create procedure sys.sp_databases  
as  
    set nocount on  
  
    select  
        DATABASE_NAME   = db_name(s_mf.database_id),  
        DATABASE_SIZE   = convert(int,  
                                    case -- more than 2TB(maxint) worth of pages (by 8K each) can not fit an int...  
                                    when convert(bigint, sum(s_mf.size)) >= 268435456  
                                    then null  
                                    else sum(s_mf.size)*8 -- Convert from 8192 byte pages to Kb  
                                    end),  
        REMARKS         = convert(varchar(254),null)  
    from  
        sys.master_files s_mf  
    where  
        s_mf.state = 0 and -- ONLINE  
        has_dbaccess(db_name(s_mf.database_id)) = 1 -- Only look at databases to which we have access  
    group by s_mf.database_id  
    order by 1  
    
    
    
-------�����Լ��Ĵ洢����(����ֱ��create��Ϊalter)
create proc usp_test_1
as
begin
	select * from TblArea
end

--���ô洢����
exec usp_test_1

--�����洢���̵�ʱ����execһ��ѡ��ִ�У�����ֵݹ���ã�exec����Ҳ��д��洢���̣�
create proc usp_test_2
as
begin
	select * from TblArea
end

exec usp_test_2



--------------------�������Ĵ洢����

create proc usp_add_two_num
@n1 int,
@n2 int
as
begin
	select @n1+@n2
end

exec usp_add_two_num 10,20


----------------Ĭ�ϲ�����������Cpp ������Ĭ�ϲ���д�������βΣ�

alter proc usp_selectStudentByGenderAge
@gender char(2) = '��',
@age int = 20
as 
begin
	select * from TblStudent where tSGender=@gender and tSAge>=@age
end
	
exec usp_selectStudentByGenderAge

--------------����������Ĵ洢����
create proc usp_selectStudentAndCount
@gender char(2) = '��',
@age int = 20,
@sc int output ----�������,ָ����output
as 
begin
	select * from TblStudent where tSGender=@gender and tSAge>=@age
	set @sc=(select COUNT(*) from TblStudent where tSGender=@gender and tSAge>=@age)
end

declare @sc1 int = 0
exec usp_selectStudentAndCount @gender='Ů',@age=20,@sc=@sc1 output -----ע�⴫ʵ�ε�ʱ��Ҳ����ע��output��������c#
select @sc1



-----------------�洢����ʵ�ַ�ҳ
set NOCOUNT OFF

select * from MyStudent

GO --����go��ϵͳ��Ϊ�����һ����һ��������ĵ�һ��
alter proc usp_GetStudentRecord
@pagesize int = 10,
@pageindex int = 1,
@recordcount int output,
@pagecount int output
as
begin
	select 
		* from (SELECT *,rn = row_number() over(ORDER BY fid ASC) from MyStudent) as t
	where rn between (@pageindex-1)*@pagesize+1 AND @pageindex*@pagesize
	set @recordcount = (SELECT COUNT(*) from MyStudent)
	set @pagecount = ceiling(@recordcount*1.0/@pagesize)
end

declare @rc int,@pc int;
exec usp_GetStudentRecord 10,3,@rc output,@pc output
select @rc,@pc


sele
select * from bank
-------�洢����ʵ��ת��



---�洢����ʵ����ɾ�Ĳ�
select * from TblClass

--1.����
create proc usp_insert_TblClass
@name varchar(50),
@desc varchar(50)
as
begin
	insert INTO TblClass VALUES(@name,@desc)
end

---2.ɾ��
create proc usp_delete_TblClass
@id int
as
begin
	delete from TblClass where tClassId=@id
end

--3.����
create proc usp_update_TblClass
@tclassId int,
@name varchar(50),
@desc varchar(50)
as
begin
	update TblClass SET tClassName=@name,tClassDesc=@desc where tClassId=@tclassId
end

---4.��ѯ
create proc usp_selectAll_TblClass
as
begin
	select * from TblClass
end
