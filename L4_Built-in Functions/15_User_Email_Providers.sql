--15.User Email Providers
--Find all users with information about their email providers. Display the username and email provider. Sort the results by email provider alphabetically, then by username. 


SELECT Username, SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email) - CHARINDEX('@', Email) + 1) 
      AS [Email Provider]
    FROM Users
ORDER BY [Email Provider], Username ASC;