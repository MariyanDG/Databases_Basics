--19. **Salary Challenge
/* Create a query that returns:
•	FirstName
•	LastName
•	DepartmentID
Select all employees who have salary higher than the average salary of their respective departments. Select only the first 10 rows. Order them by DepartmentID. */


SELECT TOP(10) 
		e.[FirstName], 
		e.[LastName], 
		e.[DepartmentID]
		FROM [dbo].[Employees] AS e
		WHERE e.Salary > 
		(
			SELECT AVG([Salary])
			FROM [dbo].[Employees] AS m
			WHERE m.DepartmentID = e.DepartmentID
			GROUP BY [DepartmentID]
		)
		ORDER BY e.[DepartmentID]


------------------------------------------------------------------------


SELECT TOP(10)
		FirstName, 
		LastName, 
		e.DepartmentID 
		FROM Employees AS e
		INNER JOIN (
			SELECT DepartmentID, 
			AVG(Salary) AS AverageSalary
			FROM Employees 
			GROUP BY DepartmentID) AS av
		ON e.DepartmentID = av.DepartmentID
		WHERE Salary > AverageSalary
		ORDER BY e.DepartmentID


------------------------------------------------------------------------


-- how come a different output ?!

SELECT
  DepartmentID, AVG(Salary) AS AverageSalary
INTO AverageSalaries
FROM Employees
GROUP BY DepartmentID

SELECT TOP 10
  FirstName, LastName, e.DepartmentID 
FROM Employees AS e
INNER JOIN AverageSalaries AS av
ON e.DepartmentID = av.DepartmentID
WHERE Salary > AverageSalary
ORDER BY e.DepartmentID