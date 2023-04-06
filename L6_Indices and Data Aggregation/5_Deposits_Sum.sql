--5.Deposits Sum
--Select all deposit groups and their total deposit sums.


SELECT w.[DepositGroup], SUM([DepositAmount]) AS [TotalSum]
		FROM [dbo].[WizzardDeposits] AS w
		GROUP BY [DepositGroup];