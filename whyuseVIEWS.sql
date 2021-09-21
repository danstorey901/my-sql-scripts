
create view ClassesForMajorIncInstructor as

select m.Code MajorCode, m.Description Major,
	c.Code Class, i.Lastname Instructor
	from Major m
	join MajorClass mc
		on mc.MajorId = m.Id
	join Class c
		on c.Id = mc.ClassId
	join Instructor i
		on i.Id = c.InstructorId
		--view = saved sql queries that are a little more complex, i.e. so you don't have to keep rewriting all these joins!!
	select * from ClassesForMajorIncInstructor