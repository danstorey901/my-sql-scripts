--How to update rows, 1 of them, multiple specific, or all

update Products set
	Description = 'xoxoxoxoxoxooxoxo',
	Price = 123
	where Id in (1,3);
	go
---------------------------------------------------------------------------------------

create or alter procedure <spname>
	@<pname1> <type> = n1,
	@<pname2> <type> = n2,
	@<pname1> <type> = n3,

-- @ = param, seperate by commas
exec sproc1 @p1=0,

--@if user doesn't define it takes on a default value
-- executing, if the store procedure returns a value, it can be captuers into another variable


--if else
--if boolean expression is true, statement or block is executed otherwise staement or block Else is executed

if @a = 0 begin
	set @b = 'ABC'; -- executed if true
end else begin
	set @c = 'XYZ'; -- executed if false
end

--purpose, check code to see if correct value exists
----------------------------------------------------------------------

--while = a loop that goes over and over again until resolution
-- Executes the following statement or statement block is executed as long as the boolean expression is true.

while @idx <10 begin
	print @idx
	set @idx = @idx + 1;
end

-- Break = if executed inside a while loop, the loop executes immedaitely

while @idx < 10 begin
	if @idx = 3 break;
	set @idx = @idx + 1;
end

-- does this student have a state code of wv? if there is any, then it breaks, aka gets out of the loop

--continue = when executed within a while loop, the remaining statements are skipped and the next iteration of the loop executes

while @idx < 10 begin
	set @idx = @idx + 1;
	if @idx = 5 continue;
	print @idx; -- skipped if @idx is 5

--return = return statement passes a value back oto the calling statement

if @NbrErrors < 0 begin
	return -1; -- falure
end
return 0; -- success!

-- throw = generates an error that can be handled by the calling staement code

set @idx = -3
while @idx <10 begin
	if @idx = 0
	throw -1, 'div by zero', 0;
set @idx = @idx + 1;
end

-- catch = if any statements within the BEGIN TRY and END TRY executes a THROW statement,
-- control is transferred to the BEGIN CATCH and END CATCH block

begin try
	throw 123, 'idx is 5', 0;
end try
begin catch
	select ERROR_NUMBER(),
				ERROR_MESSAGE(),
				ERROR_STATE();
end catch


-- CURSORS = cursors are a construct that allowes iterating through a result set row by row
-- they must be declare AND include a SQL statement that return a result set.
-- they must be opened at the start and closed and deallocated when done

-- declaring and deallocating cursor = defines and deallocates a cursor associated with a SQL SELECT staement

declare my Cur Cursor for
	SELECT * from Customer;
--
DEALLOCATE myCur;


-- OPEN/CLOSE CURSOR = after being declared, a cursor must be opened then closed at the end of processing

OPEN myCUr;
-- cursor operations
CLOSE myCur;

--FETCH CURSOR = retrieves the first, next, prev, or last row in the result set of a cursor
-- row data can be stored in variable using the INTO clause
--@@FETCH_STATUS is 0 when successfull

declare @id int, @name varchar(30);
FETCH Next FROM myCur INTO
	@id, @name;
--put the columns that you need, dont just select * everything
