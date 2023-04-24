--100 Tourist Sites of Bulgaria

CREATE DATABASE NationalTouristSitesOfBulgaria;

USE NationalTouristSitesOfBulgaria;

--1. Database design
/* Create a database called NationalTouristSitesOfBulgaria. You need to create 7 tables:
•	Categories – contains information about the different categories of the tourist sites;
•	Locations – contains information about the locations of the tourist sites;
•	Sites – contains information about the tourist sites;
•	Tourists – contains information about the tourists, who are visiting the tourist sites;
•	SitesTourists – a many to many mapping table between the sites and the tourists;
•	BonusPrizes – contains information about the bonus prizes, which are given to an annual raffle;
•	TouristsBonusPrizes – a many to many mapping table between the tourists and the bonus prizes. */


CREATE TABLE Categories(
Id INT IDENTITY PRIMARY KEY NOT NULL,
[Name] VARCHAR(50) NOT NULL
);


CREATE TABLE Locations(
Id INT IDENTITY PRIMARY KEY NOT NULL,
[Name] VARCHAR(50) NOT NULL,
Municipality VARCHAR(50),
Province VARCHAR(50)
);


CREATE TABLE Sites(
Id INT IDENTITY PRIMARY KEY NOT NULL,
[Name] VARCHAR(100) NOT NULL,
LocationId INT NOT NULL FOREIGN KEY REFERENCES Locations(Id),
CategoryId INT	NOT NULL FOREIGN KEY REFERENCES Categories(Id),
Establishment VARCHAR(15)
);



CREATE TABLE Tourists(
Id INT IDENTITY PRIMARY KEY NOT NULL,
[Name] VARCHAR(100) NOT NULL,
Age INT	NOT NULL
	CHECK(Age >= 0 AND Age <= 120),
PhoneNumber VARCHAR(20) NOT NULL,
Nationality VARCHAR(30) NOT NULL,
Reward VARCHAR(20)
);


CREATE TABLE SitesTourists(
TouristId INT NOT NULL REFERENCES Tourists(Id),
SiteId INT NOT NULL REFERENCES Sites(Id),
PRIMARY KEY (TouristId, SiteId)
);


CREATE TABLE BonusPrizes(
Id INT IDENTITY PRIMARY KEY,
[Name] VARCHAR(50) NOT NULL
);


CREATE TABLE TouristsBonusPrizes(
TouristId INT NOT NULL REFERENCES Tourists(Id),
BonusPrizeId INT NOT NULL REFERENCES BonusPrizes(Id),
PRIMARY KEY (TouristId, BonusPrizeId)
);