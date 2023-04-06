--6.Deposits Sum for Ollivander Family
--Select all deposit groups and their total deposit sums, but only for the wizards, who have their magic wands crafted by the Ollivander family.


SELECT w.[DepositGroup], SUM([DepositAmount]) AS [TotalSum]
		FROM [dbo].[WizzardDeposits] AS w
		WHERE [MagicWandCreator] = 'Ollivander family'
		GROUP BY [DepositGroup];