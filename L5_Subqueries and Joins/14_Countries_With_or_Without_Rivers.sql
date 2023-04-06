--14.Countries With or Without Rivers
/* Create a query that selects:
•	CountryName
•	RiverName
Find the first 5 countries with or without rivers in Africa. Sort them by CountryName in ascending order. */

SELECT TOP(5) 
		c.[CountryName],
		r.[RiverName]
		FROM [dbo].[Countries] AS c
		LEFT JOIN [dbo].[CountriesRivers] AS cr
		ON c.CountryCode = cr.CountryCode
		LEFT JOIN [dbo].[Rivers] AS r
		ON r.Id = cr.RiverId
		WHERE c.ContinentCode = 'AF'
		ORDER BY c.CountryName ASC;