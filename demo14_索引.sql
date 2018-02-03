SELECT * from TestIndex1002

--创建聚集索引（物理索引（必须和存储顺序一致）），只能有一个
CREATE clustered index IXc4 on TestIndex1002(c4)
SELECT * from TestIndex1002 WHERE c4 = 1
DROP INDEX TestIndex1002.IXc4

--创建非聚集索引（逻辑索引（不需要和存储顺序一致）），可以有多个
CREATE nonclustered index IXc3 on TestIndex1002(c3)
SELECT * from TestIndex1002 WHERE c3='aAddress'
DROP INDEX TestIndex1002.IXc3