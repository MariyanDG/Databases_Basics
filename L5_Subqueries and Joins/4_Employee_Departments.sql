--4.Employee Departments
/* Create a query that selects:
•	EmployeeID
•	FirstName 
•	Salary
•	DepartmentName
Filter only employees with a salary higher than 15000. Return the first 5 rows, sorted by DepartmentID in ascending order. */


SELECT TOP(5) 
		e.[EmployeeID],
		e.[FirstName], 
		e.[Salary], 
		d.[Name] AS [DepartmentName]
		FROM [dbo].[Employees] AS e
		JOIN [dbo].[Departments] AS d
		ON e.DepartmentID = d.DepartmentID
		WHERE [Salary] > 15000
		ORDER BY e.[DepartmentID] ASC;