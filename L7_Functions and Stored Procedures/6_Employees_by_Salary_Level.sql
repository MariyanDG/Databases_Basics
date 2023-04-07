--6.Employees by Salary Level
/* Create a stored procedure usp_EmployeesBySalaryLevel that receives as parameter level of salary (low, average, or high) and print the names of all employees, who have the given level of salary. You should use the function - "dbo.ufn_GetSalaryLevel(@Salary)", which was part of the previous task, inside your "CREATE PROCEDURE …" query. */


CREATE PROCEDURE usp_EmployeesBySalaryLevel(@salaryLevel VARCHAR(10))
AS
BEGIN
		SELECT e.[FirstName], e.[LastName]
		FROM [dbo].[Employees] AS e
		WHERE [dbo].[ufn_GetSalaryLevel](e.Salary) = @salaryLevel
END

EXEC usp_EmployeesBySalaryLevel [high];