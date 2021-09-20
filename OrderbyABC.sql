select *
	from student s
	where GPA > (select avg(GPA)
					from student)
					order by GPA desc