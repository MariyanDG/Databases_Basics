--7.Count of Sites in Sofia Province
/* Extract all locations which are in Sofia province. Find the count of sites in every location. Select the name of the province, name of the municipality, name of the location and count of the tourist sites in it. Order the result by count of tourist sites (descending) and then by name of the location (ascending). */

SELECT l.[Province], 
		l.[Municipality], 
		l.[Name] AS 'Location', 
		COUNT(s.[Name]) AS CountOfSites
	FROM [dbo].[Locations] AS l
	JOIN [dbo].[Sites] AS s ON s.[LocationId] = l.Id
	WHERE l.Province = 'Sofia'
	GROUP BY l.[Name], l.Municipality, l.Province
	ORDER BY CountOfSites DESC, l.[Name];