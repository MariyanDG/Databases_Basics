--3.Sales Employee
/* Create a query that selects:
•	EmployeeID
•	FirstName
•	LastName
•	DepartmentName
Sort them by EmployeeID in ascending order. Select only employees from the "Sales" department. */


SELECT e.[EmployeeID], 
		e.[FirstName], 
		e.[LastName],
		d.[Name] AS [DepartmentName]
		FROM [dbo].[Employees] AS e
		JOIN [dbo].[Departments] AS d
		ON e.DepartmentID = d.DepartmentID
		WHERE d.[Name] = 'Sales'
		ORDER BY [EmployeeID];