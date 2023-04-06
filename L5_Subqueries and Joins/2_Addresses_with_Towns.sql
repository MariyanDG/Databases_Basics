--2.Addresses with Towns
/* Write a query that selects:
•	FirstName
•	LastName
•	Town
•	AddressText
Sort them by FirstName in ascending order, then by LastName. Select the first 50 employees. */

SELECT TOP(50) 
	e.[FirstName], 
	e.[LastName], 
	t.[Name], 
	a.[AddressText]
	FROM [dbo].[Employees] AS e
	LEFT JOIN [dbo].[Addresses] AS a
	ON e.AddressID = a.AddressID
	LEFT JOIN [dbo].[Towns] AS t
	ON t.TownID = a.TownID
	ORDER BY [FirstName] ASC , [LastName];