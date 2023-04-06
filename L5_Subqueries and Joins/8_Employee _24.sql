--8.Employee 24
/* Create a query that selects:
•	EmployeeID
•	FirstName
•	ProjectName
Filter all the projects of employee with Id 24. If the project has started during or after 2005 the returned value should be NULL. */

SELECT 
		e.[EmployeeID], 
		e.[FirstName],
		CASE WHEN p.StartDate >= '2005-01-01' THEN NULL
		ELSE p.[Name]
		END AS [ProjectName]
		FROM [dbo].[Employees] AS e
		JOIN [dbo].[EmployeesProjects] AS ep
		ON e.EmployeeID = ep.EmployeeID AND e.[EmployeeID] = 24
		JOIN [dbo].[Projects] AS p
		ON p.ProjectID = ep.ProjectID;