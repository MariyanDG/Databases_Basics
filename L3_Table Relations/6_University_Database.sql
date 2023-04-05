--6 University Database


CREATE DATABASE University;

USE University;

CREATE TABLE Majors(
		MajorID INT PRIMARY KEY NOT NULL,
		[Name] VARCHAR(50) NOT NULL
		);


CREATE TABLE Subjects(
		SubjectID INT PRIMARY KEY NOT NULL,
		SubjectName VARCHAR(50) NOT NULL
		);


CREATE TABLE Students(
		StudentID INT PRIMARY KEY NOT NULL,
		StudentNumber NVARCHAR(50) NOT NULL,
		StudentName VARCHAR(50) NOT NULL,
		MajorID INT NOT NULL
		);


CREATE TABLE Agenda(
		StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
		SubjectID INT FOREIGN KEY REFERENCES Subjects(SubjectID),
		CONSTRAINT PK_Agenda
		PRIMARY KEY (StudentID, SubjectID)
		);


CREATE TABLE Payments(
		PaymentID INT PRIMARY KEY NOT NULL,
		PaymanetDate DATE,
		PaymentAmount DECIMAL(8,2) NOT NULL,
		StudentID INT NOT NULL
		);