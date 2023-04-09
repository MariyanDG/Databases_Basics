--9.Find Full Name
/* You are given a database schema with tables AccountHolders(Id (PK), FirstName, LastName, SSN) and Accounts(Id (PK), AccountHolderId (FK), Balance).  Write a stored procedure usp_GetHoldersFullName that selects the full name of all people. */


USE [Bank]


CREATE PROCEDURE usp_GetHoldersFullName 
AS
BEGIN
	SELECT CONCAT(FirstName, ' ', LastName) AS [Full Name] 
	  FROM AccountHolders
END

EXEC usp_GetHoldersFullName