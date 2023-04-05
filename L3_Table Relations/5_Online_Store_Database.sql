--5 Online Store Database

CREATE DATABASE Store;

USE Store;


CREATE TABLE Cities(
		CityID INT PRIMARY KEY NOT NULL,
		[Name] VARCHAR(50) NOT NULL
		);

INSERT INTO Cities(
		CityID,
		[Name]
		)
		VALUES
		(1, 'New York'),
		(2, 'Los Angeles'),
		(3, 'Chicago'),
		(4, 'Houston'),
		(5, 'Miami');


CREATE TABLE Customers(
		CustomerID INT PRIMARY KEY NOT NULL,
		[Name] VARCHAR(50) NOT NULL,
		Birthday DATE,
		CityID INT FOREIGN KEY REFERENCES Cities(CityID) NOT NULL
		);

INSERT INTO Customers(
		CustomerID, 
		[Name],
		Birthday,
		CityID
		)
		VALUES
		(1, 'John Doe', '1990-05-15', 1),
		(2, 'Jane Smith', '1985-12-01', 2),
		(3, 'Bob Johnson', '1978-08-22', 3),
		(4, 'Alice Lee', '1995-02-28', 2),
		(5, 'David Kim', '1998-11-10', 4);


CREATE TABLE ItemTypes(
		ItemTypeID INT PRIMARY KEY NOT NULL,
		[Name] VARCHAR(50) NOT NULL,
		);

INSERT INTO ItemTypes(
		ItemTypeID,
		[Name]
		)
		VALUES
		(1, 'Electronics'),
		(2, 'Clothing'),
		(3, 'Home Goods'),
		(4, 'Books'),
		(5, 'Toys');



CREATE TABLE Items(
		ItemID INT PRIMARY KEY NOT NULL,
		[Name] VARCHAR(50) NOT NULL,
		ItemTypeID INT FOREIGN KEY REFERENCES ItemTypes(ItemTypeID) NOT NULL
		);

INSERT INTO Items(
		ItemID,
		[Name],
		ItemTypeID
		)
		VALUES
		(1, 'Item 1', 1),
		(2, 'Item 2', 1),
		(3, 'Item 3', 2),
		(4, 'Item 4', 2),
		(5, 'Item 5', 3);


CREATE TABLE Orders(
		OrderID INT PRIMARY KEY NOT NULL,
		CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID) NOT NULL,
		[OrderDate] DATE
		);

INSERT INTO Orders(
		OrderID,
		CustomerID,
		[OrderDate]
		)
		VALUES
		(1, 1, '2022-02-01'),
		(2, 2, '2022-03-15'),
		(3, 3, '2022-04-10'),
		(4, 4, '2022-05-20'),
		(5, 5, '2022-06-05');



CREATE TABLE OrderItems(
		OrderID INT FOREIGN KEY REFERENCES Orders(OrderID) NOT NULL,
		ItemID INT FOREIGN KEY REFERENCES Items(ItemID)NOT NULL,
		CONSTRAINT PK_OrderItems
		PRIMARY KEY(OrderID, ItemID)
		);

INSERT INTO OrderItems(
		OrderID,
		ItemID
		)
		VALUES
		(1, 1),
		(1, 2),
		(1, 3),
		(2, 2),
		(3, 3),
		(3, 4),
		(3, 5),
		(4, 1),
		(4, 4),
		(5, 2),
		(5, 3),
		(5, 5);