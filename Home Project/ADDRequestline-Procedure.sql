create or alter procedure AddRequestline
	@RequestId int = null,
	@ProductName varchar(30) = null,
	@Quantity int = null
as begin
	-- check for all data entered
	if @RequestId is null OR @ProductName is null OR @Quantity is null begin
		print 'ALL parameters must be entered!,';
		return -1;
	end
	if not exists(select 1 from Requests Id = @RequestId)
	begin
		print 'Request not found';
		return -2;
	end
	if not exists(select 1 from Products where Description = @ProductName)
	begin
		print 'Product not found';
		return -3;
	end
	if @Quantity < 1
	begin
		print 'Quantity must be GTE zero';
		return -4;
	end
	--ALL PARAMTERES ARE CHECKED
	declare @ProductId int;
	select @ProductId = Id from Products where Description = @ProductName;
	--do the Insert
	insert Requestlines (RequestId, ProductId, Quantity)
		values (@RequestId, @ProductId, @Quantity);
	print 'Insert Succesful!';
	return 0;
end
go
exec AddRequestline @RequestId = 1, @ProductName = 'Echo', @Quantity =3;
go
select * from Requests;
select * from Requestlines;