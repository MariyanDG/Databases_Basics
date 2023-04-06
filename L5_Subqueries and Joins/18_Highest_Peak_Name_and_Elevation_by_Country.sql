--18.Highest Peak Name and Elevation by Country
/* For each country, find the name and elevation of the highest peak, along with its mountain. When no peaks are available in some countries, display elevation 0, "(no highest peak)" as peak name and "(no mountain)" as a mountain name. When multiple peaks in some countries have the same elevation, display all of them. Sort the results by country name alphabetically, then by highest peak name alphabetically. Limit only the first 5 rows. */


SELECT TOP(5) 
		dt.CountryName AS[Country],
		IIF(dt.PeakName IS NULL, '(no highest peak)', dt.PeakName) AS [Highest Peak Name],
		ISNULL(dt.Elevation, 0) AS [Highest Peak Elevation],
		IIF(dt.MountainRange IS NULL, '(no mountain)', dt.MountainRange) AS [Mountain]
  FROM
       (SELECT c.CountryName,
               p.PeakName,
	           p.Elevation,
	           m.MountainRange,
		       DENSE_RANK() OVER (PARTITION BY c.CountryName ORDER BY p.Elevation DESC) AS [Ranking]
          FROM Countries c
     LEFT JOIN MountainsCountries AS mc ON mc.CountryCode = c.CountryCode
     LEFT JOIN Mountains AS m ON m.Id = mc.MountainId
     LEFT JOIN Peaks AS p ON p.MountainId = m.Id) AS dt
   WHERE dt.Ranking = 1
ORDER BY dt.CountryName, dt.PeakName



WITH PeaksMountains_CTE (Country, PeakName, Elevation, Mountain) AS (
  SELECT c.CountryName, p.PeakName, p.Elevation, m.MountainRange
  FROM Countries AS c
  LEFT JOIN MountainsCountries as mc ON c.CountryCode = mc.CountryCode
  LEFT JOIN Mountains AS m ON mc.MountainId = m.Id
  LEFT JOIN Peaks AS p ON p.MountainId = m.Id
)
SELECT TOP 5
  TopElevations.Country AS Country,
  ISNULL(pm.PeakName, '(no highest peak)') AS HighestPeakName,
  ISNULL(TopElevations.HighestElevation, 0) AS HighestPeakElevation,	
  ISNULL(pm.Mountain, '(no mountain)') AS Mountain
FROM 
  (SELECT Country, MAX(Elevation) AS HighestElevation
   FROM PeaksMountains_CTE 
   GROUP BY Country) AS TopElevations
LEFT JOIN PeaksMountains_CTE AS pm 
ON (TopElevations.Country = pm.Country AND TopElevations.HighestElevation = pm.Elevation)
ORDER BY Country, HighestPeakName