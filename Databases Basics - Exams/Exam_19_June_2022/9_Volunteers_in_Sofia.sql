--9.Volunteers in Sofia
/* Extract information about the volunteers, involved in 'Education program assistant' department, who live in Sofia. Select their name, phone number and their address in Sofia (skip city's name). Order the result by the name of the volunteers (ascending). */


SELECT v.[Name], 
		v.[PhoneNumber], 
		SUBSTRING (v.[Address], 
					CHARINDEX(',', v.[Address]) + 2, 
					LEN(v.[Address])) AS [Address]
		FROM [dbo].[Volunteers] AS v
		JOIN [dbo].[VolunteersDepartments] AS vd ON vd.Id = v.DepartmentId
		WHERE vd.DepartmentName = 'Education program assistant'
		AND v.Address LIKE ('%Sofia%')
		ORDER BY v.[Name];