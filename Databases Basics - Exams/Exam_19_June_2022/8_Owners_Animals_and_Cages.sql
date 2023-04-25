--8.Owners, Animals and Cages
/* Extract information about the owners of mammals, the name of their animal and in which cage these animals are. Select owner's name and animal's name (in format 'owner-animal'), owner's phone number and the id of the cage. Order the result by the name of the owner (ascending) and then by the name of the animal (descending). */


SELECT CONCAT(o.[Name], '-', a.[Name]) AS 'OwnerAnimal', 
		o.[PhoneNumber], c.[Id] AS CageId
		FROM [dbo].[Owners] AS o
		JOIN [dbo].[Animals] AS a ON a.OwnerId = o.Id
		JOIN [dbo].[AnimalTypes] AS at ON at.Id = a.AnimalTypeId
		JOIN [dbo].[AnimalsCages] AS ac ON ac.AnimalId = a.Id
		JOIN [dbo].[Cages] AS c ON c.Id = ac.CageId
		WHERE AnimalType = 'Mammals'
		ORDER BY o.[Name], a.[Name] DESC;