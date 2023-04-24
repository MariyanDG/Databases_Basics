--6.Sites with Their Location and Category
/* Select all sites and find their location and category. Select the name of the tourist site, name of the location,  establishment year/ century and name of the category. Order the result by name of the category (descending), then by name of the location (ascending) and then by name of the site itself (ascending). */


SELECT s.[Name] AS 'Site',
		l.[Name] AS 'Location',
		s.[Establishment],
		c.[Name] AS 'Category' 
		FROM [dbo].[Sites] AS s
		JOIN [dbo].[Locations] AS l ON l.Id = s.LocationId
		JOIN [dbo].[Categories] AS c ON c.Id = s.CategoryId
		ORDER BY c.[Name] DESC, l.[Name], s.[Name];