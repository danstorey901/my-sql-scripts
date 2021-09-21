--Define tables
create table Students (
	Id int not null primary key identity(1,1),
	Name varchar(50) not null,
	FavNumber int not null,
	FavColor varchar (20) null default 'Grey',
	Milk bit null default 0
);
--Insert tables
insert into Students
	(Name,FavNumber, FavColor, Milk)
	values
	('Matt', 144, 'Green', 1),
	('Parth', 84, 'Blue', 1),
	('Caroline',25, null, 0);

	go
--Define tables
create table Topics (
	Id int not null primary key identity(1,1),
	Description varchar(30) not null,
	Sequence int not null unique,
	TooEasy bit not null default 1

)
go

--Insert table
insert into Topics
	(Description,Sequence, TooEasy)
	values
	('Git/GitHub', 1, 1),
	('SQL Server', 2, 1),
	('C#', 3, 0),
	('EntityFrameworkCore', 4, 1),
	('Java', 5, 1),
	('Spring', 6, 1),
	('HTML', 7, 1),
	('CSS', 8, 1),
	('Javascript', 9, 1),
	('Bootstrap', 10, 1),
	('jQuery', 11, 1),
	('Typescript', 12, 1),
	('Angular', 13, 1),
	('TooEasy', 14, 1);
	go

	--Establish Table with Primary and Foreign keys. Do not create until now as you cannot establish PK/FK
	-- without referencing already existing data/tables
create table Rating (
	Id int not null primary key identity (1,1),
	Stars int not null check (Stars >= 1 and Stars <= 5),
	Comment varchar(300) null,
	StudentId int not null
		foreign key references Students(Id),
	TopicId int not null
		foreign key references Topics(Id);

Insert into Rating (Stars, StudentId, TopicId)
   values (3,
  (Select Id from Students where Name = 'Matt'),
  (Select Id from Topics where Description like '%Git%');