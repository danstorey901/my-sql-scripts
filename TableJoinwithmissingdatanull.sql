select *
	from Student s
		left join Major m
			on m.Id = s.MajorId
			where s.MajorId is null;