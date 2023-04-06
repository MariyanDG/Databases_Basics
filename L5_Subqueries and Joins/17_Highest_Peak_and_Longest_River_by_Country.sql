--17.Highest Peak and Longest River by Country
/* For each country, find the elevation of the highest peak and the length of the longest river, sorted by the highest peak elevation (from highest to lowest), then by the longest river length (from longest to smallest), then by country name (alphabetically). Display NULL when no data is available in some of the columns. Limit only the first 5 rows. */


SELECT TOP(5) 
		dt.CountryName, 
		MAX(dt.Elevation) AS [HighestPeakElevation], 
		MAX(dt.[Length]) AS [LongestRiverLength]
     FROM(
   SELECT c.CountryName, r.[Length], p.Elevation
     FROM Countries c
LEFT JOIN MountainsCountries mc
       ON c.CountryCode = mc.CountryCode
LEFT JOIN Mountains m
       ON m.Id = mc.MountainId
LEFT JOIN Peaks p
       ON p.MountainId = m.Id
LEFT JOIN CountriesRivers cr
       ON cr.CountryCode = c.CountryCode
LEFT JOIN Rivers r
       ON r.Id = cr.RiverId) AS dt
GROUP BY dt.CountryName
ORDER BY MAX(dt.Elevation) DESC, MAX(dt.[Length]) DESC, dt.CountryName




SELECT TOP(5)
		c.CountryName,
		MAX(p.Elevation) AS HighestPeakElevation,
		MAX(r.[Length]) AS LongestRiverLength
FROM Countries AS c
  LEFT JOIN MountainsCountries AS mc 
  ON c.CountryCode = mc.CountryCode
  LEFT JOIN Peaks AS p 
  ON p.MountainId = mc.MountainId
  LEFT JOIN CountriesRivers AS cr 
  ON c.CountryCode = cr.CountryCode
  LEFT JOIN Rivers AS r 
  ON r.Id = cr.RiverId
GROUP BY c.CountryName
ORDER BY HighestPeakElevation DESC, LongestRiverLength DESC, c.CountryName