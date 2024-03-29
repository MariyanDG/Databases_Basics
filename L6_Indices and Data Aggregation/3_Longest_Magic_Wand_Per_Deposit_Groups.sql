--3.Longest Magic Wand Per Deposit Groups
--For wizards in each deposit group show the longest magic wand. Rename the new column appropriately.



SELECT [DepositGroup],
		MAX([MagicWandSize]) AS [LongestMagicWand]
		FROM [dbo].[WizzardDeposits]
		GROUP BY [DepositGroup];