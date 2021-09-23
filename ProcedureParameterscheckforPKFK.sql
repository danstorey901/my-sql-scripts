create or alter Procedure CalculateRequestTotal
	@RequestId int = null
as
begin
 -- check for missing RequestId
	if @RequestID is null
	begin
		print 'RequestId is required';
		return -1;
	end
	--check the RequestId exists
	if not exists(select 1 from Requests where Id = @RequestId)
	begin
		print 'Request not found';
		return -2;
	end
	--
	declare @Total decimal (9,2);
	--this puts the total calculated by the query into the variable called @Total
	select @Total = Sum(rl.quantity * p.price)
			from Requests r
			join Requestlines rl
				on rl.RequestId = r.Id
			join Products p
				on p.Id = rl.ProductId
			where r.Id = @RequestId;
			--displays the value of the variable
		--select @Total 'Total';
		--Now update the request
		update Requests Set
			Total = @Total
			where Id = @RequestId
		print 'Updated!';
		return 0;

end
go
--return code to display the value of the return
declare @rc int;
-- COULD write a procedure the last datetime is was run and then update the requests its tied to
exec @rc = CalculateRequestTotal @RequestId = 1;
print @rc;
go
