--4. Delete
/* For this year's raffle it was decided to remove the Sleeping bag from the bonus prizes. */

SELECT * FROM TouristsBonusPrizes

DELETE FROM TouristsBonusPrizes
WHERE BonusPrizeId = 5

SELECT * FROM BonusPrizes

DELETE FROM BonusPrizes
WHERE Id = 5