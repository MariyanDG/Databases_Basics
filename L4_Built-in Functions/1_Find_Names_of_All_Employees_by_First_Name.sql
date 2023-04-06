--1.Find Names of All Employees by First Name
--Create a SQL query that finds all employees whose first name starts with "Sa". As a result, display "FirstName" and "LastName".


USE [SoftUni];

SELECT [FirstName], [LastName]
FROM [dbo].[Employees]
WHERE [FirstName] LIKE 'Sa%';