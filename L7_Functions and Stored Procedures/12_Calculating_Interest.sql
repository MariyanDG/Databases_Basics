--12.Calculating Interest
/* Your task is to create a stored procedure usp_CalculateFutureValueForAccount that uses the function from the previous problem to give an interest to a person's account for 5 years, along with information about their account id, first name, last name and current balance as it is shown in the example below. It should take the AccountId and the interest rate as parameters. Again, you are provided with the dbo.ufn_CalculateFutureValue function, which was part of the previous task. */



CREATE PROCEDURE usp_CalculateFutureValueForAccount (@accountId INT, @interest FLOAT)
AS
BEGIN
		DECLARE @year INT = 5

		SELECT a.[Id], ah.[FirstName], ah.[LastName], a.[Balance] AS [Current Balance], [dbo].[ufn_CalculateFutureValue](a.[Balance], @interest, 5) AS [Balance in 5 years]
		FROM [dbo].[Accounts] AS a
		JOIN [dbo].[AccountHolders] ah ON a.AccountHolderId = ah.Id
		WHERE a.Id = @accountId

END

EXEC usp_CalculateFutureValueForAccount 1,0.1;