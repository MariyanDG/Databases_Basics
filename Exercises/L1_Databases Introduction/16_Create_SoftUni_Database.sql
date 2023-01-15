--Condition:


--16.Create SoftUni Database
--Now create bigger database called SoftUni. You will use the same database in the future tasks. 
--	It should hold information about
--•	Towns (Id, Name)
--•	Addresses (Id, AddressText, TownId)
--•	Departments (Id, Name)
--•	Employees (Id, FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary, 
--	AddressId)
--The Id columns are auto incremented, starting from 1 and increased by 1 (1, 2, 3, 4…). Make 
--	sure you use appropriate data types for each column. Add primary and foreign keys as 
--	constraints for each table. Use only SQL queries. Consider which fields are always 
--	required and which are optional.

CREATE DATABASE SoftUni

USE SoftUni

CREATE TABLE Towns(
		[Id] INT PRIMARY KEY IDENTITY(1,1),
		[Name] NVARCHAR(50) NOT NULL
		)

CREATE TABLE Addresses(
		[Id] INT PRIMARY KEY IDENTITY(1,1),
		[AddressText] NVARCHAR(100) NOT NULL,
		[TownId] INT FOREIGN KEY REFERENCES Towns([Id]) NOT NULL
		)

CREATE TABLE Departments(
		[Id] INT PRIMARY KEY IDENTITY(1,1),
		[Name] NVARCHAR(50) NOT NULL
		)

CREATE TABLE Employees(
		[Id] INT PRIMARY KEY IDENTITY(1,1),
		[FirstName] NVARCHAR(50) NOT NULL,
		[MiddleName] NVARCHAR(50),
		[LastName] NVARCHAR(50) NOT NULL,
		[JobTitle] NVARCHAR(50) NOT NULL,
		[DepartmentId] INT NOT NULL,
		[HireDate]DATE NOT NULL,
		[Salary] MONEY NOT NULL,
		[AddressId] INT FOREIGN KEY REFERENCES Addresses([Id])
		)