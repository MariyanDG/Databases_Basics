--1.Employee Address
/* Create a query that selects:
•	EmployeeId
•	JobTitle
•	AddressId
•	AddressText
Return the first 5 rows sorted by AddressId in ascending order. */

USE [SoftUni]

SELECT TOP(5) e.[EmployeeID], e.[JobTitle], a.[AddressID], a.[AddressText]
	FROM [dbo].[Employees] AS e
	JOIN [dbo].[Addresses] AS a
	ON e.AddressID = a.AddressID
	ORDER BY a.AddressID ASC;