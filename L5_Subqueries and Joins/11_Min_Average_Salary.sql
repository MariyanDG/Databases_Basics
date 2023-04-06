--11.Min Average Salary
--Create a query that returns the value of the lowest average salary of all departments.

SELECT MIN(av.[AverageSalary]) AS [MinAverageSalary]
		FROM(
			SELECT AVG(e.[Salary]) AS [AverageSalary]
			FROM [dbo].[Employees] AS e
			GROUP BY [DepartmentID]) AS av;