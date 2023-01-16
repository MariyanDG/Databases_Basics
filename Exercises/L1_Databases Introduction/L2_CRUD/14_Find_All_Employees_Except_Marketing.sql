--14.Find All Employees Except Marketing
--Create a SQL query that finds the first and last names of all employees whose department ID is not 4.

SELECT [FirstName], [LastName] FROM [dbo].[Employees]
WHERE [DepartmentId] != 4