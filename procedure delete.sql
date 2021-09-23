create or alter procedure DeleteRequestlineById
	@RequestlineId int = null
as begin
	if @RequestlineId is null begin
		print 'Requestline id is required';
		return -1;
	end
	delete from Requestlines
		where Id = @RequestlineId;
end
go
exec DeleteRequestlineById @RequestlineId = 4;
go