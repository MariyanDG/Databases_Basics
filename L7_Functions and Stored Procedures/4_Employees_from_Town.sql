--4.Employees from Town
--Create a stored procedure usp_GetEmployeesFromTown that accepts town name as parameter and returns the first and last name of those employees, who live in the given town. 


CREATE PROCEDURE usp_GetEmployeesFromTown (@townName VARCHAR(50))
AS
BEGIN
		SELECT e.[FirstName], e.[LastName]
		FROM [dbo].[Employees] AS e
		JOIN [dbo].[Addresses] AS a ON a.AddressID = e.AddressID
		JOIN [dbo].[Towns] AS t ON t.TownID = a.TownID
		WHERE t.[Name] = @townName
END

EXEC usp_GetEmployeesFromTown Sofia;