CREATE DATABASE Bakery;

USE Bakery;

--1

CREATE TABLE Countries(
		Id INT IDENTITY PRIMARY KEY,
		[Name] NVARCHAR(50) UNIQUE
		);


CREATE TABLE Customers(
		Id INT IDENTITY PRIMARY KEY,
		FirstName NVARCHAR(25),
		LastName NVARCHAR(25),
		Gender CHAR(1)
			CHECK (Gender IN ('M','F')),
		Age INT,
		PhoneNumber NVARCHAR(10)
			CHECK (LEN(PhoneNumber) = 10),
		CountryId INT FOREIGN KEY REFERENCES Countries(Id)
		);


CREATE TABLE Products(
		Id INT IDENTITY PRIMARY KEY,
		[Name] NVARCHAR(25) UNIQUE,
		[Description] NVARCHAR(250),
		Recipe NVARCHAR(MAX),
		Price DECIMAL(15,2)
			CHECK(Price >= 0)
		);


CREATE TABLE Feedbacks(
		Id INT IDENTITY PRIMARY KEY,
		[Description] NVARCHAR(255),
		Rate DECIMAL(4,2)
			CHECK(Rate >= 0 AND Rate <= 10),
		ProductId INT FOREIGN KEY REFERENCES Products(Id),
		CustomerId INT FOREIGN KEY REFERENCES Customers(Id)
		);


CREATE TABLE Distributors(
		Id INT IDENTITY PRIMARY KEY,
		[Name] NVARCHAR(25) UNIQUE,
		AddressText NVARCHAR(30),
		Summary NVARCHAR(200),
		CountryId INT FOREIGN KEY REFERENCES Countries(Id)
		);


CREATE TABLE Ingredients(
		Id INT IDENTITY PRIMARY KEY,
		[Name] NVARCHAR(30),
		[Description] NVARCHAR(200),
		OriginCountryId INT FOREIGN KEY REFERENCES Countries(Id),
		DistributorId INT FOREIGN KEY REFERENCES Distributors(Id)
		);


CREATE TABLE ProductsIngredients(
		ProductId INT FOREIGN KEY REFERENCES Products(Id),
		IngredientId INT FOREIGN KEY REFERENCES Ingredients(Id)
		PRIMARY KEY(ProductId, IngredientId)
		);

--2.Insert
/* Let's insert some sample data into the database. Write a query to add the following records into the corresponding tables. All Ids should be auto-generated. */


INSERT INTO Distributors(
				[Name], 
				CountryId, 
				AddressText, 
				Summary
				)
				VALUES
				('Deloitte & Touche', 2, '6 Arch St #9757', 'Customizable neutral traveling'),
				('Congress Title', 13, '58 Hancock St', 'Customer loyalty'),
				('Kitchen People', 1, '3 E 31st St #77', 'Triple-buffered stable delivery'),
				('General Color Co Inc', 21, '6185 Bohn St #72', 'Focus group'),
				('Beck Corporation', 23, '21 E 64th Ave', 'Quality-focused 4th generation hardware');

INSERT INTO Customers(
				FirstName,
				LastName,
				Age,
				Gender,
				PhoneNumber,
				CountryId
				)
				VALUES
				('Francoise', 'Rautenstrauch', 15, 'M', '0195698399', 5),
				('Kendra', 'Loud', 22, 'F', '0063631526', 11),
				('Lourdes', 'Bauswell', 50, 'M', '0139037043', 8),
				('Hannah', 'Edmison', 18, 'F', '0043343686', 1),
				('Tom', 'Loeza', 31, 'M', '0144876096', 23),
				('Queenie', 'Kramarczyk', 30, 'F', '0064215793', 29),
				('Hiu', 'Portaro', 25, 'M', '0068277755', 16),
				('Josefa', 'Opitz', 43, 'F', '0197887645', 17);


--3.Update
/* We've decided to switch some of our ingredients to a local distributor. Update the table Ingredients and change the DistributorId of "Bay Leaf", "Paprika" and "Poppy" to 35. Change the OriginCountryId to 14 of all ingredients with OriginCountryId equal to 8. */


UPDATE Ingredients
	SET DistributorId = 35
	WHERE [Name] IN ('Bay Leaf', 'Paprika', 'Poppy');

UPDATE Ingredients 
	SET OriginCountryId = 14
	WHERE OriginCountryId = 8;


--4.Delete
/* Delete all Feedbacks which relate to Customer with Id 14 or to Product with Id 5. */


DELETE Feedbacks
WHERE CustomerId = 14 OR ProductId =5;


--5.Products by Price
/* Select all products ordered by price (descending) then by name (ascending). 
Required columns
•	Name
•	Price
•	Description */


SELECT [Name], Price, [Description] 
		FROM Products
		ORDER BY Price DESC, [Name];


--6.Negative Feedback
/* Select all feedbacks alongside with the customers which gave them. Filter only feedbacks which have rate below 5.0. Order results by ProductId (descending) then by Rate (ascending).
Required columns
•	ProductId
•	Rate
•	Description
•	CustomerId
•	Age
•	Gender */


SELECT f.ProductId, 
		f.Rate, 
		f.[Description], 
		f.CustomerId, 
		c.Age, 
		c.Gender 
		FROM Feedbacks AS f
		JOIN [dbo].[Customers] AS c ON c.Id = f.CustomerId
		WHERE f.Rate < 5.0
		ORDER BY f.ProductId DESC, f.Rate;


--7.Customers without Feedback
/* Select all customers without feedbacks. Order them by customer id (ascending).
Required columns
•	CustomerName – customer’s first and last name, concatenated with space
•	PhoneNumber
•	Gender */


SELECT CONCAT(c.[FirstName], ' ', c.[LastName]) AS FullName,
		c.[PhoneNumber], 
		c.[Gender]
		FROM [dbo].[Customers] AS c
		LEFT JOIN [dbo].[Feedbacks] AS f ON f.CustomerId = c.Id
		WHERE f.Id IS NULL
		ORDER BY c.[Id];


--8.Customers by Criteria
/* Select customers that are either at least 21 old and contain "an" in their first name or their phone number ends with "38" and are not from Greece. Order by first name (ascending), then by age(descending).
Required columns
•	FirstName
•	Age
•	PhoneNumber */


SELECT [FirstName],
		[Age],
		[PhoneNumber] 
		FROM [dbo].[Customers]
		WHERE ([Age] >= 21 AND [FirstName] LIKE '%an%') 
				OR ([PhoneNumber] LIKE '%38' 
				AND [CountryId] != (SELECT [Id] FROM [dbo].[Countries] WHERE [Name] = 'Greece'))
		ORDER BY [FirstName], [Age] DESC;


--9.Middle Range Distributors
/* Select all distributors which distribute ingredients used in the making process of all products having average rate between 5 and 8 (inclusive). Order by distributor name, ingredient name and product name all ascending.
Required columns
•	DistributorName
•	IngredientName
•	ProductName
•	AverageRate */



SELECT DistributorName, IngredientName, ProductName, AverageRate
	FROM (
			SELECT d.[Name] AS DistributorName,
					i.[Name] AS IngredientName,
					p.[Name] AS ProductName,
					AVG(f.[Rate]) AS AverageRate
			FROM [dbo].[Distributors] AS d
			JOIN [dbo].[Ingredients] AS i ON i.DistributorId = d.Id
			JOIN [dbo].[ProductsIngredients] AS pri ON pri.IngredientId = i.Id
			JOIN [dbo].[Products] AS p ON p.Id = pri.ProductId
			JOIN [dbo].[Feedbacks] AS f ON f.ProductId = p.Id
			GROUP BY d.[Name], i.[Name], p.[Name]
		) AS [Rank]
	WHERE AverageRate BETWEEN 5.0 AND 8.0
	ORDER BY DistributorName, IngredientName, ProductName;



--10.Country Representative
/* Select all countries with their most active distributor (the one with the greatest number of ingredients). If there are several distributors with most ingredients delivered, list them all. Order by country name then by distributor name.
Required columns
•	CountryName
•	DistributorName */


SELECT RankQuery.[Name], RankQuery.DistributorName
	FROM(
			SELECT
			c.[Name], d.[Name] AS DistributorName,
			DENSE_RANK() OVER(PARTITION BY c.[Name] ORDER BY COUNT(i.Id) DESC) AS Rank
			FROM [dbo].[Countries] AS c
			JOIN [dbo].[Distributors] AS d ON d.CountryId = c.Id
			LEFT JOIN [dbo].[Ingredients] AS i ON i.DistributorId = d.Id
			GROUP BY c.[Name], d.[Name]
		) AS RankQuery
	WHERE RankQuery.Rank = 1
	ORDER BY RankQuery.[Name], RankQuery.DistributorName;



--11.Customers with Countries
/* Create a view named v_UserWithCountries which selects all customers with their countries.
Required columns
•	CustomerName – first name plus last name, with space between them
•	Age
•	Gender
•	CountryName */


CREATE VIEW v_UserWithCountries AS (
	SELECT
		CONCAT(c.[FirstName], ' ', c.[LastName]) AS CustomerName,
		c.[Age],
		c.[Gender],
		coun.[Name]
		FROM [dbo].[Customers] AS c
		JOIN [dbo].[Countries] AS coun ON coun.Id = c.CountryId
	);


SELECT TOP 5 *
  FROM v_UserWithCountries
  ORDER BY Age



--12.Delete Products
/* Create a trigger that deletes all of the relations of a product upon its deletion. */


CREATE TRIGGER dbo.ProductsToDelete
	ON Products
	INSTEAD OF DELETE
	AS
	BEGIN
	DECLARE @deletedProductId INT = 
		(SELECT p.Id 
		FROM Products AS p
		JOIN Deleted AS d ON d.Id = p.Id
		)
	DELETE
		FROM [dbo].[ProductsIngredients]
		WHERE ProductId = @deletedProductId
	DELETE
		FROM [dbo].[Feedbacks]
		WHERE ProductId = @deletedProductId
	DELETE
		FROM Products
		WHERE Id = @deletedProductId
END


DELETE FROM Products WHERE Id = 7;