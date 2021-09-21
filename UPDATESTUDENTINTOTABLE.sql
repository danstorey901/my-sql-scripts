--INSERT A NEW STUDENT THAT HAS RECENTLY ENROLLED. STUDENT INFO = NAME: NOAH PHENSE, STATE: GA, SAT:1235, GPA:3.15, MAJOR:MATH
/*
Insert Student
	(Firstname,Lastname, StateCode, SAT, GPA, MajorId)
	VALUES
	('Noah','Phense','GA','1235','3.15',
		(select Id from Major Where Description = 'Math'));

*/

select * from Student order by id desc;