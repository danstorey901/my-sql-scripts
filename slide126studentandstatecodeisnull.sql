-- create a list of students last name + major for those who live in michigan
-- students that don't have a major, show description as Undeclared

select s.Lastname, ISNULL(m.Description, 'UNDECLARED') Major
	from Student s
	left join Major m
		on m.Id = s.MajorId
	where statecode = 'MI'
	