--7.Owners and Their Animals
/* Extract the animals for each owner. Find the top 5 owners, who have the biggest count of animals. Select the owner's name and the count of the animals he owns. Order the result by the count of animals owned (descending) and then by the owner's name. */


SELECT TOP(5) o.[Name] AS [Owner], 
		COUNT(*) AS CountOfAnimals 
		FROM [dbo].[Owners] AS o
		JOIN [dbo].[Animals] AS a ON a.OwnerId = o.Id
		GROUP BY o.[Name]
		ORDER BY CountOfAnimals DESC, [Owner];