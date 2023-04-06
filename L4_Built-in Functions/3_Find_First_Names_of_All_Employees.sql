--3.Find First Names of All Employees
--Create a SQL query that finds the first names of all employees whose department ID is 3 or 10, and the hire year is between 1995 and 2005 inclusive.


SELECT [FirstName], [LastName]
FROM [dbo].[Employees]
WHERE [DepartmentID] IN (3,5) AND CAST(DATEPART(YEAR, [HireDate]) AS INT) BETWEEN 1995 AND 2005;