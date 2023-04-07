--13.Departments Total Salaries
/* Create a query that shows the total sum of salaries for each department. Order them by DepartmentID.
Your query should return:	
•	DepartmentID */


USE [SoftUni];


SELECT [DepartmentID], SUM([Salary]) AS [TotalSalary]
	FROM [dbo].[Employees]
	GROUP BY [DepartmentID]
	ORDER BY [DepartmentID] ASC;