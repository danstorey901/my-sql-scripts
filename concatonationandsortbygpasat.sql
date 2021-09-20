select concat(Firstname, ' ', Lastname) Name, sat, gpa
	from student
	where sat >= 1490
	order by gpa desc, sat desc;