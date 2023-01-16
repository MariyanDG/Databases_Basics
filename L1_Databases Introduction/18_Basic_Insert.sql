--Conditions:

--18.Basic Insert
--Use the SoftUni database and insert some data using SQL queries.
--Towns: Sofia, Plovdiv, Varna, Burgas
--Departments: Engineering, Sales, Marketing, Software Development, Quality Assurance
--Employees:

INSERT INTO Towns([Name])
		VALUES
			('Sofia'),
			('Yambol'),
			('Varna')

INSERT INTO Departments([Name])
		VALUES
			('Engineering'),
			('Sales'),
			('Marketing'),
			('Software Development'),
			('Quality Assurance')

INSERT INTO Employees([FirstName], [MiddleName], [LastName], [JobTitle],
					[DepartmentId],[HireDate], [Salary])
		VALUES
			('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, CONVERT(datetime, '01/02/2013', 103), 3500.00),
			('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1,	CONVERT(datetime, '02/03/2004', 103), 4000.00),
			('Maria', 'Petrova', 'Ivanova', 'Intern',	5,	CONVERT(datetime, '28/08/2016', 103), 525.25),
			('Georgi', 'Teziev', 'Ivanov', 'CEO',	2,	CONVERT(datetime, '09/12/2007', 103), 3000.00),
			('Peter', 'Pan', 'Pan', 'Intern',	3,	CONVERT(datetime, '28/08/2016', 103), 599.88)