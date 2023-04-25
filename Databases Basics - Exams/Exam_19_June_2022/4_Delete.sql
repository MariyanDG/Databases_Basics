--4.Delete
/* The Zoo decided to close one of the Volunteers Departments - Education program assistant. Your job is to delete this department from the database. 
NOTE: Keep in mind that there could be foreign key constraint conflicts! */

SELECT * FROM Volunteers;

DELETE FROM Volunteers
WHERE DepartmentId = 2;


SELECT * FROM VolunteersDepartments;

DELETE FROM VolunteersDepartments
WHERE Id = 2;