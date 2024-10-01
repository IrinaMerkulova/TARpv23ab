--39 View SQL
-- Kuvame kõik töötajad DimEmployee tabelist
SELECT * FROM DimEmployee

-- Kuvame töötajate andmed koos osakonna nimega
SELECT 
    EmployeeKey, 
    FirstName, 
    BaseRate, 
    Gender, 
    DepartmentName
FROM 
    DimEmployee
JOIN 
    DimDepartmentGroup ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentName; -- Õige liitmine osakonna nimede alusel

-- Loome vaate vWeEmployeesByDepartment
CREATE VIEW vWeEmployeesByDepartment AS
SELECT 
    EmployeeKey, 
    FirstName, 
    BaseRate, 
    Gender, 
    DepartmentName
FROM 
    DimEmployee
JOIN 
    DimDepartmentGroup ON DimEmployee.DepartmentKey = DimDepartmentGroup.DepartmentKey; -- Õige liitmine osakonna võtme alusel

-- Kuvame töötajad vastavalt osakonnale
SELECT * FROM vWeEmployeesByDepartment

-- Loome vaate vWITDepartment_Employees
CREATE VIEW vWITDepartment_Employees AS
SELECT 
    EmployeeKey, 
    FirstName, 
    BaseRate, 
    Gender, 
    DepartmentName
FROM 
    DimEmployee
JOIN 
    DimDepartmentGroup ON DimEmployee.DepartmentKey = DimDepartmentGroup.DepartmentKey -- Liitmine osakonna võtme alusel
WHERE 
    DimDepartmentGroup.DepartmentGroupName = 'IT'; -- Valime ainult IT osakonna töötajad

-- Loome vaate VWeEmployeesNonConfidentionalData
CREATE VIEW VWeEmployeesNonConfidentionalData AS
SELECT 
    DimEmployee.EmployeeKey, 
    DimEmployee.FirstName, 
    DimEmployee.BaseRate, 
    DimEmployee.Gender, 
    DimDepartmentGroup.DepartmentGroupName
FROM 
    DimEmployee
JOIN 
    DimDepartmentGroup ON DimEmployee.ParentEmployeeKey = DimDepartmentGroup.ParentDepartmentGroupKey; -- Liitmine õige võtme alusel

-- Loome vaate vWEMployeesCountByDepartment
CREATE VIEW vWEMployeesCountByDepartment AS
SELECT 
    DepartmentGroupName, 
    COUNT(EmployeeKey) AS TotalEmployees -- Arvutame töötajate arvu
FROM 
    DimEmployee
JOIN 
    DimDepartmentGroup ON DimEmployee.DepartmentKey = DimDepartmentGroup.DepartmentGroupKey -- Õige liitmine osakonna võtme alusel
GROUP BY 
    DepartmentGroupName; -- Grupeerime osakonna nime järgi
