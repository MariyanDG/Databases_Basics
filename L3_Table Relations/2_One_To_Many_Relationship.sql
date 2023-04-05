--2 One-To-Many Relationship
--Create two tables and use appropriate data types.


CREATE TABLE [Models](
		ModelID INT NOT NULL,
		[Name] NVARCHAR(50) NOT NULL,
		ManufacturerID INT NOT NULL,
		);


INSERT INTO [Models](
		ModelID,
		[Name],
		ManufacturerID
		)
		VALUES
		(101, 'X1', 1),
		(102, 'i6', 1),
		(103, 'Model S', 2),
		(104, 'Model X', 2),
		(105, 'Model 3', 2),
		(106, 'Nova', 3);


CREATE TABLE [Manufacturers](
		ManufacturerID INT NOT NULL,
		[Name] NVARCHAR(50) NOT NULL,
		EstablishedOn DATE NOT NULL
		);


INSERT INTO [Manufacturers](
		ManufacturerID,
		[Name],
		EstablishedOn
		)
		VALUES
		(1, 'BMW', '07/03/1916'),
		(2, 'Tesla', '01/01/2003'),
		(3, 'Lada', '01/05/1966');


ALTER TABLE [Models]
ADD CONSTRAINT PK_Models
PRIMARY KEY (ModelID);


ALTER TABLE [Manufacturers]
ADD CONSTRAINT PK_Manufacturers
PRIMARY KEY (ManufacturerID);


ALTER TABLE [Models]
ADD CONSTRAINT FK_Models_Manufacturers
FOREIGN KEY (ManufacturerID)
REFERENCES [Manufacturers] (ManufacturerID);


SELECT * FROM [Models];

SELECT * FROM [Manufacturers];