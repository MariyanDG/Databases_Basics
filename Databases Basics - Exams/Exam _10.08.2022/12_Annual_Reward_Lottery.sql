--12.Annual Reward Lottery
/* A reward scheme has been developed to encourage collection of as many stamps as possible. Depending on the number of stamps collected, participants may receive bronze, silver or gold badges. 
Create a stored procedure, named usp_AnnualRewardLottery(@TouristName). Update the reward of the given tourist according to the count of the sites he have visited:
	>= 100 receives 'Gold badge'
	>= 50 receives 'Silver badge'
	>= 25 receives 'Bronze badge'
Extract the name of the tourist and the reward he has. */

GO
CREATE PROC usp_AnnualRewardLottery(@TouristName VARCHAR(50))
AS
BEGIN
	IF(SELECT COUNT(s.Id) FROM [dbo].[Sites] AS s
			JOIN [dbo].[SitesTourists] AS st ON st.SiteId = s.Id
			JOIN [dbo].[Tourists] AS t ON t.Id = st.TouristId
			WHERE t.[Name] = @TouristName) >= 100
		BEGIN
			UPDATE Tourists
			SET [Reward] = 'Gold badge'
			WHERE [Name] = @TouristName
		END
	ELSE IF(SELECT COUNT(s.Id) FROM [dbo].[Sites] AS s
			JOIN [dbo].[SitesTourists] AS st ON st.SiteId = s.Id
			JOIN [dbo].[Tourists] AS t ON t.Id = st.TouristId
			WHERE t.[Name] = @TouristName) >= 50
		BEGIN
			UPDATE Tourists
			SET [Reward] = 'Silver badge'
			WHERE [Name] = @TouristName
		END
	ELSE IF(SELECT COUNT(s.Id) FROM [dbo].[Sites] AS s
			JOIN [dbo].[SitesTourists] AS st ON st.SiteId = s.Id
			JOIN [dbo].[Tourists] AS t ON t.Id = st.TouristId
			WHERE t.[Name] = @TouristName) >= 25
		BEGIN
			UPDATE Tourists
			SET [Reward] = 'Bronze badge'
			WHERE [Name] = @TouristName
		END
SELECT [Name], [Reward] FROM [dbo].[Tourists]
WHERE [Name] = @TouristName
END

EXEC usp_AnnualRewardLottery 'Gerhild Lutgard';

EXEC usp_AnnualRewardLottery 'Teodor Petrov';

EXEC usp_AnnualRewardLottery 'Zac Walsh';

EXEC usp_AnnualRewardLottery 'Brus Brown';