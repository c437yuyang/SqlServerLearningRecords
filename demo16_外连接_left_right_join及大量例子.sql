--left join(������) ���ذ�������е����м�¼���ұ��������ֶ���ȵļ�¼������������м�¼������ұ��Ӧ�ֶ�û����Ӧ��¼��Ϊnull
--right join(������) ���ذ����ұ��е����м�¼������������ֶ���ȵļ�¼
--inner join(��ֵ����) ֻ�����������������ֶ���ȵ���
--http://blog.csdn.net/u010300947/article/details/37814513 ,���Կ�������ͣ�д�ıȽ����

SELECT * from TblStudent
SELECT * FROM TblScore

--��ѯ�μӿ��Ե�ѧ���ĳɼ�����Ϊ�μӿ��ԵĻ����������ű��м�¼�������inner join
SELECT
	t1.tSName,
	t1.tSAge,
	t2.tEnglish,
	t2.tMath
from TblStudent as t1
INNER JOIN TblScore as t2 
on t1.tSId=t2.tSId

SELECT -- inner�ؼ��ֿ���ʡ
	t1.tSName,
	t1.tSAge,
	t2.tEnglish,
	t2.tMath
from TblStudent as t1
JOIN TblScore as t2 
on t1.tSId=t2.tSId

--�����ӻὫ��������ȫ����ʾ��ͬʱ��Ӧ��������������ұ������ҵ�ƥ������ݣ���ô����ʾ��Ӧ���ұ������,����Ҳ���������������ճ���ʾ���ұ���ʾnull
--��ѯ����ѧ��(û�μӿ��ԵĻ���ʾnull,�������Ҫ�����Լ���where����ɸѡ����)�ĳɼ���Ϣ
--��mysqlһ����outer��inner�ؼ�����ʵ������ʡ��
SELECT
	t1.*,
	t2.tEnglish,
	t2.tMath
from TblStudent as t1 
LEFT OUTER JOIN TblScore as t2 
on t1.tSId=t2.tSId
where t2.tEnglish is not null and t2.tMath is not null


--��ѯû�вμӿ��Ե�ѧ������Ϣ(�Ӳ�ѯʵ��)
SELECT
	 * from TblStudent 
	 WHERE tSId NOT IN 
	(SELECT TblScore.tSId from TblScore)

--��ѯû�вμӿ��Ե�ѧ������Ϣ,ͨ�����Ӳ�ѯʵ��
SELECT
	t1.*,
	t2.tEnglish,
	t2.tMath
	from TblStudent as t1 
	LEFT JOIN TblScore as t2 on t1.tSId<>t2.tSId --����д�Ǵ�ģ��ѿ�������ԭ��

--��ȷ��д��(������)
SELECT
	t1.*,
	t2.tEnglish,
	t2.tMath
	from TblStudent as t1 
	LEFT JOIN TblScore as t2 
	on t1.tSId=t2.tSId  --��ͨ���������õ�����ѧ������Ϣ
	WHERE t2.tScoreId IS NULL

--��ȷ��д��(������)
SELECT
	t2.*,
	t1.tEnglish,
	t1.tMath	
	from TblScore as t1 
	RIGHT JOIN TblStudent as t2 
	on t1.tSId=t2.tSId  --ͨ���������õ�����ѧ������Ϣ
	WHERE t1.tScoreId IS NULL



--------------------ʹ�������ӣ���ֱ��˵���Ӳ�ѯ����ʱ�����Ҫָ����ѯ��������ע������������Ҫд��on����(��ʱ������)��д�ں����where���
--�������������1.innerjoin�ҳ��ѿ���������������ģ�2.��left joinѡ�������������ݽ��в���3.where��
--����on�Ļ����ڵ�һ��innerjoin��ʱ��ɸѡ��,����left join���ֻ���ӽ��������Գ���

--��������������ӣ���ѯ����û�μӿ��Ե�������gender�ж�д����on���棬�ͳ�����
SELECT
	t2.*,
	t1.tEnglish,
	t1.tMath	
	from TblScore as t1 
	RIGHT JOIN TblStudent as t2
	on t1.tSId=t2.tSId AND t2.tSGender='��'
	WHERE t1.tScoreId IS NULL

--��ȷ��д����д��where�������ɸѡ����
SELECT
	t2.*,
	t1.tEnglish,
	t1.tMath	
	from TblScore as t1 RIGHT JOIN TblStudent as t2 
	on t1.tSId=t2.tSId 
	WHERE t1.tScoreId IS NULL AND t2.tSGender='��'


----------------------��ϰ
--1.��ѯ����ѧ�����ο���δ�ο��ģ�����������ɼ���û�μӿ�����ʾȱ��,math & english < 60 ��ʾ������

SELECT
	t1.tSName,
	t1.tSAge,
	'��ѧ�ɼ�:' = case
					when t2.tMath is null then 'ȱ��'
					when t2.tMath < 60 then '������'
					else convert(varchar,t2.tMath)
					end ,
	'Ӣ��ɼ�' = case
					when t2.tEnglish is null then 'ȱ��'
					when t2.tEnglish < 60 then '������'
					else convert(varchar,t2.tEnglish)
					end 
	from TblStudent as t1
	LEFT JOIN TblScore as t2 
	on t1.tsId=t2.tsId
	
--��ʵ����ȫ���ӣ���full�ؼ��֣�����������������û�еľ���ʾnull

select * from tblStudent as t1
 full join  tblscore as t2 
	on t1.tsid = t2.tsid