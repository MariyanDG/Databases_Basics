--1.Records' Count
--Import the database and send the total count of records from the one and only table to Mr. Bodrog. Make sure nothing gets lost.


USE [Gringotts];


SELECT COUNT(*) AS [Count]
FROM [dbo].[WizzardDeposits];