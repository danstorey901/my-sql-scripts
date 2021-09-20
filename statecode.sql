declare @statecode varchar(2) = 'KY'

select *
	from Student
	where StateCode = @statecode;