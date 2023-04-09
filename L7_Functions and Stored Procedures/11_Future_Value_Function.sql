--11.Future Value Function
/* Your task is to create a function ufn_CalculateFutureValue that accepts as parameters – sum (decimal), yearly interest rate (float), and the number of years (int). It should calculate and return the future value of the initial sum rounded up to the fourth digit after the decimal delimiter. Use the following formula:

FV=I×(〖(1+R)〗^T)
	I – Initial sum
	R – Yearly interest rate
	T – Number of years  */


CREATE FUNCTION ufn_CalculateFutureValue (@sum DECIMAL(15, 2), @yearlyInterestRate FLOAT, @numberOfYears INT)
RETURNS DECIMAL(15,4)
AS
BEGIN
	DECLARE @futureValue DECIMAL(15,4)
	SET @futureValue = @sum * POWER((1 + @yearlyInterestRate), @numberOfYears)
	RETURN @futureValue
END

SELECT dbo.ufn_CalculateFutureValue(1000, 0.1, 5) AS [Output]