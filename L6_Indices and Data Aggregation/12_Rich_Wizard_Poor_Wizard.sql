--12. *Rich Wizard, Poor Wizard
/* Mr. Bodrog definitely likes his werewolves more than you. This is your last chance to survive! Give him some data to play his favorite game Rich Wizard, Poor Wizard. The rules are simple: 
You compare the deposits of every wizard with the wizard after him. If a wizard is the last one in the database, simply ignore it. In the end you have to sum the difference between the deposits.
At the end your query should return a single value: the SUM of all differences. */


--Solution with LEAD

SELECT SUM([Difference]) AS [SumDifference]
FROM 
	(SELECT 
		[FirstName] AS [Host Wizard],
		[DepositAmount] AS [Host Wizard Deposit],
		LEAD([FirstName]) OVER(ORDER BY Id) AS [Guest Wizard],
		LEAD([DepositAmount]) OVER(ORDER BY Id) AS [Guest Wizard Deposit],
		[DepositAmount] - LEAD([DepositAmount]) OVER(ORDER BY Id) AS [Difference]
	FROM [dbo].[WizzardDeposits]) AS DiffTable;

-----------------------------------------------------------------------------------------

SELECT SUM(k.[Difference]) AS [SumDifference]
FROM
	(SELECT w.[DepositAmount] - (SELECT wd.[DepositAmount] FROM [dbo].[WizzardDeposits] AS wd 
		WHERE wd.Id = w.Id + 1) AS [Difference] FROM [dbo].[WizzardDeposits] AS w ) AS k;
		

-----------------------------------------------------------------------------------------


SELECT TOP 1
  (SELECT DepositAmount FROM WizzardDeposits WHERE Id = (SELECT MIN(Id) FROM WizzardDeposits)) - 
  (SELECT DepositAmount FROM WizzardDeposits WHERE Id = (SELECT MAX(Id) FROM WizzardDeposits)) 
  AS SumDifference
FROM WizzardDeposits



-----------------------------------------------------------------------------------------

-- solution with LAG


SELECT SUM(DepoDifference) AS SumDifference
FROM 
  (SELECT
     LAG(FirstName) OVER (ORDER BY Id) AS [Host Wizard],
     LAG(DepositAmount) OVER (ORDER BY Id) AS [Host Wizard Deposit],
     FirstName AS [Guest Wizard], 
     DepositAmount AS [Guest Wizard Deposit],
	 LAG(DepositAmount) OVER (ORDER BY Id) - DepositAmount AS [DepoDifference]
   FROM WizzardDeposits) AS Differences;


-----------------------------------------------------------------------------------------


-- solution with CURSOR

DECLARE @currentDeposit DECIMAL(8,2)
DECLARE @previousDeposit DECIMAL(8,2)
DECLARE @sumDifferences DECIMAL(8,2) = 0
DECLARE wizardCursor CURSOR FOR SELECT DepositAmount FROM WizzardDeposits

OPEN wizardCursor
FETCH NEXT FROM wizardCursor INTO @currentDeposit
WHILE (@@FETCH_STATUS = 0)
BEGIN
  IF (@previousDeposit IS NOT NULL)
  BEGIN
    SET @sumDifferences += @previousDeposit - @currentDeposit
  END
  SET @previousDeposit = @currentDeposit
  FETCH NEXT FROM wizardCursor INTO @currentDeposit
END
CLOSE wizardCursor
DEALLOCATE wizardCursor

SELECT @sumDifferences AS SumDifference