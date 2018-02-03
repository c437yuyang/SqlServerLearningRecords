SELECT * from bank

--保证两条语句同时执行成功(使用事务)
UPDATE bank set balance=100 WHERE cId=0001
UPDATE bank set balance=910 WHERE cId=0002

print @@error

--事务
BEGIN transaction
	DECLARE @sum int = 0;
	--尽量使用if else语句避免出这种错,否则这样的话.net那边也会报异常的
	UPDATE bank set balance-=100 WHERE cId=0001
	SET @sum+=@@error
	UPDATE bank set balance+=100 WHERE cId=0002
	SET @sum+=@@error
	--只要有一条出错则就一定不是0
	IF(@sum<>0)
	begin --出错了
		rollback transaction--回滚(trainsaction可以省略)
	end
	else --没出错
	begin
		commit transaction--提交
	end
	
	
	
	
--自动提交事务(单挑sql语句都是，出错的时候都会自动回滚)
INSERT INTO aaa VALUES(aaa)


--隐式事务
--set IMPLICIT_TRANSACTIONS {ON|OFF}
--打开一个隐式事务
SET IMPLICIT_TRANSACTIONS ON
INSERT into bank VALUES('0004',1000000) --在一个新的连接(sql脚本)里查询，若未提交则会显示一直正在查询
COMMIT
SET IMPLICIT_TRANSACTIONS OFF

--显示事务:需要手动打开事务，手动提交或回滚
