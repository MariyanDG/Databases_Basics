--5.Volunteers
/* Extract information about all the Volunteers – name, phone number, address, id of the animal, they are responsible to and id of the department they are involved into. Order the result by name of the volunteer (ascending), then by the id of the animal (ascending) and then by the id of the department (ascending). */


SELECT [Name], 
		[PhoneNumber], 
		[Address], 
		[AnimalId], 
		[DepartmentId] 
	FROM Volunteers
	ORDER BY [Name], 
		[AnimalId], 
		[DepartmentId];