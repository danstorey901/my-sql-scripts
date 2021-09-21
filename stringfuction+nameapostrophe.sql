--COMMENT
-- select GETDATE();

DECLARE @name varchar(30) = 'O''Brien';
select REPLACE('''', '''''', @name);