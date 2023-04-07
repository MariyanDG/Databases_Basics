--3.Town Names Starting With
--Create a stored procedure usp_GetTownsStartingWith that accepts a string as parameter and returns all town names starting with that string. 



CREATE PROCEDURE usp_GetTownsStartingWith (@start VARCHAR(50))
AS
BEGIN
		SELECT t.[Name]
		FROM [dbo].[Towns] AS t
		WHERE CHARINDEX(@start, t.[Name]) = 1
END

EXEC usp_GetTownsStartingWith b;