CREATE DATABASE Airport;

USE Airport;


--1 Database design

CREATE TABLE Passengers(
		Id INT IDENTITY PRIMARY KEY,
		FullName VARCHAR(100) NOT NULL,
		Email VARCHAR(50) NOT NULL
		);


CREATE TABLE Pilots(
		Id INT IDENTITY PRIMARY KEY,
		FirstName VARCHAR(30) NOT NULL,
		LastName VARCHAR(30) NOT NULL,
		Age TINYINT NOT NULL
			CHECK(Age >= 21 AND Age <= 62),
		Rating FLOAT
			CHECK(Rating >= 0.0 AND Rating <= 10.0)
		);


CREATE TABLE AircraftTypes(
		Id INT IDENTITY PRIMARY KEY,
		TypeName VARCHAR(30) NOT NULL
		);


CREATE TABLE Aircraft(
		Id INT IDENTITY PRIMARY KEY,
		Manufacturer VARCHAR(25) NOT NULL,
		Model VARCHAR(30) NOT NULL,
		[Year] INT NOT NULL,
		FlightHours INT,
		Condition CHAR NOT NULL,
		TypeId INT FOREIGN KEY REFERENCES AircraftTypes(Id)
		);


CREATE TABLE PilotsAircraft(
		AircraftId INT NOT NULL REFERENCES Aircraft(Id),
		PilotId INT NOT NULL REFERENCES Pilots(Id),
		PRIMARY KEY(AircraftId, PilotId)
		);


CREATE TABLE Airports(
		Id INT IDENTITY PRIMARY KEY,
		AirportName VARCHAR(70) NOT NULL,
		Country VARCHAR(100) NOT NULL
		);


CREATE TABLE FlightDestinations(
		Id INT IDENTITY PRIMARY KEY,
		AirportId INT FOREIGN KEY REFERENCES Airports(Id),
		[Start] DATETIME2 NOT NULL,
		AircraftId INT FOREIGN KEY REFERENCES Aircraft(Id),
		PassengerId INT FOREIGN KEY REFERENCES Passengers(Id),
		TicketPrice DECIMAL(18,2) DEFAULT 15 NOT NULL
		);


--2.Insert

/* Write a query to insert data into the Passengers table, based on the Pilots table. For all Pilots with an id between 5 and 15 (both inclusive), insert data in the Passengers table with the following values:
•	FullName  –  get the first and last name of the pilot separated by a single space
o	Example – 'Lois Leidle'
•	Email – set it to start with full name with no space and add '@gmail.com' - 'FullName@gmail.com'
o	 Example – 'LoisLeidle@gmail.com' */



INSERT INTO Passengers([FullName], [Email])
SELECT ([FirstName] + ' ' + [LastName]) AS FullName,
		([FirstName] + [LastName] + '@gmail.com') AS Email
	FROM [dbo].[Pilots] AS p
	WHERE p.Id >= 5 AND p.Id  <= 15;


--3.Update
/* Update all Aircraft, which:
•	Have a condition of 'C' or 'B' 
•	Have FlightHours Null or up to 100 (inclusive)
•	Have Year after 2013 (inclusive)
 By setting their condition to 'A'. */


UPDATE [dbo].[Aircraft]
	SET Condition = 'A'
		WHERE ([Condition] = 'C' OR [Condition] = 'B')
		AND ([FlightHours] IS NULL OR [FlightHours] <= 100)
		AND ([Year] >= 2013);
 


 --4.Delete
/* Delete every passenger whose FullName is up to 10 characters (inclusive) long. */


DELETE FROM [dbo].[Passengers]
WHERE LEN(FullName) <= 10


--5.Aircraft
/* Extract information about all the Aircraft. Order the results by aircraft's FlightHours descending.
Required columns:
•	Manufacturer
•	Model
•	FlightHours
•	Condition */


SELECT [Manufacturer], 
		[Model], 
		[FlightHours], 
		[Condition] 
		FROM [dbo].[Aircraft]
		ORDER BY [FlightHours] DESC;


--6.Pilots and Aircraft
/* Select pilots and aircraft that they operate. Extract the pilot's First, Last names, aircraft's Manufacturer, Model, and FlightHours. Skip all plains with NULLs and up to 304 FlightHours. Order the result by the FlightHours in descending order, then by the pilot's FirstName alphabetically. 
Required columns:
•	FirstName
•	LastName
•	Manufacturer
•	Model
•	FlightHours */



SELECT p.[FirstName], 
		p.[LastName], 
		a.[Manufacturer], 
		a.[Model], 
		a.[FlightHours] 
		FROM [dbo].[Pilots] AS p
		JOIN [dbo].[PilotsAircraft] AS pa ON pa.[PilotId] = p.Id
		JOIN [dbo].[Aircraft] AS a ON a.Id = pa.AircraftId
		WHERE a.FlightHours <= 304
		ORDER BY a.FlightHours DESC, p.FirstName;


--7.Top 20 Flight Destinations
/* Select top 20  flight destinations, where Start day is an even number. Extract DestinationId, Start date, passenger's FullName, AirportName, and TicketPrice. Order the result by TicketPrice descending, then by AirportName ascending.
Required columns:
•	DestinationId
•	Start
•	FullName (passenger)
•	AirportName
•	TicketPrice */


SELECT TOP(20) fd.[Id] AS DestinationId, 
		fd.[Start], 
		p.[FullName], 
		a.[AirportName], 
		fd.[TicketPrice] 
		FROM [dbo].[FlightDestinations] AS fd
		JOIN [dbo].[Airports] AS a ON a.Id = fd.AirportId
		JOIN [dbo].[Passengers] AS p ON p.Id = fd.PassengerId
		WHERE DAY(fd.Start) % 2 = 0
		ORDER BY [TicketPrice] DESC, [AirportName];


--8.Number of Flights for Each Aircraft
/* Extract information about all the Aircraft and the count of their FlightDestinations. Display average ticket price (AvgPrice) of each flight destination by the Aircraft, rounded to the second digit. Take only the aircraft with at least 2  FlightDestinations. Order the results by count of flight destinations descending, then by the aircraft's id ascending. 
Required columns:
•	AircraftId
•	Manufacturer
•	FlightHours
•	FlightDestinationsCount
•	AvgPrice */


SELECT a.[Id], 
		a.[Manufacturer], 
		a.[FlightHours], 
		COUNT(fd.AircraftId) AS FlightDestinationsCount, 
		ROUND(AVG(fd.[TicketPrice]), 2) AS AvgPrice
FROM [dbo].[Aircraft] AS a
JOIN [dbo].[FlightDestinations] AS fd ON fd.AircraftId = a.Id
GROUP BY a.Id, a.Manufacturer, a.FlightHours
HAVING COUNT(fd.AircraftId) >= 2
ORDER BY COUNT(fd.AircraftId) DESC, a.Id;



--9.Regular Passengers
/* Extract all passengers, who have flown in more than one aircraft and have an 'a' as the second letter of their full name. Select the full name, the count of aircraft that he/she traveled, and the total sum which was paid.
Order the result by passenger's FullName.
Required columns:
•	FullName
•	CountOfAircraft
•	TotalPayed */


SELECT p.[FullName], 
		COUNT(fd.[PassengerId]) AS CountOfAircraft,
		SUM(fd.[TicketPrice]) AS TotalPayed
		FROM [dbo].[Passengers] AS p
		JOIN [dbo].[FlightDestinations] AS fd ON fd.PassengerId = p.Id
		GROUP BY p.FullName
		HAVING p.FullName LIKE '_a%' AND COUNT(fd.[PassengerId]) > 1
		ORDER BY p.FullName;



--10.Full Info for Flight Destinations
/* Extract information about all flight destinations which Start between hours: 6:00 and 20:00 (both inclusive) and have ticket prices higher than 2500. Select the airport's name, time of the day,  price of the ticket, passenger's full name, aircraft manufacturer, and aircraft model. Order the result by aircraft model ascending.
Required columns:
•	AirportName 
•	DayTime
•	TicketPrice
•	FullName (passenger)
•	Manufacturer
•	Model */


SELECT air.[AirportName], 
		fd.[Start], 
		fd.[TicketPrice], 
		p.[FullName],
		a.[Manufacturer], 
		a.[Model] 
		FROM (SELECT * FROM [dbo].[FlightDestinations] AS fd
		WHERE DATEPART(HOUR, fd.[Start]) BETWEEN 6 AND 20) fd
		JOIN [dbo].[Airports] AS air ON air.Id = fd.AirportId
		JOIN [dbo].[Passengers] AS p ON p.Id = fd.PassengerId
		JOIN [dbo].[Aircraft] AS a ON a.Id = fd.AircraftId
		WHERE fd.[TicketPrice] > 2500
		ORDER BY a.Model;


--11.Find all Destinations by Email Address
/* Create a user-defined function named udf_FlightDestinationsByEmail(@email) that receives a passenger's email address and returns the number of flight destinations that the passenger has in the database. */



CREATE FUNCTION udf_FlightDestinationsByEmail(@email VARCHAR(100))
RETURNS INT
AS
BEGIN
	DECLARE @return INT
		SET @return =
			(
				SELECT COUNT(fd.Id)
				FROM [dbo].[FlightDestinations] AS fd
				JOIN [dbo].[Passengers] AS p ON p.Id = fd.PassengerId
				WHERE p.Email = @email
			)
	RETURN @return
END


SELECT dbo.udf_FlightDestinationsByEmail ('PierretteDunmuir@gmail.com');

SELECT dbo.udf_FlightDestinationsByEmail('Montacute@gmail.com');

SELECT dbo.udf_FlightDestinationsByEmail('MerisShale@gmail.com');



--12.Full Info for Airports
/* Create a stored procedure, named usp_SearchByAirportName, which accepts the following parameters:
•	airportName(with max length 70)
Extract information about the airport locations with the given airport name. The needed data is the name of the airport, full name of the passenger, level of the ticket price (depends on flight destination's ticket price: 'Low'– lower than 400 (inclusive), 'Medium' – between 401 and 1500 (inclusive), and 'High' – more than 1501), manufacturer and condition of the aircraft, and the name of the aircraft type.
Order the result by Manufacturer, then by passenger's full name.
Required columns:
•	AirportName
•	FullName (passenger)
•	LevelOfTickerPrice 
•	Manifacturer
•	Condition
•	TypeName (aircraft type) */


CREATE PROC usp_SearchByAirportName(@airportName NVARCHAR(70))

AS

SELECT air.[AirportName], 
		p.[FullName],
		CASE
			WHEN fd.[TicketPrice] <= 400 THEN 'Low'
			WHEN fd.[TicketPrice] BETWEEN 401 AND 1500 THEN 'Medium'
			WHEN fd.[TicketPrice] > 1500 THEN 'High'
		END AS LevelOfTickerPrice,
		a.[Manufacturer],
		a.[Condition],
		airt.[TypeName]
		FROM [dbo].[Airports] AS air
		JOIN [dbo].[FlightDestinations] AS fd ON fd.AirportId = air.Id
		JOIN [dbo].[Passengers] AS p ON p.Id = fd.PassengerId
		JOIN [dbo].[Aircraft] AS a ON a.Id = fd.AircraftId
		JOIN [dbo].[AircraftTypes] AS airt ON airt.Id = a.TypeId
		WHERE air.[AirportName] = @airportName
		GROUP BY air.[AirportName],
				p.[FullName],
				fd.[TicketPrice], 
				a.[Manufacturer],
				a.[Condition],
				airt.[TypeName]
		ORDER BY a.[Manufacturer], p.[FullName];


EXEC usp_SearchByAirportName 'Sir Seretse Khama International Airport';