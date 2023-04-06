--8.Deposit Charge
/* Create a query that selects:
•	Deposit group 
•	Magic wand creator
•	Minimum deposit charge for each group 
Select the data in ascending order by MagicWandCreator and DepositGroup. */


SELECT w.[DepositGroup],
		w.[MagicWandCreator],
		MIN(w.[DepositCharge]) AS [MinDepositCharge]
		FROM [dbo].[WizzardDeposits] AS w
		GROUP BY [DepositGroup], [MagicWandCreator]
		ORDER BY [MagicWandCreator], [DepositGroup];