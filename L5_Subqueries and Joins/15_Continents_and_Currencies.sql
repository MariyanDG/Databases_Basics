--15.*Continents and Currencies
/* Create a query that selects:
•	ContinentCode
•	CurrencyCode
•	CurrencyUsage
Find all continents and their most used currency. Filter any currency, which is used in only one country. Sort your results by ContinentCode. */


SELECT dt.ContinentCode, dt.CurrencyCode, dt.CurrencyUsage 
   FROM
        (SELECT c.ContinentCode, 
                c.CurrencyCode, 
		        COUNT(c.CurrencyCode) AS [CurrencyUsage],
		        DENSE_RANK() OVER (PARTITION BY c.ContinentCode ORDER BY COUNT(c.CurrencyCode) DESC) AS [Rank]
           FROM Countries AS c
       GROUP BY c.ContinentCode, c.CurrencyCode
         HAVING COUNT(c.CurrencyCode) > 1) AS dt
   WHERE dt.[Rank] = 1
ORDER BY dt.ContinentCode


WITH CCYContUsage_CTE (ContinentCode, CurrencyCode, CurrencyUsage) AS (
  SELECT ContinentCode, CurrencyCode, COUNT(CountryCode) AS CurrencyUsage
  FROM Countries 
  GROUP BY ContinentCode, CurrencyCode
  HAVING COUNT(CountryCode) > 1  
)
SELECT ContMax.ContinentCode, ccy.CurrencyCode, ContMax.TopCCYUsage
FROM
  (SELECT ContinentCode, MAX(CurrencyUsage) AS TopCCYUsage
   FROM CCYContUsage_CTE 
   GROUP BY ContinentCode) AS ContMax
JOIN CCYContUsage_CTE AS ccy 
ON (ContMax.ContinentCode = ccy.ContinentCode AND ContMax.TopCCYUsage = ccy.CurrencyUsage)
ORDER BY ContMax.ContinentCode