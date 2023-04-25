CREATE DATABASE Zoo;

USE Zoo;

--1. Database design
CREATE TABLE Owners(
		Id INT IDENTITY PRIMARY KEY NOT NULL,
		[Name] VARCHAR(50) NOT NULL,
		PhoneNumber VARCHAR(15) NOT NULL,
		[Address] VARCHAR(50)
		);


CREATE TABLE AnimalTypes(
		Id INT IDENTITY PRIMARY KEY,
		AnimalType VARCHAR(30) NOT NULL
		);


CREATE TABLE Cages(
		Id INT IDENTITY PRIMARY KEY,
		AnimalTypeId INT NOT NULL FOREIGN KEY REFERENCES AnimalTypes(Id)
		);


CREATE TABLE Animals(
		Id INT IDENTITY PRIMARY KEY,
		[Name] VARCHAR(30) NOT NULL,
		BirthDate DATE NOT NULL,
		OwnerId INT FOREIGN KEY REFERENCES Owners(Id),
		AnimalTypeId INT NOT NULL FOREIGN KEY REFERENCES AnimalTypes(Id)
		);


CREATE TABLE AnimalsCages(
		CageId INT NOT NULL FOREIGN KEY REFERENCES Cages(Id),
		AnimalId INT NOT NULL FOREIGN KEY REFERENCES Animals(Id)
		PRIMARY KEY (CageId, AnimalId)
		);


CREATE TABLE VolunteersDepartments(
		Id INT IDENTITY PRIMARY KEY,
		DepartmentName VARCHAR(30) NOT NULL
		);


CREATE TABLE Volunteers(
		Id INT IDENTITY PRIMARY KEY,
		[Name] VARCHAR(50) NOT NULL,
		PhoneNumber VARCHAR(15) NOT NULL,
		[Address] VARCHAR(50),
		AnimalId INT FOREIGN KEY REFERENCES Animals(Id),
		DepartmentId INT NOT NULL FOREIGN KEY REFERENCES VolunteersDepartments(Id)
		);