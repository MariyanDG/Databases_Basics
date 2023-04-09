--8.Delete Employees and Departments
/* Create a procedure with the name usp_DeleteEmployeesFromDepartment (@departmentId INT) which deletes all Employees from a given department. Delete these departments from the Departments table too. Finally, SELECT the number of employees from the given department. If the delete statements are correct the select query should return 0.
After completing that exercise restore your database to revert all changes.
Hint:
You may set ManagerID column in Departments table to nullable (using query "ALTER TABLE …"). */


CREATE PROCEDURE usp_DeleteEmployeesFromDepartment (@departmentId INT)
AS
BEGIN
    -- delete all working on projects by people that are intented to be deleted
	DELETE FROM EmployeesProjects
	WHERE EmployeeID IN (	
		SELECT EmployeeID
		  FROM Employees
		 WHERE DepartmentID = @departmentId		
	)
	
	-- set ManagerID to null
	UPDATE Employees
	SET ManagerID = NULL
	WHERE ManagerID IN(	
	-- people i want to delete
		SELECT EmployeeID
		  FROM Employees
		 WHERE DepartmentID = @departmentId		
	)

	-- Set column ManagerId(Departments) to be nullable
	ALTER TABLE Departments
	ALTER COLUMN ManagerId INT

	--set ManagerId to NUll
	UPDATE Departments
	SET ManagerID = NULL
	WHERE DepartmentID = @departmentId

	DELETE FROM Employees
	WHERE DepartmentID = @departmentId

	DELETE FROM Departments
	WHERE DepartmentID = @departmentId

	SELECT COUNT(*) FROM Employees
	WHERE DepartmentID = @departmentId
			
END
