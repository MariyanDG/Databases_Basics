--5.Salary Level Function
/* Create a function ufn_GetSalaryLevel(@salary DECIMAL(18,4)) that receives salary of an employee and returns the level of the salary.
•	If salary is < 30000, return "Low"
•	If salary is between 30000 and 50000 (inclusive), return "Average"
•	If salary is > 50000, return "High" */


CREATE FUNCTION ufn_GetSalaryLevel(@salary DECIMAL)
RETURNS NVARCHAR(10)
AS
BEGIN
	DECLARE @salaryLevel NVARCHAR(10)
	IF(@salary < 30000)
	BEGIN
		SET @salaryLevel = 'Low'
	END
	ELSE IF(@salary <= 50000)
	BEGIN
		SET @salaryLevel = 'Average'
	END
	ELSE
	BEGIN
		SET @salaryLevel = 'High'
	END

	RETURN @salaryLevel
END

------------------------------------------------------------------------------

CREATE FUNCTION ufn_GetSalaryLevel(@salary MONEY)
RETURNS VARCHAR(10)
AS  
BEGIN
  DECLARE @salaryLevel varchar(10) = 'High';
  IF(@salary < 30000)       SET @salaryLevel = 'Low';
  ELSE IF(@salary <= 50000) SET @salaryLevel = 'Average';
  RETURN @salaryLevel;
END



SELECT e.Salary, 
  dbo.ufn_GetSalaryLevel(e.Salary) AS [Salary Level]
FROM Employees AS e