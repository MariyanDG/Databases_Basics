--17.Show All Games with Duration and Part of the Day
/*  Find all games with part of the day and duration. Sort them by game name alphabetically, then by duration (alphabetically, not by the timespan) and part of the day (all ascending). Part of the Day should be Morning(time is >= 0 and < 12), Afternoon (time is >= 12 and < 18), Evening (time is >= 18 and < 24). Duration should be Extra Short (smaller or equal to 3), Short (between 4 and 6 including), Long (greater than 6) and Extra Long (without duration). */


SELECT [Name] AS [Game],
  CASE 
      WHEN DATEPART(HOUR, Start) BETWEEN 0 AND 11 THEN 'Morning'
      WHEN DATEPART(HOUR, Start) BETWEEN 12 AND 17 THEN 'Afternoon'
      ELSE 'Evening'
  END AS [Part of the day],
  CASE
      WHEN Duration <= 3 THEN 'Extra Short'
	  WHEN Duration BETWEEN 4 AND 6 THEN 'Short'
	  WHEN Duration > 6 THEN 'Long'
	  ELSE 'Extra Long'
  END AS [Duration]
  FROM Games
ORDER BY [Name], [Duration], [Part of the day]



--18.Orders Table
/* You are given a table Orders(Id, ProductName, OrderDate) filled with data. Consider that the payment for that order must be accomplished within 3 days after the order date. Also the delivery date is up to 1 month. Write a query to show each product's name, order date, pay and deliver due dates. */

USE Orders

SELECT ProductName, OrderDate, 
       DATEADD(DAY, 3, OrderDate) AS [Pay Due],
	   DATEADD(MONTH, 1, OrderDate) AS [Delivery Due]
FROM Orders


--19.People Table
--Create a table People(Id, Name, Birthdate). Write a query to find age in years, months, days and minutes for each person for the current time of executing the query.


