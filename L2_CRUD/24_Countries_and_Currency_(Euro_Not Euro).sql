--24.*Countries and Currency (Euro / Not Euro)
--Find all the countries with information about their currency.
--Display the "CountryName", "CountryCode", and information about its "Currency": either "Euro" or "Not Euro". 
--Sort the results by country name alphabetically.


SELECT 
	CountryName, CountryCode, 
	IIF(Currencies.CurrencyCode = 'EUR', 'Euro', 'Not Euro') AS Currency
FROM Countries 
LEFT JOIN Currencies ON Currencies.CurrencyCode = Countries.CurrencyCode
ORDER BY CountryName