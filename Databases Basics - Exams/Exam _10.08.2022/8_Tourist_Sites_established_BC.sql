--8.Tourist Sites established BC
/* Extract information about the tourist sites, which have a location name that does NOT start with the letters 'B', 'M' or 'D' and which are established Before Christ (BC). Select the site name, location name, municipality, province and establishment. Order the result by name of the site (ascending).
NOTE: If the establishment century is Before Christ (BC), it will always be in the following format: 'RomanNumeral BC'. */


SELECT s.[Name] AS 'Site', 
		l.[Name] AS 'Location',
		l.[Municipality],
		l.[Province], 
		s.[Establishment] 
		FROM [dbo].[Sites] AS s
		JOIN [dbo].[Locations] AS l ON s.[LocationId] = l.Id
		WHERE LEFT (l.[Name], 1) NOT LIKE '%[B,M,D]'
		AND s.Establishment LIKE '%BC'
		ORDER BY s.[Name];