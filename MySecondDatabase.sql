use master;
go
drop database if exists BcDb;
go
create database BcDb;
go
use BcDb;
go
 -- Create the table here REFERENCE SLIDE 207!!
 create table Customers (
	Id int not null primary key identity(1,1),
	Code varchar(10) unique not null,
	Name varchar(30) not null,
	Sales decimal(9,2) not null
		default 0 check (Sales >= 0),
	Active bit not null default 1,
	Created datetime not null default getdate()
	)
 go
 -- Do your inserts here
 Insert into Customers
	(Code, Name, Sales)
	values
	('AMAZ', 'Amazon', 20.00),
	('MSFT', 'Microsoft', 30.01),
	('TARG', 'Target', 40.09),
	('BBUY', 'BestBuy', 483.10),
	('COST', 'Costco', 800.23)

 go
 --first alter command
 alter table Customers
	add Updated DateTime;
	-- if you want to create a new column thats not allowed to be null you must use 3 steps, make null, run, then update customer set
--step one --alter table Customers
	--add Note varchar(30) null;

/* step three */ alter table Customers
	alter Column Note varchar(30) not null;

/*step two*/update Customers set
	Note = 'Default note',
/*step four*/	Updated = getdate()

Select * from Customers;