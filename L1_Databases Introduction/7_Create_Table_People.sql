--Conditions:

--7.Create Table People
--Using SQL query, create table People with the following columns:
-- Id – unique number. For every person there will be no more than 231-1 people (auto incremented).
-- Name – full name of the person. There will be no more than 200 Unicode characters (not null).
-- Picture – image with size up to 2 MB (allow nulls).
-- Height – in meters. Real number precise up to 2 digits after floating point (allow nulls).
-- Weight – in kilograms. Real number precise up to 2 digits after floating point (allow nulls).
-- Gender – possible states are m or f (not null).
-- Birthdate – (not null).
-- Biography – detailed biography of the person. It can contain max allowed Unicode characters (allow nulls).
-- Make the Id a primary key. Populate the table with only 5 records. Submit your CREATE and INSERT statements as
-- Run queries & check DB.

CREATE TABLE People(
		[Id] INT PRIMARY KEY IDENTITY,
		[Name] NCHAR(200) NOT NULL,
		[Picture] VARBINARY(MAX) NULL,
		[Height] DECIMAL(5,2) NULL,
		[Weight] DECIMAL (5,2) NULL,
		[Gender] char(1) NOT NULL CHECK(Gender='m' OR Gender='f'),
		[Birthdate] DATE NOT NULL,
		[Biography] NVARCHAR(MAX) NULL
		)

--SELECT * FROM People

INSERT INTO People(
		[Name], 
		[Picture], 
		[Height], 
		[Weight], 
		[Gender], 
		[Birthdate],
		[Biography]
		)

		VALUES
		('Tsonio', NULL, 1.85, 95.25, 'm', '04/25/1988', NULL),
		('Yavor', NULL, 1.70, 98.65, 'm', '03/08/1989', NULL),
		('Dimitar', NULL, 1.80, 96.15, 'm', '06/04/1989', NULL),
		('Denica', NULL, 1.60, 60.36, 'f', '01/04/1988', NULL),
		('Ivan', NULL, 1.80, 85.56, 'm', '03/08/1984', NULL)