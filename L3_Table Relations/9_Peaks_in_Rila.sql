--9 Peaks in Rila

USE [Geography];

SELECT m.[MountainRange], p.[PeakName], p.[Elevation] FROM [dbo].[Peaks] AS p
	JOIN [dbo].[Mountains] AS m ON m.Id = p.MountainId
	WHERE m.MountainRange = 'Rila'
	ORDER BY p.[Elevation] DESC;