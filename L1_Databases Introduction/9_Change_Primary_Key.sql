--Conditions:

--9.Change Primary Key
-- Using SQL queries modify table Users from the previous task. First remove the current primary key and then create
-- a new primary key that would be a combination of fields Id and Username

SELECT * FROM Users
ALTER TABLE Users
DROP CONSTRAINT PK__Users__3214EC07B5684D79

ALTER TABLE Users
ADD CONSTRAINT PK_NewKey PRIMARY KEY(Id, Username)