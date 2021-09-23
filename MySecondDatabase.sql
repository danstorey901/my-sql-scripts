use master;
go
drop database if exists BcDb;
go
create database BcDb;
go
use BcDb;
go
 -- Create the table here
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