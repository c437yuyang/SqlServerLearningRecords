--��ͼ����һ�������ֻ�ܴ��ѯ��� ���Ҳ��ܴ�����

SELECT
	t1.AreaId,
	t2.AreaName as ʡ������,
	t1.AreaName as ������
	from
	TblArea as t1 
	inner join TblArea as t2 
	ON t1.AreaPId=t2.AreaId --�ѿ�����

--��ͼ�����������һ��Ҫ�����,����֮���ڲ�ѯ��ʱ��(��ľ�����ͼ���оͻ��ͻ��)
CREATE view vw_tblArea
as 
	SELECT
		t1.AreaId,
		t2.AreaName as ʡ������,
		t1.AreaName as ������
		from
		TblArea as t1 inner join TblArea as t2 
		ON t1.AreaPId=t2.AreaId --�ѿ�����

--֮��͸���ѯ��һ��
SELECT * FROM vw_tblArea

SELECT * FROM vw_tblArea where AreaId>400