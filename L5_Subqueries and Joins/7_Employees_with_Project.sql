--7.Employees with Project
/* Create a query that selects:
•	EmployeeID
•	FirstName
•	ProjectName
Filter only employees with a project which has started after 13.08.2002 and it is still ongoing (no end date). Return the first 5 rows sorted by EmployeeID in ascending order. */


SELECT TOP(5)
		e.[EmployeeID], 
		e.[FirstName],
		p.[Name] AS [ProjectName]
		FROM [dbo].[Employees] AS e
		JOIN [dbo].[EmployeesProjects] AS ep
		ON e.EmployeeID = ep.EmployeeID
		JOIN [dbo].[Projects] AS p
		ON p.ProjectID = ep.ProjectID
		WHERE p.[EndDate] IS NULL AND p.StartDate > '2002-08-13'
		ORDER BY e.[EmployeeID] ASC;