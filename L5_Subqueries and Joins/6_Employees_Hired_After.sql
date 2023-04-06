--6.Employees Hired After
/* Create a query that selects:
•	FirstName
•	LastName
•	HireDate
•	DeptName
Filter only employees hired after 1.1.1999 and are from either "Sales" or "Finance" department. Sort them by HireDate (ascending). */


SELECT e.[FirstName], 
		e.[LastName], 
		e.[HireDate], 
		d.[Name] AS [DeptName]
		FROM [dbo].[Employees] AS e
		JOIN [dbo].[Departments] AS d
		ON e.DepartmentID = d.DepartmentID
		AND d.[Name] IN ('Sales', 'Finance')
		WHERE e.[HireDate] > '1/1/1999'
		ORDER BY e.HireDate;