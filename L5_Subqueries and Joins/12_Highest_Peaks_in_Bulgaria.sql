--12.Highest Peaks in Bulgaria
/* Create a query that selects:
•	CountryCode
•	MountainRange
•	PeakName
•	Elevation
Filter all the peaks in Bulgaria, which have elevation over 2835. Return all the rows, sorted by elevation in descending order. */

USE [Geography]

SELECT c.[CountryCode], 
		m.[MountainRange], 
		p.[PeakName], 
		p.[Elevation] 
		FROM [dbo].[Peaks] AS p
		JOIN [dbo].[Mountains] AS m
		ON p.MountainId = m.Id
		JOIN MountainsCountries AS c
		ON c.MountainId = m.Id
		WHERE c.CountryCode = 'BG' AND p.[Elevation] > 2835
		ORDER BY p.[Elevation] DESC;