--7.Define Function
--Define a function ufn_IsWordComprised(@setOfLetters, @word) that returns true or false, depending on that if the word is comprised of the given set of letters. 



CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(MAX), @word VARCHAR(MAX))
RETURNS BIT
AS
BEGIN
		DECLARE @counter INT = 1
		DECLARE @currentLetter CHAR(1)

		WHILE(@counter <= LEN(@word))
		BEGIN
				SET @currentLetter = SUBSTRING(@word, @counter, 1)

				DECLARE @charIndex INT = CHARINDEX(@currentLetter, @setOfLetters)
				IF(@charIndex <= 0)
				BEGIN
						RETURN 0
				END

				SET @counter += 1
		END

		RETURN 1
END

SELECT [dbo].[ufn_IsWordComprised]('oistmiahf', 'Sofia') AS [Result]