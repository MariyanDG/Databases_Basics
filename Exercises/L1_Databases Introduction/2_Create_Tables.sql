--Condition:

--2.Create Tables
--In the newly created database Minions add table Minions (Id, Name, Age). 
--Then add a new table Towns (Id, Name).
--Set Id columns of both tables to be primary key as constraint.

CREATE TABLE Minions(
	Id INT PRIMARY KEY NOT NULL, 
	[Name] NVARCHAR(50) NOT NULL, 
	Age TINYINT
	)

CREATE TABLE Towns(
	Id INT PRIMARY KEY NOT NULL,
	[Name] NVARCHAR(50) NOT NULL
	)