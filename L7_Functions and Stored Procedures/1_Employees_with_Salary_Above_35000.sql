--1.Employees with Salary Above 35000
--Create stored procedure usp_GetEmployeesSalaryAbove35000 that returns all employees' first and last names, whose salary above 35000. 

USE [SoftUni]

CREATE PROCEDURE usp_GetEmployeesSalaryAbove35000
AS
BEGIN
		SELECT [FirstName], [LastName]
		FROM [dbo].[Employees]
		WHERE [Salary] > 35000
END

EXEC usp_GetEmployeesSalaryAbove35000