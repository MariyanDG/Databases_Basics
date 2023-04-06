--19.People Table
--Create a table People(Id, Name, Birthdate). Write a query to find age in years, months, days and minutes for each person for the current time of executing the query.


CREATE TABLE People(
    Id INT PRIMARY KEY IDENTITY(1,1),
	[Name] NVARCHAR(100),
	Birthdate DATETIME
)

INSERT INTO People ([Name], Birthdate) 
VALUES ('Victor', '2000-12-07' ),
       ('Steven', '1992-09-10'),
	   ('Stephen', '1910-09-19 '),
	   ('John', '2010-01-06 ')

SELECT [Name], 
       DATEDIFF(YEAR, Birthdate, GETDATE()) AS [Age in Years],
	   DATEDIFF(MONTH, Birthdate, GETDATE()) AS [Age in Months],
	   DATEDIFF(DAY, Birthdate, GETDATE()) AS [Age in Days],
	   DATEDIFF(MINUTE, Birthdate, GETDATE()) AS [Age in Minutess]
FROM People