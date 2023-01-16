--Conditions:

--12.Set Unique Field
-- Using SQL queries modify table Users. Remove Username field from the primary key so only the field Id would be
-- primary key. Now add unique constraint to the Username field to ensure that the values there are at least 3 symbols
-- long.

ALTER TABLE Users
DROP CONSTRAINT PK_NewKey

ALTER TABLE Users
ADD CONSTRAINT PK_NewIdKey PRIMARY KEY(Id)

ALTER TABLE Users
ADD CONSTRAINT PK_NewUniqeUsernameKey UNIQUE(Username)

ALTER TABLE Users
ADD CONSTRAINT Lenght_Checker_Username CHECK(LEN(Username) >=3)