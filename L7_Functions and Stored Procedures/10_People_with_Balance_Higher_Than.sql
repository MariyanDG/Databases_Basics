--10.People with Balance Higher Than
/* Your task is to create a stored procedure usp_GetHoldersWithBalanceHigherThan that accepts a number as a parameter and returns all the people, who have more money in total in all their accounts than the supplied number. Order them by their first name, then by their last name. */



CREATE PROCEDURE usp_GetHoldersWithBalanceHigherThan (@number DECIMAL(15, 2))
AS
BEGIN
	SELECT ah.FirstName, ah.LastName
	  FROM(
		SELECT a.AccountHolderId, SUM(a.Balance) AS [Balance]
	   	  FROM Accounts a
		GROUP BY a.AccountHolderId
		  HAVING SUM(a.Balance) > @number	
		) AS dt
	  JOIN AccountHolders AS ah ON dt.AccountHolderId = ah.Id
	ORDER BY ah.FirstName, ah.LastName
END
