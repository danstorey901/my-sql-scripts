-- Delete the students from Michigan
-- delete only those that have no major

select *
	from Student
	where StateCode = 'MI' AND MajorId is null