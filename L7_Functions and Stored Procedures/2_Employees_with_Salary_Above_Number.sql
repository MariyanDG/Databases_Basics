--2.Employees with Salary Above Number
/* Create a stored procedure usp_GetEmployeesSalaryAboveNumber that accepts a number (of type DECIMAL(18,4)) as parameter and returns all employees' first and last names, whose salary is above or equal to the given number. */


CREATE PROCEDURE usp_GetEmployeesSalaryAboveNumber (@minSalary DECIMAL(18,4))
AS 
BEGIN
		SELECT e.[FirstName], e.[LastName]
		FROM [dbo].[Employees] AS e
		WHERE e.[Salary] >= @minSalary
END

EXEC usp_GetEmployeesSalaryAboveNumber 48100