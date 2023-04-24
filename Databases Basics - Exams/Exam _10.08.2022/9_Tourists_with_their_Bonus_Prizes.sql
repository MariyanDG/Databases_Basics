--9.Tourists with their Bonus Prizes
/* Extract information about the tourists, along with their bonus prizes. If there is no data for the bonus prize put '(no bonus prize)'. Select tourist's name, age, phone number, nationality and bonus prize. Order the result by the name of the tourist (ascending).
NOTE: There will never be a tourist with more than one prize. */


SELECT t.[Name], 
		t.[Age], 
		t.[PhoneNumber], 
		t.[Nationality],
		ISNULL(bp.[Name], '(no bonus prize)') AS 'BonusPrize'
FROM [dbo].[Tourists] AS t
LEFT JOIN [dbo].[TouristsBonusPrizes] AS tbp ON tbp.TouristId = t.Id
LEFT JOIN [dbo].[BonusPrizes] AS bp ON bp.[Id] = tbp.BonusPrizeId
ORDER BY t.[Name];