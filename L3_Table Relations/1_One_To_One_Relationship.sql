--1.One-To-One Relationship
--Create two tables and use appropriate data types


CREATE DATABASE [Table Relations];

USE [Table Relations];

CREATE TABLE [Passports](
		PassportID INT PRIMARY KEY NOT NULL,
		PassportNumber VARCHAR(50) NOT NULL
		);

INSERT INTO [Passports](
		PassportID,
		PassportNumber
		)
		VALUES
		(101, 'N34FG21B'),
		(102, 'K65LO4R7'),
		(103, 'ZE657QP2');

CREATE TABLE [Persons](
		PersonID INT PRIMARY KEY IDENTITY(1,1),
		FirstName VARCHAR(50) NOT NULL,
		Salary DECIMAL(15,2) NOT NULL,
		PassportID INT FOREIGN KEY REFERENCES [dbo].[Passports]([PassportID]) UNIQUE NOT NULL
		);

INSERT INTO [Persons](
		FirstName,
		Salary,
		PassportID
		)
		VALUES
		('Roberto', 43300.00, 102),
		('Tom', 56100.00, 103),
		('Yana', 60200.00, 101);

/*SELECT * FROM [dbo].[Passports]

SELECT * FROM [dbo].[Persons]*/