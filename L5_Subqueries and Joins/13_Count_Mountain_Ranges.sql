--13.Count Mountain Ranges
/* Create a query that selects:
•	CountryCode
•	MountainRanges
Filter the count of the mountain ranges in the United States, Russia and Bulgaria. */


SELECT [CountryCode],
		COUNT([MountainId]) AS [MountainRanges]
		FROM [dbo].[MountainsCountries]
		GROUP BY [CountryCode]
		HAVING [CountryCode] IN ('BG', 'RU', 'US');