--12.Animals with Owner or Not
/* Create a stored procedure, named usp_AnimalsWithOwnersOrNot(@AnimalName). 
Extract the name of the owner of the given animal.  If there is no owner, put 'For adoption'. */

GO
CREATE PROC usp_AnimalsWithOwnersOrNot(@AnimalName VARCHAR(30))

AS
BEGIN
	IF(SELECT [OwnerId] FROM [dbo].[Animals]
			WHERE [Name] = @AnimalName) IS NULL
		BEGIN
			SELECT [Name], 'For adoption' AS OwnerName
			FROM [Animals]
			WHERE [Name] = @AnimalName
		END
		ELSE
		BEGIN
			SELECT a.[Name], o.[Name] AS OwnerName
				FROM [Animals] AS a
				JOIN [dbo].[Owners] AS o ON o.Id = a.OwnerId
				WHERE a.[Name] = @AnimalName
		END
END

EXEC usp_AnimalsWithOwnersOrNot 'Pumpkinseed Sunfish'


EXEC usp_AnimalsWithOwnersOrNot 'Hippo'


EXEC usp_AnimalsWithOwnersOrNot 'Brown bear'

GO