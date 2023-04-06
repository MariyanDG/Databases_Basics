--9.Employee Manager
/* Create a query that selects:
•	EmployeeID
•	FirstName
•	ManagerID
•	ManagerName
Filter all employees with a manager who has ID equals to 3 or 7. Return all the rows, sorted by EmployeeID in ascending order. */


SELECT e1.[EmployeeID], 
		e1.[FirstName], 
		e1.[ManagerID], 
		e2.[FirstName] AS [ManagerName]
		FROM [dbo].[Employees] AS e1
		JOIN [dbo].[Employees] AS e2
		ON e1.ManagerID = e2.EmployeeID
		WHERE e2.EmployeeID IN(3,7)
		ORDER BY e1.[EmployeeID] ASC;