--11.All Volunteers in a Department
/* Create a user-defined function named udf_GetVolunteersCountFromADepartment (@VolunteersDepartment) that receives a department and returns the count of volunteers, who are involved in this department. */


GO
CREATE FUNCTION udf_GetVolunteersCountFromADepartment(@VolunteersDepartment VARCHAR(30))

RETURNS INT
AS
BEGIN
		RETURN(SELECT COUNT(v.Id) FROM Volunteers AS v
		JOIN [dbo].[VolunteersDepartments] AS vd ON vd.Id = v.DepartmentId
		WHERE vd.DepartmentName = @VolunteersDepartment)
END
GO

SELECT dbo.udf_GetVolunteersCountFromADepartment ('Education program assistant')

SELECT dbo.udf_GetVolunteersCountFromADepartment ('Guest engagement')

SELECT dbo.udf_GetVolunteersCountFromADepartment ('Zoo events')