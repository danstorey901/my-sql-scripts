select lastname, description
	from student s
	join major m
		on s.MajorID= m.Id