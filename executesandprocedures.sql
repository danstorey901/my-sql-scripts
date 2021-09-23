create or alter procedure <spname>
	@<pname1> <type> = n1,
	@<pname2> <type> = n2,
	@<pname1> <type> = n3,

-- @ = param, seperate by commas
exec sproc1 @p1=0,

--@if user doesn't define it takes on a default value
-- executing, if the store procedure returns a value, it can be captuers into another variable
