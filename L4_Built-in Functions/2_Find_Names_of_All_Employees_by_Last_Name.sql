--2.Find Names of All Employees by Last Name 
--Create a SQL query that finds all employees whose last name contains "ei". As a result, display "FirstName" and "LastName".


SELECT [FirstName], [LastName]
FROM [dbo].[Employees]
WHERE [LastName] LIKE '%ei%';