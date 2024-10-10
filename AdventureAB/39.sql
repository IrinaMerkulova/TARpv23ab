-- Loome tabeli tblEmployee
Create table tblEmployee (
[Id] int Primary key,            -- Unikaalne ID
[Name] nvarchar(50),             -- Töötaja nimi
[Salary] int,                    -- Töötaja palk
[Gender] nvarchar(10),           -- Töötaja sugu
[City] nvarchar(50)              -- Linn
)

-- Loome tabeli tblDepartament
Create table tblDepartament (
DeptId int Primary Key,          -- Unikaalne osakonna ID
DeptName nvarchar(20)            -- Osakonna nimi
)

-- Lisame andmed tblDepartament tabelisse
Insert into tblDepartament values(1, 'IT')
Insert into tblDepartament values(2, 'PayRoll')
Insert into tblDepartament values(3, 'HR')
Insert into tblDepartament values(4, 'Admin')

-- Lisame andmed tblEmployee tabelisse (vea tõttu: vale veerg City)
Insert into tblEmployee values(1, 'John', 5000, 'Male', 3)
Insert into tblEmployee values(2, 'Mike', 3400, 'Male', 2)
Insert into tblEmployee values(3, 'Pam', 6000, 'Female', 1)
Insert into tblEmployee values(4, 'Todd', 4800, 'Male', 4)
Insert into tblEmployee values(5, 'Sara', 3200, 'Female', 1)
Insert into tblEmployee values(6, 'Ben', 4800, 'Male', 3)

-- Valime töötajad koos osakonna nimega (vea tõttu: vale tabel ja veerud)
SELECT EmployeeKey, FirstName, BaseRate, Gender, DepartmentName
FROM DimEmployee
JOIN DimDepartmentGroup ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupName;

-- Loome vaate vWeEmployeesByDepartment
CREATE VIEW vWeEmployeesByDepartment AS
SELECT EmployeeKey, FirstName, BaseRate, Gender, DepartmentName
FROM DimEmployee
JOIN DimDepartmentGroup ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupName;

-- Kuvame vaate andmed
SELECT * FROM vWeEmployeesByDepartment

-- Loome vaate vWITDepartment_Employees
CREATE VIEW vWITDepartment_Employees AS
SELECT EmployeeKey, FirstName, BaseRate, Gender, DepartmentName
FROM DimEmployee
JOIN DimDepartmentGroup ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupName 
WHERE DimDepartmentGroup.DepartmentGroupName = 'IT';

-- Loome vaate vWEmployeesNonConfidentialData
CREATE VIEW vWEmployeesNonConfidentialData AS
SELECT Id, Name, Gender, DeptName
FROM tblEmployee
JOIN tblDepartament ON tblEmployee.City = tblDepartament.DeptId;  -- Vale veerg City

-- Loome vaate vWEMployeesCountByDepartment
CREATE VIEW vWEMployeesCountByDepartment AS
SELECT DepartmentGroupName, 
COUNT(EmployeeKey) AS TotalEmployees
FROM DimEmployee
JOIN DimDepartmentGroup ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupName 
GROUP BY DepartmentGroupName;
