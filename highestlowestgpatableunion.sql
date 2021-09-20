declare @uppergpa decimal (5,1) = 3.5;
declare @lowergpa decimal (5,1) = 2.5;

Select *
	from Student
	where gpa >= @uppergpa
	UNION
Select *
	from Student
	where gpa <= @lowergpa;