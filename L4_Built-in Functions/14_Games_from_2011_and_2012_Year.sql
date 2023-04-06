--14 Games from 2011 and 2012 Year
--Find and display the top 50 games which start date is from 2011 and 2012 year. Order them by start date, then by name of the game. The start date should be in the following format: "yyyy-MM-dd". 


USE [Diablo]


SELECT TOP(50) [Name], FORMAT([Start], 'yyyy-MM-dd') AS [Start]
FROM [dbo].[Games]
WHERE DATEPART([YEAR], [Start]) IN (2011, 2012)
ORDER BY [Start];