--21.Increase Salaries
--Create a SQL query that increases salaries by 12% for all employees that work in one 
--of the following departments – Engineering, Tool Design, Marketing or Information Services. 
--As a result, select and display only the "Salaries" column from the Employees table. After this, 
--you should restore the database to the original data.

UPDATE [dbo].[Employees]
SET [Salary] *= 1.12
WHERE DepartmentID IN (
		SELECT DepartmentID FROM Departments
		WHERE [Name] IN ('Engineering', 'Tool Design', 'Information Services'))

SELECT [Salary] FROM [dbo].[Employees]

-- Restore DB to revert changes (do not submit in Judge)


UPDATE [dbo].[Employees]
SET [Salary] /= 1.12
WHERE DepartmentID IN (
		SELECT DepartmentID FROM Departments
		WHERE [Name] IN ('Engineering', 'Tool Design', 'Information Services'))

SELECT [Salary] FROM [dbo].[Employees]