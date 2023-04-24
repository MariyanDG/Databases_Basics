--10.Tourists visiting History and Archaeology sites
/* Extract all tourists, who have visited sites from category 'History and archaeology'. Select their last name, nationality, age and phone number. Order the result by their last name (ascending).
NOTE: The name of the tourists will always be in the following format: 'FirstName LastName'. */


SELECT SUBSTRING(t.[Name], CHARINDEX(' ', t.[Name]) + 1, LEN(t.[Name])) AS 'LastName',
	t.[Nationality],
	t.[Age],
	t.[PhoneNumber]
	FROM [dbo].[Tourists] AS t
	JOIN [dbo].[SitesTourists] AS st ON st.TouristId = t.Id
	JOIN [dbo].[Sites] AS s ON s.Id = st.SiteId
	JOIN [dbo].[Categories] AS c ON c.Id = s.CategoryId
	WHERE c.[Name] LIKE 'History and archaeology'
	GROUP BY t.[Name], t.[Nationality], t.[Age], t.[PhoneNumber]
	ORDER BY LastName;