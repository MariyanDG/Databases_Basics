--Conditions:

--13.Movies Database
-- Using SQL queries create Movies database with the following entities:
-- Directors (Id, DirectorName, Notes)
-- Genres (Id, GenreName, Notes)
-- Categories (Id, CategoryName, Notes)
-- Movies (Id, Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
-- Set the most appropriate data types for each column. Set a primary key to each table. Populate each table with
-- exactly 5 records. Make sure the columns that are present in 2 tables would be of the same data type. Consider which
-- fields are always required and which are optional. Submit your CREATE TABLE and INSERT statements as Run queries
-- & check DB.

CREATE DATABASE Movies

USE Movies

CREATE TABLE Directors(
		[Id] INT PRIMARY KEY IDENTITY(1,1),
		[DirectorName] NVARCHAR(50) NOT NULL,
		[Notes] NVARCHAR(MAX)
		)

INSERT INTO Directors([DirectorName],[Notes])

		VALUES
		('Georgi', 'Good'),
		('Stanimir', 'Bad'),
		('Ivan', 'Nice'),
		('Dimo', 'Worst'),
		('Kliment', 'Ugly');

--SELECT * FROM Directors

CREATE TABLE Genres(
		[Id] INT PRIMARY KEY IDENTITY(1,1),
		[GenreName] NVARCHAR(50) NOT NULL,
		[Notes] NVARCHAR(MAX)
		)

INSERT INTO Genres([GenreName],[Notes])

		VALUES
		('Action', 'Funny'),
		('Cartoon', 'Scary'),
		('Comedy', 'Cringe'),
		('Sci-fi', 'interesting'),
		('Cars', 'Notesss');

--SELECT * FROM Genres

CREATE TABLE Categories(
		[Id] INT PRIMARY KEY IDENTITY(1,1),
		[CategoryName] NVARCHAR(50) NOT NULL,
		[Notes] NVARCHAR(MAX)
		)

INSERT INTO Categories([CategoryName],[Notes])

		VALUES
		('AlaBala', NULL),
		('GruhGruh', 'Da si ebe'),
		('2023', NULL),
		('Lukanka', 'Very Nice'),
		('Munky', 'Not So Bad');

--SELECT * FROM Categories

CREATE TABLE Movies(
		[Id] INT PRIMARY KEY NOT NULL,
		[Title] NVARCHAR(200) NOT NULL,
		[DirectorId] INT FOREIGN KEY REFERENCES Directors(Id) NOT NULL,
		[CopyrightYear] INT,
		[Length] INT,
		[GenreId] INT FOREIGN KEY REFERENCES Genres(Id) NOT NULL,
		[CategoryId] INT FOREIGN KEY REFERENCES Categories(Id) NOT NULL,
		[Rating] INT,
		[Notes] NVARCHAR(MAX)
		)

INSERT INTO Movies([Id], [Title], [DirectorId], [GenreId], [CategoryId])

		VALUES
		(1, 'IT', 1, 2, 3),
		(2, 'Data Analyst', 3, 4, 3),
		(3, 'QA', 4, 5, 3),
		(4, 'Director', 2, 3, 3),
		(5, 'All', 3, 5, 3);

--SELECT * FROM Movies