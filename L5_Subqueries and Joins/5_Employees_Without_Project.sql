--5.Employees Without Project
/* Create a query that selects:
•	EmployeeID
•	FirstName
Filter only employees without a project. Return the first 3 rows, sorted by EmployeeID in ascending order. */

SELECT * FROM Projects

SELECT TOP(3)
		e.[EmployeeID],
		e.[FirstName]
		FROM [dbo].[Employees] AS e
		LEFT JOIN [dbo].[EmployeesProjects] AS ep
		ON e.EmployeeID = ep.EmployeeID
		WHERE ep.ProjectID IS NULL
		ORDER BY e.EmployeeID ASC;