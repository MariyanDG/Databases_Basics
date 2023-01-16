--Conditions:

--10.Add Check Constraint
-- Using SQL queries modify table Users. Add check constraint to ensure that the values in the Password field are at 
-- least 5 symbols long.

ALTER TABLE Users

ADD CONSTRAINT PassLenght_Checker CHECK(LEN([Password]) >= 5)
