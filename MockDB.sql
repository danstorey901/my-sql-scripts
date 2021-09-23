use master;
go
drop database if exists MockDb;
go
create database MockDb;
go
use MockDb;
go
 -- Create the table here REFERENCE SLIDE 207!!
 create table Users (
	Id int not null primary key identity(1,1),
	Username varchar(30) unique not null,
	Password varchar(30) not null,
	Firstname varchar(30) not null,
	Lastname varchar(30) not null,
	Phone varchar(30) null,
	Email varchar(30) null,
	IsReviewer bit not null default 0,
	IsAdmin bit not null default 0,
	Created datetime not null default getdate()
	)
 go
 -- User Insert
 Insert Users (Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)
	values
	('sa', 'sa', 'Systems', 'Admin', 1, 1),
	('ra', 'ra', 'Systems', 'Reviewer', 1, 0),
	('ua1', 'ua', 'Systems 1', 'User', 0, 0),
	('ua2', 'ua', 'Systems 2', 'User', 0, 0);

	go

 -- Vendor Table
 create table Vendors (
	Id int not null primary key identity(1,1),
	Code varchar(30) unique not null,
	Name varchar(30) not null,
	Address varchar(30) not null,
	City varchar(30) not null,
	State varchar(2) not null,
	Zip varchar(5) not null,
	Phone varchar(12),
	Email varchar(255),
	Created datetime not null default getdate()
	)
 go
 -- Vendor Insert
 Insert into Vendors
	(Code, Name, Address, City, State, Zip, Phone, Email)
	values
	('AMAZ', 'Amazon', '1234WAY', 'Amelia','OH','45105' ),
	('MSFT', 'Microsoft','4567TOO', 'Madisonville', 'OH', '45245'),
	('KRG', 'KROGER', '8910E', 'Oakley', 'OH', '45204'),
	('COST', 'Costco', '1112Z', 'Cincinnati', 'OH', '45226');

 go

 -- Create the table here REFERENCE SLIDE 207!!
 create table Products (
	Id int not null primary key identity(1,1),
	Partnbr varchar(30) unique not null,
	Name varchar(30) not null,
	Price decimal(9,2) not null default 0,
	Unit varchar(30) not null default 'Each',
	Photopath varchar(255) null,
	VendorId int not null
			foreign key references Vendors(Id),
	Created datetime not null default getdate(),
	)
 go
 -- Do your inserts here
 Insert into Products
	(Partnbr, Name, Price, Unit, Photopath, VendorId, Created)
	values
	('23523', 'Widget', 20.00),
	('87667', 'Wadget', 30.01),
	('099090090', 'Kroger', 40.09),
	('1001010101001', 'Costco', 800.23)

 go

 -- Create the table here REFERENCE SLIDE 207!!
 create table Requests (
	Id int not null primary key identity(1,1),
	Description varchar(80) not null,
	Justification varchar(80) not null,
	Rejectonreason varchar(80) null,
	Deliverymode varchar(20) not null default 'Pickup',
	Status varchar(10) not null default 'NEW',
	Total decimal(11,2) not null default 0,
	Userid int not null
		foreign key references Users(Id),
	Created datetime not null default getdate()
	)
 go
 -- Do your inserts here
 Insert into Requests
	(Description, Justification, Rejectonreason, Deliverymode, Status, Total, UserId)
	values
	('AMAZ', 'Amazon', 20.00),
	('MSFT', 'Microsoft', 30.01),
	('TARG', 'Target', 40.09),
	('BBUY', 'BestBuy', 483.10),
	('COST', 'Costco', 800.23)

 go

 -- Create the table here REFERENCE SLIDE 207!!
 create table Requestlines (
	Id int not null primary key identity(1,1),
	Requestid int unique not null
		foreign key references Requests(Id),
	Productid int not null
		foreign key references Products(Id),
	Quantity int not null default 1
		check (Quantity > 0),
	Created datetime not null default getdate()
	)
 go
 -- Do your inserts here
 Insert into Requestlines
	(Requestid, Productid, Quantity)
	values
	('AMAZ', 'Amazon', 20.00),
	('MSFT', 'Microsoft', 30.01),
	('TARG', 'Target', 40.09),
	('BBUY', 'BestBuy', 483.10),
	('COST', 'Costco', 800.23)


	/*
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
*/