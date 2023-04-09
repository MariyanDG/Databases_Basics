/* Queries for Diablo Database
You are given a database "Diablo" holding users, games, items, characters and statistics, available as an SQL script. Your task is to write some stored procedures, views, and other server-side database objects and write some SQL queries for displaying the data from the database.

Important: start with a clean copy of the "Diablo" database on each problem. Just execute the SQL script again.
13.	*Scalar Function: Cash in User Games Odd Rows
Create a function ufn_CashInUsersGames that sums the cash of the odd rows. Rows must be ordered by cash in descending order. The function should take a game name as a parameter and return the result as a table. Submit only your function in.
Execute the function over the following game names, ordered exactly like: "Love in a mist". 

Hint
Use ROW_NUMBER to get the rankings of all rows based on order criteria.

*/


USE [Diablo]

CREATE FUNCTION ufn_CashInUsersGames (@game VARCHAR(MAX))
RETURNS @output TABLE (SumCash DECIMAL(18, 4))
AS
BEGIN
	INSERT INTO @output SELECT(
	SELECT SUM(Cash) AS [SumCash] FROM(
		SELECT *, ROW_NUMBER() OVER (ORDER BY us.Cash DESC) AS [RowNum]
		FROM UsersGames us
		WHERE GameId IN (
		SELECT Id 
			FROM Games
		WHERE [Name] = @game
		)) AS [RowNumTable]
	WHERE [RowNumTable].RowNum % 2 <> 0)

	RETURN
END


SELECT * FROM ufn_CashInUsersGames ('Love in a mist')

-----------------------------------------------------------------

CREATE FUNCTION ufn_CashInUsersGames (@gameName nvarchar(50))
RETURNS table
AS
RETURN (
  WITH CTE_CashInRows (Cash, RowNumber) AS (
    SELECT ug.Cash, ROW_NUMBER() OVER (ORDER BY ug.Cash DESC)
    FROM UsersGames AS ug
    JOIN Games AS g ON ug.GameId = g.Id
    WHERE g.Name = @gameName
  )
  SELECT SUM(Cash) AS SumCash
  FROM CTE_CashInRows
  WHERE RowNumber % 2 = 1 -- odd row numbers only
)
-- testing
SELECT * FROM dbo.ufn_CashInUsersGames ('Lily Stargazer');
SELECT * FROM dbo.ufn_CashInUsersGames ('Love in a mist');