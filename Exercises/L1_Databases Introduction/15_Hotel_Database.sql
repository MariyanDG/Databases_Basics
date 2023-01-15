--Conditions:

--15.Hotel Database
--Using SQL queries create Hotel database with the following entities:
--•	Employees (Id, FirstName, LastName, Title, Notes)
--•	Customers (AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes)
--•	RoomStatus (RoomStatus, Notes)
--•	RoomTypes (RoomType, Notes)
--•	BedTypes (BedType, Notes)
--•	Rooms (RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes)
--•	Payments (Id, EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, TotalDays, 
--	AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes)
--•	Occupancies (Id, EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes)
--Set the most appropriate data types for each column. Set a primary key to each table. Populate each table
--	with only 3 records. Make sure the columns that are present in 2 tables would be of the same data type. 
--	Consider which fields are always required and which are optional. Submit your CREATE TABLE and INSERT 
--	statements as Run queries & check DB.


CREATE DATABASE Hotel

USE Hotel

CREATE TABLE Employees (
		[Id] INT PRIMARY KEY IDENTITY, 
		[FirstName] NVARCHAR(50) NOT NULL, 
		[LastName] NVARCHAR(50) NOT NULL, 
		[Title] NVARCHAR(50), 
		[Notes] NVARCHAR(MAX)
		);

CREATE TABLE Customers(
		[AccountNumber] INT PRIMARY KEY IDENTITY,
		[FirstName] NVARCHAR(50) NOT NULL,
		[LastName] NVARCHAR(50) NOT NULL,
		[PhoneNumber] NVARCHAR(30),
		[EmergencyName] NVARCHAR(30),
		[EmergencyNumber] NVARCHAR(30),
		[Notes] NVARCHAR(MAX)
		)

CREATE TABLE RoomStatus(
		[RoomStatus] NVARCHAR(50) PRIMARY KEY NOT NULL,
		[Notes] NVARCHAR(MAX)
		)

CREATE TABLE RoomTypes(
		[RoomType] NVARCHAR(50) PRIMARY KEY NOT NULL,
		[Notes] NVARCHAR(50)
		)

CREATE TABLE BedTypes(
		[BedType] NVARCHAR(50) PRIMARY KEY NOT NULL,
		[Notes] NVARCHAR(MAX)
		)

CREATE TABLE Rooms(
		[RoomNumber] INT PRIMARY KEY NOT NULL,
		[RoomType] NVARCHAR(50) FOREIGN KEY REFERENCES RoomTypes([RoomType]) NOT NULL,
		[BedType] NVARCHAR(50) FOREIGN KEY REFERENCES BedTypes([BedType]) NOT NULL,
		[Rate] DECIMAL(7,2) NOT NULL,
		[RoomStatus] BIT NOT NULL,
		[Notes] NVARCHAR(MAX)
		)

CREATE TABLE Payments(
		[Id] INT PRIMARY KEY IDENTITY,
		[EmployeeId] INT FOREIGN KEY REFERENCES Employees([Id]) NOT NULL,
		[PaymentDate] DATETIME2 NOT NULL,
		[AccountNumber] INT FOREIGN KEY REFERENCES Customers([AccountNumber]) NOT NULL,
		[FirstDateOccupied] DATE NOT NULL,
		[LastDateOccupied] DATE NOT NULL,
		[TotalDays] AS DATEDIFF(DAY, [FirstDateOccupied], [LastDateOccupied]),
		[AmountCharged] DECIMAL(7,2),
		[TaxRate] DECIMAL(6,2),
		[TaxAmount] AS [AmountCharged] * [TaxRate],
		[PaymentTotal] AS [AmountCharged] + [AmountCharged] * [TaxRate],
		[Notes] NVARCHAR(MAX)
		)

CREATE TABLE Occupancies(
		[Id] INT PRIMARY KEY IDENTITY,
		[EmployeeId] INT FOREIGN KEY REFERENCES Employees([Id]) NOT NULL,
		[DateOccupied] DATE NOT NULL,
		[AccountNumber] INT FOREIGN KEY REFERENCES Customers([AccountNumber]) NOT NULL,
		[RoomNumber] INT FOREIGN KEY REFERENCES Rooms([RoomNumber]) NOT NULL,
		[RateApplied] DECIMAL(7,2) NOT NULL,
		[PhoneCharge] DECIMAL(8,2) NOT NULL,
		[Notes] NVARCHAR(MAX)
		)

INSERT INTO Employees(
		[FirstName], [LastName], [Title], [Notes]
		)
		VALUES
		('Galin', 'Zhelev','IT', NULL),
		('Stoyan', 'Ivanov','CTO', NULL),
		('Petar', 'Ikonomov','CEO', NULL);

INSERT INTO Customers(
		[FirstName], [LastName], [PhoneNumber]) 
		VALUES
		('Monio', 'Ushev', '+359888666555'),
		('Gancho', 'Stoykov', '+359866444222'),
		('Genadi', 'Dimchov', '+35977555333')

INSERT INTO RoomStatus([RoomStatus]) 
		VALUES
		('occupied'),
		('non occupied'),
		('repairs')

INSERT INTO RoomTypes(RoomType) 
		VALUES
		('single'),
		('double'),
		('appartment')

INSERT INTO BedTypes(BedType) 
		VALUES
		('single'),
		('double'),
		('couch')

INSERT INTO Rooms([RoomNumber], [RoomType], [BedType], [Rate], [RoomStatus])
		VALUES
		(201, 'single', 'single', 40.0, 1),
		(205, 'double', 'double', 70.0, 0),
		(208, 'appartment', 'double', 110.0, 1)

INSERT INTO Payments(EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, AmountCharged, TaxRate) VALUES
		(1, '2011-11-25', 2, '2017-11-30', '2017-12-04', 250.0, 0.2),
		(3, '2014-06-03', 3, '2014-06-06', '2014-06-09', 340.0, 0.2),
		(3, '2016-02-25', 2, '2016-02-27', '2016-03-04', 500.0, 0.2)

INSERT INTO Occupancies(EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge) VALUES
		(2, '2011-02-04', 3, 205, 70.0, 12.54),
		(2, '2015-04-09', 1, 201, 40.0, 11.22),
		(3, '2012-06-08', 2, 208, 110.0, 10.05)