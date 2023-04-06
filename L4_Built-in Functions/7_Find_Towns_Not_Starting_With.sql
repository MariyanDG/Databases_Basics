--7.Find Towns Not Starting With
--Create a SQL query that finds all towns, which do not start with 'R', 'B' or 'D'. Order the result alphabetically by name. 


SELECT [TownID], [Name]
FROM [dbo].[Towns]
WHERE [Name] NOT LIKE '[R,B,D]%'
ORDER BY [Name] ASC;