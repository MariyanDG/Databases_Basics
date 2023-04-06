--16.Countries Without Any Mountains
/* Create a query that returns the count of all countries, which don’t have a mountain. */


SELECT COUNT(*) AS [Count]
		FROM [Countries] AS c
		LEFT JOIN [dbo].[MountainsCountries] AS m
		ON c.CountryCode = m.CountryCode
		WHERE m.MountainId IS NULL;