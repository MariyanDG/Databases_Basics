--Conditions:

--11.Set Default Value of a Field
-- Using SQL queries modify table Users. Make the default value
-- of LastLoginTime field to be the current time.

ALTER TABLE Users
ADD CONSTRAINT DF_LastloginTime
DEFAULT GETDATE() FOR LastloginTime

INSERT INTO Users(
			[Username],
			[Password],
			[ProfilePicture],
			[IsDeleted]
			)
			VALUES
			('Falko', '219695', NULL, 1)