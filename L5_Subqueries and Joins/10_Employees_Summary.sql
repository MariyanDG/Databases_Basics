--10.Employees Summary
/* Create a query that selects:
•	EmployeeID
•	EmployeeName
•	ManagerName
•	DepartmentName
Show the first 50 employees with their managers and the departments they are in (show the departments of the employees). Order them by EmployeeID. */


SELECT TOP(50) 
		e1.[EmployeeID], 
		CONCAT(e1.[FirstName], ' ',e1.[LastName]) AS [EmployeeName], 
		CONCAT(e2.[FirstName], ' ',e2.[LastName]) AS [ManagerName],
		d.[Name] AS [DepartmentName] 
		FROM [dbo].[Employees] AS e1
		LEFT JOIN [dbo].[Employees] AS e2
		ON e1.ManagerID = e2.EmployeeID
		LEFT JOIN [dbo].[Departments] AS d
		ON d.DepartmentID = e1.DepartmentID
		ORDER BY e1.[EmployeeID] ASC;