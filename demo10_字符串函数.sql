use MyFiveDatabase

--返回字符个数，无论中英
PRINT len('hi,最近好吗？')
PRINT datalength('hi~最近好吗？') --13
PRINT datalength(N'hi~最近好吗？') --16

PRINT upper('hello')
PRINT lower('Hello')
print ltrim(' asda') --ltrim,rtrim

PRINT left('abcde',2)
PRINT right('abcde',2)
print substring('我们的中华任命工的',3,3)

print empty()


--orcl才有的
--print initcap('hello')
--print concat('aa','bb')