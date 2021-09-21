-- create program that counts 1-10 and writes a message

create or alter procedure CountToTen as
begin
	declare @Index int = 1;
	declare @Stop int = 10;

	while @Index <= @Stop
	begin
		print '@Index is ' + CAST(@Index as varchar(5));
		if @Index = 5
		begin
			print '@Index is five'
		end
		set @Index = @Index +1;
	end
end;
go
exec CountToTen;
go