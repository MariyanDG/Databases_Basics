--Conditions:

--14.Car Rental Database
-- Using SQL queries create CarRental database with the following entities:
-- Categories (Id, CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
-- Cars (Id, PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Picture, Condition,
-- Available)
-- Employees (Id, FirstName, LastName, Title, Notes)
-- Customers (Id, DriverLicenceNumber, FullName, Address, City, ZIPCode, Notes)
-- RentalOrders (Id, EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart,
-- KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate,
-- OrderStatus, Notes)

-- Set the most appropriate data types for each column. Set a primary key to each table. Populate each table with only
-- 3 records. Make sure the columns that are present in 2 tables would be of the same data type. Consider which fields
-- are always required and which are optional. Submit your CREATE TABLE and INSERT statements as Run queries &
-- check DB.

CREATE DATABASE CarRental

USE CarRental

CREATE TABLE Categories(
		[Id] INT PRIMARY KEY IDENTITY(1,1),
		[CategoryName] NVARCHAR(50) NOT NULL,
		[DailyRate] INT,
		[WeeklyRate] INT,
		[MonthlyRate] INT,
		[WeekendRate] INT
		)

INSERT INTO Categories([CategoryName])
		VALUES
			('Zorro'),
			('Баш Майстора'),
			('Limit Less')

--SELECT * FROM Categories

CREATE TABLE Cars(
		[Id] INT PRIMARY KEY IDENTITY(1,1),
		[PlateNumber] NVARCHAR(10) NOT NULL,
		[Manufacturer] NVARCHAR(50) NOT NULL,
		[Model] NVARCHAR(50),
		[CarYear] INT,
		[CategoryId] INT FOREIGN KEY REFERENCES Categories(Id) NOT NULL,
		[Doors] INT,
		[Picture] VARBINARY(MAX),
		[Condition] NVARCHAR(100),
		[Available] BIT
		)

INSERT INTO Cars([PlateNumber], [CategoryId], [Manufacturer])

		VALUES
		('Y1594AB', 1, 'AUDI'),
		('CA1698AP', 2, 'BMW'),
		('X1598AM', 3, 'LEXUS')

--SELECT * FROM Cars

CREATE TABLE Employees(
		[Id] INT PRIMARY KEY IDENTITY(1,1),
		[FirstName] NVARCHAR(50) NOT NULL,
		[LastName] NVARCHAR(50) NOT NULL,
		[Title] NVARCHAR(MAX),
		[Notes] NVARCHAR(MAX)
		)

INSERT INTO Employees([FirstName], [LastName])

		VALUES
		('Mariyan', 'Petrov'),
		('Georgi', 'Ivanov'),
		('Sabin', 'Trifonov')

--SELECT * FROM Employees

CREATE TABLE Customers(
		[Id] INT PRIMARY KEY IDENTITY(1,1),
		[DriverLicenceNumber] INT NOT NULL,
		[FullName] NVARCHAR(200) NOT NULL,
		[Address] NVARCHAR(100),
		[City] NVARCHAR(50),
		[ZIPCode] INT,
		[Notes] NVARCHAR(MAX)
		)

INSERT INTO Customers([DriverLicenceNumber], [FullName])

		VALUES
		(33, 'Kolio Petrov Petrov'),
		(56, 'Sasho Georgiev Filipov'),
		(12, 'Petko Ivanov Ivanov')

--SELECT * FROM Customers

CREATE TABLE RentalOrders(
		[Id] INT PRIMARY KEY IDENTITY(1,1),
		[EmployeeId] INT FOREIGN KEY REFERENCES Employees(Id) NOT NULL,
		[CustomerId] INT FOREIGN KEY REFERENCES Customers(Id) NOT NULL,
		[CarId] INT FOREIGN KEY REFERENCES Cars(Id) NOT NULL,
		[TankLevel] INT,
		[KilometrageStart] INT NOT NULL,
		[KilometrageEnd] INT,
		[TotalKilometrage] INT,
		[StartDate] DATETIME2,
		[EndDate] DATETIME2,
		[TotalDays] INT,
		[RateApplied] INT,
		[TaxRate] INT,
		[OrderStatus] NVARCHAR(50),
		[Notes] NVARCHAR(MAX)
		)

INSERT INTO RentalOrders([EmployeeId], [CustomerId], [CarId], [KilometrageStart])

		VALUES
		(1, 2, 3, 560),
		(2, 3, 2, 156),
		(3, 1, 1, 236);

--SELECT * FROM RentalOrders