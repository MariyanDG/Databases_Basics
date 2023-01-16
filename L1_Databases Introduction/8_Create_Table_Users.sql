--Conditions:

--8.Create Table Users
-- Using SQL query create table Users with columns:
-- Id – unique number for every user. There will be no more than 263-1 users (auto incremented).
-- Username – unique identifier of the user. It will be no more than 30 characters (non Unicode)  (required).
-- Password – password will be no longer than 26 characters (non Unicode) (required).
-- ProfilePicture – image with size up to 900 KB.
-- LastLoginTime
-- IsDeleted – shows if the user deleted his/her profile. Possible states are true or false

-- Make the Id a primary key. Populate the table with exactly 5 records. Submit your CREATE and INSERT statements
-- as Run queries & check DB

CREATE TABLE Users(
		[Id] INT PRIMARY KEY IDENTITY NOT NULL,
		[Username] VARCHAR(30) NOT NULL,
		[Password] VARCHAR(26) NOT NULL,
		[ProfilePicture] VARBINARY(MAX)
		CHECK(DATALENGTH(ProfilePicture) <=921600),
		[LastLoginTime] DATETIME2,
		[IsDeleted] BIT
		)

INSERT INTO Users(
		[Username],
		[Password],
		[ProfilePicture],
		[LastLoginTime],
		[IsDeleted]
		)

		VALUES
			('Asan', '12566', NULL, NULL, 0),
			('Petar', '59855', NULL, NULL, 0),
			('Mustafa', '259498', NULL, NULL, 0),
			('Aishe', '9586554', NULL, NULL, 0),
			('Zombiul', '5996589', NULL, NULL, 0)

--SELECT * FROM Users