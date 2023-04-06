--12.Countries Holding 'A' 3 or More Times
--Find all countries which hold the letter 'A' at least 3 times in their name (case-insensitively). Sort the result by ISO code and display the "Country Name" and "ISO Code". 


USE [Geography];

SELECT [CountryName], [IsoCode]
FROM [dbo].[Countries]
WHERE [CountryName] LIKE '%a%a%a%'
ORDER BY [IsoCode];