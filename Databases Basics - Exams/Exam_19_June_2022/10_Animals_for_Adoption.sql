--10.Animals for Adoption
/* Extract all animals, who does not have an owner and are younger than 5 years (5 years from '01/01/2022'), except for the Birds. Select their name, year of birth and animal type. Order the result by animal's name. */


SELECT [Name], YEAR(a.[BirthDate]) AS BirthYear,
		at.AnimalType
		FROM [dbo].[Animals] AS a
		JOIN [dbo].[AnimalTypes] AS at ON a.AnimalTypeId = at.Id
		WHERE OwnerId IS NULL
		AND AnimalTypeId != 3
		AND DATEDIFF(YEAR, [BirthDate], '01/01/2022') < 5
		ORDER BY [Name];