--11.Tourists Count on a Tourist Site
/* Create a user-defined function named udf_GetTouristsCountOnATouristSite (@Site) which receives a tourist site and returns the count of tourists, who have visited it. */

GO
CREATE FUNCTION udf_GetTouristsCountOnATouristSite(@Site VARCHAR(100))
RETURNS INT
AS
BEGIN
	RETURN(SELECT COUNT(t.Id) FROM [dbo].[Tourists] AS t
	JOIN [dbo].[SitesTourists] AS st ON st.TouristId = t.Id
	JOIN [dbo].[Sites] AS s ON s.Id = st.SiteId
	WHERE s.Name = @Site
	)
END

SELECT dbo.udf_GetTouristsCountOnATouristSite ('Regional History Museum – Vratsa')

SELECT dbo.udf_GetTouristsCountOnATouristSite ('Samuil’s Fortress')

SELECT dbo.udf_GetTouristsCountOnATouristSite ('Gorge of Erma River')